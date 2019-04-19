package com.datasnail.dao;

import org.springframework.jdbc.core.support.JdbcDaoSupport;


public class UserDao extends JdbcDaoSupport{


	
	public boolean checkUserAndPassword(String username,String password)
	{
		boolean result = false;
//		String sql = "select count(0) from users where username = "+username+" and password = "+password;
//		this.getJdbcTemplate().queryForList(sql);
		//TODO
		
		
		return true;//TODO 应该返回result
	}
	
}
