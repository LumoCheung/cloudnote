package org.tarena.note.service;

import org.tarena.note.entity.NoteResponse;

/**
 * 
 * @author Administrator
 *
 */
public interface UserService {
	/**
	 * 登陆的验证
	 * @param name
	 * @param password
	 * @return
	 */
	public NoteResponse checkLogin(
			String name,String password);
	
	public NoteResponse regist(String name,String pwd,String nickName);
	
	public NoteResponse changePwd(String name,String pwd);
}
