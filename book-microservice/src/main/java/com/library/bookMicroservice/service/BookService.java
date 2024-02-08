package com.library.bookMicroservice.service;

import com.library.bookMicroservice.record.BookRecord;
import com.library.bookMicroservice.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public interface BookService {
    //Iniezione repository
    @Autowired
    private BookRepository bookRepository;


    //GetAllBooks
    public List <BookRecord> getAllBooks(){
        return  BookRecord;
    };
}
