package com.springapp.mvc.domain;

import lombok.Data;

/**
 * Created by Administrator on 2016/12/23.
 */
@Data
public class Rule {

    private int id;
    private String method;
    private String ml;
    private int count;
    private String type;//warning,error,complete,info
    private String op;
    private String userName;
    private String gameName;
}
