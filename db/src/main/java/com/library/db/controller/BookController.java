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
            @RequestParam(required = false) Long authorId,
            @RequestParam(required = false) Long genreId,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date editionDate,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date printDate,
            @RequestParam(required = false) Long publisherId,
            @RequestParam(required = false) Long price,
            @RequestParam(required = false) Integer pageNumber,
            @RequestParam(required = false) Integer rating,
            @RequestParam(required = false, defaultValue = "10") Integer pageSize,
            @RequestParam(required = false, defaultValue = "1") Integer currentPage

    ){
        return bookService.getAllBooks(authorId, genreId, editionDate, printDate, publisherId, price, pageNumber, rating, pageSize,currentPage);
    }
    @GetMapping("/{bookId}")
    public Book getBookById(@PathVariable("bookId") Long bookId){
        return bookService.getBookById(bookId);
    }
}
