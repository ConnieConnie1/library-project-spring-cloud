package com.library.db.service;

import com.library.db.entity.RegisteredUser;
import com.library.db.entity.Users;
import com.library.db.record.UserDetailRecord;
import com.library.db.record.UserRecord;
import com.library.db.repository.RegisteredUserRepository;
import com.library.db.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class UserService {

    @Autowired
    private RegisteredUserRepository registeredUserRepository;

    @Autowired
    private UsersRepository usersRepository;

    private static final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    public RegisteredUser createNewUser(UserRecord record){
        RegisteredUser newRegisteredUser = new RegisteredUser();
        newRegisteredUser.setEmail(record.email());
        String criptedPassword = encoder.encode(record.password());
        newRegisteredUser.setPassword(criptedPassword);
        newRegisteredUser.setDateOfRegistration(LocalDateTime.now());
        return  registeredUserRepository.save(newRegisteredUser);
    }

    public Users insertUserDetails(UserDetailRecord record, Long registeredUserId){
        Users userDetails = new Users();
        userDetails.setAddress(record.address());
        userDetails.setName(record.name());
        userDetails.setSurname(record.surname());
        userDetails.setEmail(record.email());
        userDetails.setDateOfBirth(record.dateOfBirth());
        userDetails.setRegisteredUserId(registeredUserId);
        return usersRepository.save(userDetails);
    }

    public RegisteredUser getUserByEmailAndPassword(String email, String password){
        RegisteredUser registeredUser = registeredUserRepository.findByEmail(email);
        if (registeredUser != null && encoder.matches(password, registeredUser.getPassword())) {
            return registeredUser;
        }
        return null;
    }
}
