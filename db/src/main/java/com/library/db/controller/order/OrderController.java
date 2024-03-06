package com.library.db.controller.order;

import com.library.db.entity.order.Orders;
import com.library.db.record.PaginationResponse;
import com.library.db.record.order.OrderModifyRecord;
import com.library.db.record.order.OrderRecord;
import com.library.db.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @GetMapping
    PaginationResponse<Orders> getAllOrders(
            @RequestParam(required = false) Integer orderNumber,
            @RequestParam(required = false) String mail,
            @RequestParam(required = true) Long userId,
            @RequestParam(required = false) Integer currentPage,
            @RequestParam(required = false) Integer pageSize) {
        return orderService.getAllOrders(orderNumber, mail, userId, currentPage, pageSize);
    }

    @GetMapping("/{orderId}")
    public Orders getOrderById(@PathVariable("orderId") Long orderId) {
        return orderService.getOrderById(orderId);
    }

    @DeleteMapping("/delete/{orderId}")
    public void deleteOrder(@PathVariable("orderId") Long orderId) {
        orderService.deleteOrderById(orderId);
    }

    @PostMapping("/new")
    public Orders createOrder(
            @RequestBody OrderRecord orderRecord,
            @RequestParam(required = true) Long userId){
        return orderService.createNewOrder(orderRecord, userId);}

    @PutMapping("/modify")
    public void modifyOrder(@RequestBody OrderModifyRecord orderRecord){
        orderService.modifyOrder(orderRecord);
    }
}

