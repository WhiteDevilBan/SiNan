package com.springapp.mvc.dao;

import com.springapp.mvc.domain.Rule;
import com.springapp.mvc.util.MyBatisRepository;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2016/12/23.
 */
@MyBatisRepository
public interface RuleDao {
    List<Rule> getAllRule();

    void addRule(@Param("rule")Rule rule);

    void updateRule(@Param("rule")Rule rule);

    void deleteRule(@Param("id")int id);
}
