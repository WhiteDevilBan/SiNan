package com.springapp.mvc.service;

import com.springapp.mvc.dao.UserDao;
import com.springapp.mvc.domain.User;
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
        if(password.equals(userDao.valid(email,password).getPassword())){
            return true;
        }
        return false;
    }

    public void regist(User user) {
        userDao.regist(user);
    }
}
