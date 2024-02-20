package com.library.db.entity;

import jakarta.persistence.*;

import java.util.Date;


@Entity
@Table(name="BOOK")
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @ManyToOne(targetEntity = Author.class, fetch = FetchType.LAZY)
    @Column(name = "AUTHOR_ID")
    private Author author;

    @Column(name = "TITLE")
    private String title;

    @ManyToOne(targetEntity = Genre.class, fetch = FetchType.LAZY)
    @Column(name = "GENRE_ID")
    private Genre genre;

    @Column(name = "EDITION_DATE")
    private Date editionDate;

    @Column(name = "PRINT_DATE")
    private Date printDate;

    @ManyToOne(targetEntity = Publisher.class, fetch = FetchType.LAZY)
    @Column(name = "PUBLISHER_ID")
    private Publisher publisher;

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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthorId(Author authorId) {
        this.author = authorId;
    }

    public Genre getGenreId() {
        return genre;
    }

    public void setGenreId(Genre genreId) {
        this.genre = genreId;
    }

    public Date getEditionDate() {
        return editionDate;
    }

    public void setEditionDate(Date editionDate) {
        this.editionDate = editionDate;
    }

    public Date getPrintDate() {
        return printDate;
    }

    public void setPrintDate(Date printDate) {
        this.printDate = printDate;
    }

    public Publisher getPublisherId() {
        return publisher;
    }

    public void setPublisherId(Publisher publisherId) {

        this.publisher = publisherId;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getEan() {
        return ean;
    }

    public void setEan(String ean) {
        this.ean = ean;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }
}
