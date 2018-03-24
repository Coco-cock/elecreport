<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="en">
	<head>
		<c:set var="baseUrl" value="${pageContext.request.contextPath}"></c:set>
		<title>电力负荷数据报表系统</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="icon" href="${baseUrl}/assets/img/favicon.gif" type="image/gif" >
		<!--  CDN 资源 -->
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<!-- 表格插件 -->
<!-- 		<link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css" rel="stylesheet"> -->
		<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/echarts/4.0.4/echarts.js"></script>
		<script src="${baseUrl}/assets/js/ace-extra.min.js"></script>	
		<link rel="stylesheet" href="${baseUrl}/assets/font-awesome/4.5.0/css/font-awesome.min.css" />
		<!-- 字体 -->
		<link rel="stylesheet" href="${baseUrl}/assets/css/fonts.googleapis.com.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="${baseUrl}/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		<link rel="stylesheet" href="${baseUrl}/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="${baseUrl}/assets/css/ace-rtl.min.css" />
	</head>
	<body class="no-skin">
	<style>
.navindex{
background:	#595959;
}
</style>
	<div id="navbar" class="navindex navbar navbar-default ace-save-state">
			<div class="navbar-container ace-save-state" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="${baseUrl}/index" class="navbar-brand">
						<small>
							<i class="glyphicon glyphicon-stats"></i>
							电力负荷数据报表系统
						</small>
					</a>
				</div>
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="grey dropdown-modal">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" style="width: 50px;height:45px" src='<c:out value="${sessionScope.sessionVO.userAndCustomVO.user.imgPath}"/>' alt="Photo" />
								<span class="user-info">
									<small>Welcome</small>
									<c:out value="${sessionScope.sessionVO.userAndCustomVO.user.userName}"/>
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="#">
										<i class="ace-icon fa fa-cog"></i>
										设置
									</a>
								</li>
								<li>
									<a href="${baseUrl}/goProfile">
										<i class="ace-icon fa fa-user"></i>
										信息
									</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="${baseUrl}/logout">
										<i class="ace-icon fa fa-power-off"></i>
										退出
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
  		
		