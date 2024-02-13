package com.library.db.entity;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name="USER")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Column(name = "EMAIL")
    private String email;

    @Column(name = "PASSWORD")
    private String password;

    @Column(name = "DATE_OF_REGISTRATION")
    private LocalDateTime dateOfRegistration;

    @Column(name = "PREFERRED_GENRES")
    private Long preferredGenres;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LocalDateTime getDateOfRegistration() {
        return dateOfRegistration;
    }

    public void setDateOfRegistration(LocalDateTime dateOfRegistration) {
        this.dateOfRegistration = dateOfRegistration;
    }

    public Long getPreferredGenres() {
        return preferredGenres;
    }

    public void setPreferredGenres(Long preferredGenres) {
        this.preferredGenres = preferredGenres;
    }
}
