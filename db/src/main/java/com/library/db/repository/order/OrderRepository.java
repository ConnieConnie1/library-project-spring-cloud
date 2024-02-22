package com.library.db.repository.order;

import com.library.db.entity.order.Orders;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository  extends JpaRepository<Orders, Long> {
    /*@Query("SELECT o FROM Orders o WHERE " +
            "(:bookId IS NULL OR o.bookId = :bookId) " +
            "AND (:userId IS NULL OR o.userId = :userId) " +
            "AND (:bookingDate IS NULL OR o.bookingDate = :bookingDate)")
    List<Orders> findByBookIdAndUserIdAndBookingDate(
            @Param("bookId") Long bookId,
            @Param("userId") Long userId,
            @Param("bookingDate") Date bookingDate
    );*/
}
