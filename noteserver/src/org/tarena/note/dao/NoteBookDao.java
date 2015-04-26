package org.tarena.note.dao;

import java.util.List;

import org.tarena.note.entity.NoteBook;
import org.tarena.note.entity.NoteResponse;
import org.tarena.note.util.MyBatisDao;

@MyBatisDao
public interface NoteBookDao {
	/**
	 * 显示出当前用户内的所有笔记本
	 * @param user_id	当前用户的userId
	 * @return	返回笔记本的数组
	 */
	public List<NoteBook> findAllNoteBook(String user_id);
	/**
	 * 插入笔记本
	 * @param nb	要插入笔记本的数据
	 */
	public void insertNotebook(NoteBook nb);
	/**
	 * 重命名笔记本
	 * @param nrb	status来存储新的笔记本的名字	message来存储笔记本的notebook_id
	 */
	public void rename_notebook(NoteResponse nrb);
	/**
	 * 查询选中笔记本内的内容项
	 * @param notebook_id	传入当前notebook_id
	 * @return	返回当前选中笔记本中的笔记数
	 */
	public int countnote_notebook(String notebook_id); 
	
	/**
	 * 查找默认的笔记本
	 * @param userId
	 * @return
	 */
	public NoteBook findFaultBook(String userId);
	
	/**
	 *删除笔记本
	 * @param bookId
	 */
	public void deleteBook(String bookId);
	
}
