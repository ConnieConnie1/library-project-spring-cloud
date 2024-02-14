package com.example.authormicroservice.controller;

import com.example.authormicroservice.record.AuthorRecord;
import com.example.authormicroservice.service.AuthorService;
import jakarta.ws.rs.core.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("")
@CrossOrigin(origins = "http://localhost:3000")
public class AuthorController {
    @Autowired
    private AuthorService authorService;
    @GetMapping("")
    public List<AuthorRecord> getAllAuthors(){
        return authorService.getAllAuthors();
    }
    @GetMapping("/{id}")
    public Response getAuthorById(@PathVariable Long id) {
        AuthorRecord response = authorService.getAuthorById(id);
        if (Objects.isNull(response)) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(response).build();
    }
}
