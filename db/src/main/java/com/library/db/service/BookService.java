package com.library.db.service;

import com.library.db.entity.Book;
import com.library.db.record.PaginationResponse;
import com.library.db.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class BookService {
    @Autowired
    private BookRepository bookRepository;
    //GetAllBooks

    public Book getBookById(Long id) {
        Optional<Book> book = bookRepository.findById(id);
        return bookRepository.findById(id).isPresent() ? bookRepository.findById(id).get() : null;
    }

    public PaginationResponse<Book> getAllBooks(Long authorId, Long genreId, Date editionDate, Date printDate, Long publisherId, Long price, Integer pageNumber, Integer rating, Integer pageSize, Integer currentPage) {

        Pageable pageable = PageRequest.of(currentPage, pageSize);
        return bookRepository.findBooksByFilter(
                    pageable, authorId, genreId, editionDate, printDate, publisherId, price, pageNumber, rating);
    }
}