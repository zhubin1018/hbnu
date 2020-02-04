package com.bin.hbnu.controller;

import com.bin.hbnu.bean.User;
import com.bin.hbnu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName UserController
 * @date 2020/2/2 16:38
 **/
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/test")
    public String test(Map map) {
        User user = userService.getUserById(2);
        map.put("user", user);
        System.out.println("user = " + user);
        return "test";
    }
}
