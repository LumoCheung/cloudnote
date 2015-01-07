/**
 * 注册Ajax异步
 */
function regist_success(data){
	if(data.status == "1"){
		$("#warning_1").css("display","block");
		$("#warning_1 span").html(data.message);
	}else{
		//后端代码实现默认笔记本的自动建立
		
		//alert重写放到log_in.html界面
		alert("注册成功");
		//setTimeout(function(){window.location.href="log_in.html";},3000);
		window.location.href="log_in.html";
	}
}