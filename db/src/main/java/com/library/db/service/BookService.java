package com.library.db.service;

import com.library.db.entity.Book;
import com.library.db.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class BookService {
    @Autowired
    BookRepository bookRepository;
    //GetAllBooks

    public Book getBookById(Long id){
        return bookRepository.findById(id).isPresent() ? bookRepository.findById(id).get() : null;
    }
}
