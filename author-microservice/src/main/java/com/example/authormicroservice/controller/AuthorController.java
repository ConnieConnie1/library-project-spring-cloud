package com.example.authormicroservice.controller;

import com.example.authormicroservice.record.AuthorRecord;
import com.example.authormicroservice.service.AuthorService;
import jakarta.ws.rs.core.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

@RestController
@RequestMapping("")
public class AuthorController {

    @Autowired
    private AuthorService authorService;

    @GetMapping("/{id}")
    public Response getAuthorById(@PathVariable Long id) {
        AuthorRecord response = authorService.getAuthorById(id);
        if (Objects.isNull(response)) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(response).build();
    }
}
