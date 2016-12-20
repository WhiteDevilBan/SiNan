package com.springapp.mvc.controller;

import com.springapp.mvc.domain.CommentCount;
import com.springapp.mvc.domain.Parameter;
import com.springapp.mvc.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Administrator on 2016/12/18.
 */
@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService service;

    @RequestMapping("/s")
    public ModelAndView getComments(Parameter parameter){

        return null;
    }

    @RequestMapping("/getCommentList.json")
    public String getCommentList(Parameter parameter){

        return null;
    }

    @RequestMapping("/getCommentStarCount.json")
    public @ResponseBody CommentCount getCommentStarCount(Parameter parameter){
        List<Integer> starList = service.getCommentStarCount(parameter);
        CommentCount commentCount = new CommentCount();
        commentCount.setCount1(starList.get(0));
        commentCount.setCount2(starList.get(1));
        commentCount.setCount3(starList.get(2));
        commentCount.setCount4(starList.get(3));
        commentCount.setCount5(starList.get(4));
        return commentCount;
    }

}
