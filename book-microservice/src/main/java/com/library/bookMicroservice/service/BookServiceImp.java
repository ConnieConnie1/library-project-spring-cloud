package com.library.bookMicroservice.service;

import java.util.List;

public class BookServiceImp implements BookService{

    // Inietto la repository
    @Override
    public List<BookDTO> getAllBooks() {
        return bookRepo.findAll();
    }
}
