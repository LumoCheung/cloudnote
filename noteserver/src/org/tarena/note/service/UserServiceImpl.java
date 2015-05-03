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
		map.put("name", user.getName());
		map.put("nick", user.getNickName());
		map.put("token", NoteUtil.createUUID());
		res.setData(map);
		return res;
	}

	public NoteResponse regist(String name, String password,String nickName) {
		// TODO Auto-generated method stub
		NoteResponse res = new NoteResponse();
		User user = dao.findByName(name);
		if(user != null){
			res.setStatus("1");
			res.setMessage("用户名已存在");
			return res;
		}
		user=new User();
		String userId=NoteUtil.createUUID();
		user.setId(userId);
		user.setName(name);
		user.setPassword(password);
		user.setNickName(nickName);
		dao.insertUser(user);
		res.setStatus("0");
		res.setMessage("注册成功");
		res.setData(userId);
		return res;
	}

	public NoteResponse changePwd(String name, String pwd) {
		User user=new User();
		user.setName(name);
		user.setPassword(pwd);
		dao.updatePwd(user);
		NoteResponse res=new NoteResponse();
		res.setStatus("0");
		res.setMessage("修改成功");
		return res;
	}
	
}
