package com.library.db.service.user;

import com.library.db.entity.user.RegisteredUser;
import com.library.db.entity.user.Users;
import com.library.db.record.user.UserDetailRecord;
import com.library.db.record.user.UserRecord;
import com.library.db.repository.user.RegisteredUserRepository;
import com.library.db.repository.user.UsersRepository;
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
        RegisteredUser registeredUser =  registeredUserRepository.save(newRegisteredUser);
        Users user = new Users();
        user.setRegisteredUserId(registeredUser.getId());
        user.setEmail(record.email());
        usersRepository.save(user);
        return registeredUser;
    }

    public void modifyUserDetails(UserDetailRecord record){
        Users userDetails = usersRepository.findByRegisteredUserId(record.registeredUserId());
        if(userDetails != null){
            userDetails.setAddress(record.address());
            userDetails.setName(record.name());
            userDetails.setSurname(record.surname());
            userDetails.setDateOfBirth(record.dateOfBirth());
            usersRepository.save(userDetails);
        }
    }

    public RegisteredUser getUserByEmailAndPassword(String email, String password){
        RegisteredUser registeredUser = registeredUserRepository.findByEmail(email);
        if(registeredUser != null){
            if(encoder.matches(password, registeredUser.getPassword())){
                return registeredUser;
            }
            registeredUser.setPassword(null);
            return registeredUser;
        }
        return null;
    }
}
