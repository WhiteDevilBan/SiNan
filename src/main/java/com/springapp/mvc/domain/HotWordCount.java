package com.springapp.mvc.domain;

import lombok.Data;

/**
 * Created by Administrator on 2016/12/22.
 */
@Data
public class HotWordCount {

    private String word;
    private int count;
    private String commentTime;

}
