package com.example.loginmicroservice.service;

import com.example.loginmicroservice.entity.User;
import com.example.loginmicroservice.record.UserRecord;
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
        ResponseEntity<User> response = restTemplate.getForEntity(databaseServiceUrl + "/api/db/user/createUser" + requestBody, User.class);
        User user = response.getBody();
        if(Objects.nonNull(user)){
            return new UserRecord(user.getEmail(), user.getPassword());
        }
        return null;
    }
}
