package com.example.publishermicroservice.record;

import jakarta.persistence.Column;

public record PublisherRecord( Long id,String publisherName, String description) {
}
