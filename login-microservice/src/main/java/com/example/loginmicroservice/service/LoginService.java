package com.example.loginmicroservice.service;

import com.example.loginmicroservice.entity.user.RegisteredUser;
import com.example.loginmicroservice.entity.user.User;
import com.example.loginmicroservice.record.UserDetailRecord;
import com.example.loginmicroservice.record.UserRecord;
import com.example.loginmicroservice.util.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Objects;

@Service
public class LoginService {
    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private DiscoveryClient discoveryClient;

    public UserRecord createNewUser(UserRecord requestBody){
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        ResponseEntity<RegisteredUser> response = restTemplate.postForEntity(databaseServiceUrl + "/api/db/user/createUser", requestBody, RegisteredUser.class);
        RegisteredUser user = response.getBody();
        if(Objects.nonNull(user)){
            return new UserRecord(user.getEmail(), user.getPassword());
        }
        return null;
    }

    public String login(UserRecord request){
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        ResponseEntity<RegisteredUser> response = restTemplate.getForEntity(databaseServiceUrl + "/api/db/user/login?mail=" + request.email() + "&password=" + request.password(), RegisteredUser.class);
        RegisteredUser user = response.getBody();
        if(Objects.nonNull(user)){
            if(user.getPassword() != null) {
                return JwtUtil.generateToken(request.email());
            }
            return "Wrong credentials. Please try again!";
        }
        return null;
    }

    public void modifyUserDetails(UserDetailRecord requestBody){
        String databaseServiceUrl = discoveryClient.getInstances("db-microservice").get(0).getUri().toString();
        restTemplate.put(databaseServiceUrl + "/api/db/user/modifyUserDetails", requestBody, User.class);
    }
}
