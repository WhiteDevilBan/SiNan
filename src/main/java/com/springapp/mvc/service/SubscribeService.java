package com.springapp.mvc.service;

import com.springapp.mvc.dao.SubscribeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2016/12/23.
 */
@Service
public class SubscribeService {

    @Autowired
    private SubscribeDao subserviceDao;

    public void modifyHotWord(String gameName, String hotWord, String userName) {
        subserviceDao.modifyHotWord(gameName, hotWord, userName);
    }

    public int insertHotWord(String gameName, String hotWord, String userName) {
        return subserviceDao.insertHotWord(gameName, hotWord, userName);
    }

    public boolean existHotWord(String gameName, String userName) {
        int result = subserviceDao.existHotWord(gameName,userName);
        if(result == 1){
            return true;
        } else {
            return false;
        }
    }
}
