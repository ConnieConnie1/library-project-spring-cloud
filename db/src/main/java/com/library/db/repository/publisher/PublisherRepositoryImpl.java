package com.library.db.repository.publisher;

import com.library.db.entity.publisher.Publisher;
import com.library.db.record.PaginationResponse;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.*;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;

public class PublisherRepositoryImpl implements PublisherCustomRepository {

    @PersistenceContext
    EntityManager em;

    @Override
    public PaginationResponse<Publisher> findPublisherByFilter(Pageable pageable, String publisherName) {
        PaginationResponse<Publisher> response = new PaginationResponse<Publisher>();
        final int currentPageNumber = pageable.getPageNumber();

        CriteriaBuilder cb = em.getCriteriaBuilder();
        // Per l'editore
        CriteriaQuery<Publisher> cq = cb.createQuery(Publisher.class);
        Root<Publisher> root = cq.from(Publisher.class);
        List<Predicate> predicates = getPredicates(root, cb, publisherName);

        cq.where(predicates.stream().toArray(Predicate[]::new));
        cq.orderBy(cb.asc(root.get("publisherName"))); // Ordinati in ordine alfabetico di nome

        TypedQuery<Publisher> query = em.createQuery(cq);
        query.setFirstResult((pageable.getPageNumber()-1)*pageable.getPageSize());
        query.setMaxResults(pageable.getPageSize());
        List<Publisher> result = query.getResultList();

        // Per la Count
        CriteriaQuery <Long> cqCount = cb.createQuery(Long.class);
        Root<Publisher> rootCount = cqCount.from(Publisher.class);
        List<Predicate> predicateCount = getPredicates(rootCount, cb, publisherName);
        cqCount.select(cb.count(rootCount));
        cqCount.where(predicateCount.stream().toArray(Predicate[]::new));
        Long publisherCount = em.createQuery(cqCount).getSingleResult();

        int totalPage = (int)Math.ceil((double)publisherCount/pageable.getPageSize());
        // PageSize verrà passato da FE.
        response.setData(result);
        response.setTotalPage(totalPage);
        response.setCurrentPage(currentPageNumber);

        return response;
    }

    private List<Predicate> getPredicates(Root<Publisher> root, CriteriaBuilder cb, String publisherName){
        List<Predicate> predicates = new ArrayList<Predicate>();
        if (publisherName != null){
            predicates.add(cb.equal(root.get("publisherName"), publisherName));
        }
        return predicates;
    }
}
