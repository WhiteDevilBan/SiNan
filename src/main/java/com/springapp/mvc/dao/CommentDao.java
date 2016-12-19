package com.springapp.mvc.dao;

import com.springapp.mvc.domain.Comment;
import com.springapp.mvc.util.MyBatisRepository;

import java.util.List;

/**
 * Created by Administrator on 2016/12/18.
 */
@MyBatisRepository
public interface CommentDao {
    int getCommentCount(int type);

    List<Comment> getCommentList();
}
