//扩充Date()对象的formate方法
Date.prototype.formate=function(parttern){
	var year=this.getFullYear();
	var month=this.getMonth()+1;
	month=month<10?"0"+month:month;
	var dd=this.getDate();
	switch(parttern){
		case "yyyy":
			parttern=parttern.replace("yyyy",year);
			break;
		case "yyyy-MM-dd":
			parttern=parttern.replace("yyyy",year);
			parttern=parttern.replace("MM",month);
			parttern=parttern.replace("dd",dd);
			break;
		case "yyyy-MM-dd hh:mm:ss":
			parttern=parttern.replace("yyyy",year);
			parttern=parttern.replace("MM",month);
			break;
		default:
			break;
	}
	
	parttern=parttern.replace("yyyy-MM-dd",year);
	return parttern;
}

//日期的增减
Date.prototype.addDate=function(num){
	var dateMills=this.valueOf();
	var mills=num*24*60*60*1000;
	dateMills+=mills;
	return new Date(dateMills).formate("yyyy-MM-dd");
	
}