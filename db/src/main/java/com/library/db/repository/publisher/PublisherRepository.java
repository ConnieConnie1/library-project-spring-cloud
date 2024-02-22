package com.library.db.repository.publisher;

import com.library.db.entity.publisher.Publisher;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PublisherRepository extends JpaRepository<Publisher, Long>, PublisherCustomRepository {
}
