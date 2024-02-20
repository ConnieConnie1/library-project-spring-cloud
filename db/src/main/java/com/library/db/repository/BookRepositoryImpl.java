package com.library.db.repository;

import com.library.db.entity.Author;
import com.library.db.entity.Book;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BookRepositoryImpl implements BookCustomRepository{

    @PersistenceContext
    EntityManager em;
    @Override
    public List<Book> findAuthorsByFilters(Long authorId, Long genreId, Date editionDate, Date printDate, Long publisherId, Long price, Integer pageNumber, Integer rating) {

        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery <Book> cq = cb.createQuery(Book.class);
        Root<Book> root = cq.from(Book.class);
        List<Predicate> predicates = new ArrayList<Predicate>();
        // JOIN
        Join<Book, Author> join = root.join("author");
        // Join con genere e con editore
        Join<Book,>

        if (authorId != null){
            predicates.add(cb.equal(join.get("id"), authorId));
        }
        if (genreId != null){
            predicates.add(cb.equal(root.get("genreId"), genreId));
        }
        if (editionDate != null){
            predicates.add(cb.equal(root.get("editionDate"), editionDate));
        }
        if (printDate != null) {
            predicates.add(cb.equal(root.get("printDate"), printDate));
        }
        if (publisherId != null) {
            predicates.add(cb.equal(root.get("publisherId"), publisherId));
        }
        if (price != null) {
            predicates.add(cb.equal(root.get("price"), price));
        }
        if (pageNumber != null) {
            predicates.add(cb.equal(root.get("pageNumber"), pageNumber));
        }
        if (rating != null) {
            predicates.add(cb.equal(root.get("rating"), rating));
        }

        cq.where(predicates.stream().toArray(Predicate[]::new));
        TypedQuery<Book> query = em.createQuery(cq);

        List<Book> result = query.getResultList();

        return result;
    }
}
