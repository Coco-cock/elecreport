<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>登录</title>
 <c:set var="baseUrl" value="${pageContext.request.contextPath}"></c:set>
<link href="${baseUrl}/assets/css/login.css" rel="stylesheet" type="text/css" media="all"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
</head>
<body>
<div class="login">
	<h2>电力负荷报表系统</h2>
	<div class="login-top">
		<h1>登录</h1>
		<form action="${baseUrl}/login" method="post">
			<input type="text" name="userName" placeholder="用户名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '用户名';}">
			<input type="password" name="userPassword" placeholder="密码" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '密码';}">
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
</body>
</html>