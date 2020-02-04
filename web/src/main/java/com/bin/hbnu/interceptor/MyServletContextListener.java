package com.bin.hbnu.interceptor;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName MyServletContextListener
 * @date 2020/2/2 21:54
 **/
public class MyServletContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext application = servletContextEvent.getServletContext();

        String appName = application.getContextPath();

        application.setAttribute("APP_PATH",appName);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
