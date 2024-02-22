package com.library.db.controller.author;

import com.library.db.entity.author.Author;
import com.library.db.record.PaginationResponse;
import com.library.db.service.author.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/author")
public class AuthorController {

    @Autowired
    private AuthorService authorService;

    @GetMapping
    public PaginationResponse<Author> getAllAuthors(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String surname,
            @RequestParam(required = false) Integer pageSize,
            @RequestParam(required = false) Integer currentPage
    ){
        return authorService.getAllAuthors(name, surname, pageSize,currentPage);
    }

    @GetMapping("/{authorId}")
    public Author getAuthorById(@PathVariable("authorId") Long authorId){
        return authorService.getAuthorById(authorId);
    }
}
