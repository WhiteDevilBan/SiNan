package com.springapp.mvc.dao;


import com.springapp.mvc.util.MyBatisRepository;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2016/12/16.
 */
@MyBatisRepository
public interface UserDao {

    boolean valid(String email, String password);
}
