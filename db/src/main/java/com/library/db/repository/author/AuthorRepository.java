package com.library.db.repository.author;

import com.library.db.entity.author.Author;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthorRepository extends JpaRepository<Author, Long>, AuthorCustomRepository {
}
