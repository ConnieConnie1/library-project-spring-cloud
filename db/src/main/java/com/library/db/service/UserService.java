package com.library.db.service;

import com.library.db.entity.RegisteredUser;
import com.library.db.record.UserRecord;
import com.library.db.repository.RegisteredUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class UserService {

    @Autowired
    private RegisteredUserRepository registeredUserRepository;

    private static final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    public RegisteredUser createNewUser(UserRecord record){
        RegisteredUser newRegisteredUser = new RegisteredUser();
        newRegisteredUser.setEmail(record.email());
        String criptedPassword = encoder.encode(record.password());
        newRegisteredUser.setPassword(criptedPassword);
        newRegisteredUser.setDateOfRegistration(LocalDateTime.now());
        return  registeredUserRepository.save(newRegisteredUser);
    }

    public RegisteredUser getUserByEmailAndPassword(String email, String password){
        RegisteredUser registeredUser = registeredUserRepository.findByEmail(email);
        if (registeredUser != null && encoder.matches(password, registeredUser.getPassword())) {
            return registeredUser;
        }
        return null;
    }
}
