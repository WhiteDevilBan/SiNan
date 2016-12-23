package com.springapp.mvc.controller;

import com.springapp.mvc.service.CommentService;
import com.springapp.mvc.service.SubscribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/12/23.
 */
@Controller
public class SubscribeController {

    @Autowired
    private SubscribeService subscribeService;
    @Autowired
    private CommentService commentService;

    @RequestMapping("/subscribe/modifyHotWord.do")
    public ModelAndView modifyHotWord(String gameName, String hotWord, String userName){
        ModelAndView mv = new ModelAndView("subscribe");
        if(subscribeService.existHotWord(gameName,userName)){
            subscribeService.modifyHotWord(gameName,hotWord,userName);
        } else {
            subscribeService.insertHotWord(gameName, hotWord, userName);
        }
        String[] hotWordArr= hotWord.split(",");
        List<String> hotWordList = new ArrayList<String>();
        for(String hotWordStr:hotWordArr){
            hotWordList.add(hotWordStr);
        }
        Map<String, List<Integer>> result = commentService.getHotWordCount(hotWordList);

        mv.addObject("hotWordMap",result);

        return mv;
    }

}
