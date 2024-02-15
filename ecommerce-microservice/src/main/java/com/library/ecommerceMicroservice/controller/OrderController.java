package com.library.ecommerceMicroservice.controller;
import com.library.ecommerceMicroservice.entity.Orders;
import com.library.ecommerceMicroservice.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@RequestMapping("/")
public class OrderController {
    private final OrderService orderService;

    @Autowired
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/{id}")
    public Optional<Orders> getOrderById(@PathVariable Long id) {
        return orderService.getOrderById(id);
    }
}
