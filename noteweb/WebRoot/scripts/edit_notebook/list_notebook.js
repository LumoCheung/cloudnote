$(function(){
   		$(".profile-username").append(cookie("nickName"));
		list_notebook();
});

	
	function list_notebook(){
		$('#list_notebook').html("");
		$.ajax({
			url:basepath+"/edit/listnotebook",
			type:"get",	
			success:function(data){
				if(getCookie("userId")!=null){
					if(data.length>0){
						var index=-1;
						for(var i=0;i<data.length;i++){
						//寻找默认笔记本
							if(data[i].data=="6")
							{
								$('#list_notebook').append("<li class='online'  id='notebook_"+data[i].status
										+"' ondblclick='rename_notebook(this)' onmouseover='click_notebook(this)' onmouseout=''><a class='checked'>"
										+"<i class='fa fa-book' title='online' rel='tooltip-bottom' ></i>"
										+data[i].message
										+"<button type='button' class='btn btn-default btn-xs btn_position btn_delete' onclick='delBook(this)'><i class='fa fa-times'></i></button>"
										+"</a></li>"
										);
								index=i;
								break;
							}
						}
						for(var i=0;i<index;i++)
						{
							$('#list_notebook').append("<li class='online'  id='notebook_"+data[i].status
									+"' ondblclick='rename_notebook(this)' onmouseover='click_notebook(this)' onmouseout=''><a class=''>"
									+"<i class='fa fa-book' title='online' rel='tooltip-bottom' ></i>"
									+data[i].message
									+"<button type='button' class='btn btn-default btn-xs btn_position btn_delete' onclick='delBook(this)'><i class='fa fa-times'></i></button>"
									+"</a></li>");
						}
						for(var i=index+1;i<data.length;i++)
						{
							$('#list_notebook').append("<li class='online'  id='notebook_"+data[i].status
									+"' ondblclick='rename_notebook(this)' onmouseover='click_notebook(this)' onmouseout=''><a class=''>"
									+"<i class='fa fa-book' title='online' rel='tooltip-bottom' ></i>"
									+data[i].message
									+"<button type='button' class='btn btn-default btn-xs btn_position btn_delete' onclick='delBook(this)'><i class='fa fa-times'></i></button>"
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
	
	function delBook(obj)
	{
		var id=$(obj).parent().parent().attr("id");
		alert(id);
		//notebook id获取
		//判断如果是默认笔记本，则不允许删除
		//默认笔记本放在第一的位置上
		//弹出框（是否删除该笔记本，若删除，则其中的所有笔记将自动移至默认笔记本？）
		/*if(true)
		 * $.ajax()//note/move
		 * else
		 * window_close();
		 * 
		 * */
	}
	