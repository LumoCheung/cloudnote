//重写JS原生alert函数
$(function(){
	window.alert=function(e){
		$('#can').load('./alert/alert_error.html',function(){
			$('#error_info').text(' '+e);
			$('.opacity_bg').show();
			$(".btn.btn-default.cancle").click(window_close);
			$('.close').click(function(){
				window_close();
			});
		});
	}
})
//关闭弹出框
function window_close(){
	$('.opacity_bg').hide();
	$('#can').html("");
}