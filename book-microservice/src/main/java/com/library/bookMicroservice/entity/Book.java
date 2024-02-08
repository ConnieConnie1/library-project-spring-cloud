package com.library.bookMicroservice.entity;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
@Entity
@Table(name="BOOK")

public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Column(name = "AUTHOR_ID")
    private Long authorId;

    @Column(name = "GENRE_ID")
    private Long genreId;

    @Column(name = "EDITION_DATE")
    private Date editionDate;

    @Column(name = "PRINT_DATE")
    private Date printDate;

    @Column(name = "PUBLISHER_ID")
    private Long publisherId;

    @Column(name = "PRICE")
    private Long price;

    @Column(name = "EAN", unique = true)
    private String ean;

    @Column(name = "PAGE_NUMBER")
    private Integer pageNumber;

    @Column(name = "SYNOPSIS", length = 100000)
    private String synopsis;

    @Column(name = "RATING")
    private Integer rating;


}
