package org.tarena.note.dao;

import org.tarena.note.entity.User;
import org.tarena.note.util.MyBatisDao;

@MyBatisDao
public interface UserDao {
	/**
	 * 查找用户名
	 * @param name
	 * @return
	 */
	public User findByName(String name);
}