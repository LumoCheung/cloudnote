function checkLogin(v_name,v_pwd){
	//登录Ajax异步
	$.ajax({
		url:basepath+"/login/checklogin.form",
		type:"get",
		beforeSend:function(xhr){
			var author = make_base_auth(v_name,v_pwd);
			alert(author);
			xhr.setRequestHeader("Authorization",author);
		},
		success:function(data){
			login_success(data);
		}
	});
}

function make_base_auth(user, password) {  
	 var tok = user + ':' + password;  
	 var hash = Base64.encode(tok);  
	 return "Basic " + hash;  
}