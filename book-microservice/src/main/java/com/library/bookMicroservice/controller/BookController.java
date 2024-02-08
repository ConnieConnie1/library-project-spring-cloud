package com.library.bookMicroservice.controller;

import jakarta.ws.rs.Path;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/book")
public class BookController {

    @GetMapping("/test")
    public String test(){
        return "TEST";
    }
}
