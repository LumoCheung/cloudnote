package org.tarena.note.util;

import java.util.List;

import org.tarena.note.entity.Note;
import org.tarena.note.entity.NoteResponse;

/**
 * 利用NoteResponse传递数据的工具类
 * @author Administrator
 *
 */
public class Resopnse_util {
	/**
	 * 给返回的list类型封装成NoteResponse
	 * @param list
	 * @return NoteResponse
	 */
	public static NoteResponse setRes(Object obj)
	{
		List<Note> list=(List<Note>) obj;
		System.out.println(list.size());
		NoteResponse res=new NoteResponse();
		if(list.isEmpty())
		{
			res.setStatus("1");
			res.setMessage("未找到笔记");
			System.out.println(res.getStatus()+" "+res.getMessage());
			return res;
		}
		res.setStatus("0");
		if(list!=null){
			res.setMessage("查询到"+list.size()+"条笔记");
			res.setData(list);
			System.out.println(res.getData());
		}
		
		
		//System.out.println(res.getStatus()+" "+res.getMessage());
		return res;
	}
	
	/**
	 * 重载，回收站，删除，查询，修改，创建的返回值封装
	 * @param message
	 * @return NoteResponse
	 */
	public static NoteResponse setRes(String message)
	{
		NoteResponse res=new NoteResponse();
		res.setStatus("0");
		res.setMessage(message);
		return res;
	}
}
