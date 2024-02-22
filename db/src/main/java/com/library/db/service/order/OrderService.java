package com.library.db.service.order;

import com.library.db.entity.book.Book;
import com.library.db.entity.order.Orders;
import com.library.db.repository.order.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class OrderService {

    @Autowired
    private  OrderRepository orderRepository;


    public Orders getOrderById(Long id) {
        return orderRepository.findById(id).isPresent() ? orderRepository.findById(id).get() : null;
    }
    
    public void deleteOrderById(Long id){
       orderRepository.deleteById(id);
    }
}
