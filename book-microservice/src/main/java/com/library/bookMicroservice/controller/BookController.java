package com.library.bookMicroservice.controller;

import com.library.bookMicroservice.record.BookRecord;
import com.library.bookMicroservice.service.BookService;
import jakarta.ws.rs.Path;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookService bookService;

    @GetMapping("/test")
    public String test(){
        return "TEST";
    }

    @GetMapping("/getAll")
    public List<BookRecord> getAllBooks() {

        return bookService.getAllBooks();
    }
}
