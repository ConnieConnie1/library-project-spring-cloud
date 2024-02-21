package com.library.db.controller.user;

import com.library.db.entity.user.RegisteredUser;
import com.library.db.entity.user.Users;
import com.library.db.record.user.UserDetailRecord;
import com.library.db.record.user.UserRecord;
import com.library.db.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/createUser")
    public RegisteredUser createUser(@RequestBody UserRecord userRecord) {
        return userService.createNewUser(userRecord);
    }

    @GetMapping("login")
    public RegisteredUser login(@RequestParam String mail, @RequestParam String password) {
        return userService.getUserByEmailAndPassword(mail, password);
    }

    @PostMapping("/insertUserDetails")
    public Users insertUserDetails(@RequestBody UserDetailRecord userDetailRecord,@RequestParam(required = true) Long registeredUserId) {
        return userService.insertUserDetails(userDetailRecord, registeredUserId);
    }
}
