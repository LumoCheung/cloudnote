function login_success(data){
	if(data.status == "1"){
		
		$("#count_span").html(data.message);
	}else if(data.status == "2"){
		
		$("#password_span").html(data.message);
	}else if(data.status == "0"){
		
		var uid = data.data.userId;
		var token = data.data.token;
		var key = uid+"_token";
		addCookie(key,Base64.encode(token),2);
		document.cookie="userId"+"="+key+";"+"path=/"; 
		document.cookie=key+"="+Base64.encode(token)+";"+"path=/"; 
		//alert(Base64.encode(token))
		window.location.href="edit.html";
	}
}

