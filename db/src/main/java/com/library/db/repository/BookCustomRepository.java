package com.library.db.repository;

import com.library.db.entity.Book;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;

public interface BookCustomRepository {

    //Dichiaro le Query personalizzate
    @Query("SELECT b FROM Book b WHERE " +
            "(:authorId IS NULL OR b.authorId = :authorId) " +
            "AND (:genreId IS NULL OR b.genreId = :genreId) " +
            "AND (:editionDate IS NULL OR b.editionDate = :editionDate) " +
            "AND (:printDate IS NULL OR b.printDate = :printDate) " +
            "AND (:publisherId IS NULL OR b.publisherId = :publisherId) " +
            "AND (:price IS NULL OR b.price = :price) " +
            "AND (:pageNumber IS NULL OR b.pageNumber = :pageNumber) " +
            "AND (:rating IS NULL OR b.rating = :rating)")
    List<Book> findByAuthorIdAndGenreIdAndEditionDateAndPrintDateAndPublisherIdAndPriceAndPageNumberAndRating(
            @Param("authorId") Long authorId,
            @Param("genreId") Long genreId,
            @Param("editionDate") Date editionDate,
            @Param("printDate") Date printDate,
            @Param("publisherId") Long publisherId,
            @Param("price") Long price,
            @Param("pageNumber") Integer pageNumber,
            @Param("rating") Integer rating
    );
}
