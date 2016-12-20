package com.springapp.mvc.service;

import com.springapp.mvc.dao.CommentDao;
import com.springapp.mvc.domain.Comment;
import com.springapp.mvc.domain.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by Administrator on 2016/12/18.
 */
@Service
public class CommentService {

    @Autowired
    private CommentDao commentDao;

    public int getCommentCount(Parameter param) {
        return commentDao.getCommentCount(param);
    }


    public List<Comment> getCommentList(Parameter param) {
        List<Comment> list = commentDao.getCommentList(param);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (Comment comment : list) {
            comment.setCommentTimeStr(format.format(comment.getCommentTime()));
        }
        return list;
    }


    public int getTotalCount(Parameter param) {
        return commentDao.getTotalCount(param);
    }


}
