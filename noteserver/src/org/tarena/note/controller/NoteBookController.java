package org.tarena.note.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tarena.note.entity.Note;
import org.tarena.note.entity.NoteResponse;
import org.tarena.note.service.NoteBookService;
import org.tarena.note.service.NoteSrevice;
import org.tarena.note.util.cookie_util;

@Controller
@RequestMapping("/edit")
public class NoteBookController {
	@Resource
	private NoteBookService noteBookService;
	@Resource
	private NoteSrevice noteSrevice;
	@RequestMapping(value="/listnotebook",method=RequestMethod.GET)
	@ResponseBody//将返回结果转成json格式字符串
	public List<NoteResponse> listNoteBook(HttpServletRequest request){
		List<NoteResponse> list=noteBookService.listAllNoteBook(request);
		System.out.println(list.size());
		return list;
	}
	
	/**
	 * 添加笔记本的事件
	 * @param notebookName  要传入新建笔记本的名称
	 * @param request	通过HttpServletRequest来获取客户端的userId在创建时候加入
	 * @return	返回一个NoteResponse信息来储存新建笔记本的信息，Status来储存notebook_id   Message来存储notebook_name
	 */
	@RequestMapping(value="/addnotebook/{notebookName}",method=RequestMethod.PUT)
	@ResponseBody
	public NoteResponse addnotebook(@PathVariable("notebookName")String notebookName,HttpServletRequest request){
		NoteResponse n=noteBookService.addNotebook(notebookName,request);
		return n;
	}
	
	
	/**
	 * 对笔记本的重命名
	 * @param new_name	新的笔记本的名字
	 * @param notebook_id	笔记本的notebook_id
	 * @return 
	 */
	@RequestMapping(value="/rename_notebook/{notebook_id}/{new_name}",method=RequestMethod.PUT)
	@ResponseBody
	public NoteResponse rename_notebook(@PathVariable("new_name")String new_name,@PathVariable("notebook_id")String notebook_id){
		noteBookService.rename_notebook(new_name, notebook_id);
		NoteResponse nr=new NoteResponse();
		return nr;
	}
	
	/**
	 * 对笔记本中内容是否为空的判断
	 * @param notebook_id	传入notebook_id的值来进行判断
	 * @return	返回的是NoteResponse来存储若的status来存储 1为有内容   0是没有内容
	 * 若是有内容就要是在data中存储新的Note数组进行显示
	 */
	@RequestMapping(value="/isnull_notebook/{notebook_id}",method=RequestMethod.GET)
	@ResponseBody
	public NoteResponse isnull_notebook(@PathVariable("notebook_id")String notebook_id){
		NoteResponse nr=
		noteBookService.isnull_notebook(notebook_id);
		return nr;
	}
	
	
	/**
	 * 显示当前用户回收站中的数据
	 * @param request	通过request来获取客户端存储的用户数据来判断当前用户的回收站的文档
	 * @return	利用List数组来显示用户的回收站的信息
	 */
	@RequestMapping(value="/list_recovernote",method=RequestMethod.GET)
	@ResponseBody
	public NoteResponse list_recovernote(HttpServletRequest request){
		NoteResponse nr=noteBookService.list_recovernote(request);
		return nr;
	}
	
	/**
	 * 用户进行彻底的删除回收站内的笔记
	 * @param note_id	需要传入用户选中的笔记的note_id
	 * @return
	 */
	@RequestMapping(value="/remove_recovernote/{note_id}",method=RequestMethod.GET)
	@ResponseBody
	public NoteResponse remove_recovernote(@PathVariable("note_id")String note_id){
		noteSrevice.delete_note(note_id);
		NoteResponse nr=new NoteResponse();
		return nr;
	} 
	
	
	
}
