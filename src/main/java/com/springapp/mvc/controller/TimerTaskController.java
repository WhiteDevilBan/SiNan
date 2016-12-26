package com.springapp.mvc.controller;

import com.springapp.mvc.domain.Message;
import com.springapp.mvc.domain.Rule;
import com.springapp.mvc.service.RuleService;
import com.springapp.mvc.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/12/26.
 */
@Controller
public class TimerTaskController {

    @Autowired
    private RuleService ruleService;
    @Autowired
    private TaskService taskService;


    @RequestMapping("/task/excute.do")
    public
    @ResponseBody
    List<Message> excuteTask() {
        List<Rule> list = ruleService.getAllRule();
        List<Message> messages = new ArrayList<>();
        for (Rule rule : list) {
            switch (rule.getMethod()) {
                case "评论数":
                    int commentCount = taskService.getYesCommentCount(rule.getGameName());
                    if ("<".equals(rule.getMl()) && commentCount < rule.getCount()) {
                        messages.add(buildMessage(rule, commentCount));
                    } else if (">".equals(rule.getMl()) && commentCount > rule.getCount()) {
                        messages.add(buildMessage(rule, commentCount));
                    }
                    break;
                case "好评数":
                    int goodCount = taskService.getFeelCommentCount(rule.getGameName(),1);
                    if ("<".equals(rule.getMl()) && goodCount < rule.getCount()) {
                        messages.add(buildMessage(rule, goodCount));
                    } else if (">".equals(rule.getMl()) && goodCount > rule.getCount()) {
                        messages.add(buildMessage(rule, goodCount));
                    }
                    break;
                case "差评数":
                    int badCount = taskService.getFeelCommentCount(rule.getGameName(),2);
                    if ("<".equals(rule.getMl()) && badCount < rule.getCount()) {
                        messages.add(buildMessage(rule, badCount));
                    } else if (">".equals(rule.getMl()) && badCount > rule.getCount()) {
                        messages.add(buildMessage(rule, badCount));
                    }
                    break;
                default:
                    int wordCount = taskService.getWordCount(rule.getGameName(), rule.getMethod());
                    if ("<".equals(rule.getMl()) && wordCount < rule.getCount()) {
                        messages.add(buildMessage(rule, wordCount));
                    } else if (">".equals(rule.getMl()) && wordCount > rule.getCount()) {
                        messages.add(buildMessage(rule, wordCount));
                    }
                    break;
            }
        }

        return messages;
    }

    private Message buildMessage(Rule rule, int count) {
        StringBuilder sb = new StringBuilder();
        sb.append("您所制定的规则：");
        sb.append(rule.getGameName());
        sb.append(" ");
        sb.append(rule.getMethod());
        sb.append(" ");
        sb.append(rule.getMl());
        sb.append(" ");
        sb.append(rule.getCount());
        sb.append(" ");
        sb.append("报警类型为:");
        sb.append(rule.getType());
        sb.append("现已超出阈值，值为：");
        sb.append(count);
        Message message = new Message();
        message.setContent(sb.toString());
        message.setType(rule.getType());
        return message;
    }

}
