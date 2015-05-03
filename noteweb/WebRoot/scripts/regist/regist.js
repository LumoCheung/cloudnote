/**
 * 注册
 */
function regist(){
	for(i=1;i<5;i++){
		$("#warning_"+i).css("display","none");
	}
	if(!(regPwd()|finPwd()|cUser()|cNick())){
		$.ajax({
			url:basepath+"/regist/regist.form",
			contentType:"application/x-www-form-urlencoded; charset=utf-8",
			type:"get",
			beforeSend:function(xhr){
				//存在中文乱码问题
				var v_name=$("#regist_username").val();
				var v_pwd=$("#regist_password").val();
				var v_nick=$("#nickname").val();
				alert(v_nick);
				var author = make_base_auth_reg(v_name,v_pwd,v_nick);
				//alert(author);
				xhr.setRequestHeader("Authorization",author);
			},
			success:function(data){
				regist_success(data);
			}
		});
	}
}
function make_base_auth_reg(user, password,nickname) { 
	//添加昵称，加入数据库
	 var tok = user + ':' + password+":"+nickname;
	 var hash = Base64.encode(tok);
	 return "Basic " + hash;  
}