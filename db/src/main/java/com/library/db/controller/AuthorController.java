package com.library.db.controller;

import com.library.db.entity.Author;
import com.library.db.entity.Book;
import com.library.db.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/author")
public class AuthorController {

    @Autowired
    private AuthorService authorService;

    @GetMapping("/{authorId}")
    public Author getAuthorById(@PathVariable("authorId") Long authorId){
        return authorService.getAuthorById(authorId);
    }
}
