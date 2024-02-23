package com.example.loginmicroservice.record;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

public record UserDetailRecord(Long userId, String name, String surname, Date dateOfBirth, String address, LocalDateTime dateOfRegistration) {
}
