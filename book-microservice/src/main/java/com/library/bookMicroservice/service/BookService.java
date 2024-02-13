package com.library.bookMicroservice.service;

import com.library.bookMicroservice.entity.Book;
import com.library.bookMicroservice.record.BookRecord;

import com.library.bookMicroservice.repository.BookRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class BookService {
    private static final Logger logger = LoggerFactory.getLogger(BookService.class);
    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private DiscoveryClient discoveryClient;
    //GetAllBooks
    public List<BookRecord> getAllBooks() {
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        /*ResponseEntity<List<Book>> response = restTemplate.exchange(databaseServiceUrl + "/api/db/book" , Book.class); */
        ResponseEntity<List<Book>> response = restTemplate.exchange(
                databaseServiceUrl + "/api/db/book",
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<List<Book>>() {
                });
        List<Book> books = response.getBody();
        return books.stream()
                .map(book -> new BookRecord(
                        book.getId(),
                        book.getAuthorId(),
                        book.getGenreId(),
                        book.getEditionDate(),
                        book.getPrintDate(),
                        book.getPublisherId(),
                        book.getPrice(),
                        book.getEan(),
                        book.getPageNumber(),
                        book.getSynopsis(),
                        book.getRating()))
                .collect(Collectors.toList());
    }

    public BookRecord getBookById(Long id){
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        ResponseEntity<Book> response = restTemplate.getForEntity(databaseServiceUrl + "/api/db/book/" + id, Book.class);
        Book book = response.getBody();
        if(Objects.nonNull(book)){
            return new BookRecord(book.getId(),book.getAuthorId(), book.getGenreId(), book.getEditionDate(), book.getPrintDate(), book.getPublisherId(), book.getPrice(), book.getEan(), book.getPageNumber(), book.getSynopsis(),book.getRating());
        }
        return null;
    }
}
