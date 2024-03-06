package com.library.db.service.order;

import com.library.db.entity.order.Orders;
import com.library.db.record.PaginationResponse;
import com.library.db.record.order.OrderRecord;
import com.library.db.repository.order.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Date;

@Service
public class OrderService {

    @Autowired
    private  OrderRepository orderRepository;


    public Orders getOrderById(Long id) {
        return orderRepository.findOrderById(id);
    }
    
    public void deleteOrderById(Long id){
       orderRepository.deleteById(id);
    }

    public PaginationResponse<Orders> getAllOrders(Integer orderNumber, String mail, Integer currentPage, Integer pageSize) {
        Pageable pageable = PageRequest.of(currentPage, pageSize);
        PaginationResponse<Orders> response = orderRepository.findOrdersByFilter(pageable, orderNumber, mail);
        return response;
    }

    public Orders createNewOrder (OrderRecord orderRecord){
        Orders order = new Orders();
        order.setOrderNumber(order.getOrderNumber());
        order.setId(order.getId());
        // order.setBookingDate(LocalDate.now());
        order.setOrderTotal(order.getOrderTotal());
        order.setAddress(order.getAddress());
        orderRepository.save(order);
        return order;
    }

}
