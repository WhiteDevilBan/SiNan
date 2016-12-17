package com.springapp.mvc.dao;


import com.springapp.mvc.domain.User;
import com.springapp.mvc.util.MyBatisRepository;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Administrator on 2016/12/16.
 */
@MyBatisRepository
public interface UserDao {

    User valid(@Param("email")String email, @Param("password")String password);

    void regist(User user);
}
