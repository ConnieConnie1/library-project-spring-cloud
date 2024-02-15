package com.library.ecommerceMicroservice.repository;

import com.library.ecommerceMicroservice.entity.Orders;
import org.springframework.data.repository.CrudRepository;

public interface OrderRepository extends CrudRepository<Orders, Long> {
    Orders findById(long id);
}
