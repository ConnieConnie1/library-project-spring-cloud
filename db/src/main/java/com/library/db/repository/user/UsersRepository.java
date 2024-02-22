package com.library.db.repository.user;

import com.library.db.entity.user.Users;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsersRepository extends JpaRepository<Users, Long> {

    Users findByRegisteredUserId(Long registeredUserId);
}