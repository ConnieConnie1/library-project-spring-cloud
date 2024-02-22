package com.example.loginmicroservice.record;

import java.util.Date;

public record UserDetailRecord(Long registeredUserId,String name, String surname, Date dateOfBirth, String address) {
}
