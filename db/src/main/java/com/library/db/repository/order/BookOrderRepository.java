package com.library.db.repository.order;


import com.library.db.entity.book.BookOrder;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookOrderRepository extends JpaRepository<BookOrder, Long> {
}
