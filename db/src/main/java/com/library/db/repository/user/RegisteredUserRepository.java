package com.library.db.repository.user;

import com.library.db.entity.user.RegisteredUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegisteredUserRepository extends JpaRepository<RegisteredUser, Long> {

    RegisteredUser findByEmail(String email);
    RegisteredUser findByEmailAndPassword(String email, String password);
}
