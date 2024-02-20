package com.example.publishermicroservice.service;

import com.example.publishermicroservice.entity.Publisher;
import com.example.publishermicroservice.record.PublisherRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Objects;

@Service
public class PublisherService {

    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private DiscoveryClient discoveryClient;

    public PublisherRecord getPublisherById(Long id){
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        ResponseEntity<Publisher> response = restTemplate.getForEntity(databaseServiceUrl + "/api/db/publisher/" + id, Publisher.class);
        Publisher publisher = response.getBody();
        if(Objects.nonNull(publisher)){
            return new PublisherRecord(publisher.getId(), publisher.getPublisherName(), publisher.getDescription());
        }
        return null;
    }
}
