package com.library.ecommerceMicroservice.record;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import java.math.BigDecimal;
import java.util.Date;

public record OrderRecord(Long id, Integer orderNumber, Long bookId, Long userId, String address, Date bookingDate,
                          BigDecimal orderTotal) {
}
