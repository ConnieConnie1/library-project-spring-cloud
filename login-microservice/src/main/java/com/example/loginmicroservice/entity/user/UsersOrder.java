package com.example.loginmicroservice.entity.user;

import jakarta.persistence.*;

@Entity
@Table(name="USER_ORDERS")
public class UsersOrder {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = " ORDER_ID")
    private Integer orderId;

    @Column(name = "USER_ID")
    private Integer userId;

    @Column(name = "CURRENT_ORDER")
    private Boolean currentOrder;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Boolean getCurrentOrder() {
        return currentOrder;
    }

    public void setCurrentOrder(Boolean currentOrder) {
        this.currentOrder = currentOrder;
    }
}
