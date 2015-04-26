function cathKeyPress(){
	//按enter发送查询请求
	$(document).keypress(function(e){
		//获取输入的关键字
		var keywords=$("#search_note").val();
		//如果按enter建，用ajax发送请求
		if(e.which==13){
			$.ajax({
				type:"get",
				url:basepath+"/note/searchnote/"+keywords,
				dataType:'json',
				//响应成功返回则执行search_success()方法
				success:function(data){
					search_success(data);
				}
			});
		}
	});
}

//添加新笔记
function addNote()
{
	//弹出框加载创建新笔记的html
	$('#can').load('./alert/alert_note.html',function(){
		//黑色背景的显示
		$('#can').show();
		$('.opacity_bg').show();
		//弹出框关闭按钮点击事件
		$('.close').click(window_close);
		//取消按钮
		$(".btn.btn-default.cancle").click(window_close);
		//创建按钮
		$(".btn.btn-primary.sure").click(
			function(){
				//判断笔记标题不为空
				if($("#input_note").val()!="")
				{
					//应该从上一级的点击事件获取bookId和从cookies中获取userId
					//var userId="48595f52-b22c-4485-9244-f4004255b972";
					var bookId=$('#pc_part_2').data("notebook_id");
					//alert(bookId);
					$.ajax({
						url:basepath+"/note/addnote/"+bookId+"/"+$("#input_note").val().trim(),
						contentType:"application/x-www-form-urlencoded; charset=utf-8",
						type:"POST",
						//返回类型
						dataType:"json",
						//传入值
						//data:"title="+$("#input_note").val().trim()+"&userId="+userId+"&bookId="+bookId,
						success:function(data){
							window_close();
							//刷新笔记列表
							get_notebook_list();
							//编辑笔记列表显示当前笔记内容
							getContentAjax("noteId_"+data.data,1);
						}
					});
				}
			}
		);
	});
}

function get_notebook_list()
{
	//此处需要获取bookId
	var bookId=$('#pc_part_2').data("notebook_id");
		$.ajax({
			url:basepath+"/edit/isnull_notebook/"+bookId,
			type:"GET",
			dataType:"json",
			success:function(data){
				if(data.status=="0"){
					$(notebook_ele).children('a').append("<button type='button' class='btn btn-default btn-xs btn_position btn_delete'><i class='fa fa-times'></i></button>");
					
					//$(notebook_ele).children('button').click(delete_notebook());
				}else{
					$("#pc_part_2 ul").empty();
					list_note(data);
				}
			}
		});
	}

//传入的是noteid_
function getContent(obj,flag)
{
	var id=$(obj).attr("id");
	getContentAjax(id,flag);
}


//获得内容的ajax
function getContentAjax(id,flag)
{
	$("#pc_part_2 a").removeClass("checked");
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
				//
				myEdit(note,flag);
			}
	});
}
//编辑框(预览框)内容获得
function myEdit(note,flag)
{
	//编辑框
	if(flag==1){
		$("#input_note_title").val(note.note_title);
		$("#myEditor").html(note.note_body);
	}
	//预览框
	else{
		$("#noput_note_title").html(note.note_title);
		$("#myPage").html(note.note_body);
	}
}

//保存修改
function save()
{
	//笔记更改的时候判断笔记标题是否为空
	if($("#input_note_title").val()!="")
	{
		//当前列表中的被选中的笔记
		//noteId_
		var noteId=$("#pc_part_2 a[class=checked]").attr("id");
		var title=$("#input_note_title").val().trim();
		var body=$("#myEditor").html().trim();
		$.ajax({     
			url:basepath+"/note/savecontent/"+noteId,
			type:"POST",
			dataType:"json",
			data:"&title="+title+"&body="+body,
			success:function(data){
				//刷次笔记列表
				get_notebook_list();
				//刷新编辑笔记
				getContentAjax(noteId,1);
				alert(data.message);
			}
		});
	}
}



/*
 * 功能按键的编写
 */

/*删除放入到回收站的功能*/
function rec(obj)
{
	//判断是否删除，弹出框
	$('#can').load('./alert/alert_delete_note.html',function(){
		//黑色背景的显示
		$(".opacity_bg").show();
		//弹出框关闭按钮点击事件
		$('.close').click(window_close);
		//取消按钮
		$(".btn.btn-default.cancle").click(window_close);
		//删除按钮上上上级的前一个兄弟节点绑定的id，获取
		var id=$(obj).parent().parent().parent().prev().attr("id");
		//把id绑定到删除按钮上
		$(".btn.btn-primary.sure").attr("id",id);
		//删除按钮
		$(".btn.btn-primary.sure").click(recAjax);
		});
}

//分享笔记
function share(obj)
{
	var btnId=$(obj).attr("id");
	var noteId=$(obj).parent().parent().parent().prev().attr("id");
	//判断当前的目录是否是已经分享的状态，是则无响应
	if(btnId!="share4")
	{
		$.ajax({
			url:basepath+"/note/share/"+noteId,
			type:"POST",
			data:"json",
			success:function(){
				//刷新列表
				get_notebook_list();
			}
		});
	}
	else
	{
		//取消界面所有的下拉框显示
		$(".online div").css("display","none");
	}
}
/*移动笔记*/
function move_note(ele){
	var noteId=$(ele).parent().parent().parent().prev().attr("id");
	var notebookId=$('#pc_part_2').data("notebook_id");
	$('#can').load('./alert/alert_move.html',function(){
		$('.opacity_bg').show();
		$(".btn.btn-default.cancle").click(window_close);
		$('.close').click(function(){
			window_close();
		});
		remove_list_notebook(notebookId);
		//alert(new_notebookId);
		$('#btn_sure').bind("click",noteId,function(){
			movenote_rollback(noteId);
			window_close();
			//list_notebook();
		});
	});
}

/*移动笔记的回调执行事件*/
function movenote_rollback(noteId){
	var new_notebookId=$('#moveSelect').find("option:selected").attr("id");
	$.ajax({
		url:basepath+"/note/move_note/"+new_notebookId+"/"+noteId,
		type:'get',
		success:function(data){
			get_notebook_list();
		}
	});
}

//显示提示框中的笔记本列表
function remove_list_notebook(notebook_id){
	$.ajax({
		url:basepath+"/note/remove_listnotebook/"+notebook_id,
		type:'get',
		success:function(data){
			//alert(data);
			for(var i=0;i<data.length;i++)
			$('#moveSelect').append(" <option id='notebook_"+data[i].status+"'>"+data[i].message+"</option>");
		}
	});
}

/*放入到回收站功能的回调功能*/
function recAjax()
{
	var id=$(this).attr("id");
	$.ajax({
		url:basepath+"/note/recover/"+id,
		type:"POST",
		dataType:"json",
		success:function(data){
			//刷新笔记列表
			get_notebook_list();
			//清空编辑笔记div内容
			$("#input_note_title").val("");
			$("#myEditor").html("");
			alert(data.message);
		}
	});
}



//显示查询共享笔记结果
function search_success(data){
	if(data.status=="1"){
		alert("未查询到结果");
	//如果status==0 则成功查到笔记 在消息头中获取笔记 
	}else if(data.status=="0"){
		$('#sixth_side_right .contacts-list').empty();
		var list=data.data;
		var noteNode="";
		//把查询到的结果显示在页面上
		/**点收藏按钮触发方法collect(id)收藏笔记*/
		/**获取笔记id，点击触发showNoteDetail(id)方法*/
		//判断更多的情况，保持大量数据显示在界面上
		if(list.length<=20){
			searchItem(list.length);
			$("#more_note").css("display","none");
		}
		else{
			searchItem(10);
			$("#more_note").css("display","block");
		}
		
	}
}
function searchItem(length){
	for(var i=0;i<length;i++){	
		var title=list[i].note_title;
		var noteId=list[i].note_id;
		//把用户id和笔记id放在一起发送值服务器
		var id=list[i].note_id;
		showDiv(6,5);
		noteNode="<li  class='online'><a>" +
				"<i class='fa fa-file-text-o' title='online' rel='tooltip-bottom'></i>" +
				"<i id='i_"+noteId+"' onclick='getContentAjax(this.id,2);'><span>" +title+"</span></i>&nbsp;&nbsp;" +
				"<button class='btn btn-default btn-xs btn-position btn_like' id="+id+" title='收藏笔记'onclick='collect(this.id);'" +
				"style='font-size:10px;line-height:11px;'><i class='fa fa-star'></i></button>"
		$('#sixth_side_right .contacts-list').append(noteNode);
	}	
}

/**把要收藏的笔记的id发送至服务器*/
function collect(id){
		$.ajax({
			type:"post",
			url:basepath+"/note/collectNote/"+id,
			success:function(data){
				alert(data.message);
			}
		});
}

function get_collect_note(){
	$.ajax({
		type:"post",
		url:basepath+"/note/list_collect_note",
		success:function(data){
			if(data.status=='1'){
				list_note(data);
			}
			else{
				alert("收藏夹为空");
			}
		}
	});
}
