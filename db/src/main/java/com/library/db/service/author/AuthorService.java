package com.library.db.service.author;

import com.library.db.entity.author.Author;

import com.library.db.record.PaginationResponse;
import com.library.db.repository.author.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AuthorService {

    @Autowired
    private AuthorRepository authorRepository;

    public Author getAuthorById(Long id){
        return authorRepository.findById(id).isPresent() ? authorRepository.findById(id).get() : null;
    }

    public PaginationResponse<Author> getAllAuthors(
            String name, String surname, Integer pageSize, Integer currentPage) {
        Pageable pageable = PageRequest.of(currentPage, pageSize);
        PaginationResponse<Author> response = authorRepository.findAuthorByFilter(
                pageable, name, surname);
        return response;
    }

}
