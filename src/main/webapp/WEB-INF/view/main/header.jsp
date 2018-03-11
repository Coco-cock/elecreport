<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<c:set var="baseUrl" value="${pageContext.request.contextPath}"></c:set>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="icon" href="${baseUrl}/assets/images/favicon.gif" type="image/gif" >
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${baseUrl}/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${baseUrl}/assets/font-awesome/4.5.0/css/font-awesome.min.css" />
		<!-- 字体 -->
		<link rel="stylesheet" href="${baseUrl}/assets/css/fonts.googleapis.com.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="${baseUrl}/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		<link rel="stylesheet" href="${baseUrl}/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="${baseUrl}/assets/css/ace-rtl.min.css" />
		<script src="${baseUrl}/assets/js/ace-extra.min.js"></script>	
		<script src="${baseUrl}/assets/js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="${baseUrl}/assets/js/echarts.js"></script>  	
	</head>
	<body class="no-skin">
	<div id="navbar" class="navbar navbar-default ace-save-state">
			<div class="navbar-container ace-save-state" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="index" class="navbar-brand">
						<small>
							<i class="glyphicon glyphicon-stats"></i>
							数据报表
						</small>
					</a>
				</div>

				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">

						<li class="light-blue dropdown-modal">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="assets/images/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>Welcome</small>
									${sessionScope.sessionVo.getUserVO().getUser().getUserName()}
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="#">
										<i class="ace-icon fa fa-cog"></i>
										Settings
									</a>
								</li>

								<li>
									<a href="profile.html">
										<i class="ace-icon fa fa-user"></i>
										Profile
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="${baseUrl}/logout">
										<i class="ace-icon fa fa-power-off"></i>
										Logout
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
  		
		