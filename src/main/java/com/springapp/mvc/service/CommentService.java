package com.springapp.mvc.service;

import com.springapp.mvc.dao.CommentDao;
import com.springapp.mvc.domain.Comment;
import com.springapp.mvc.domain.CommentCount;
import com.springapp.mvc.domain.FeelingEntry;
import com.springapp.mvc.domain.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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


    public List<CommentCount> getCommentCountWithoutTime(Parameter parameter) {

        List<String> list = new ArrayList();
        list.add("meizu");
        list.add("qq");
        list.add("Apple Store");
        List<CommentCount> result = new ArrayList();
        for(String store:list){
            parameter.setStore(store);
            List<Integer> l = commentDao.getCommentCountWithoutTime(parameter);
            CommentCount count = new CommentCount();
            count.setStore(store);
            if(l.size()>0){
                count.setGoodCount(l.get(0));
                count.setBadCount(l.get(1));
            }
            result.add(count);
        }

        return result;
    }

    public CommentCount getCommentStarCount(Parameter parameter) {
        List<Integer> starList = commentDao.getCommentStarCount(parameter);
        if(starList.size()>5) starList.remove(0);
        CommentCount commentCount = new CommentCount();
        commentCount.setCount1(starList.get(0));
        commentCount.setCount2(starList.get(1));
        commentCount.setCount3(starList.get(2));
        commentCount.setCount4(starList.get(3));
        commentCount.setCount5(starList.get(4));
        return commentCount;
    }

    public List<FeelingEntry> getFeelingLineCount(Parameter parameter){
        return commentDao.getFeelingLineCount(parameter);
    }
}
