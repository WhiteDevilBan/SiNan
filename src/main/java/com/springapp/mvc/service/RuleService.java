package com.springapp.mvc.service;

import com.springapp.mvc.dao.RuleDao;
import com.springapp.mvc.domain.Rule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/12/23.
 */
@Service
public class RuleService {

    @Autowired
    private RuleDao ruleDao;


    public List<Rule> getAllRule() {
        return ruleDao.getAllRule();
    }


    public void addRule(Rule rule) {
        ruleDao.addRule(rule);
    }

    public void updateRule(Rule rule) {
        ruleDao.updateRule(rule);
    }

    public void deleteRule(int id) {
        ruleDao.deleteRule(id);
    }
}
