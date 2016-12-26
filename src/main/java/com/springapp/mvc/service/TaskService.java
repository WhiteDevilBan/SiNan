package com.springapp.mvc.service;

import com.springapp.mvc.dao.TaskDao;
import com.springapp.mvc.domain.Rule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2016/12/26.
 */
@Service
public class TaskService {

    @Autowired
    private TaskDao taskDao;

    public int getYesCommentCount(String gameName) {

        return taskDao.getYesCommentCount(gameName);
    }

    public int getFeelCommentCount(String gameName, int type) {

        return taskDao.getFeelCommentCount(gameName,type);
    }

    public int getWordCount(String gameName, String word) {

        return taskDao.getWordCount(gameName,word);
    }
}
