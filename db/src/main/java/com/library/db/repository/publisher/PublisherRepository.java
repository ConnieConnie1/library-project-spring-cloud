package com.library.db.repository;

import com.library.db.entity.Book;
import com.library.db.entity.Publisher;
import com.library.db.record.PaginationResponse;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PublisherRepository extends JpaRepository<Publisher, Long>, PublisherCustomRepository {
}
