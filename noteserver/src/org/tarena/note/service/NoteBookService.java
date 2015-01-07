package org.tarena.note.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.tarena.note.entity.NoteResponse;

public interface NoteBookService {
	/**
	 * 显示当前用户下的所有笔记本
	 * @param request	用于获取当前用户的userId
	 * @return	返回的数据笔记列表Status存储notebook_id	Message来存储notebook_name
	 */
	public List<NoteResponse> listAllNoteBook(HttpServletRequest request);
	/**
	 * 添加笔记本
	 * @param notebookName	传入新的笔记本名字
	 * @param request	将用户名字添加进去
	 * @return	返回的笔记本得数据
	 */
	public NoteResponse addNotebook(String notebookName,String userId,String typeId);
	
	/**
	 * 重命名笔记本	
	 * @param new_name	新的笔记本的名字	
	 * @param notebook_id	笔记本的notebook_id
	 */
	public void rename_notebook(String new_name,String notebook_id);
	/**
	 * 判断当前用户的笔记本是否为空
	 * @param notebook_id	传入笔记本的notebook_id
	 * @return	
	 */
	public NoteResponse isnull_notebook(String notebook_id);
	/**
	 * 显示回收站内的笔记
	 * @param request	获取当前用户的笔记
	 * @return
	 */
	public NoteResponse list_recovernote(HttpServletRequest request );
}
