package org.tarena.note.interceptor;


import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import sun.misc.BASE64Decoder;

/**
 * 拦截器进行登录的验证
 * @author Administrator
 *
 */
public class LoginInterceptor  extends HandlerInterceptorAdapter{

	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		String userId="";
		 Cookie[] cookies=request.getCookies();
		 if(cookies!=null){
			 
			 
			 String token_session="";
			 if(request.getSession().getAttribute("userId")!=null)
			 userId=request.getSession().getAttribute("userId").toString()+"_token";
			 //System.out.println("userId"+userId);
			 if(request.getSession().getAttribute("token")!=null)
			 token_session =request.getSession().getAttribute("token").toString();
			 String token_cookie="";
			
			if(cookies !=null){
				 for(Cookie c:cookies){
					 System.out.println(c.getName());
					 System.out.println("可否找到"+c.getName().equals(userId));
					 if(c.getName().equalsIgnoreCase(userId)){
							token_cookie=c.getValue();
							byte[]bytes=Base64.decodeBase64(token_cookie);
							token_cookie=new String (bytes,"utf-8");
							System.out.println("cookie"+token_cookie);
							System.out.println("session"+token_session);
							break;
						}
					}
				 	//System.out.println(token_cookie!="");
					if(token_cookie!=""&&token_cookie.equals(token_session)){
						return true;
					}
			}
		 }
		response.sendRedirect("/noteweb/log_in.html");
		return false;
	}
	
	
}
