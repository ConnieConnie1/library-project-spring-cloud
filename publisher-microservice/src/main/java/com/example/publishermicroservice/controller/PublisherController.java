package com.example.publishermicroservice.controller;

import com.example.publishermicroservice.entity.Publisher;
import com.example.publishermicroservice.record.PublisherRecord;
import com.example.publishermicroservice.service.PublisherService;
import jakarta.ws.rs.core.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

@RestController
@RequestMapping("")
public class PublisherController {

    @Autowired
    private PublisherService publisherService;

    @GetMapping("/{id}")
    public Response getPublisherById(@PathVariable Long id) {
        PublisherRecord response = publisherService.getPublisherById(id);
        if (Objects.isNull(response)) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(response).build();
    }
}
