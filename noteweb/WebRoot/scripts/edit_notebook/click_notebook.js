function click_notebook(notebook_ele){
	showDiv(2,3);
	var bookId=notebook_ele.id;
	$('#pc_part_2').data("notebook_id",bookId);
	//alert(bookId);
	$('#list_notebook a').removeClass("checked");
	$(notebook_ele).find("a").addClass("checked");
	$.ajax({
		url:basepath+"/edit/isnull_notebook/"+notebook_ele.id,
		type:"get",
		success:function(data){
			$("#pc_part_2 ul").empty();
			if(data.status!="0"){
				list_note(data);
			}
		}
	});
}

function list_note(data){
	var list=data.data;
	for(i=0;i<list.length;i++)
	{
		var s=list[i];
		var s1='<li class="online">'
			//此处绑定noteId
			+'<a id="noteId_'+s.note_id+'" onclick="getContent(this,1)">';
		var s4='<i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i>';
		//共享图标
		var s2=' <i class="fa fa-sitemap" title="shared" rel="tooltip-bottom"></i>';
		var s3=s.note_title//此处绑定题目
			//此处绑定列表的行数id（in）
			+'<button type="button" id="i'+i+'" class="btn btn-default btn-xs btn_position btn_slide_down" onclick="event.cancelBubble=true;more(this);" ><i class="fa fa-chevron-down"></i></button>'
			+'</a>'
			//此处绑定列表的下拉框id（divin），和列表行数id有关，可以通过简单的操作获取当前的下拉框
			+'<div id="divi'+i+'" class="note_menu" tabindex="-1">'
			+'<dl>'
			+'<dt><button type="button" class="btn btn-default btn-xs btn_move" title="移动至..." onclick="move_note(this)"><i class="fa fa-random"></i></button></dt>'
			+'<dt><button type="button" id="share'
			+s.note_status_id
			+'" class="btn btn-default btn-xs btn_share" title="分享" onclick="share(this)"><i class="fa fa-sitemap"></i></button></dt>'
			+'<dt><button type="button" class="btn btn-default btn-xs btn_delete" title="删除" onclick="rec(this)" ><i class="fa fa-times"></i></button></dt>'
			+'</dl>'
			+'</div>'
			+'</li>';
		var ss;
		//判断当前是否为分享状态，2为分享状态，1为普通状态
		if(s.note_status_id!=null&&s.note_status_id==4)
			ss=s1+s2+s3;
		else
			ss=s1+s4+s3;
		$("#pc_part_2 ul").append(ss);
		$("#input_note_title").val("");
		$("#myEditor").html("");
	}
}
var tID;
//笔记操作的下拉框
function more(obj)
{
		//获取当前点击事件的id
		var id=$(obj).attr("id");
		//取消全部的下拉框
		$(".online div").css("display","none");
		//当前对象的下拉框
		$("#div"+id).css("display","block");
		//设置当前对象下拉框的hover事件
		$("#div"+id).hover(function(){
			//鼠标移上去时取消一次性计时器
			clearTimeout(tID);
		},function(){
			//鼠标移走时取消下拉框的显示
			$(".online div").css("display","none");
		});
		tID=setTimeout(function(){$(".online div").css("display","none");},1000);
}



