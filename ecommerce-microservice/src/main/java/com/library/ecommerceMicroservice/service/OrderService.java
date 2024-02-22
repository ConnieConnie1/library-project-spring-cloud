package com.library.ecommerceMicroservice.service;

import com.library.ecommerceMicroservice.entity.Orders;
import com.library.ecommerceMicroservice.record.OrderRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Objects;
import java.util.Optional;

@Service
public class OrderService {

    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private DiscoveryClient discoveryClient;

    public OrderRecord getOrderById(Long id) {
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        ResponseEntity<Orders> response = restTemplate.getForEntity(databaseServiceUrl + "/api/db/order/" + id, Orders.class);
        Orders order = response.getBody();
        if(Objects.nonNull(order)){
            return new OrderRecord(order.getId(), order.getOrderNumber(), order.getBookId(), order.getUserId(), order.getAddress(), order.getBookingDate(),order.getOrderTotal());
        }
        return null;
    }

    public void deleteOrderById(Long id){
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        restTemplate.delete(databaseServiceUrl + "/api/db/order/delete/" + id);
    }
}
