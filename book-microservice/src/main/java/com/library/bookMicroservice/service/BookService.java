package com.library.bookMicroservice.service;

import com.library.bookMicroservice.entity.Book;
import com.library.bookMicroservice.record.BookRecord;

import com.library.bookMicroservice.record.PaginationResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class BookService {
    private static final Logger logger = LoggerFactory.getLogger(BookService.class);


    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private DiscoveryClient discoveryClient;

    //GetAllBooks
    public PaginationResponse<BookRecord> getAllBooks(Long authorId, Long genreId, Date editionDate, Date printDate, Long publisherId, Long price, Integer pageNumber, Integer rating, Integer pageSize, Integer currentPage) {
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        String url = databaseServiceUrl + "/api/db/book";
        if (isParameterPresent(authorId, genreId, editionDate, printDate, publisherId, price, pageNumber, rating, pageSize, currentPage)){
            url += "?";
        }
        if (authorId != null) {
            url += "authorId=" + authorId + "&";
        }
        if (genreId != null) {
            url += "genreId=" + genreId + "&";
        }
        if (editionDate != null) {
            url += "editionDate=" + editionDate.getTime() + "&";
        }
        if (printDate != null) {
            url += "printDate=" + printDate.getTime() + "&";
        }
        if (publisherId != null) {
            url += "publisherId=" + publisherId + "&";
        }
        if (price != null) {
            url += "price=" + price + "&";
        }
        if (pageNumber != null) {
            url += "pageNumber=" + pageNumber + "&";
        }
        if (rating != null) {
            url += "rating=" + rating + "&";
        }
        if (pageSize != null) {
            url += "pageSize=" + pageSize + "&";
        }
        if (currentPage != null) {
            url += "currentPage=" + currentPage + "&";
        }

        if (url.endsWith("&")) {
            url = url.substring(0, url.length() - 1);
        }

        ResponseEntity<PaginationResponse<Book>> response = restTemplate.exchange(
                url,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<PaginationResponse<Book>>() {
                });
        List<Book> books = response.getBody().getData();
        PaginationResponse<BookRecord> result = new PaginationResponse<BookRecord>();
        result.setCurrentPage(currentPage);
        result.setTotalPage(response.getBody().getTotalPage());

        List<BookRecord> data = books.stream()
                .map(book -> new BookRecord(
                        book.getId(),
                        book.getTitle(),
                        book.getAuthor().getName(),
                        book.getAuthor().getSurname(),
                        book.getGenreId().getGenre(),
                        book.getEditionDate(),
                        book.getPrintDate(),
                        book.getPublisherId().getPublisherName(),
                        book.getPrice(),
                        book.getEan(),
                        book.getPageNumber(),
                        book.getSynopsis(),
                        book.getRating()))
                .collect(Collectors.toList());

        result.setData(data);
        return result;
    }

    public BookRecord getBookById(Long id){
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        ResponseEntity<Book> response = restTemplate.getForEntity(databaseServiceUrl + "/api/db/book/" + id, Book.class);
        Book book = response.getBody();
        if(Objects.nonNull(book)){
            return new BookRecord(book.getId(),book.getTitle(),book.getAuthor().getName(),book.getAuthor().getSurname(), book.getGenreId().getGenre(), book.getEditionDate(), book.getPrintDate(), book.getPublisherId().getPublisherName(), book.getPrice(), book.getEan(), book.getPageNumber(), book.getSynopsis(),book.getRating());
        }
        return null;
    }

    public boolean isParameterPresent(Long authorId, Long genreId, Date editionDate, Date printDate, Long publisherId, Long price, Integer pageNumber, Integer rating, Integer pageSize, Integer currentPage) {
        if (authorId != null || genreId != null || editionDate != null || printDate != null || publisherId != null || price != null || pageNumber != null || rating != null || pageSize != null || currentPage != null){
            return true;
        } return false;
    }

}
