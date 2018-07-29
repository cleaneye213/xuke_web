<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + path + "/";
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
	<form id="form1" name="form1" action="<%=basePath%>AServlet"
		method="post">
		<div class="big">
			用户名：<input type="text" name="userName" /><br /> 密码：<input
				type="password" name="pwd" /><br /> 爱好：<input type="checkbox"
				name="love" value="0" />骑行 <input type="checkbox" name="love"
				value="1" />篮球 <input type="checkbox" name="love" value="2" />游泳<br />
			性别： <select name="sex">
				<option value="1">男</option>
				<option value="0">女</option>
			</select><br />

			<button type="button">保存</button>
			&nbsp;
			<button type="button">表单json对象</button>
		</div>
	</form>
	<p></p>
	<script type="text/javascript">
		$(function(){
			$("button:eq(0)").click(function(){
				var url="<%=basePath%>BServlet";
				var jsonParam = $("#form1").serializeArray();

				$.ajax({
					url : url,
					data : jsonParam,
					type : "post",
					dataType : "json",//数据返回类型
					async : true,//(默认: true) 默认设置下，所有请求均为异步请求。如果需要发送同步请求，请将此选项设置为 false
					success : function(data) {
						alert(data.userName);
					},
					error : function() {
						alert("执行失败了");
					}
				});

				/* 4 $.ajax() 底层功能最强大的
				 * * 格式：jQuery.ajax([settings])
				 * 		参数settings：设置所有的参数
				 * 			url:发送请求的地址
				 * 			data:发送到服务器的数据,请求参数
				 * 			type:请求方式 ("POST" 或 "GET")， 
				 * 			success:成功的回调函数，success(data, textStatus, jqXHR)
				 * 			error:请求失败时调用此函数
				 * 			dataType:预期服务器返回的数据类型
				 * 				"xml": 返回 XML 文档，可用 jQuery 处理。
				 * 				"html": 返回纯文本 HTML 信息；包含的script标签会在插入dom时执行。
				 * 				"script": 返回纯文本 JavaScript 代码。不会自动缓存结果。除非设置了"cache"参数。'''注意：'''在远程请求时(不在同一个域下)，所有POST请求都将转为GET请求。(因为将使用DOM的script标签来加载)
				 * 				"json": 返回 JSON 数据 。
				 * 				"jsonp": JSONP 格式。使用 JSONP 形式调用函数时，如 "myurl?callback=?" jQuery 将自动替换 ? 为正确的函数名，以执行回调函数。
				 * 				"text": 返回纯文本字符串
				 */

			});
		});
	</script>
</body>
</html>