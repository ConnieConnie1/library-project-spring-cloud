package com.library.bookMicroservice.service;

import com.library.bookMicroservice.entity.Book;
import com.library.bookMicroservice.record.BookRecord;
import com.library.bookMicroservice.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Objects;

@Service
public class BookService {

    @Autowired
    BookRepository bookRepository;
    public BookRecord getBookById(Long bookId){
        Book book =  bookRepository.findById(bookId).isPresent() ? bookRepository.findById(bookId).get():null;
        if(Objects.nonNull(book)){
            return new BookRecord(book.getId(),book.getAuthorId(), book.getGenreId(), book.getEditionDate(), book.getPrintDate(), book.getPublisherId(), book.getPrice(), book.getEan(), book.getPageNumber(), book.getSynopsis(),book.getRating());
        }
        return null;
    }
}
