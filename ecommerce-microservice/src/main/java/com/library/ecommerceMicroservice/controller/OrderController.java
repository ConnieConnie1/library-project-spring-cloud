package com.library.ecommerceMicroservice.controller;

import com.library.ecommerceMicroservice.entity.Orders;
import com.library.ecommerceMicroservice.record.OrderRecord;
import com.library.ecommerceMicroservice.record.PaginationResponse;
import com.library.ecommerceMicroservice.service.OrderService;
import jakarta.ws.rs.core.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;
import java.util.Optional;

@RestController
@RequestMapping("/")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @GetMapping("")
    public PaginationResponse<Orders> getAllOrders(
            @RequestParam(required = false) Integer orderNumber,
            @RequestParam(required = true) Long userId,
            @RequestParam(required = false, defaultValue = "1") Integer currentPage,
            @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return orderService.getAllOrders(orderNumber, userId, currentPage, pageSize);

    }

    @GetMapping("/{id}")
    public Response getOrderById(@PathVariable Long id) {
        OrderRecord response = orderService.getOrderById(id);
        if (Objects.isNull(response)) {
            return Response.status(Response.Status.NOT_FOUND).entity("No orders found").build();
        }
        return Response.ok(response).build();
    }

    @DeleteMapping("/delete/{orderId}")
    public Response deleteOrder (@PathVariable("orderId") Long orderId){
        orderService.deleteOrderById(orderId);
        return Response.ok("Order successfully cancelled").build();
    }
}
