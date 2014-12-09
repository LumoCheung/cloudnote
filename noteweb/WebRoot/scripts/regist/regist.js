/**
 * 注册
 */
function regist(){
	for(i=1;i<5;i++){
		$("#warning_"+i).css("display","none");
	}
	if(!(regPwd()&finPwd()&cUser()&cNick())){
		$.ajax({
			url:basepath+"/regist/regist.form",
			type:"get",
			beforeSend:function(xhr){
				var v_name=$("#regist_username").val();
				var v_pwd=$("#regist_password").val();
				var author = make_base_auth(v_name,v_pwd);
				//alert(author);
				xhr.setRequestHeader("Authorization",author);
			},
			success:function(data){
				regist_success(data);
			}
		});
	}
}