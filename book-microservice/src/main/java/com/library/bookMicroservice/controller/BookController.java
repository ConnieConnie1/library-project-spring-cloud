package com.library.bookMicroservice.controller;

import com.library.bookMicroservice.record.BookRecord;
import com.library.bookMicroservice.service.BookService;
import com.netflix.discovery.DiscoveryClient;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/books")
@CrossOrigin = (origins= "http://localhost:3000")
public class BookController {
    @Autowired
    private BookService bookService;

    @GetMapping("/getAll")
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