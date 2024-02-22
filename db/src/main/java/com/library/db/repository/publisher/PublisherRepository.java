package com.library.db.repository.publisher;

import com.library.db.entity.book.Book;
import com.library.db.entity.publisher.Publisher;
import com.library.db.record.PaginationResponse;
import com.library.db.repository.PublisherCustomRepository;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PublisherRepository extends JpaRepository<Publisher, Long>, PublisherCustomRepository {
}
