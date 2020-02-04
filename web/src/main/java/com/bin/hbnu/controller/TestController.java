package com.bin.hbnu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName TestController
 * @date 2020/2/2 15:11
 **/
@Controller
public class TestController {
    @RequestMapping("/test")
    public String test(){
        return "test";
    }
}
