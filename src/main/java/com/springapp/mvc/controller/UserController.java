package com.springapp.mvc.controller;

import com.springapp.mvc.domain.User;
import com.springapp.mvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login.do")
    public ModelAndView login(String email, String password) {
        ModelAndView mv;
        if (userService.valid(email, password)) {
            mv = new ModelAndView("redirect:../index");
            System.out.println("login success");
        } else {
            mv = new ModelAndView("redirect:/login");
            System.out.println("login failed");
        }
        return mv;
    }

    @RequestMapping("/regist.do")
    public ModelAndView regist(User user) {
        ModelAndView mv = new ModelAndView("redirect:/login");
        userService.regist(user);
        return mv;
    }
}