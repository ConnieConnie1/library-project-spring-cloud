package com.library.db.service;


import com.library.db.entity.book.Book;
import com.library.db.entity.publisher.Publisher;
import com.library.db.record.PaginationResponse;
import com.library.db.repository.publisher.PublisherRepository;
import com.library.db.repository.publisher.PublisherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PublisherService {

    @Autowired
    private PublisherRepository publisherRepository;

    public Publisher getPublisherById(Long id){
        return publisherRepository.findById(id).isPresent() ? publisherRepository.findById(id).get() : null;
    }

    public PaginationResponse<Publisher> getAllPublishers(Integer pageSize, Integer currentPage, String publisherName) {
        Pageable pageable = PageRequest.of(currentPage, pageSize);
        PaginationResponse<Publisher> response = publisherRepository.findPublisherByFilter(
                pageable, publisherName);
        return response;
    }
}
