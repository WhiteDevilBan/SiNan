package com.springapp.mvc.util;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;

/**
 * Created by Administrator on 2016/12/18.
 */
public class ApplicationContextUtil {

    public static <T> T  getBean(Class<T> c){
        ApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
        return context.getBean(c);
    }
}
