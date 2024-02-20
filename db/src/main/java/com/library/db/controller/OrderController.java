package com.library.db.controller;

import com.library.db.entity.Orders;
import com.library.db.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/orders")
public class OrderController {

        @Autowired
        private OrderService orderService;

        @GetMapping("/{orderId}")
        public Optional<Orders> getOrderById(@PathVariable("orderId") Long orderId){

            return orderService.getOrderById(orderId);
        }
    }