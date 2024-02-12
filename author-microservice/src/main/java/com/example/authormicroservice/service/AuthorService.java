package com.example.authormicroservice.service;

import com.example.authormicroservice.entity.Author;
import com.example.authormicroservice.record.AuthorRecord;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Objects;

@Service
public class AuthorService {

    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private DiscoveryClient discoveryClient;

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
