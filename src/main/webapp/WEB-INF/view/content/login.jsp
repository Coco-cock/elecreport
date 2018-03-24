<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>登录</title>
 <c:set var="baseUrl" value="${pageContext.request.contextPath}"></c:set>
 <link rel="icon" href="${baseUrl}/assets/img/favicon.gif" type="image/gif" >
<link href="${baseUrl}/assets/css/login.css" rel="stylesheet" type="text/css" media="all"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<link rel="stylesheet" href="${baseUrl}/assets/css/bootstrap.min.css" />
<script src="${baseUrl}/assets/js/jquery-2.1.4.min.js"></script>
</head>
<body>
<div class="login">
	<h2>电力负荷报表系统</h2>
	<div class="login-top">
		<h1>登录</h1>
		<form action="${baseUrl}/loginVerify" id="loginForm" method="post">
			<input type="text" id="userName"name="userName" placeholder="用户名" >
			<input type="password" id="password" name="password" placeholder="密码" >
	    <div class="forgot">
	    	<a href="#">忘记密码？</a>
	    	<input type="submit" value="Login" >
	    </div>
	    </form>
	</div>
	<div class="login-bottom">
	</div>
</div>	
<div class="copyright">
	<p>Copyright &copy; 2018 中北大学信息商务学院 - 自动控制系</p>
</div>
<script>
	function checkEmpty(id, name) {
		var value = $("#" + id).val();
		if (value.length == 0) {
			
			alert(name + "不能为空");
			$("#" + id)[0].focus();
			return false;
		}
		return true;
	}


		$(function() {
			$("#loginForm").submit(function() {
				if (!checkEmpty("userName", "用户名")||!checkEmpty("password", "密码"))
					return false;
				return true;
			});
		});
	</script>
</body>
</html>