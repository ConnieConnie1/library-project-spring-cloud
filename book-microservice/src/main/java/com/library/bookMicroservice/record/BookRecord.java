package com.library.bookMicroservice.record;

import java.util.Date;

public record BookRecord(Long id, Long authorId, Long genreId, Date editionDate, Date printDate, Long publisherId, Long price, String ean, Integer pageNumber, String synopsis, Integer rating) {

    //Metodi
}
