package com.givoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Locale;

@Controller
public class MainController {

//    임시 컨트롤러
    @RequestMapping(value = "/")
    public String main(Locale locale, Model model) {
        return "main_sidebar";
    }
}
