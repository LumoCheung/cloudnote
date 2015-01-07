package org.tarena.note.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Service;
import org.tarena.note.dao.NoteBookDao;
import org.tarena.note.dao.NoteDao;
import org.tarena.note.entity.Note;
import org.tarena.note.entity.NoteBook;
import org.tarena.note.entity.NoteResponse;
import org.tarena.note.util.NoteUtil;
import org.tarena.note.util.cookie_util;

@Service
public class NoteBookServiceImpl implements NoteBookService{
	
	@Resource
	private NoteBookDao noteBookDao;
	@Resource
	private NoteDao noteDao;
	public List<NoteResponse> listAllNoteBook(HttpServletRequest request) {
		Cookie c= cookie_util.cookie_findByName("userId", request.getCookies());
		List<NoteBook> listNoteBook= noteBookDao.findAllNoteBook(c.getValue().split("_")[0]);
		System.out.println("list "+c.getValue().split("_")[0]);
		List<NoteResponse>list=new ArrayList<NoteResponse>();
		for(NoteBook nb:listNoteBook){
			NoteResponse n=new NoteResponse();
			n.setStatus(nb.getNotebook_id());
			n.setMessage(nb.getNotebook_name());
			n.setData(nb.getType_id());
			list.add(n);
		}
		return list;
	}
	public NoteResponse addNotebook(String notebookName,String userId,String typeId){
		NoteBook nb=new NoteBook();
		nb.setNotebook_name(notebookName);
		String uuid=NoteUtil.createUUID();
		nb.setNotebook_id(uuid);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=sdf.format(new Date());
		nb.setNotebook_createtime(time);
		nb.setUser_id(userId);
		nb.setType_id(typeId);
		noteBookDao.insertNotebook(nb);
		NoteResponse n=new NoteResponse();
		n.setStatus(uuid);
		n.setMessage(notebookName);
		return n;
	} 
	
	/*
	 * 在其中的NoteResponse属性的status来储存new_name message来储存notebook_id
	 */
	public void rename_notebook(String new_name,String notebook_id){
		
		NoteResponse n=new NoteResponse();
		n.setStatus(new_name);
		n.setMessage(notebook_id.substring(9));
		noteBookDao.rename_notebook(n);
	}
	
	/**
	 * 判断每个笔记本内是否有内容
	 * @return NoteResponse中的status来存储 1为有内容   0是没有内容
	 * 若是有内容就要是在data中存储新的Note数组进行显示
	 */
	public NoteResponse isnull_notebook(String notebook_id){
		NoteResponse nr=new NoteResponse();
		int count= noteBookDao.countnote_notebook(notebook_id.substring(9));
		System.out.println("笔记本重数量"+count);
		if(count>0){
			nr.setStatus("1");
			
				List<Note> list=noteDao.findByNoteBookId(notebook_id.substring(9));
				nr.setData(list);
						
		}else{
			nr.setStatus("0");
		}
		
		return nr;
	}
	
	
	public NoteResponse list_recovernote(HttpServletRequest request ){
		Cookie c=cookie_util.cookie_findByName("userId", request.getCookies());
		String userId=c.getValue();
		userId=userId.split("_")[0];
		NoteResponse nr=new NoteResponse();
		nr.setData(noteDao.list_recovernote(userId));
		List<Note>list=(List<Note>)nr.getData();
		//System.out.println(list.get(0).getNote_title());
		//System.out.println("+++++++++++"+nr.getData().toString(););
		return nr;
	}
	

}
