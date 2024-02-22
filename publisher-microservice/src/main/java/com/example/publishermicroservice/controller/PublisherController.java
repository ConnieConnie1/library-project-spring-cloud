package com.example.publishermicroservice.controller;

import com.example.publishermicroservice.record.PaginationResponse;
import com.example.publishermicroservice.record.PublisherRecord;
import com.example.publishermicroservice.service.PublisherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.web.exchanges.HttpExchange;
import org.springframework.web.bind.annotation.*;
import org.springframework.core.ParameterizedTypeReference;
import jakarta.ws.rs.core.Response;

import java.util.Objects;

@RestController
@RequestMapping("")
@CrossOrigin(origins = "http://localhost:3000")
public class PublisherController {

    @Autowired
    private PublisherService publisherService;

    @GetMapping("")
    public Response getAllPublishers(
            @RequestParam(required = false, defaultValue = "10") Integer pageSize,
            @RequestParam(required = false, defaultValue = "1") Integer currentPage) {
        PaginationResponse<PublisherRecord> responsePublisher = publisherService.getAllPublishers(pageSize, currentPage);

        if (Objects.isNull(responsePublisher)) {
            return Response.status(Response.Status.NOT_FOUND).build();
        } return Response.ok(responsePublisher).build();
}

@GetMapping("/{id}")
public Response getPublisherById(@PathVariable Long id) {
    PublisherRecord response = publisherService.getPublisherById(id);
    if (Objects.isNull(response)) {
        return Response.status(Response.Status.NOT_FOUND).build();
    }
    return Response.ok(response).build();
}
}
