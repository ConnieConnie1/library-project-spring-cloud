package com.library.bookMicroservice.controller;

import jakarta.ws.rs.Path;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

    @GetMapping("/{bookId}")
    public Response getBookById(@PathVariable("bookId") Long bookId){
        BookRecord response = bookService.getBookById(bookId);
        if(Objects.isNull(response)){
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(response).build();
    }
}
