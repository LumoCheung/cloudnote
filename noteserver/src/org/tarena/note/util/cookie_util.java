package org.tarena.note.util;

import javax.servlet.http.Cookie;

/**
 * cookie的工具类
 * @author Administrator
 *
 */
public class cookie_util {
	
	public static Cookie cookie_findByName(String name,Cookie[] cookies){
		for(Cookie c:cookies){
			if(c.getName().equalsIgnoreCase(name)){
				return c;
			}
		}
		return null;
	}
}
