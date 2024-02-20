package com.library.db.service;

import com.library.db.entity.User;
import com.library.db.record.UserRecord;
import com.library.db.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    private static final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    public User createNewUser(UserRecord record){
        User newUser = new User();
        newUser.setEmail(record.email());
        String criptedPassword = encoder.encode(record.password());
        newUser.setPassword(criptedPassword);
        newUser.setDateOfRegistration(LocalDateTime.now());
        return  userRepository.save(newUser);
    }

    public User getUserByEmailAndPassword(String email, String password){
        User user = userRepository.findByEmail(email);
        if (user != null && encoder.matches(password, user.getPassword())) {
            return user;
        }
        return null;
    }
}
