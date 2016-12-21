package com.springapp.mvc.controller;

import com.springapp.mvc.domain.CommentCount;
import com.springapp.mvc.domain.Parameter;
import com.springapp.mvc.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Collections;
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

    @RequestMapping("/getCommentCount.json")
    public @ResponseBody List<CommentCount> getCommentCount(Parameter parameter){
        List<String> list = new ArrayList();
        list.add("meizu");
        list.add("qq");
        list.add("Apple Store");
        List<CommentCount> result = new ArrayList();
        for(String store:list){
            parameter.setStore(store);
            List<Integer> l = service.getCommentCountWithoutTime(parameter);
            CommentCount count = new CommentCount();
            count.setStore(store);
            if(l.size()>0){
                count.setGoodCount(l.get(0));
                count.setBadCount(l.get(1));
            }
            result.add(count);
        }

        return result;
    }

    @RequestMapping("/getCommentStarCount.json")
    public @ResponseBody CommentCount getCommentStarCount(Parameter parameter){
        return service.getCommentStarCount(parameter);
    }

}
