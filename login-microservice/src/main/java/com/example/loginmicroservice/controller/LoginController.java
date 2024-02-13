package com.example.loginmicroservice.controller;

import com.example.loginmicroservice.record.UserRecord;
import com.example.loginmicroservice.service.LoginService;
import jakarta.ws.rs.core.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

@RestController
@RequestMapping("")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @PostMapping("/registerUser")
    public Response createUser(@RequestBody UserRecord userRecord){
        UserRecord response = loginService.createNewUser(userRecord);
        if (Objects.isNull(response)) {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
        }
        return Response.ok("User registered successfully").build();
    }
}
