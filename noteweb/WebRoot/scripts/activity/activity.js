function activity_list()
{
	$.ajax({
		url:basepath+"/activity/listactivity",
		type:"GET",
		success:function(data){
			list_activity(data);
		}
	});
}
function activity_detail(obj)
{
	var id=$(obj).attr("id");
	url= "activity_detail.html?activityid="+id;
	location.href=url;
}
function getpost()
{
	var url=location.search;
	var Request = new Object();
	if(url.indexOf("?")!=-1)
	{
	　var str = url.substr(1)　//去掉?号
	　strs= str.split("&");
	　for(i=0;i<strs.length;i++)
	　{
	　　 Request[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
	　}
	}
	return Request["activityid"];
}

function note_activity_list()
{
	var id=getpost();
	$.ajax({
		url:basepath+"/activity/listactivitynote/"+id,
		type:"GET",
		//返回类型
		dataType:"json",
		success:function(data){
			list_note_activity(data);
		}
	});
}
function click_notebook(obj)
{
	var bookId=obj.id;
	$('.col-xs-7').data("notebook_id",bookId);
	//alert(bookId);
	$('#list_notebook a').removeClass("checked");
	$(obj).find("a").addClass("checked");
	$.ajax({
		url:basepath+"/edit/isnull_notebook/"+obj.id,
		type:"get",
		success:function(data){
			$(".col-xs-7 ul").empty();
			if(data.status!="0"){
				list_note(data);
			}
		}
	});
}
function list_note(data)
{
	var list=data.data;
	for(i=0;i<list.length;i++)
	{
		var s=list[i];
		var ss='<li class="online"><a id="noteId_'+s.note_id+'" onclick="select_note(this)"><i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i>'
		+s.note_title+'</a></li>';
		$(".col-xs-7 ul").append(ss);
	}
}
function notebook_list()
{
	$('#list_notebook').html("");
	$.ajax({
		url:basepath+"/edit/listnotebook",
		type:"get",	
		success:function(data){
			if(getCookie("userId")!=null&&data.status!="0"){
				if(data.length>0){
					var index=-1;
					for(var i=0;i<data.length;i++){
					//寻找默认笔记本
						if(data[i].data=="6")
						{
							$('#list_notebook').append("<li class='online'  id='"+data[i].data+"_"+data[i].status
									+"' ondblclick='rename_notebook(this)' onmouseover='click_notebook(this)' onmouseout=''><a class='checked'>"
									+"<i class='fa fa-book' title='online' rel='tooltip-bottom' ></i>"
									+data[i].message
									+"</a></li>"
									);
							index=i;
							break;
						}
					}
					for(var i=0;i<index;i++)
					{
						$('#list_notebook').append("<li class='online'  id='"+data[i].data+"_"+data[i].status
								+"' ondblclick='rename_notebook(this)' onmouseover='click_notebook(this)' onmouseout=''><a class=''>"
								+"<i class='fa fa-book' title='online' rel='tooltip-bottom' ></i>"
								+data[i].message
								+"</a></li>");
					}
					for(var i=index+1;i<data.length;i++)
					{
						$('#list_notebook').append("<li class='online'  id='"+data[i].data+"_"+data[i].status
								+"' ondblclick='rename_notebook(this)' onmouseover='click_notebook(this)' onmouseout=''><a class=''>"
								+"<i class='fa fa-book' title='online' rel='tooltip-bottom' ></i>"
								+data[i].message
								+"</a></li>");
					}
					click_notebook(document.getElementById('list_notebook').childNodes.item(0));	
				}
			}
			else
				$("body").html(data);
		}
	});
}

function select_note(obj)
{
	//目前只能一次投一篇笔记，不支持多选
	$('.col-xs-7 a').removeClass("checked");
	$("#"+obj.id).addClass("checked");
}

function activity_note()
{
	var noteid=$('.col-xs-7 a[class=checked]').attr("id");
	var activityid=getpost();
	if(noteid!=undefined)
	{
		$.ajax({
			url:basepath+"/activity/activitynote/"+noteid+"/"+activityid,
			type:"get",
			success:function(data){
				if(data.status=="0")
				{
					btn_cancle();
					note_activity_list();
				}
			}
		});
	}
}

function getcontent(obj)
{
	var id = obj.id;
	$("#first_action a").removeClass("checked");
	//笔记选中
	$("#"+id).addClass("checked");
	$.ajax({
		url:basepath+"/note/getcontent/"+id,
			type:"GET",
			dataType:"json",
			success:function(data){
				var list=data.data;
				//返回为json，json的data属性是list，list中只有一个值
				//这里没有做更多的健全性处理
				var note=list[0];
				$("#content_body").html("<h4><strong>笔记标题: </strong>"+note.note_title+"</h4>");
				$("#myPage").html(note.note_body);
			}
	});
}