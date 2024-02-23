package com.library.db.service.user;

import com.library.db.entity.user.Users;
import com.library.db.record.user.UserDetailRecord;
import com.library.db.record.user.UserRecord;
import com.library.db.repository.user.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class UserService {


    @Autowired
    private UsersRepository usersRepository;

    private static final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    public Users createNewUser(UserRecord record) {
        Users user = new Users();
        user.setEmail(record.email());
        String criptedPassword = encoder.encode(record.password());
        user.setPassword(criptedPassword);
        user.setDateOfRegistration(LocalDateTime.now());
        usersRepository.save(user);
        return user;
    }

    public void modifyUserDetails(UserDetailRecord record) {
        Users userDetails = usersRepository.findById(record.userId()).get();
        userDetails.setAddress(record.address());
        userDetails.setName(record.name());
        userDetails.setSurname(record.surname());
        userDetails.setDateOfBirth(record.dateOfBirth());
        usersRepository.save(userDetails);

    }

    public Users getUserDetailsById(Long id) {
        return usersRepository.findById(id).isPresent() ? usersRepository.findById(id).get() : null;
    }

    public Users getUserByEmailAndPassword(String email, String password) {
        Users user = usersRepository.findByEmail(email);
        if (user != null) {
            if (encoder.matches(password, user.getPassword())) {
                return user;
            }
            user.setPassword(null);
            return user;
        }
        return null;
    }
}
