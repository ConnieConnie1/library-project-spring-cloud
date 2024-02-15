package com.library.ecommerceMicroservice.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import java.math.BigDecimal;
import java.util.Date;

@Entity
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Integer orderNumber;
    private Long bookId;
    private Long userId;
    private String address;
    private Date bookingDate;
    private BigDecimal orderTotal;


}
