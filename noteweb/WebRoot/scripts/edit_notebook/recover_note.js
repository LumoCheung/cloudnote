$(function(){
	$('#rollback_button').click(function(){
		list_recovernote();
	});
})


function recover_note(note){
	/*$('#list_note').append("<li class='online'><a  class='checked' id='noteid_"+note.note_id+"' onclick='delete_note(this)'>" +
			"<i class='fa fa-file-text-o' title='online' rel='tooltip-bottom'></i>"+note.note_title
			+"<button type='button' class='btn btn-default btn-xs btn_position btn_delete' onclick='event.cancelBubble=true;list_del_btn(this)'><i class='fa fa-times'></i></button>" +
					"<button type='button'  class='btn btn-default btn-xs btn_position_2 btn_replay' onclick='event.cancelBubble=true;list_remove_btn(this)'><i class='fa fa-reply'></i></button></a></li>");
	*/
	$('#four_side_right ul').append("<li class='disable'><a id='noteid_"+note.note_id
	+"' ondblclick='getContent(this,2)' ><i class='fa fa-file-text-o' title='online' rel='tooltip-bottom'></i>"
	+note.note_title+"<button type='button' class='btn btn-default btn-xs btn_position btn_delete' onclick='list_del_btn(this)'>"
	+"<i class='fa fa-times'></i></button><button type='button' class='btn btn-default btn-xs btn_position_2 btn_replay' onclick='list_remove_btn(this)'>"
	+"<i class='fa fa-reply'></i></button></a></li>");
}


function list_del_btn(ele){
	delete_note($(ele).parent().attr("id"));
	//alert($(ele).parent().attr("id"));
}


function list_remove_btn(ele){
	var note_id=$(ele).parent().attr("id");
	replay_note(note_id);
	//alert($(ele).parent().attr("id"));
}

function list_recovernote(){
	$.ajax({
		url:basepath+"/edit/list_recovernote",
		type:"get",
		success:function(data){
			//alert(data.data.length)
			$('#four_side_right ul').html("");
			if(data.data.length<1){
				alert("回收站为空");
			}else{
				showDiv(4,5);
				for(var i=0;i<data.data.length;i++){
					recover_note(data.data[i]);
				}
			}
			
		}
		
	});
}

function delete_note(id){
	$('#can').load('./alert/alert_delete_rollback.html',function(){
		$('.opacity_bg').show();
		$('.close').click(function(){
			window_close();
		});
		$('#btn_sure').click(function(){
			remove_delete_note(id);
			window_close();
			list_recovernote();
		});
		
	});
}

function replay_note(note_id){
	$('#can').load('./alert/alert_replay.html',function(){
		
		$('.opacity_bg').show();
		$('.close').click(function(){
			window_close();
		});
		alert_list_notebook();
		$('#btn_sure').click(function(){
			remove_delete_note(id);
		});
		$('#btn_replay').click(function(){
			var notebook_id= $('#replaySelect').find("option:selected").attr("id");
			replay_note_sure(note_id,notebook_id);
		});
		
	});
}

//点击确定恢复笔记后的执行过程
function replay_note_sure(note_id,notebook_id){
	$.ajax({
		url:basepath+"/note/replay_recover_note/"+notebook_id+"/"+note_id,
		type:"put",
		success:function(data){
			window_close();
			list_recovernote();
		}
	});
}

function remove_delete_note(id){
	$.ajax({
		url:basepath+"/edit/remove_recovernote/"+id,
		type:"get",
		
	});
	list_recovernote();
}

//显示提示框中的笔记本列表
function alert_list_notebook(){
	$.ajax({
		url:basepath+"/edit/listnotebook",
		type:'get',
		success:function(data){
			//alert(data);
			for(var i=0;i<data.length;i++)
			$('#replaySelect').append(" <option id='notebook_"+data[i].status+"'>"+data[i].message+"</option>");
		}
	});
}