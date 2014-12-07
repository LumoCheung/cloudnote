function rename_notebook(notebook_id_ele){
		
		$('#can').load('./alert/alert_rename.html',function(){
				$('#can').show();
				$('.opacity_bg').show();
				$('.close').click(function(){
					window_close()
				});
				$('#btn_close').click(function(){
					window_close();
				});
				
				$('#rename_notebook').click(function(){
					var new_name=$('#input_notebook_rename').val();
					var notebook_id=notebook_id_ele.id;
					if($('#input_notebook_rename').val().trim()!="")
					$.ajax({
						url:basepath+"/edit/rename_notebook/"+notebook_id+"/"+new_name,
						type:"put",
						success:function(){
							list_notebook();
							window_close()
						}
					});
					else{
						alert("修改名字不能为空");
					}
				});
			});
		
	}


