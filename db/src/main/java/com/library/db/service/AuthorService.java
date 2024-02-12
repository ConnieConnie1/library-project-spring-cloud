package com.library.db.service;

import com.library.db.entity.Author;

import com.library.db.repository.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AuthorService {

    @Autowired
    private AuthorRepository authorRepository;

    public Author getAuthorById(Long id){
        Optional<Author> author = authorRepository.findById(id);
        return authorRepository.findById(id).isPresent() ? authorRepository.findById(id).get() : null;
    }
}
