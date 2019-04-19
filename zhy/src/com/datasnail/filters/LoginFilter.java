package com.datasnail.filters;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;



public class LoginFilter extends HttpServlet implements Filter{
    
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public FilterConfig config;
	
	public String[] allowAuthorityURLs;
	public String[] authorityURLs;

	public void destory(){
		
	}
	
	@Override
	public void doFilter(ServletRequest sRequest, ServletResponse sResponse,
			FilterChain sFilterChain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		//需要跳转道登录界面的地址
		String redirectPath = config.getInitParameter("redirectPath");
		boolean isEnable = true; //启用过滤器
		String disableStr = config.getInitParameter("disableFilter");
		if(StringUtils.isNotEmpty(disableStr)){
			isEnable = disableStr.equals("NONONO");
		}
		
		HttpServletRequest request = (HttpServletRequest) sRequest;
		HttpServletResponse response = (HttpServletResponse) sResponse;
//		HttpSession session = request.getSession();
		String url = request.getServletPath();
//		String contextPath = request.getContextPath();
		
		//若过滤器没有启用
		if(!isEnable){
			sFilterChain.doFilter(request, response);
//			return;
		}
		//需要过滤的后缀
		String authorityURL = config.getInitParameter("authorityURLs");
		if(StringUtils.isNoneEmpty(authorityURL)){
			authorityURLs = authorityURL.split(",");
		}
		if(authorityURLs(request)){
			String allowAuthorityURL = config.getInitParameter("allowAuthorityURL");
			allowAuthorityURLs = allowAuthorityURL.split(",");
		   //不需要过滤
			if(allowAuthorityURL(request)){
				sFilterChain.doFilter(request, response);
//				return;
			}
			//需要过滤
			else{
				System.out.println("####"+url);
				relogin(redirectPath,request,response);
//				if(!relogin(redirectPath,request,response)) {
//					
//					return;
//				}
			
			}
			sFilterChain.doFilter(request, response);
		}
		else{
			sFilterChain.doFilter(request, response);
		}
		
		
//		String usersession = (String) session.getAttribute("username");
//		if(url.equals("")) url += "/";
//		if((url.startsWith("/") && !url.startsWith("/login") && (usersession == null)))
//		{
//		    	
//			System.out.println("####"+url);
//		    response.sendRedirect(contextPath + "/login.jsp");
//		
//		}
		/*
		if((url.startsWith("/") && !url.startsWith("/login")))
		{
			System.out.println("####"+url);
			String user = (String) session.getAttribute("username");
			if (user == null)
			{
				response.sendRedirect(contextPath + "/login.jsp");
				//return;
			}
			
		}
		*/
//		sFilterChain.doFilter(sRequest,sResponse);
	}

	

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		config = filterConfig;
	}
	
	//不需要过滤的URL
	private boolean allowAuthorityURL(HttpServletRequest request){
		boolean isAllow = false;
		String currentURL = request.getServletPath();
		if(!ArrayUtils.isEmpty(allowAuthorityURLs)){
			for(String allowURL : allowAuthorityURLs){
				//containsIgnoreCase()函数用于确定一个字符串是否包含指定子串
				if(currentURL.equals(allowURL)){
					isAllow = true;
					break;
				}
			}
		}
		return isAllow;
	}
	
	//需要过滤的后缀
	private boolean authorityURLs(HttpServletRequest request){
		boolean isFilter = false;
		String url = request.getServletPath();
		if(ArrayUtils.isNotEmpty(authorityURLs)){
			for(String str : authorityURLs){
				if(request.getServletPath().indexOf(str) != -1){
					isFilter = true;
					break;
				}
			}
		}
		return isFilter;
	}
 //relogin返回假：代表重新登录，真：代表session存在
	private boolean relogin(String redirectPath, HttpServletRequest sRequest,
			HttpServletResponse sResponse) throws IOException {
		// TODO Auto-generated method stub
		
        HttpServletRequest request = (HttpServletRequest) sRequest;
		HttpServletResponse response = (HttpServletResponse) sResponse;
		
		response.setContentType("text/html;charset=UTF-8");  
        response.setCharacterEncoding("UTF-8");  
        String contextPath = request.getContextPath();
//        PrintWriter out = null;
//		
//			out = response.getWriter();
		String url = request.getServletPath();
        // 判断该用户是否存在session中，如果有直接进入当前action  
        if (null == request.getSession().getAttribute("username"))  
        {  
            // 跳转到登录界面  
//           out.print("<script language='javascript'>alert('身份验证失效，请重新登录！');window.parent.location.href='"  
//                    + redirectPath + "';</script>");  
        	if(!url.startsWith("/login.jsp"))//&&url.indexOf("userInfo.do")!=-1
        	{
        		response.sendRedirect(contextPath + "/login.jsp");
        	}
			
		
            return false;  
        }  
  
        // 如果用户禁用掉cookie，则跳转到登录界面，提示用户启用cookie  
        Cookie[] cookies = request.getCookies();  
        if (null == cookies)  
        {  
            // 1.可能用户清除过cookie 2.可能是由于用户禁用了cookie 此时都会跳转到登录界面  
            // 跳转到登录界面  
//            out.print("<script language='javascript'>alert('Cookie被清理或是已禁用，请尝试重新登录！');window.parent.location.href='"  
//                    + redirectPath + "';</script>");  
            
				response.sendRedirect(contextPath + "/login.jsp");
			
            return false;  
        }  
        return true; 
	}
}
