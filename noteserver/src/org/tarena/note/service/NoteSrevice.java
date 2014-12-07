package org.tarena.note.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.tarena.note.entity.Note;
import org.tarena.note.entity.NoteResponse;

public interface NoteSrevice {
	/**
	 * 彻底删除笔记数据
	 * @param note_id	传入笔记的note_id
	 */
	public void delete_note(String note_id);
	/**
	 * 恢复回收站内的笔记
	 * @param notebook_id	传入要转入的笔记本id
	 * @param note_id	要恢复的笔记id
	 */
	public void replay_recover_note(String notebook_id,String note_id);
	
	/**
	 * 通过笔记的id获取笔记下的内容
	 * @param Note_id
	 * @return
	 */
	public NoteResponse findByNoteId(String note_id);
	
	
	/**
	 * 创建笔记
	 * @param bookId
	 * @param title
	 * @return
	 */
	public NoteResponse creat_note(String bookId,String title,HttpServletRequest request);
	
	/**
	 * 对笔记本修改的保存
	 * @param noteId
	 * @param title
	 * @param body
	 * @return
	 */
	public NoteResponse saveContent(String noteId,String title,String body);
	
	
	/**
	 * 分享笔记本
	 * @param id	分享笔记的id
	 * @return
	 */
	public NoteResponse share(String id);
	
	/**
	 * 将笔记放入到回收站中
	 * @param id
	 */
	public NoteResponse recover(String id);
	
	/**
	 * 显示移动笔记本的列表(除了当前的笔记本)
	 * @param request	为了获取当前用户的cookie
	 * @param nootbook_id	当前的笔记本id
	 * @return
	 */
	public List<NoteResponse> listAllNoteBook(HttpServletRequest request,
			String nootbook_id);
	
	/**
	 * 移动到新的笔记本目录
	 * @param notebook_id
	 * @param noteId
	 * @return
	 */
	public NoteResponse move_note(String notebook_id, String noteId);
	
	/**
	 * 根据关键字查找相应的note
	 * @param keywords
	 * @return	在data中存储相应的list集合
	 */
	public NoteResponse searchNote(String keywords);
	
	/**
	 * 收藏笔记
	 * @param noteId	传入笔记的id
	 * @param userId	传入当前用户的id
	 * @return
	 */
	public NoteResponse collect(String noteId, HttpServletRequest request);//收藏笔记
	
	/**
	 * 显示本人收藏的笔记
	 * @param request
	 * @return
	 */
	public NoteResponse list_collect_note(HttpServletRequest request);
}
