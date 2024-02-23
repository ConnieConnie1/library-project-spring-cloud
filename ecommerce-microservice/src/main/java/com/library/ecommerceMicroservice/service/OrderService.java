package com.library.ecommerceMicroservice.service;

import com.library.ecommerceMicroservice.entity.Orders;
import com.library.ecommerceMicroservice.record.OrderRecord;
import com.library.ecommerceMicroservice.record.PaginationResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Objects;

@Service
public class OrderService {

    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private DiscoveryClient discoveryClient;


    public PaginationResponse<Orders> getAllOrders(Integer orderNumber, Long userId, int currentPage, int pageSize) {
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        String url = databaseServiceUrl + "/api/db/order";
        if (orderNumber != null) {
            url += "?orderNumber=" + orderNumber;
        }

        if (userId != null) {
            url += (orderNumber != null ? "&" : "?") + "userId=" + userId;
        }

        if (currentPage > 0) {
            url += (orderNumber != null || userId != null ? "&" : "?") + "currentPage=" + currentPage;
        }

        if (pageSize > 0) {
            url += (orderNumber != null || userId != null || currentPage > 0 ? "&" : "?") + "pageSize=" + pageSize;
        }


        ResponseEntity<PaginationResponse<Orders>> response = restTemplate.exchange(
                url,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<PaginationResponse<Orders>>() {});

        return response.getBody();
    }
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
