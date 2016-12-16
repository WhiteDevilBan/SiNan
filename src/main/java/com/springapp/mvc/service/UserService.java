package com.springapp.mvc.service;

import com.springapp.mvc.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2016/12/16.
 */
@Service
public class UserService {

    @Autowired
    private UserDao userDao;


    public boolean valid(String email, String password) {
        userDao.valid(email,password);
        return true;
    }
}
