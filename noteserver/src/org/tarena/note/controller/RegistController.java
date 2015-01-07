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

import sun.misc.BASE64Decoder;

@Controller
@RequestMapping("/regist")
public class RegistController {

	@Resource
	private UserService service;
	
	@RequestMapping(value="/regist",method=RequestMethod.GET)
	@ResponseBody//将返回结果转成json格式字符串
	public NoteResponse execute(
			HttpServletRequest request) throws Exception{
		String[] author_arr=Base64Util.getMessage(request);
		String name = author_arr[0];
		String password = author_arr[1];
		System.out.println("注册"+name+" "+password);
		//System.out.println(name+" "+MD5MessageDigest.md5(password));
		NoteResponse res = 
			service.regist(name, MD5MessageDigest.md5(password));
		return res;
	}
}
