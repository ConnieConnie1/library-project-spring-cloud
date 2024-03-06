package com.library.db.record.order;

public record OrderModifyRecord(Long orderId, String orderStatus, Boolean currentOrder) {
}
