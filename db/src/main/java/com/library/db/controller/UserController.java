package com.library.db.controller;

import com.library.db.entity.RegisteredUser;
import com.library.db.record.UserRecord;
import com.library.db.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/createUser")
    public RegisteredUser createUser(@RequestBody UserRecord userRecord){
        return userService.createNewUser(userRecord);
    }

    @GetMapping("login")
    public RegisteredUser login(@RequestParam String mail, @RequestParam String password){
        return userService.getUserByEmailAndPassword(mail, password);
    }
}
