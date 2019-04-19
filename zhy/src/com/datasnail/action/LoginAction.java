package com.datasnail.action;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.python.core.PyFunction;
import org.python.core.PyInteger;
import org.python.core.PyObject;
import org.python.util.PythonInterpreter;

import com.datasnail.dao.UserDao;
import com.datasnail.filters.SpringInit;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String result = "";
	private String userName = null;
	private String passWord = null;
	private UserDao userDao = (UserDao) SpringInit.getApplicationContext().getBean("userDao");
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String loginProcess()
	{
		System.out.println("login");
		return SUCCESS;
	}
	
	public String userLogin()
	{
		String userName = this.getUserName();
		String passWord = this.getPassWord();
		System.out.println("122");
		if(userDao.checkUserAndPassword(userName, passWord)) 
		{
			HttpServletRequest request = ServletActionContext.getRequest();
			request.getSession().setAttribute("username", userName); 
			return SUCCESS;
		}else{
			result = "用户名或密码错误！";
			return ERROR;
		}
	}
	
}
