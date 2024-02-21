package com.library.db.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="USERS")
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Column(name = "NAME")
    private String name;

    @Column(name = "SURNAME")
    private String surname;

    @Column(name = "REGISTERED_USER_ID")
    private Long registeredUserId;

    @Column(name = "EMAIL")
    private String email;

    @Column(name = "DATE_OF_BIRTH")
    private Date dateOfBirth;

    @Column(name = "ADDRESS")
    private String address;

    @ManyToOne(targetEntity = Orders.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "ID_OF_PAST_ORDERS")
    private List<Orders> precedentOrders;

    @OneToOne(targetEntity = Orders.class, fetch = FetchType.LAZY)
    @JoinColumn(name = " ID_OF_CURRENT_ORDERS")
    private Orders currentOrder;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<Orders> getPrecedentOrders() {
        return precedentOrders;
    }

    public void setPrecedentOrders(List<Orders> precedentOrders) {
        this.precedentOrders = precedentOrders;
    }

    public Orders getCurrentOrder() {
        return currentOrder;
    }

    public void setCurrentOrder(Orders currentOrder) {
        this.currentOrder = currentOrder;
    }

    public Long getRegisteredUserId() {
        return registeredUserId;
    }

    public void setRegisteredUserId(Long registeredUserId) {
        this.registeredUserId = registeredUserId;
    }
}
