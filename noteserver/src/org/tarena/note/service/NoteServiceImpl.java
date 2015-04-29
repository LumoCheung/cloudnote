package org.tarena.note.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.tarena.note.dao.NoteDao;
import org.tarena.note.entity.Note;
import org.tarena.note.entity.NoteBook;
import org.tarena.note.entity.NoteResponse;
import org.tarena.note.util.NoteUtil;
import org.tarena.note.util.Resopnse_util;
import org.tarena.note.util.cookie_util;

@Service
public class NoteServiceImpl implements NoteSrevice {
	@Resource
	private NoteDao notedao;
	
	public void delete_note(String note_id) {
		notedao.delete_note(note_id.split("_")[1]);
		
	}
	
	
	/*
	 * 用status来储存notebook_id message来储存note_id data来存储notebook_name
	 */
	public void replay_recover_note(String notebook_id,String note_id){
		notebook_id= notebook_id.split("_")[1];
		note_id=note_id.split("_")[1];
		NoteResponse nr=new NoteResponse();
		nr.setStatus(notebook_id);
		nr.setMessage(note_id);
		notedao.replay_recover_note(nr);
	}
	
	/**
	 * 根据笔记的id查看该笔记下的内容
	 */
	public NoteResponse findByNoteId(String id)
	{
		System.out.println(id.split("_")[1]);
		Note note=notedao.findByNoteId(id.split("_")[1]);
		List<Note>list=new ArrayList<Note>();
		//System.out.println(note.getNote_body());
		list.add(note);
		return Resopnse_util.setRes(list);
	}
	
	
	public NoteResponse creat_note(String bookId,String title,HttpServletRequest request) 
	{
		String userId=cookie_util.cookie_findByName("userId", request.getCookies()).getValue().split("_")[0];
		Note note=new Note();
		//userId,noteBookId,title
		note.setUser_id(userId);
		note.setNotebook_id(bookId.split("_")[1]);
		note.setNote_title(title);
		//createTime,lastModTime
		long time=new Date().getTime();
		note.setNote_status_id("2");
		note.setNote_create_time(time);
		note.setNote_last_modify_time(time);
		//noteId(通过UUID获得)
		String noteId=NoteUtil.createUUID();
		note.setNote_id(noteId);
		//noteStatusId
		note.setNote_status_id("1");
		System.out.println(";;;;;"+note.getUser_id()+note.getNote_title()+note.getNotebook_id());
		//创建
		notedao.creat_note(note);
		NoteResponse res=Resopnse_util.setRes("创建成功");
		//System.out.println(note.getNote_id());
		res.setData(note.getNote_id());
		return res;
	}


	/**
	 * 保存，修改笔记
	 */
	public NoteResponse saveContent(String noteId,String title,String body)
	{
		System.out.println("进来咯");
		Note note=new Note();
		//title,body,noteId
		note.setNote_title(title);
		note.setNote_body(body);
		note.setNote_id(noteId.split("_")[1]);
		//lastModTime
		long time=new Date().getTime();
		note.setNote_last_modify_time(time);
		//保存修改
		notedao.saveContent(note);
		return Resopnse_util.setRes("保存成功");
	}


	
	/**
	 * 分享笔记(将分享的笔记加入到分享笔记的表中)
	 */
	public NoteResponse share(String id) {
		notedao.shareById(id.split("_")[1]);
		return Resopnse_util.setRes("分享成功");
	}

	/**
	 * 将笔记放入到回收站中
	 * @param id
	 * @return
	 */
	public NoteResponse recover(String id) {
		System.out.println("放入到回收站笔记的id"+id);
		notedao.recoverById(id.split("_")[1]);
		return Resopnse_util.setRes("成功放入回收站");
	}

	/**
	 * 显示要移动的笔记本列表
	 * 利用
	 */
	public List<NoteResponse> listAllNoteBook(HttpServletRequest request,
			String notebook_id) {
		NoteResponse nr=new NoteResponse();
		nr.setStatus(cookie_util.cookie_findByName("userId", request.getCookies()).getValue().split("_")[0]);
		nr.setMessage(notebook_id.split("_")[1]);
		List<NoteBook>listNoteBook=notedao.move_listnotebook(nr);
		List<NoteResponse>list=new ArrayList<NoteResponse>();
		for(NoteBook nb:listNoteBook){
			NoteResponse n=new NoteResponse();
			n.setStatus(nb.getNotebook_id());
			n.setMessage(nb.getNotebook_name());
			list.add(n);
		}
		return list;
		
	}


	public NoteResponse move_note(String notebook_id, String noteId) {
		NoteResponse n=new NoteResponse();
		n.setStatus(notebook_id.split("_")[1]);
		n.setMessage(noteId.split("_")[1]);
		notedao.move_note(n);
		NoteResponse nr=new NoteResponse();
		nr.setMessage("移动成功");
		return nr;
	}
	
	/**根据关键字查询笔记 并将查询结果封装到NoteRespone中*/
	public NoteResponse searchNote(String keywords) {
		NoteResponse res=new NoteResponse();
		System.out.println(keywords);
		List<Note> list=notedao.findByKeywords(keywords);//将查询到的笔记存入该list
		/**若list为空，则笔记未找到*/
		if(list.isEmpty()){
			res.setStatus("1");
			res.setMessage("未找到笔记");
			System.out.println(3+res.getStatus()+":"+res.getMessage());
			return res;
		}
		/**list不为空，成功查到笔记*/
		res.setStatus("0");
		res.setMessage("查询到"+list.size()+"条笔记");
		res.setData(list);
		//System.out.println(3+":"+res.getStatus()+":"+res.getMessage());
		return res;
	}


	public NoteResponse collect(String noteId, HttpServletRequest request) {
		Cookie user=cookie_util.cookie_findByName("userId", request.getCookies());
		String userId=user.getValue().split("_")[0];
		noteId=noteId.split(":")[0];
		noteId=noteId.split("_")[1];
		Note n=notedao.findByNoteId(noteId);
		n.setNote_status_id("6");
		n.setUser_id(userId);
		n.setNote_id(NoteUtil.createUUID());
		notedao.creat_note(n);
		NoteResponse nr=new NoteResponse();
		nr.setMessage("收藏成功");
		return nr;
	}


	public NoteResponse list_collect_note(HttpServletRequest request) {
		String userId=cookie_util.cookie_findByName("userId", request.getCookies()).getValue();
		System.out.println(userId);
		List<Note>list= notedao.list_collect_note(userId.split("_")[0]);
		NoteResponse nr=new NoteResponse();
		if(!list.isEmpty()){
			nr.setStatus("1");
			nr.setData(list);
		}else{
			nr.setStatus("0");
		}
		
		return nr;
	}
	
	
	
}
