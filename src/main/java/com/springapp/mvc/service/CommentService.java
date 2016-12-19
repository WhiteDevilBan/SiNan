package com.springapp.mvc.service;

import com.springapp.mvc.dao.CommentDao;
import com.springapp.mvc.domain.Comment;
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

    public int getCommentCount(int type) {
        return commentDao.getCommentCount(type);
    }


    public List<Comment> getCommentList() {
        List<Comment> list = commentDao.getCommentList();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (Comment comment : list) {
            comment.setCommentTimeStr(format.format(comment.getCommentTime()));
        }
        return list;
    }
}
