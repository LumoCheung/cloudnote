package org.tarena.note.controller.login;



import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tarena.note.entity.NoteResponse;
import org.tarena.note.service.UserService;

import sun.misc.BASE64Decoder;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Resource
	private UserService service;
	
	@RequestMapping(value="/checklogin",method=RequestMethod.GET)
	@ResponseBody//将返回结果转成json格式字符串
	public NoteResponse execute(
			HttpServletRequest request) throws Exception{
		//Basic name:pwd
		String author = request.getHeader("Authorization");
		String[] author_arr = author.split(" ");
		//对author_arr[1]进行base64解码
		BASE64Decoder decoder = new BASE64Decoder();
		byte[] bbs = decoder.decodeBuffer(author_arr[1]);
		String author_dec = new String(bbs);
		//将解码后的author_dec进行:切割
		String[] author_arr1 = author_dec.split(":");
		String name = author_arr1[0];
		String password = author_arr1[1];
		//
		System.out.println(name+" "+password);
		
		NoteResponse res = 
			service.checkLogin(name, password);
		//将令牌存入session
		if(res.getStatus().equals("0")){
			Map map = (Map)res.getData();
			request.getSession().setAttribute(
				"token", map.get("token"));
			request.getSession().setAttribute("userId", map.get("userId"));
		}
		
		return res;
	}
}
