package org.tarena.note.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.tarena.note.entity.Activity;
import org.tarena.note.entity.ActivityNote;
import org.tarena.note.util.MyBatisDao;

@MyBatisDao
public interface ActivityDao {
	/**
	 * 显示所有活动
	 * @return		 
	 */
	public List<Activity> listAllActivity();
	/**
	 * 显示当前活动下所有的参赛笔记
	 * @param activityId	传入当前活动的activityId
	 * @return	
	 */
	public List<ActivityNote>findByActivityId(String activityId);
	/**
	 * 投稿
	 * @param activityId
	 * @param noteId
	 * @return
	 */
	public void activity_note (String activityId, String noteId);
	/**
	 * 收藏笔记
	 * @param noteId	传入笔记的id
	 * @param userId	 传入当前用户的id
	 * @return
	 */
	public void collect(String noteId, HttpServletRequest request);//收藏笔记

}
