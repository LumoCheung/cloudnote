function login_success(data){
	if(data.status == "1"){
		
		$("#count_span").html(data.message);
	}else if(data.status == "2"){
		
		$("#password_span").html(data.message);
	}else if(data.status == "0"){
		var nickName=data.data.nick;
		var userName=data.data.name;
		var uid = data.data.userId;
		var token = data.data.token;
		var key = uid+"_token";
		addCookie(key,Base64.encode(token),2);
		//改为昵称，加入到cookie
		document.cookie="nickName"+"="+nickName+";"+"path=/";
		document.cookie="name"+"="+userName+";"+"path=/";
		document.cookie="userId"+"="+key+";"+"path=/"; 
		document.cookie=key+"="+Base64.encode(token)+";"+"path=/"; 
		alert(Base64.encode(token))
		window.location.href="edit.html";
	}
}
