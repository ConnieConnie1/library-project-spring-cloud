package com.library.ecommerceMicroservice.controller;

import com.library.ecommerceMicroservice.entity.Orders;
import com.library.ecommerceMicroservice.record.OrderRecord;
import com.library.ecommerceMicroservice.service.OrderService;
import jakarta.ws.rs.core.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;
import java.util.Optional;

@RestController
@RequestMapping("/")
public class OrderController {

    @Autowired
    private OrderService orderService;

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
