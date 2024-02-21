package com.library.bookMicroservice.record;

import java.util.Date;

public record BookRecord(Long id, String title, String authorName, String authorLastName, String genreName, Date editionDate, Date printDate, String publisherName, Long price, String ean, Integer pageNumber, String synopsis, Integer rating) {

}
