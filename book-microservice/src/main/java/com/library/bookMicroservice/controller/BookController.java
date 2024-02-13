package com.library.bookMicroservice.controller;

import com.library.bookMicroservice.record.BookRecord;
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

@RestController
@RequestMapping("")
@CrossOrigin(origins = "http://localhost:3000")
public class BookController {
    @Autowired
    private BookService bookService;

    @GetMapping("")
    public List<BookRecord> getAllBooks() {
        return bookService.getAllBooks();
    }

    @GetMapping("/{id}")
    public Response getBookById(@PathVariable Long id) {
        BookRecord response = bookService.getBookById(id);
        if (Objects.isNull(response)) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(response).build();
    }
}
