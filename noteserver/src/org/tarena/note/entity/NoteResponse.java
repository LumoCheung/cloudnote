package org.tarena.note.entity;

import java.io.Serializable;
//作为同一个响应结果
/**
 * 完成客户端与服务端的中介信息传输任务
 * @author Administrator
 *
 */
public class NoteResponse implements Serializable{
	private String status;//状态,0成功;1失败;...
	private String message;//消息
	private Object data;//数据
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
}
