package com.library.db.repository.author;

import com.library.db.entity.author.Author;
import com.library.db.record.PaginationResponse;
import org.springframework.data.domain.Pageable;

public interface AuthorCustomRepository {

    PaginationResponse<Author> findAuthorByFilter (Pageable pageable, String name, String surname);


}
