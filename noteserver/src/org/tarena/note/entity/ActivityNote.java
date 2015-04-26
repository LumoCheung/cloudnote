package org.tarena.note.entity;


public class ActivityNote {
	private String activityId;
	private String activityNoteId;
	private String noteId;
	private int up;
	private int down;
	private String title;
	private String body;
	public String getActivityId() {
		return activityId;
	}
	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}
	public String getActivityNoteId() {
		return activityNoteId;
	}
	public void setActivityNoteId(String activityNoteId) {
		this.activityNoteId = activityNoteId;
	}
	public String getNoteId() {
		return noteId;
	}
	public void setNoteId(String noteId) {
		this.noteId = noteId;
	}
	public int getUp() {
		return up;
	}
	public void setUp(int up) {
		this.up = up;
	}
	public int getDown() {
		return down;
	}
	public void setDown(int down) {
		this.down = down;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
}
