package com.library.db.repository;

import com.library.db.entity.RegisteredUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegisteredUserRepository extends JpaRepository<RegisteredUser, Long> {

    RegisteredUser findByEmail(String email);
    RegisteredUser findByEmailAndPassword(String email, String password);
}
