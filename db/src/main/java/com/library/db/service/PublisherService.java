package com.library.db.service;


import com.library.db.entity.Publisher;
import com.library.db.repository.PublisherRepository;
import org.springframework.beans.factory.annotation.Autowired;
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
}
