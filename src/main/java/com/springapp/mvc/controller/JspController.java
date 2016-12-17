package com.springapp.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2016/12/17.
 */
@Controller
@RequestMapping("/")
public class JspController {


    @RequestMapping("{url}")
    public String redirect(@PathVariable String url){
//        System.out.println(url);
        return url;
    }

}
