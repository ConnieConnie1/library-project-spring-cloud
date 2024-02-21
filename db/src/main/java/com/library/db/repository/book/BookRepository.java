package com.library.db.repository.book;

import com.library.db.entity.book.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Long>, BookCustomRepository {

}
