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
				//$("#form1").submit();
				/* 格式：load(url, [data], [callback])
				 * 		参数1：url ，请求路径
				 * 		参数2：data，请求参数
				 * 		参数3：callback，回调函数
				 * * 如果没有请求参数，发送的GET请求
				 * * 如果有请求参数，发送的POST请求。请求没有中文乱码
				 * * 回调函数的参数
				 * 		参数1：data，响应数据。load()永远获得字符串，如果需要使用，必须手动转换json对象。
				 */
				var url="<%=basePath %>AServlet";
				var jsonParam=$("#form1").serializeArray();
				//发起异步请求
				$("p").load(url,jsonParam,function(data){
					if(data==null){
						alert("执行失败");
					}else{
						$("p").text("执行成功"+data);
						window.location.href="http://www.baidu.com";
					}
					
				});
			});
		});
	</script>
</body>
</html>