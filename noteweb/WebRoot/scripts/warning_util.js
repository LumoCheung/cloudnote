// 注册界面的判断
function get(e){
	return document.getElementById(e);
}
/**
 * 判断注册密码
 */
function regPwd(){
	var npassword=get('regist_password').value.length;
	if(npassword<6&&npassword>=0){
		get('warning_2').style.display='block';
		return true;
	}
	return false;
}
/**
 * 判断确认密码
 */
function finPwd(){
	var npassword=get('regist_password').value;
	var fpassword=get('final_password').value;
	if(npassword!=fpassword){
		get('warning_3').style.display='block';
		return true;
	}
	return false;
}
/**
 * 判断昵称
 */
function cNick(){
	var name=get('nickname').value;
	if(name==""){
		get('warning_4').innerHTML="";
		get('warning_4').innerHTML="<span>昵称不能为空</span>";
		get('warning_4').style.display='block';
		return true;
	}
	if((/[\u4e00-\u9fa5]+/g).test(name)){   
		get('warning_4').innerHTML="";  
		get('warning_4').innerHTML="<span>不能含有汉字</span>";
		get('warning_4').style.display='block';
	     return true;
	  }  
	return false;
}
/**
 * 判断用户名不为空
 */
function cUser(){
	var name=get('regist_username').value;
	if(name==""){
		get('warning_1').style.display='block';
		get('warning_1').innerHTML="<span>用户名不能为空</span>";
		return true;
	}
	return false;
}