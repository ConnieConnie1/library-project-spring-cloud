package com.library.db.repository;

import com.library.db.entity.Author;
import com.library.db.entity.Book;
import com.library.db.record.PaginationResponse;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface AuthorCustomRepository {

    PaginationResponse<Author> findAuthorByFilter (Pageable pageable, String name, String surname);


}
