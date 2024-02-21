package com.library.db.controller.order;

import com.library.db.entity.order.Orders;
import com.library.db.service.order.OrderService;
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
