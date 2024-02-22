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
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
        }
        return Response.ok("User registered successfully").build();
    }

    @GetMapping("/login")
    public Response login(@RequestBody UserRecord userRecord){
        String token = loginService.login(userRecord);
        if (null == token) {
            return Response.status(Response.Status.BAD_REQUEST).entity("You must register before logging in").build();
        }
        return Response.ok(token).build();
    }

    @PostMapping("/insertUserDetails")
    public Response insertUserDetails(@RequestBody UserDetailRecord userRecord, @RequestParam(required = true) Long registeredUserId){
        UserDetailRecord record = loginService.insertUserDetails(userRecord,registeredUserId);
        if (null == record) {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Found an error while saving data").build();
        }
        return Response.ok(record).build();
    }
}
