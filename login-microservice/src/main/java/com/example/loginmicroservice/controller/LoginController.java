package com.example.loginmicroservice.controller;

import com.example.loginmicroservice.record.UserDetailRecord;
import com.example.loginmicroservice.record.UserRecord;
import com.example.loginmicroservice.service.LoginService;
import jakarta.ws.rs.core.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("A problem has been encountered with user registration. Please try again later.").build();
        }
        return Response.ok("User registered successfully").build();
    }

    @GetMapping("/login")
    public Response login(@RequestBody UserRecord userRecord){
        String token = loginService.login(userRecord);
        if (null == token) {
            return Response.status(Response.Status.BAD_REQUEST).entity("You must register before logging in").build();
        } else if(token.contains("credentials")){
            return Response.status(Response.Status.BAD_REQUEST).entity("Wrong credentials. Please try again!").build();
        }
        return Response.ok(token).build();
    }

    @PutMapping("/modifyUserDetails")
    public Response modifyUserDetails(@RequestBody UserDetailRecord userRecord){
        loginService.modifyUserDetails(userRecord);
        return Response.ok("User details modified successfully").build();
    }

    @GetMapping("details/{userId}")
    public Response getUserDetails(@PathVariable("userId") Long userId){
        UserDetailRecord response = loginService.getUserDetails(userId);
        if (Objects.isNull(response)) {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("User not found!").build();
        }
        return Response.ok(response).build();
    }
}