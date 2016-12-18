package com.springapp.mvc.controller;

import com.springapp.mvc.domain.Parameter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2016/12/18.
 */
@Controller
@RequestMapping("/comment")
public class CommentController {


    @RequestMapping("/s")
    public ModelAndView getComments(Parameter parameter){


        return null;
    }

}
