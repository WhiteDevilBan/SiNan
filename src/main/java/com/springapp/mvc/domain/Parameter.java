package com.springapp.mvc.domain;

import lombok.Data;

import java.util.Date;

/**
 * Created by Administrator on 2016/12/18.
 */
@Data
public class Parameter {

    private String gameName;
    private String type;//好评，差评
    private Date startTime;
    private Date endTime;
    private String store;
    private int star;
    private String word;

}
