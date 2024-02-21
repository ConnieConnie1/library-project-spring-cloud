package com.library.db.repository;

import com.library.db.entity.Book;
import com.library.db.record.PaginationResponse;
import org.springframework.data.domain.Pageable;

import java.util.Date;
import java.util.List;

public interface BookCustomRepository {


    PaginationResponse<Book> findBooksByFilter(Pageable pageable,String authorName, String authorSurname, String genre, Date editionDate, Date printDate, String publisherName, Long price, Integer rating);
}
