package org.tarena.note.dao;

import java.util.List;

import org.tarena.note.entity.Note;
import org.tarena.note.entity.NoteBook;
import org.tarena.note.entity.NoteResponse;
import org.tarena.note.util.MyBatisDao;

@MyBatisDao
public interface NoteDao {
	/**
	 * 彻底的删除笔记
	 * @param note_id	根据note_id来删除
	 */
	public void delete_note(String note_id);
	/**
	 * 恢复回收站中的笔记
	 * @param nr	传入NoteResponse对象来存储要恢复到的笔记本以及笔记的note_id
	 */
	public void replay_recover_note(NoteResponse nr);
	
	/**
	 * 显示当前笔记本下的笔记
	 * @param notebook_id	传入当前笔记本的notebook_id
	 * @return	返回note数组
	 */
	public List<Note>findByNoteBookId(String notebook_id);
	
	/**
	 * 通过笔记的id获取笔记的内容
	 * @param id
	 * @return
	 */
	public Note findByNoteId(String note_id);
	
	/**
	 * 保存笔记的标题
	 * @param note
	 */
	public void creat_note(Note note);
	
	/**
	 * 保存笔记的内容
	 * @param note
	 */
	public void saveContent(Note note);
	
	/**
	 * 通过笔记的id将笔记放入到回收站中
	 * @param id
	 */
	public void recoverById(String note_id);
	
	/**
	 * 将笔记进行分享
	 * @param id
	 */
	public void shareById(String id);
	
	
	/**
	 * 显示回收站内的笔记
	 * @param userId	传入当前用户的userId
	 * @return	返回回收站内的笔记数组
	 */
	public List<Note>list_recovernote(String userId);
	/**
	 * 显示要移动的笔记本
	 * @param nr
	 * @return
	 */
	public List<NoteBook>move_listnotebook(NoteResponse nr);
	
	/**
	 * 移动到目标的笔记本
	 * @param n
	 */
	public void move_note(NoteResponse n);
	
	/**
	 * 根据关键字查找相应的note
	 * @param keywords	输入的关键字
	 * @return
	 */
	public List<Note> findByKeywords(String keywords);
	
	public List<Note> list_collect_note(String userId);
}
