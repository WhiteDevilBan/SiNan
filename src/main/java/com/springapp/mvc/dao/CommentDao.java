package com.springapp.mvc.dao;

import com.springapp.mvc.domain.Comment;
import com.springapp.mvc.domain.FeelingEntry;
import com.springapp.mvc.domain.HotWordCount;
import com.springapp.mvc.domain.Parameter;
import com.springapp.mvc.util.MyBatisRepository;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2016/12/18.
 */
@MyBatisRepository
public interface CommentDao {
    int getCommentCount(Parameter param);

    List<Comment> getCommentList(Parameter param);

    int getTotalCount(Parameter param);

    List<Integer> getCommentStarCount(Parameter parameter);

    List<Integer> getCommentCountWithoutTime(Parameter parameter);

    List<FeelingEntry> getFeelingLineCount(Parameter parameter);

    List<Integer> getHotWordCount(@Param("hotWord")String hotWord);
}
