package com.library.db.entity;

import jakarta.persistence.*;

@Entity
@Table (name = "GENRE")
public class Genre {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "GENRE")
    private String genre;


    public Long getId(){
        return id;
    }

    public void setId(Long id){
        this.id= id;
    }

    public String getGenre(){
        return genre;
    }

    public void setGenre(String genre){
        this.genre= genre;
    }
}
