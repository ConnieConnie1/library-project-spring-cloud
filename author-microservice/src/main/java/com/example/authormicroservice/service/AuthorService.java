package com.example.authormicroservice.service;

import com.example.authormicroservice.entity.Author;
import com.example.authormicroservice.record.AuthorRecord;

import org.springframework.http.HttpMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class AuthorService {

    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private DiscoveryClient discoveryClient;

    public List<AuthorRecord> getAllAuthors(){
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        String url = databaseServiceUrl +"/api/db/author";
        ResponseEntity<List<Author>> response = restTemplate.exchange(
                url,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<List<Author>>() {}
        );
        List<Author> authors = response.getBody();
        if (authors != null) {
            return authors.stream()
                    .map(author -> new AuthorRecord(
                            author.getId(),
                            author.getName(),
                            author.getSurname(),
                            author.getGenreId(),
                            author.getBiography()))
                    .collect(Collectors.toList());
        }
        return Collections.emptyList();
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
}
