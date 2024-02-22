package com.example.publishermicroservice.service;

import com.example.publishermicroservice.entity.Publisher;
import com.example.publishermicroservice.record.PaginationResponse;
import com.example.publishermicroservice.record.PublisherRecord;
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
public class PublisherService {

    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private DiscoveryClient discoveryClient;

    public PaginationResponse<PublisherRecord> getAllPublishers(int pageSize, int currentPage){

        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        String url = databaseServiceUrl +"api/db/publisher";
        ResponseEntity<PaginationResponse<Publisher>> response = restTemplate.exchange(
                url,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<PaginationResponse<Publisher>>() {

                });
        List<Publisher> publishers = response.getBody().getData();
        PaginationResponse<PublisherRecord> result = new PaginationResponse<>();
        result.setCurrentPage(currentPage);
        result.setTotalPage(response.getBody().getTotalPage());

        List<PublisherRecord> data = publishers.stream()
                .map(publisher -> new PublisherRecord(
                        publisher.getId(),
                        publisher.getPublisherName(),
                        publisher.getDescription()
                )).collect(Collectors.toList());

        result.setData(data);
        return result;

    }
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
