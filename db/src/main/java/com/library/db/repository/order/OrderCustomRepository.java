package com.library.db.repository.order;

import com.library.db.entity.order.Orders;
import com.library.db.record.PaginationResponse;
import org.springframework.data.domain.Pageable;

public interface OrderCustomRepository {
    PaginationResponse<Orders> findOrdersByFilter(Pageable pageable,Integer orderNumber, String mail);

    Orders findOrderById(Long id);
}
