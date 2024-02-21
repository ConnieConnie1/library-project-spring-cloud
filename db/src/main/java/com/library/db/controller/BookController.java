package com.library.db.controller;

import com.library.db.entity.Book;
import com.library.db.record.PaginationResponse;
import com.library.db.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookService bookService;

    @GetMapping
    public PaginationResponse<Book> getAllBooks(
            @RequestParam(required = false) String authorName,
            @RequestParam(required = false) String authorSurname,
            @RequestParam(required = false) String genre,
            @RequestParam(required = false) Date editionDate,
            @RequestParam(required = false) Date printDate,
            @RequestParam(required = false) String publisherName,
            @RequestParam(required = false) Long price,
            @RequestParam(required = false) Integer pageNumber,
            @RequestParam(required = false) Integer rating,
            @RequestParam(required = false) Integer pageSize,
            @RequestParam(required = false) Integer currentPage

    ){
        return bookService.getAllBooks(authorName, authorSurname, genre, editionDate, printDate, publisherName, price, pageNumber, rating, pageSize, currentPage);
    }
    @GetMapping("/{bookId}")
    public Book getBookById(@PathVariable("bookId") Long bookId){
        return bookService.getBookById(bookId);
    }
}
