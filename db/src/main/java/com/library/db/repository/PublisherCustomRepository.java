package com.library.db.repository;


import com.library.db.entity.publisher.Publisher;
import com.library.db.record.PaginationResponse;
import org.springframework.data.domain.Pageable;


public interface PublisherCustomRepository {
    PaginationResponse<Publisher> findPublisherByFilter(Pageable pageable, String publisherName);

}
