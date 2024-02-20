package com.library.db.controller;


import com.library.db.entity.Publisher;
import com.library.db.service.PublisherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/publisher")
public class PublisherController {

    @Autowired
    private PublisherService publisherService;

    @GetMapping("/{publisherId}")
    public Publisher getPublisherById(@PathVariable("publisherId") Long publisherId){
        return publisherService.getPublisherById(publisherId);
    }
}
