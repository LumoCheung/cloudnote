//给登录按钮添加单击事件
//两个输入窗口的ID用户名count    ID密码password
$(function(){

	$("#login").click(function(){
		//清空消息提示
		$("#count_span").html("");
		$("#password_span").html("");
	
	    var v_name = $("#count").val();
	    var v_pwd = $("#password").val();
	    var ok = true;
	    //检测用户输入信息格式
	    if(v_name == ""){
	    	$("#count_span").html("用户名不能为空");
	    	ok = false;
	    }
	    if(v_pwd == ""){
	    	$("#password_span").html("密码不能为空");
	    	ok = false;
	    }
	    if(ok){
			checkLogin(v_name,v_pwd);
		}
	});
});
