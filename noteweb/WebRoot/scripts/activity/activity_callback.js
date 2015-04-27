var panel=["panel-primary","panel-success","panel-info","panel-warning","panel-danger","panel-default"];

function list_activity(data)
{
	//date{"0","",[{},{},{}]}
	if(data.status=="0")
	{
		var list=data.data;
		for(i=0;i<3;i++)
		{
			$("#col_"+i).html("");
		}
		for(i=0,k=0;i<list.length;i++,k++)
		{
			//r控制颜色，z控制位置
			var r = parseInt(Math.random()*6);
			var z=k%3;
			$("#col_"+z).append('<div class="panel '+panel[r]+'" id="'+list[i].id+'" onclick="activity_detail(this)" style=" cursor: pointer;"><div class="panel-heading">'
					+list[i].title+'</div><div class="panel-body">'+list[i].body+'</div><div class="panel-footer">截止时间：'
					+list[i].endDate+'</div>');
		}
	}
}
function list_note_activity(data)
{
	//date{"0","",[{},{},{}]}
	if(data.status=="0")
	{
		var list=data.data;
		var length=list.length;
		$("#more_activity_note").css("display","none");
		if(length>15)
		{
			length=15;
			$("#more_activity_note").css("display","block");
		}		
		for(i=0;i<length;i++)
		{
			var title=list[i].title;
			$("#first_action ul").append('<li class="online"><a id="noteId_'+list[i].noteId+'" onclick="getcontent(this)"><i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i>'
					+(title.length>20?title.substring(0,20):title)+'<button type="button" class="btn btn-default btn-xs btn_position_3 btn_up"><i class="fa fa-thumbs-o-up"></i></button>'
					+'<button type="button" class="btn btn-default btn-xs btn_position_2 btn_down"><i class="fa fa-thumbs-o-down"></i></button>'
					+'<button type="button" class="btn btn-default btn-xs btn_position btn_like"><i class="fa fa-star-o"></i>'
					+'</button></a></li>');
		}
	}
}

