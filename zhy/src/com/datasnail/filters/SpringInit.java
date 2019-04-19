package com.datasnail.filters;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class SpringInit implements ServletContextListener{
	private static WebApplicationContext springContext;
	public SpringInit(){super();}
	public void contextInitialized(ServletContextEvent event){
		springContext = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
	}
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}
    public static ApplicationContext getApplicationContext() {
        return springContext;
    }
}
