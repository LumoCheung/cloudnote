	function list_notebook(){
		//全部笔记和编辑笔记
		showDiv(2,3);
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
										+"<button type='button' class='btn btn-default btn-xs btn_position btn_delete' onclick='delBook(this)'><i class='fa fa-times'></i></button>"
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
									+"<button type='button' class='btn btn-default btn-xs btn_position btn_delete' onclick='delBook(this)'><i class='fa fa-times'></i></button>"
									+"</a></li>");
						}
						for(var i=index+1;i<data.length;i++)
						{
							$('#list_notebook').append("<li class='online'  id='"+data[i].data+"_"+data[i].status
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
		//alert(id.substring(0,1));
		//notebook id获取
		//判断如果是默认笔记本，则不允许删除
		if(id.substring(0,1)=="6")
			alert("默认笔记本为系统笔记本，不能删除！");
		else{
		//弹出框（是否删除该笔记本，若删除，则其中的所有笔记将自动移至默认笔记本？）
			$('#can').load('./alert/alert_delete_notebook.html',function(){
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
						$.ajax({
							url:basepath+"/edit/deletenotebook/"+id.substring(2),
							type:"POST",
							dataType:"json",
							success:function(data){
								window_close();
								list_notebook();
							}
						});
					});
				});
		}
		/*if(true)
		 * $.ajax()//note/move
		 * else
		 * window_close();
		 * 
		 * */
	}
	