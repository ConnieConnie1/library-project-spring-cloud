package com.library.db.service;


import com.library.db.entity.Book;
import com.library.db.entity.Publisher;
import com.library.db.record.PaginationResponse;
import com.library.db.repository.PublisherRepository;
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
        Optional<Publisher> publisher = publisherRepository.findById(id);
        return publisherRepository.findById(id).isPresent() ? publisherRepository.findById(id).get() : null;
    }

    public PaginationResponse<Publisher> getAllPublishers(Integer pageSize, Integer currentPage) {

        Pageable pageable = PageRequest.of(currentPage, pageSize);
        PaginationResponse<Publisher> response = publisherRepository.findPublisherByFilter(
                pageable, pageSize, currentPage);
        return response;
    }
}
