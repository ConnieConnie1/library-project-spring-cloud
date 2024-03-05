package com.library.db.record.order;

import com.library.db.record.book.BookRecord;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public record OrderRecord(Long id, Integer orderNumber, List<BookRecord> books, String userMail, String userName, String userSurname, String address, Date bookingDate,
                          BigDecimal orderTotal) {
}
