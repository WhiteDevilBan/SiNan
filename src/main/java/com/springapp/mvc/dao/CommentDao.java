package com.springapp.mvc.dao;

import com.springapp.mvc.domain.Comment;
import com.springapp.mvc.domain.Parameter;
import com.springapp.mvc.util.MyBatisRepository;

import java.util.List;

/**
 * Created by Administrator on 2016/12/18.
 */
@MyBatisRepository
public interface CommentDao {
    int getCommentCount(Parameter param);

    List<Comment> getCommentList(Parameter param);

    int getTotalCount(Parameter param);

}
