package org.tarena.note.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tarena.note.entity.NoteResponse;
import org.tarena.note.service.UserService;
import org.tarena.note.util.Base64Util;
import org.tarena.note.util.MD5MessageDigest;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Resource
	private UserService service;
	
	@RequestMapping(value="/checklogin",method=RequestMethod.POST)
	@ResponseBody//将返回结果转成json格式字符串
	public NoteResponse execute(
			HttpServletRequest request) throws Exception{
		String[] author_arr=Base64Util.getMessage(request);
		String name = author_arr[0];
		String password = author_arr[1];
		NoteResponse res = 
			service.checkLogin(name, MD5MessageDigest.md5(password));
		//将令牌存入session
		if(res.getStatus().equals("0")){
			Map map = (Map)res.getData();
			request.getSession().setAttribute(
				"token", map.get("token"));
			request.getSession().setAttribute("userId", map.get("userId"));
		}
		return res;
	}
	@RequestMapping(value="/checkpwd",method=RequestMethod.POST)
	@ResponseBody//将返回结果转成json格式字符串
	public NoteResponse checkPwd(
			HttpServletRequest request) throws Exception{
		String[] author_arr=Base64Util.getMessage(request);
		String name = author_arr[0];
		String password = author_arr[1];
		NoteResponse res = 
			service.checkLogin(name, MD5MessageDigest.md5(password));
		return res;
	}
	@RequestMapping(value="/changepwd",method=RequestMethod.POST)
	@ResponseBody//将返回结果转成json格式字符串
	public NoteResponse changePwd(
			HttpServletRequest request) throws Exception{
		String[] author_arr=Base64Util.getMessage(request);
		String name = author_arr[0];
		String lpassword = author_arr[1];
		String npassword=author_arr[2];
		NoteResponse res = 
				service.checkLogin(name, MD5MessageDigest.md5(lpassword));
		if(res.getStatus().equals("0"))
		{
			res=service.changePwd(name, MD5MessageDigest.md5(npassword));
		}
		return res;
	}
}
