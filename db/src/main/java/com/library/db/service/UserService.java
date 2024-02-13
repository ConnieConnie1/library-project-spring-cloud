package com.library.db.service;

import com.library.db.entity.User;
import com.library.db.record.UserRecord;
import com.library.db.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User createNewUser(UserRecord record){
        User newUser = new User();
        newUser.setEmail(record.email());
        newUser.setPassword(record.password());
        newUser.setDateOfRegistration(LocalDateTime.now());
        return  userRepository.save(newUser);
    }
}
