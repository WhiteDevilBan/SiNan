package com.springapp.mvc.dao;

import com.springapp.mvc.util.MyBatisRepository;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Administrator on 2016/12/26.
 */
@MyBatisRepository
public interface TaskDao {
    int getYesCommentCount(String gameName);

    int getFeelCommentCount(@Param("gameName")String gameName, @Param("type")int type);

    int getWordCount(@Param("gameName")String gameName, @Param("word")String word);
}
