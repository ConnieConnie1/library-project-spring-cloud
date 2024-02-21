package com.library.db.record;

import java.util.Date;

public record UserDetailRecord(Long registeredUserId, String email, String name, String surname, Date dateOfBirth, String address) {
}
