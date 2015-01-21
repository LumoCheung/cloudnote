package org.tarena.note.controller;



import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tarena.note.entity.NoteResponse;
import org.tarena.note.service.NoteSrevice;

@Controller
@RequestMapping("/note")
public class NoteController {
	@Resource
	private NoteSrevice noteSrevice;
	
	
	/**
	 * 对回收站内的笔记进行恢复
	 * @param notebook_id	将笔记恢复到的笔记本的notebook_id
	 * @param note_id	传入笔记的id
	 * @return
	 */
	@RequestMapping(value="/replay_recover_note/{notebook_id}/{note_id}",method=RequestMethod.PUT)
	@ResponseBody
	public NoteResponse replay_recover_note(@PathVariable("notebook_id")String notebook_id,@PathVariable("note_id")String note_id){
		noteSrevice.replay_recover_note(notebook_id, note_id);
		NoteResponse nr=new NoteResponse();
		return nr;
	}
	
	/**
	 * 添加笔记，只添加标题，内容通过修改操作保存
	 * @param title
	 * @param userId
	 * @param bookId
	 * @return NoteResponse
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/addnote/{notebook_id}/{note_title}",method=RequestMethod.POST)
	@ResponseBody
	public NoteResponse addNote(@PathVariable("note_title")String title,@PathVariable("notebook_id")String bookId,HttpServletRequest request) throws UnsupportedEncodingException
	{
		title=new String(title.getBytes("iso-8859-1"),"utf-8");
		System.out.println("笔记的标题"+title+"笔记本的notebook"+bookId);
		return noteSrevice.creat_note(bookId, title,request);
		
	}
	
	/**
	 * 通过笔记的id获取笔记的内容
	 * @param id
	 * @return NoteResponse
	 */
	@RequestMapping(value="/getcontent/{id}",method=RequestMethod.GET)
	@ResponseBody
	public NoteResponse getContent(@PathVariable("id") String id)
	{
		NoteResponse res=noteSrevice.findByNoteId(id);
		
		return res;
	}
	
	/**
	 * 修改标题和内容
	 * @param noteId
	 * @param title
	 * @param body
	 * @return NoteResponse
	 */
	@RequestMapping(value="/savecontent/{noteid}",method=RequestMethod.POST)
	@ResponseBody
	public NoteResponse save(@PathVariable("noteid")String noteId,String title,String body)
	{
		return noteSrevice.saveContent(noteId, title, body);
	}
	
	
	/**
	 * 通过笔记Id将笔记放入回收站
	 * @param id
	 * @return NoteResponse
	 */
	@RequestMapping(value="/recover/{id}",method=RequestMethod.POST)
	@ResponseBody
	public NoteResponse recover(@PathVariable("id")String id)
	{
		return noteSrevice.recover(id);
	}
	
	
	/**
	 * 通过笔记Id分享笔记
	 * @param id
	 * @return NoteResponse
	 */
	@RequestMapping(value="/share/{id}",method=RequestMethod.POST)
	@ResponseBody
	public NoteResponse share(@PathVariable("id")String id)
	{
		return noteSrevice.share(id);
	}
	
	@RequestMapping(value="/remove_listnotebook/{notebook_id}",method=RequestMethod.GET)
	@ResponseBody//将返回结果转成json格式字符串
	public List<NoteResponse> listNoteBook(HttpServletRequest request,@PathVariable("notebook_id")String nootbook_id){
		List<NoteResponse> list=noteSrevice.listAllNoteBook(request,nootbook_id);
		System.out.println(list.size());
		return list;
	}
	
	@RequestMapping(value="/move_note/{notebook_id}/{noteId}",method=RequestMethod.GET)
	@ResponseBody
	public NoteResponse move_note(@PathVariable("noteId")String noteId,@PathVariable("notebook_id")String notebook_id){
		return noteSrevice.move_note(notebook_id,noteId);
	}
	
	
	/**
	 * 接收客户端的查询请求：
	 * 获取关键字 调用searchNote()方法查询符合要求的笔记，将查询结果res转成json字符串并返回
	 * @param keywords	获取的关键字
	 * @return
	 */
	@RequestMapping(value="/searchnote/{keywords}",method=RequestMethod.GET)
	@ResponseBody//将返回结果转成json格式字符串
	public NoteResponse search(@PathVariable("keywords")String keywords){
		NoteResponse res=noteSrevice.searchNote(keywords);
		//System.out.println("chenggong"+res.getMessage());
		return res;
	}
	
	/**
	 * 收藏笔记
	 * @param id	根据笔记本的id
	 * @return
	 */
	@RequestMapping(value="/collectNote/{note_id}",method=RequestMethod.POST)
	@ResponseBody
	public NoteResponse collect(@PathVariable("note_id") String note_id,HttpServletRequest request){
		System.out.println("collect:"+note_id);
		//String noteId=id.split(":")[0];
		//String userId=id.split(":")[1];
		//System.out.println(noteId+","+userId);
		return noteSrevice.collect(note_id,request);
		
	}
	
	@RequestMapping(value="/list_collect_note",method=RequestMethod.POST)
	@ResponseBody
	public NoteResponse list_collect_note(HttpServletRequest request){
		return noteSrevice.list_collect_note(request);
	}
	
}
