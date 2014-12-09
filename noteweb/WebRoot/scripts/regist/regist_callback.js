/**
 * 注册Ajax异步
 */
function regist_success(data){
	if(data.status == "1"){
		$("#warning_1").css("display","block");
		$("#warning_1 span").html(data.message);
	}else{
		setTimeout(3000);
		alert("注册成功");
		window.location.href="log_in.html";
	}
}