package org.tarena.note.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.tarena.note.dao.ActivityDao;
import org.tarena.note.entity.Activity;
import org.tarena.note.entity.ActivityNote;
import org.tarena.note.entity.NoteResponse;
@Service("activityService")
public class ActivityServiceImpl implements ActivityService {
	@Resource
	private ActivityDao activityDao;
	public NoteResponse listAllActivity(HttpServletRequest request) {
		List<Activity> activities= activityDao.listAllActivity();
		NoteResponse noteResponse=new NoteResponse();
		noteResponse.setData(activities);
		noteResponse.setStatus("0");
		noteResponse.setMessage("成功");
		return noteResponse;
	}

	public NoteResponse findByActivityId(String activityId) {
		List<ActivityNote> notes=activityDao.findByActivityId(activityId);
		NoteResponse res=new NoteResponse();
		res.setData(notes);
		res.setStatus("0");
		res.setMessage("success");
		return res;
	}

	public NoteResponse activity_note(String activityId, String noteId) {
		// TODO Auto-generated method stub
		return null;
	}

	public NoteResponse collect(String noteId, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}
