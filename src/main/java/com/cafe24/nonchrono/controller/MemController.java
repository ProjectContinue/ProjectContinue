package com.cafe24.nonchrono.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemController {

    public MemController() {
        System.out.println("-----memController() 객체 생성");
    } // memController() end


    @RequestMapping("/mem/login")
    public String mem() {
        return "mem/loginForm";
    }

} // class end
