function addnotebook(){
	$ .ajax({
		url:basepath+"/edit/addnotebook/"+$(input_notebook).val(),
		type:"put",
		success:function(data){
			$('#list_notebook').append("<li class='online'>"+"<a  class='checked'>"
					+"<i class='fa fa-book' title='online' rel='tooltip-bottom' id='notebook_"+data.status+"'" +
							"ondblclick='rename_notebook(this)'></i>"
					+data.message+"</a></li>");
		}
	});
}
function window_close(){
	$('.opacity_bg').hide();
	$('#can').hide();
}