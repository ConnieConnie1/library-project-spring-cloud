package com.library.bookMicroservice.service;

import com.library.bookMicroservice.entity.Book;
import com.library.bookMicroservice.record.BookRecord;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public interface BookService {
    //GetAllBooks
    public List<BookRecord> getAllBooks();
}
