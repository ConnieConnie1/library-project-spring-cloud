package com.library.db.repository;

import com.library.db.entity.Book;

import java.util.Date;
import java.util.List;

public interface BookCustomRepository {


    List<Book> findAuthorsByFilters(Long authorId, Long genreId, Date editionDate, Date printDate, Long publisherId, Long price, Integer pageNumber, Integer rating);
}
