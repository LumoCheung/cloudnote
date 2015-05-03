function checkLogin(v_name,v_pwd){
	//登录Ajax异步
	$.ajax({
		url:basepath+"/login/checklogin.form",
		type:"post",
		beforeSend:function(xhr){
			var author = make_base_auth(v_name,v_pwd);
			//alert(author);
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

function validOldPwd(lpassword)
{
	if(lpassword=="")
		return false;
	$.ajax({
		url:basepath+"/login/checkpwd.form",
		type:"post",
		beforeSend:function(xhr){
			var v_name=cookie("name").trim();
			var author = make_base_auth(v_name,lpassword);
			//alert(author);
			xhr.setRequestHeader("Authorization",author);
		},
		success:function(data){
			if(data.status != "0")
			{
				get('warning_1').style.display='block';
			}
			else
			{
				get('warning_1').style.display='none';
			}
		}
	});
}
function changepwd(lpassword,npassword)
{
	$.ajax({
		url:basepath+"/login/changepwd.form",
		type:"post",
		beforeSend:function(xhr){
			var v_name=cookie("name").trim();
			//复用注册中字段，重构的时候可以修改参数名字
			var author = make_base_auth_reg(v_name,lpassword,npassword);
			xhr.setRequestHeader("Authorization",author);
		},
		success:function(data){
			if(data.status == "0")
			{
				alert(data.message);
				window.history.back();
			}
			else if(data.status=='3')
			{
				alert(data.message);
			}
			else
			{
				get('warning_1').style.display='block';
			}
		}
	});
}