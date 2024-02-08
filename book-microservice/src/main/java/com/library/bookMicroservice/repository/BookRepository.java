package com.library.bookMicroservice.repository;

import com.library.bookMicroservice.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Long> {
}
