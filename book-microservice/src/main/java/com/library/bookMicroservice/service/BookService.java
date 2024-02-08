package com.library.bookMicroservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public interface BookService {
    //Iniezione repository
    @Autowired
    //Iniezione del mapper
    @Autowired

    //GetAllBooks
    public List <BookDTO> getAllBooks(){
        return  BookDTO;
    };
}
