package com.example.authormicroservice.record;

public record AuthorRecord(Long id, String name, String surname,Long genreId, String biography) {
}
