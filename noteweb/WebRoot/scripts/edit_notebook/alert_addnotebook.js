function addnotebook(){
	$.ajax({
		url:basepath+"/edit/addnotebook/"+$(input_notebook).val(),
		type:"put",
		success:function(data){
			list_notebook();
		}
	});
}
