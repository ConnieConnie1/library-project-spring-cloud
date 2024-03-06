package com.library.ecommerceMicroservice.record;

public record OrderModifyRecord(Long orderId, String orderStatus, Boolean currentOrder) {
}
