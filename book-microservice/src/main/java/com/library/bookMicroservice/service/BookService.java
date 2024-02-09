package com.library.bookMicroservice.service;

import com.library.bookMicroservice.entity.Book;
import com.library.bookMicroservice.record.BookRecord;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Objects;

@Service
public class BookService {
    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private DiscoveryClient discoveryClient;
    //GetAllBooks
    public List<BookRecord> getAllBooks(){
        return null;
    };
    public BookRecord getBookById(Long id){
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        ResponseEntity<Book> response = restTemplate.getForEntity(databaseServiceUrl + "/api/book/" + id, Book.class);
        Book book = response.getBody();
        if(Objects.nonNull(book)){
            return new BookRecord(book.getId(),book.getAuthorId(), book.getGenreId(), book.getEditionDate(), book.getPrintDate(), book.getPublisherId(), book.getPrice(), book.getEan(), book.getPageNumber(), book.getSynopsis(),book.getRating());
        }
        return null;
    }
}
