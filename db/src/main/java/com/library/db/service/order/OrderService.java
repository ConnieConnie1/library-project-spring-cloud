package com.library.db.service.order;

import com.library.db.entity.book.Book;
import com.library.db.entity.order.Orders;
import com.library.db.record.PaginationResponse;
import com.library.db.repository.order.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class OrderService {

    @Autowired
    private  OrderRepository orderRepository;


    public Orders getOrderById(Long id) {
        Orders order = orderRepository.findOrderById(id);
        return order;
    }
    
    public void deleteOrderById(Long id){
       orderRepository.deleteById(id);
    }

    public PaginationResponse<Orders> getAllOrders(Integer orderNumber, Long userId, Integer currentPage, Integer pageSize) {
        Pageable pageable = PageRequest.of(currentPage, pageSize);
        PaginationResponse<Orders> response = orderRepository.findOrdersByFilter(pageable, orderNumber, userId);
        return response;
    }
}
