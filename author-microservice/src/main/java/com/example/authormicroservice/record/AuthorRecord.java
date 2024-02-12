package com.example.authormicroservice.record;

import jakarta.persistence.Column;

public record AuthorRecord(Long id, String name, String surname,Long genreId, String biography) {
}
