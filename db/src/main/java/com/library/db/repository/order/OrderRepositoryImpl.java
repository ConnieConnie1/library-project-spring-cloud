package com.library.db.repository.order;


import com.library.db.entity.book.Book;
import com.library.db.entity.book.BookOrder;
import com.library.db.entity.order.Orders;
import com.library.db.record.PaginationResponse;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.*;
import org.springframework.data.domain.Pageable;
import java.util.ArrayList;
import java.util.List;

public class OrderRepositoryImpl implements OrderCustomRepository {
    @PersistenceContext
    EntityManager em;

    @Override
    public PaginationResponse<Orders> findOrdersByFilter(Pageable pageable, Integer orderNumber, Long userId) {
        PaginationResponse<Orders> response = new PaginationResponse<Orders>();

        final int currentPageNumber = pageable.getPageNumber();
        CriteriaBuilder cb = em.getCriteriaBuilder();

        // Per il libro
        CriteriaQuery<Orders> cq = cb.createQuery(Orders.class);
        Root<Orders> root = cq.from(Orders.class);
        List<Predicate> predicates = getPredicates(cb, root, orderNumber, userId);

        cq.where(predicates.stream().toArray(Predicate[]::new));
        cq.orderBy(cb.asc(root.get("orderNumber"))); // Ordinati in ordine di numero ordine

        TypedQuery<Orders> query = em.createQuery(cq);
        query.setFirstResult((pageable.getPageNumber() - 1) * pageable.getPageSize());
        query.setMaxResults(pageable.getPageSize());
        List<Orders> result = query.getResultList();

        // Per la count
        CriteriaQuery<Long> cqCount = cb.createQuery(Long.class);
        Root<Orders> rootCount = cqCount.from(Orders.class);
        List<Predicate> predicateCount = getPredicates(cb, rootCount, orderNumber, userId);
        cqCount.select(cb.count(rootCount));
        cqCount.where(predicateCount.stream().toArray(Predicate[]::new));
        Long orderCount = em.createQuery(cqCount).getSingleResult();

        int totalPage = (int) Math.ceil((double) orderCount / pageable.getPageSize());
        // PageSize verrà passato da FE.
        response.setData(result);
        response.setTotalPage(totalPage);
        response.setCurrentPage(currentPageNumber);

        return response;
    }

    @Override
    public Orders findOrderById(Long id) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Orders> cq = cb.createQuery(Orders.class);
        Root<Orders> root = cq.from(Orders.class);
        List<Predicate> predicates = new ArrayList<>();
        Join<Orders, BookOrder> joinBookOrder = root.join("books");
        predicates.add(cb.equal(root.get("id"), id));
        joinBookOrder.join("orders");
        cq.where(predicates.stream().toArray(Predicate[]::new));
        TypedQuery<Orders> query = em.createQuery(cq);
        return query.getSingleResult();
    }

    private List<Predicate> getPredicates(CriteriaBuilder cb, Root<Orders> root, Integer orderNumber, Long userId) {
        List<Predicate> predicates = new ArrayList<>();
        Join<Orders, Book> bookJoin = root.join("books");

        if (orderNumber != null) {
            predicates.add(cb.equal(root.get("orderNumber"), orderNumber));
        }

        if (userId != null) {
            predicates.add(cb.equal(bookJoin.get("userId"), userId));
        }
        return predicates;

    }
}
