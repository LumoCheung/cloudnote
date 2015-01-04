$(function(){
   		$(".profile-username").append(cookie("userName"));
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
						$('#list_notebook').append("<li class='online'  id='notebook_"+data[0].status
								+"' ondblclick='rename_notebook(this)' onmouseover='click_notebook(this)' onmouseout=''><a class='checked'>"
								+"<i class='fa fa-book' title='online' rel='tooltip-bottom' ></i>"
								+data[0].message
								+"<button type='button' class='btn btn-default btn-xs btn_position btn_delete'><i class='fa fa-times'></i></button>"
								+"</a></li>"
								);
						for(var i=1;i<data.length;i++){
							$('#list_notebook').append("<li class='online'  id='notebook_"+data[i].status
							+"' ondblclick='rename_notebook(this)' onmouseover='click_notebook(this)' onmouseout=''><a class=''>"
							+"<i class='fa fa-book' title='online' rel='tooltip-bottom' ></i>"
							+data[i].message
							+"<button type='button' class='btn btn-default btn-xs btn_position btn_delete'><i class='fa fa-times'></i></button>"
							+"</a></li>"
							);
						}
						click_notebook(document.getElementById('list_notebook').childNodes.item(0));	
					}
				}
				else
					$("body").html(data);
			}
		});
	}
	
	