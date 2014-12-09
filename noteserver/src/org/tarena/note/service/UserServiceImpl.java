package org.tarena.note.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.tarena.note.dao.UserDao;
import org.tarena.note.entity.NoteResponse;
import org.tarena.note.entity.User;
import org.tarena.note.util.NoteUtil;

@Service
public class UserServiceImpl implements UserService{

	@Resource
	private UserDao dao;
	
	public NoteResponse checkLogin(
			String name, 
			String password) {
		
		NoteResponse res = new NoteResponse();
		
		User user = dao.findByName(name);
		if(user == null){
			res.setStatus("1");
			res.setMessage("用户名不存在");
			return res;
		}
		
		if(!user.getPassword().equals(password)){
			res.setStatus("2");
			res.setMessage("密码错误");
			return res;
		}
		
		res.setStatus("0");
		res.setMessage("用户名和密码正确");
		//颁发一个令牌和用户ID
		Map map = new HashMap();
		map.put("userId", user.getId());
		map.put("token", NoteUtil.createUUID());
		res.setData(map);
		return res;
	}

	public NoteResponse regist(String name, String password) {
		// TODO Auto-generated method stub
		NoteResponse res = new NoteResponse();
		User user = dao.findByName(name);
		if(user != null){
			res.setStatus("1");
			res.setMessage("用户名已存在");
			return res;
		}
		user=new User();
		user.setId(NoteUtil.createUUID());
		user.setName(name);
		user.setPassword(password);
		dao.insertUser(user);
		res.setStatus("0");
		res.setMessage("注册成功");
		return res;
	}

}
