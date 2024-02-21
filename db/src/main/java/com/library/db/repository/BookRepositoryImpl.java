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

public class BookRepositoryImpl implements BookCustomRepository{

    @PersistenceContext
    EntityManager em;
    @Override
    public PaginationResponse<Book> findBooksByFilter(Pageable pageable,String authorName, String authorSurname, String genre, Date editionDate, Date printDate, String publisherName, Long price, Integer rating) {
        PaginationResponse<Book> response = new PaginationResponse<Book>();

        final int currentPageNumber = pageable.getPageNumber();

        CriteriaBuilder cb = em.getCriteriaBuilder();
        // Per il libro
        CriteriaQuery <Book> cq = cb.createQuery(Book.class);
        Root<Book> root = cq.from(Book.class);
        List<Predicate> predicates = getPredicates(root, cb, authorName, authorSurname, genre, editionDate, printDate, publisherName, price, rating);

        cq.where(predicates.stream().toArray(Predicate[]::new));
        cq.orderBy(cb.asc(root.get("title"))); // Ordinati in ordine alfabetico di nome

        TypedQuery<Book> query = em.createQuery(cq);
        query.setFirstResult((pageable.getPageNumber()-1)*pageable.getPageSize());
        query.setMaxResults(pageable.getPageSize());
        List<Book> result = query.getResultList();

        // Per la count
        CriteriaQuery <Long> cqCount = cb.createQuery(Long.class);
        Root<Book> rootCount = cqCount.from(Book.class);
        List <Predicate> predicateCount = getPredicates(rootCount, cb, authorName, authorSurname, genre, editionDate, printDate, publisherName, price, rating);
        cqCount.select(cb.count(rootCount));
        cqCount.where(predicateCount.stream().toArray(Predicate[]::new));
        Long bookCount = em.createQuery(cqCount).getSingleResult();

        int totalPage = (int)Math.ceil((double)bookCount/pageable.getPageSize());
         // PageSize verrà passato da FE.
        response.setData(result);
        response.setTotalPage(totalPage);
        response.setCurrentPage(currentPageNumber);

        return response;
    }

    private List<Predicate> getPredicates(Root<Book> root, CriteriaBuilder cb, String authorName, String authorSurname, String genre, Date editionDate, Date printDate, String publisherName, Long price, Integer rating){
        List<Predicate> predicates = new ArrayList<Predicate>();
        // JOIN
        Join<Book, Author> authorJoin = root.join("author", JoinType.INNER);
        // Join con genere e con editore
        Join<Book, Genre> genreJoin  = root.join("genre", JoinType.INNER);
        Join <Book, Publisher> publisherJoin  = root.join("publisher",JoinType.INNER);

        if (authorName != null){
            predicates.add(cb.equal(authorJoin.get("name"), authorName));
        }
        if (authorSurname != null){
            predicates.add(cb.equal(authorJoin.get("surname"), authorSurname));
        }
        if (genre != null){
            predicates.add(cb.equal(genreJoin.get("genre"), genre));
        }
        if (editionDate != null){
            predicates.add(cb.equal(root.get("editionDate"), editionDate));
        }
        if (printDate != null) {
            predicates.add(cb.equal(root.get("printDate"), printDate));
        }
        if (publisherName != null) {
            predicates.add(cb.equal(publisherJoin.get("publisherName"), publisherName));
        }
        if (price != null) {
            predicates.add(cb.equal(root.get("price"), price));
        }
        if (rating != null) {
            predicates.add(cb.equal(root.get("rating"), rating));
        }
        return predicates;
    }


}
