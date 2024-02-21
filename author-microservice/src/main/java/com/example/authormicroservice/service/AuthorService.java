package com.example.authormicroservice.service;

import com.example.authormicroservice.entity.Author;
import com.example.authormicroservice.entity.Book;
import com.example.authormicroservice.record.AuthorRecord;

import com.example.authormicroservice.record.PaginationResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class AuthorService {
    private static final Logger logger = LoggerFactory.getLogger(AuthorService.class);

    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private DiscoveryClient discoveryClient;

    public PaginationResponse<AuthorRecord> getAllAuthors(Long id, String name, String surname, Long genreId, String biography, List<Long> bookIds, Integer pageSize, Integer currentPage){
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        String url = databaseServiceUrl +"/api/db/author";
        if (isParameterPresent(id, name, surname, genreId, biography, bookIds, pageSize, currentPage)) {
            url += "?";
            boolean isFirstParam = true; // Aggiunto un flag per gestire il primo parametro
            if (id != null) {
                url += "id=" + id;
            }

            if (name != null) {
                url += "&name=" + name;
            }

            if (surname != null) {
                url += "&surname=" + surname;
            }

            if (genreId != null) {
                url += "&genreId=" + genreId;
            }

            if (biography != null) {
                url += "&biography=" + biography;
            }

            if (bookIds != null) {
                for (Long bookId : bookIds) {
                    url += "&bookIds=" + bookId;
                }
            }

        }


        ResponseEntity<PaginationResponse<Author>> response = restTemplate.exchange(
                url,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<PaginationResponse<Author>>() {}
        );
        List<Author> authors = response.getBody().getData();
        PaginationResponse<AuthorRecord> result = new PaginationResponse<AuthorRecord>();
        result.setCurrentPage(currentPage);
        result.setTotalPage(response.getBody().getTotalPage());


            List<AuthorRecord> data = authors.stream()
                    .map(author -> new AuthorRecord(
                            author.getId(),
                            author.getName(),
                            author.getSurname(),
                            author.getGenreId(),
                            author.getBiography()))
                    .collect(Collectors.toList());
            result.setData(data);
        return result;
    }
    public AuthorRecord getAuthorById(Long id){
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        ResponseEntity<Author> response = restTemplate.getForEntity(databaseServiceUrl + "/api/db/author/" + id, Author.class);
        Author author = response.getBody();
        if(Objects.nonNull(author)){
            return new AuthorRecord(author.getId(), author.getName(), author.getSurname(), author.getGenreId(), author.getBiography());
        }
        return null;
    }

    public boolean isParameterPresent(Long id, String name, String surname, Long genreId, String biography, List<Long> bookIds, Integer pageSize, Integer currentPage) {
        return id != null || name != null || surname != null || genreId != null || biography != null || (bookIds != null && !bookIds.isEmpty()) || pageSize != null || currentPage != null;
    }

}
