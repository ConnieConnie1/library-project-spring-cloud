package com.library.bookMicroservice.controller;

import com.library.bookMicroservice.entity.Book;
import com.library.bookMicroservice.record.BookRecord;
import com.library.bookMicroservice.service.BookService;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.core.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/book")
public class BookController {

    @Autowired
    BookService bookService;

    /*@GetMapping("getAll")
    public List<Book> getAllBooks() {
        return bookService.getAllBooks();
    }*/

    @GetMapping("/{bookId}")
    public Response getBookById(@PathVariable("bookId") Long bookId){
        BookRecord response = bookService.getBookById(bookId);
        if(Objects.isNull(response)){
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(response).build();
    }
}
