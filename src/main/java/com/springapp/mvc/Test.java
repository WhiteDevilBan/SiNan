package com.springapp.mvc;

import com.springapp.mvc.util.DateUtil;

/**
 * Created by Administrator on 2016/12/20.
 */
public class Test {

    public static void main(String[] args) {
        System.out.println(DateUtil.getTimeString());
        System.out.println(DateUtil.getNow());
        System.out.println(DateUtil.format(DateUtil.addDay(DateUtil.parse(DateUtil.getNow()),-1)));
    }
}
