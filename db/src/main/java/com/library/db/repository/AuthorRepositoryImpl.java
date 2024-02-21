package com.library.db.repository;

import com.library.db.entity.Author;
import com.library.db.entity.Book;
import com.library.db.entity.Genre;
import com.library.db.entity.Publisher;
import com.library.db.record.PaginationResponse;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.*;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AuthorRepositoryImpl implements AuthorCustomRepository{


    @PersistenceContext
    EntityManager em;
    @Override
    public PaginationResponse<Author> findAuthorByFilter(Pageable pageable, String name, String surname) {
        PaginationResponse<Author> response = new PaginationResponse<Author>();
        final int currentPageNumber = pageable.getPageNumber();
        CriteriaBuilder cb = em.getCriteriaBuilder();
        // Per il autore
        CriteriaQuery<Author> cq = cb.createQuery(Author.class);
        Root<Author> root = cq.from(Author.class);
        List<Predicate> predicates = getPredicates(root, cb,  name, surname);
        cq.where(predicates.stream().toArray(Predicate[]::new));
        cq.orderBy(cb.asc(root.get("name"))); // Ordinati in ordine alfabetico di nome dell'autore

        TypedQuery<Author> query = em.createQuery(cq);
        query.setFirstResult((pageable.getPageNumber()-1)*pageable.getPageSize());
        query.setMaxResults(pageable.getPageSize());
        List<Author> result = query.getResultList();

        // Per la count
        CriteriaQuery <Long> cqCount = cb.createQuery(Long.class);
        Root<Author> rootCount = cqCount.from(Author.class);
        List <Predicate> predicateCount = getPredicates(rootCount, cb, name, surname);
        cqCount.select(cb.count(rootCount));
        cqCount.where(predicateCount.stream().toArray(Predicate[]::new));
        Long authorCount = em.createQuery(cqCount).getSingleResult();

        int totalPage = (int)Math.ceil((double)authorCount/pageable.getPageSize());
        // PageSize verrà passato da FE.
        response.setData(result);
        response.setTotalPage(totalPage);
        response.setCurrentPage(currentPageNumber);

        return response;
    }

    private List<Predicate> getPredicates(Root<Author> root, CriteriaBuilder cb, String name, String surname){
        List<Predicate> predicates = new ArrayList<Predicate>();

        if (name != null){
            predicates.add(cb.like(root.get("name"), name));
        }
        if (surname != null){
            predicates.add(cb.like(root.get("surname"), surname));
        }

        return predicates;
    }


}
