package com.nicat.spring.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultCookingController {

    @RequestMapping("/")
    public String showDFCooking() {
        return "default_cooking";
    }
}
