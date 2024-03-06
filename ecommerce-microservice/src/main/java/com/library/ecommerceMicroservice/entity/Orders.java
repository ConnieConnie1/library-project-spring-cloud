package com.library.ecommerceMicroservice.entity;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name="ORDERS")
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = " ORDER_NUMBER")
    private Integer orderNumber;
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "BOOK_ORDERS", // Questo dovrebbe essere il nome della tabella di collegamento
            joinColumns = @JoinColumn(name = "ORDER_ID"), // Questa dovrebbe essere la colonna nella tabella di collegamento che fa riferimento all'ID dell'ordine
            inverseJoinColumns = @JoinColumn(name = "BOOK_ID") // Questa dovrebbe essere la colonna nella tabella di collegamento che fa riferimento all'ID del libro
    )
    private Set<Book> books;
    @ManyToOne(targetEntity = Users.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "USER_ID")
    private Users user;
    @Column(name = "ADDRESS")
    private String address;
    @Column(name = "BOOKING_DATE")
    private Date bookingDate;
    @Column(name = "ORDER_TOTAL")
    private BigDecimal orderTotal;

    @Column(name = "CURRENT_ORDER")
    private Boolean currentOrder;

    @Column(name = "ORDER_STATUS")
    private String orderStatus;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(Integer orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Set<Book> getBooks() {
        return books;
    }

    public void setBooks(Set<Book> books) {
        this.books = books;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public BigDecimal getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(BigDecimal orderTotal) {
        this.orderTotal = orderTotal;
    }

    public Boolean getCurrentOrder() {
        return currentOrder;
    }

    public void setCurrentOrder(Boolean currentOrder) {
        this.currentOrder = currentOrder;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
}
