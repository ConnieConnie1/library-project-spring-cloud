package com.library.db.service.order;

import com.library.db.entity.order.Orders;
import com.library.db.record.PaginationResponse;
import com.library.db.repository.order.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

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

    public PaginationResponse<Orders> getAllOrders(Integer orderNumber, String mail, Integer currentPage, Integer pageSize) {
        Pageable pageable = PageRequest.of(currentPage, pageSize);
        PaginationResponse<Orders> response = orderRepository.findOrdersByFilter(pageable, orderNumber, mail);
        return response;
    }

    /*
    public Users createNewUser(UserRecord record) {
        Users user = new Users();
        user.setEmail(record.email());
        String criptedPassword = encoder.encode(record.password());
        user.setPassword(criptedPassword);
        user.setDateOfRegistration(LocalDateTime.now());
        usersRepository.save(user);
        return user;
    }
     */
}
