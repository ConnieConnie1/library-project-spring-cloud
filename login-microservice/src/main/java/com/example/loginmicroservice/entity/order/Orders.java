package com.example.loginmicroservice.entity.order;

import com.example.loginmicroservice.entity.user.User;
import com.example.loginmicroservice.entity.book.Book;
import com.fasterxml.jackson.annotation.JsonIgnore;
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
    @OneToOne(mappedBy = "currentOrder")
    @JsonIgnore
    private User user;
    @Column(name = "ADDRESS")
    private String address;
    @Column(name = "BOOKING_DATE")
    private Date bookingDate;
    @Column(name = "ORDER_TOTAL")
    private BigDecimal orderTotal;


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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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


}
