package com.library.ecommerceMicroservice.service;

import com.library.ecommerceMicroservice.entity.Orders;
import com.library.ecommerceMicroservice.record.BookRecord;
import com.library.ecommerceMicroservice.record.OrderRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;
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
        List<BookRecord> books = new ArrayList<>();
        if(Objects.nonNull(order)){
            order.getBooks().forEach(book ->{
                books.add(new BookRecord(book.getId(), book.getTitle(), book.getAuthor().getName(), book.getAuthor().getSurname(), book.getGenre().getGenre(), book.getEditionDate(), book.getPrintDate(), book.getPublisher().getPublisherName(), book.getPrice(), book.getEan(), book.getPageNumber(), book.getSynopsis(), book.getRating()));
            });
            return new OrderRecord(order.getId(), order.getOrderNumber(), books, order.getUser().getId(), order.getAddress(), order.getBookingDate(),order.getOrderTotal());
        }
        return null;
    }

    public void deleteOrderById(Long id){
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        restTemplate.delete(databaseServiceUrl + "/api/db/order/delete/" + id);
    }
}
