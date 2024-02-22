package com.library.db.controller.publisher;


import com.library.db.entity.publisher.Publisher;
import com.library.db.record.PaginationResponse;
import com.library.db.service.publisher.PublisherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/publisher")
public class PublisherController {

    @Autowired
    private PublisherService publisherService;

    @GetMapping
    public PaginationResponse<Publisher> getAllPublishers(
            @RequestParam(required = false) Integer pageSize,
            @RequestParam(required = false) Integer currentPage,
            @RequestParam(required = false) String publisherName
    ){
        return publisherService.getAllPublishers(pageSize, currentPage, publisherName);
    }

    @GetMapping("/{publisherId}")
    public Publisher getPublisherById(@PathVariable("publisherId") Long publisherId){
        return publisherService.getPublisherById(publisherId);
    }
}
