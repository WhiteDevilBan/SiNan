package com.springapp.mvc.domain;

import lombok.Data;

import java.util.Date;

/**
 * Created by Administrator on 2016/12/18.
 */
@Data
public class Comment {

    private int id;
    private String author;
    private String content;
    private Date commentTime;
    private int score;
    private String store;
    private String gameName;
    private String commentTimeStr;
}
