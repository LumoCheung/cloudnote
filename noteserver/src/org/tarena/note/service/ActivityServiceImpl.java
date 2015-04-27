package org.tarena.note.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.tarena.note.dao.ActivityDao;
import org.tarena.note.dao.NoteDao;
import org.tarena.note.entity.Activity;
import org.tarena.note.entity.ActivityNote;
import org.tarena.note.entity.Note;
import org.tarena.note.entity.NoteResponse;
@Service("activityService")
public class ActivityServiceImpl implements ActivityService {
	@Resource
	private ActivityDao activityDao;
	@Resource
	private NoteDao noteDao;
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
		Note note=noteDao.findByNoteId(noteId);
		ActivityNote activityNote=new ActivityNote();
		activityNote.setActivityId(activityId);
		activityNote.setActivityNoteId(UUID.randomUUID().toString());
		activityNote.setTitle(note.getNote_title());
		activityNote.setNoteId(noteId);
		activityNote.setBody(note.getNote_body());
		activityDao.activity_note(activityNote);
		NoteResponse res=new NoteResponse();
		res.setStatus("0");
		res.setMessage("success");
		return res;
	}

	public NoteResponse collect(String noteId, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}
