package com.library.db.record.user;

import java.util.Date;

public record UserDetailRecord(Long registeredUserId, String name, String surname, Date dateOfBirth, String address) {
}