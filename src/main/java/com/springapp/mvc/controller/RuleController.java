package com.springapp.mvc.controller;

import com.springapp.mvc.domain.Rule;
import com.springapp.mvc.service.RuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Administrator on 2016/12/23.
 */
@Controller
public class RuleController {

    @Autowired
    private RuleService ruleService;

    @RequestMapping("/rule/updateRule.do")
    public ModelAndView updateRuleList(Rule rule){
        ModelAndView mv = new ModelAndView("alert");

        if("add".equals(rule.getOp())){
            ruleService.addRule(rule);
        } else if ("update".equals(rule.getOp())){
            ruleService.updateRule(rule);
        } else if("delete".equals(rule.getOp())){
            ruleService.deleteRule(rule.getId());
        }

        return mv;
    }

    @RequestMapping("/rule/getAllRule.json")
    public List<Rule> getAllRule(){

        return ruleService.getAllRule();
    }

}
