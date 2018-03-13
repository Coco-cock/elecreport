<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ include file="header.jsp"%>
<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>

			<div id="sidebar" class="sidebar responsive ace-save-state">
				<script type="text/javascript">
					try{ace.settings.loadState('sidebar')}catch(e){}
				</script>
				<ul class="nav nav-list">
					<li id="navleft1">
						<a href="index">
							<i class="menu-icon glyphicon glyphicon-flash"></i>
							<span class="menu-text"> 实时负荷曲线</span>
						</a>

						<b class="arrow"></b>
					</li>

					<li id="navleft2">
						<a href="${baseUrl}/historyload">
							<i class="menu-icon glyphicon glyphicon-signal"></i>
							<span class="menu-text"> 历史负荷曲线</span>
									<b class="arrow"></b>
						</a>
				
					</li>

					<li id="navleft3">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-list"></i>
							<span class="menu-text"> 历史负荷数据表 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li id="navleft3-1">
								<a href="${baseUrl}/">
									<i class="menu-icon fa fa-caret-right"></i>
									实时负荷数据记录表
								</a>

								<b class="arrow"></b>
							</li>

							<li id="navleft3-2">
								<a href="${baseUrl}/dayloadtable">
									<i class="menu-icon fa fa-caret-right"></i>
									日负荷数据记录表
								</a>

								<b class="arrow"></b>
							</li>
								<li id="navleft3-3">
								<a href="${baseUrl}/monthloadtable">
									<i class="menu-icon fa fa-caret-right"></i>
									月负荷数据记录表
								</a>

								<b class="arrow"></b>
							</li>
								<li id="navleft3-4">
								<a href="${baseUrl}/yearloadtable">
									<i class="menu-icon fa fa-caret-right"></i>
									年负荷数据记录表
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>
		
					<li id="navleft4">
						<a href="${baseUrl}/getAllCustom">
							<i class="menu-icon glyphicon glyphicon-align-center"></i>
							<span class="menu-text"> 用户信息管理</span>
						</a>
						<b class="arrow"></b>
					</li >
					<li id="navleft5">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon glyphicon glyphicon-wrench"></i>
							<span class="menu-text"> 权限管理 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li id="navleft5-1">
								<a href="${baseUrl}/getAllPermission">
									<i class="menu-icon fa fa-caret-right"></i>
									权限表
								</a>

								<b class="arrow"></b>
							</li>

							<li id="navleft5-2">
								<a href="${baseUrl}/getAllRole">
									<i class="menu-icon fa fa-caret-right"></i>
									角色表
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					<li id="navleft6">
						<a href="${baseUrl}/goProfile">
							<i class="menu-icon glyphicon glyphicon-user"></i>
							<span class="menu-text"> 用户信息</span>
						</a>
						<b class="arrow"></b>
					</li>
					<li id="navleft7">
						<a href="${baseUrl}/goAbout">
							<i class="menu-icon glyphicon glyphicon-copyright-mark"></i>
							<span class="menu-text"> 关于</span>
						</a>
						<b class="arrow"></b>
					</li>
				</ul><!-- /.nav-list -->

				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>
			</div>