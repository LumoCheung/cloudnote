package org.tarena.note.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tarena.note.entity.NoteResponse;
import org.tarena.note.service.ActivityService;
@Controller
@RequestMapping("/activity")
public class ActivityController {
	
	@Resource
	private ActivityService activityService;
	
	@RequestMapping(value="/listactivity",method=RequestMethod.GET)
	@ResponseBody//将返回结果转成json格式字符串
	public NoteResponse execute(
			HttpServletRequest request) throws Exception{
		System.out.println("获得活动列表");
		NoteResponse res=activityService.listAllActivity(request);
		return res;
	}
	@RequestMapping(value="/listactivitynote/{activityid}",method=RequestMethod.GET)
	@ResponseBody//将返回结果转成json格式字符串
	public NoteResponse listActivityNote(@PathVariable("activityid")String id) throws Exception{
		System.out.println("进入活动内容");
		NoteResponse res=activityService.findByActivityId(id);
		return res;
	}

}
