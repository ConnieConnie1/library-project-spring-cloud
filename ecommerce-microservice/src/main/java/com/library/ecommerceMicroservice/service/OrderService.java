package com.library.ecommerceMicroservice.service;

import com.library.ecommerceMicroservice.entity.Orders;
import com.library.ecommerceMicroservice.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class OrderService {
    private final OrderRepository orderRepository;

    @Autowired
    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public Optional<Orders> getOrderById(Long id) {
        return orderRepository.findById(id);
    }
}
