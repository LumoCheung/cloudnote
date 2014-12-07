package org.tarena.note.entity;
/**
 * 笔记的实体类
 * @author Administrator
 *
 */
public class Note {
	private String note_id;
	private String notebook_id;
	private String user_id;
	private String note_status_id;
	private String note_type_id;
	private String note_title;
	private String note_body;
	private long note_create_time;
	private long note_last_modify_time;
	public String getNote_id() {
		return note_id;
	}
	public void setNote_id(String note_id) {
		this.note_id = note_id;
	}
	public String getNotebook_id() {
		return notebook_id;
	}
	public void setNotebook_id(String notebook_id) {
		this.notebook_id = notebook_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getNote_status_id() {
		return note_status_id;
	}
	public void setNote_status_id(String note_status_id) {
		this.note_status_id = note_status_id;
	}
	public String getNote_type_id() {
		return note_type_id;
	}
	public void setNote_type_id(String note_type_id) {
		this.note_type_id = note_type_id;
	}
	public String getNote_title() {
		return note_title;
	}
	public void setNote_title(String note_title) {
		this.note_title = note_title;
	}
	public String getNote_body() {
		return note_body;
	}
	public void setNote_body(String note_body) {
		this.note_body = note_body;
	}
	public long getNote_create_time() {
		return note_create_time;
	}
	public void setNote_create_time(long note_create_time) {
		this.note_create_time = note_create_time;
	}
	public long getNote_last_modify_time() {
		return note_last_modify_time;
	}
	public void setNote_last_modify_time(long note_last_modify_time) {
		this.note_last_modify_time = note_last_modify_time;
	}
	
}
