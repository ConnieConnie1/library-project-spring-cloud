package com.library.db.service;

import com.library.db.entity.Book;
import com.library.db.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class BookService {
    @Autowired
    BookRepository bookRepository;
    //GetAllBooks

    public Book getBookById(Long id) {
        Optional<Book> book = bookRepository.findById(id);
        return bookRepository.findById(id).isPresent() ? bookRepository.findById(id).get() : null;
    }

    public List<Book> getAllBooks(Long authorId, Long genreId, Date editionDate, Date printDate, Long publisherId, Long price, Integer pageNumber, Integer rating) {
        // Se non ci sono filtri
        if (Objects.isNull(authorId) && Objects.isNull(genreId) && Objects.isNull(editionDate) && Objects.isNull(printDate) && Objects.isNull(publisherId) && Objects.isNull(price) && Objects.isNull(pageNumber) && Objects.isNull(rating)) {
            return bookRepository.findAll();
        } else {
            return bookRepository.findByAuthorIdAndGenreIdAndEditionDateAndPrintDateAndPublisherIdAndPriceAndPageNumberAndRating(
                    authorId, genreId, editionDate, printDate, publisherId, price, pageNumber, rating);
        }
    }
}