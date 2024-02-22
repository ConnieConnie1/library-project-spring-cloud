package com.library.bookMicroservice.controller;

import com.library.bookMicroservice.record.BookRecord;
import com.library.bookMicroservice.record.PaginationResponse;
import com.library.bookMicroservice.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Response;
import java.util.List;
import java.util.Objects;
import java.util.Date;
import org.springframework.web.bind.annotation.*;



@RestController
@RequestMapping("")
@CrossOrigin(origins = "http://localhost:3000")
public class BookController {
    @Autowired
    private BookService bookService;

    @GetMapping("")
    public Response getAllBooks(
            @RequestParam(required = false) String authorName,
            @RequestParam(required = false) String authorSurname,
            @RequestParam(required = false) String genre,
            @RequestParam(required = false) Date editionDate,
            @RequestParam(required = false) Date printDate,
            @RequestParam(required = false) String publisherName,
            @RequestParam(required = false) Long price,
            @RequestParam(required = false) Integer pageNumber,
            @RequestParam(required = false) Integer rating,
            @RequestParam(required = false, defaultValue = "10") Integer pageSize,
            @RequestParam(required = false, defaultValue = "1") Integer currentPage) {
        PaginationResponse<BookRecord> responseBooks =  bookService.getAllBooks(authorName, authorSurname, genre, editionDate, printDate, publisherName, price, pageNumber, rating, pageSize, currentPage);
        if (Objects.isNull(responseBooks)) {
            return Response.status(Response.Status.NOT_FOUND).entity("No books found!").build();
        }
        return Response.ok(responseBooks).build();
    }

    @GetMapping("/{id}")
    public Response getBookById(@PathVariable Long id) {
        BookRecord response = bookService.getBookById(id);
        if (Objects.isNull(response)) {
            return Response.status(Response.Status.NOT_FOUND).entity("No book found!").build();
        }
        return Response.ok(response).build();
    }
}
