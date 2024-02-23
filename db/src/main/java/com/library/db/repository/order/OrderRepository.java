package com.library.db.repository.order;

import com.library.db.entity.order.Orders;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository  extends JpaRepository<Orders, Long>, OrderCustomRepository {

}
