package com.library.db.controller;

import com.library.db.entity.Author;
import com.library.db.entity.Book;
import com.library.db.record.PaginationResponse;
import com.library.db.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/author")
public class AuthorController {

    @Autowired
    private AuthorService authorService;

    @GetMapping
    public PaginationResponse<Author> getAllAuthors(
            @RequestParam(required = false) Long id,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String surname,
            @RequestParam(required = false) Long genreId,
            @RequestParam(required = false) String biography,
            @RequestParam(required = false) List<Book> book,
            @RequestParam(required = false, defaultValue = "10") Integer pageSize,
            @RequestParam(required = false, defaultValue = "1") Integer currentPage
    ){
        return authorService.getAllAuthors(id, name, surname, genreId, biography, book, pageSize,currentPage);
    }

    @GetMapping("/{authorId}")
    public Author getAuthorById(@PathVariable("authorId") Long authorId){
        return authorService.getAuthorById(authorId);
    }
}
