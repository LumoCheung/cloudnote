package org.tarena.note.entity;

import java.io.Serializable;
/**
 * 笔记的实体类
 * @author Administrator
 *
 */
public class NoteBook implements Serializable{
	private String notebook_id;
	private String user_id;
	private String type_id;
	private String notebook_name;
	private String notebook_desc;
	private String notebook_createtime;
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
	public String getType_id() {
		return type_id;
	}
	public void setType_id(String type_id) {
		this.type_id = type_id;
	}
	public String getNotebook_name() {
		return notebook_name;
	}
	public void setNotebook_name(String notebook_name) {
		this.notebook_name = notebook_name;
	}
	public String getNotebook_desc() {
		return notebook_desc;
	}
	public void setNotebook_desc(String notebook_desc) {
		this.notebook_desc = notebook_desc;
	}
	public String getNotebook_createtime() {
		return notebook_createtime;
	}
	public void setNotebook_createtime(String notebook_createtime) {
		this.notebook_createtime = notebook_createtime;
	}
	
}
