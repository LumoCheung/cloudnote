function activity_list()
{
	$.ajax({
		url:basepath+"/activity/listactivity",
		type:"GET",
		success:function(data){
			list_activity(data);
		}
	});
}
function activity_detail(obj)
{
	var id=$(obj).attr("id");
	url= "activity_detail.html?activityid="+id;
	location.href=url;
}
function getpost()
{
	var url=location.search;
	var Request = new Object();
	if(url.indexOf("?")!=-1)
	{
	　var str = url.substr(1)　//去掉?号
	　strs= str.split("&");
	　for(i=0;i<strs.length;i++)
	　{
	　　 Request[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
	　}
	}
	return Request["activityid"];
}

function note_activity_list()
{
	var id=getpost();
	$.ajax({
		url:basepath+"/activity/listactivitynote/"+id,
		type:"GET",
		//返回类型
		dataType:"json",
		success:function(data){
			list_note_activity(data);
		}
	});
}
function join_action()
{
	
}