package com.springapp.mvc.domain;

import lombok.Data;

import java.util.Date;

/**
 * Created by Administrator on 2016/12/18.
 */
@Data
public class Parameter {

    private String gameName;
    private int type=0;//1:好评，2:差评
    private String startTime;
    private String endTime;
    private String store;
    private int star;
    private String word;
    private int pageNo = 1;
    private int perPageNo = 10;
    private int offset =0;
}
