package com.library.db.service.book;

import com.library.db.entity.book.Book;
import com.library.db.record.PaginationResponse;
import com.library.db.repository.book.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Date;
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

    public PaginationResponse<Book> getAllBooks(
            String authorName, String authorSurname, String genre, Date editionDate, Date printDate, String publisherName, Long price, Integer pageNumber, Integer rating, Integer pageSize, Integer currentPage) {

        Pageable pageable = PageRequest.of(currentPage, pageSize);
        PaginationResponse<Book> response = bookRepository.findBooksByFilter(
                pageable, authorName, authorSurname, genre, editionDate, printDate, publisherName, price, rating);
        return response;
    }
}