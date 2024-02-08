package com.library.bookMicroservice.service;

import com.library.bookMicroservice.record.BookRecord;
import com.library.bookMicroservice.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BookServiceImp implements BookService{

    // Inietto la repository
    @Autowired
    private BookRepository bookRepository;
    @Override
    public List<BookRecord> getAllBooks() {
        return bookRepository.findAll();
    }
}
