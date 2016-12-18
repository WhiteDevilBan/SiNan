package com.springapp.mvc.domain;

import lombok.Data;

import java.util.Date;

/**
 * Created by Administrator on 2016/12/18.
 */
@Data
public class Game {

    private int id;
    private String name;
    private String store;
    private int totalCommentCount;
    private int totalDownloadCount;
    private int totalScore;
    private Date date;

}
