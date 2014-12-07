package org.tarena.note.dao.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.tarena.note.dao.NoteBookDao;
import org.tarena.note.dao.UserDao;
import org.tarena.note.entity.NoteBook;
import org.tarena.note.entity.NoteResponse;
import org.tarena.note.entity.User;
import org.tarena.note.service.NoteBookService;
import org.tarena.note.service.NoteBookServiceImpl;

public class TestUserDao {
	public static void main(String[] args){
		String conf = "applicationContext.xml";
		ApplicationContext ac = 
			new ClassPathXmlApplicationContext(conf);
		NoteBookServiceImpl dao = (NoteBookServiceImpl)
			ac.getBean("noteBookServiceImpl");
		
	}
}
