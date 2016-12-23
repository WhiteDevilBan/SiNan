package com.springapp.mvc.dao;

import com.springapp.mvc.util.MyBatisRepository;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Administrator on 2016/12/23.
 */
@MyBatisRepository
public interface SubscribeDao {
    void modifyHotWord(@Param("gameName")String gameName, @Param("hotWord")String hotWord,@Param("userName")String userName);

    int insertHotWord(@Param("gameName")String gameName, @Param("hotWord")String hotWord,@Param("userName")String userName);

    int existHotWord(@Param("gameName")String gameName, @Param("userName")String userName);
}
