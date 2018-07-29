<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() 
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>my Jsp</title>
<script src="js/jquery-2.1.4.js"></script>
    <style type="text/css">
        .big {
            width: 600px;
            height: 600px;
            background-color: aqua;
            border: 1px solid #A52A2A;
        }

        .middle {
            width: 150px;
            height: 150px;
            background-color: brown;
            border: 1px solid blue;
        }

        .divfont {
            font-size: 24px;
        }

        .small {
            width: 50px;
            height: 50px;
            background-color: greenyellow;
            border: 1px solid greenyellow;
        }
    </style>
</head>
<body>
<form id="form1" name="form1" action="<%=basePath %>AServlet" method="post">
		<div class="big">
			用户名：<input type="text" name="userName" /><br/>
			密码：<input type="password" name="pwd" /><br/>
			爱好：<input type="checkbox" name="love" value="0" />骑行
			<input type="checkbox" name="love" value="1" />篮球
			<input type="checkbox" name="love" value="2" />游泳<br/>
			性别：
			<select name="sex">
				<option value="1">男</option>
				<option value="0">女</option>
			</select><br/>
			
			<button type="button">保存</button>&nbsp;
			<button type="button">表单json对象</button>
		</div>
	</form>
	<p></p>
	<script type="text/javascript">
		$(function(){
			$("button:eq(0)").click(function(){
				var url="<%=basePath %>BServlet";
				var jsonParam=$("#form1").serializeArray();
				//发起异步请求
				/*
				url:待载入页面的URL地址
				data:待发送 Key/value 参数。
				callback:载入成功时回调函数。
				type:返回内容格式，xml, html, script, json, text, _default。

				*/
				//var param={};
				$.post(url,jsonParam,function(data){
					alert(1);
					alert(data.userName);
				},"json");
			});
		});
	</script>
</body>
</html>