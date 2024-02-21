package com.example.authormicroservice.controller;


import com.example.authormicroservice.entity.Author;
import com.example.authormicroservice.entity.Book;
import com.example.authormicroservice.record.AuthorRecord;
import com.example.authormicroservice.record.PaginationResponse;
import com.example.authormicroservice.service.AuthorService;
import jakarta.ws.rs.core.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("")
public class AuthorController {

    @Autowired
    private AuthorService authorService;

    @GetMapping("")
    public Response getAllAuthors(

            @RequestParam(required = false) String name,
            @RequestParam(required = false) String surname,
            @RequestParam(required = false, defaultValue = "10") Integer pageSize,
            @RequestParam(required = false, defaultValue = "1") Integer currentPage
    ){
        PaginationResponse<AuthorRecord> responseAuthors =  authorService.getAllAuthors(name, surname, pageSize, currentPage);
        if (Objects.isNull(responseAuthors)) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(responseAuthors).build();
    }

    @GetMapping("/{id}")
    public Response getAuthorById(@PathVariable Long id){
        AuthorRecord response = authorService.getAuthorById(id);
        if (Objects.isNull(response)) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(response).build();
        }
    }

