<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	 <c:set var="baseUrl" value="${pageContext.request.contextPath}"></c:set>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>电力负荷报表系统</title>
    <!-- Bootstrap Styles-->
    <link href="${baseUrl}/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="${baseUrl}/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="${baseUrl}/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="${baseUrl}/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="${baseUrl}/assets/js/Lightweight-Chart/cssCharts.css"> 
      <script type="text/javascript" src="${baseUrl}/assets/js/echarts.js"></script>  
</head>

<body>
    <div id="wrapper">
       <nav class="navbar navbar-default top-navbar" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${baseUrl}/index"><strong><i
						class="icon glyphicon glyphicon-stats"></i> 数据报表</strong></a>

				<div id="sideNav" href="">
					<i class="fa fa-bars icon"></i>
				</div>
			</div>

			<ul class="nav navbar-top-links navbar-right">


				<!-- 消息通知开始 -->
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" aria-expanded="false"> <i
						class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-alerts">
						<li><a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i> New Comment <span
										class="pull-right text-muted small">4 min</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
										class="pull-right text-muted small">12 min</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-envelope fa-fw"></i> Message Sent <span
										class="pull-right text-muted small">4 min</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-tasks fa-fw"></i> New Task <span
										class="pull-right text-muted small">4 min</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
										class="pull-right text-muted small">4 min</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>See
									All Alerts</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-alerts --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" aria-expanded="false"> <i
						class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>${sessionScope.sessionVo.getUserName()}</a>
						</li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> 设置</a></li>
						<li class="divider"></li>
						<li><a href="${baseUrl}/logout"><i
								class="fa fa-sign-out fa-fw"></i> 退出</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
		</nav>
		<!--/. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li><a  href="${baseUrl}/index"><i class="glyphicon glyphicon-flash"></i>实时负荷曲线</a>
					</li>
					<li><a  href="${baseUrl}/historyload"><i class="glyphicon glyphicon-signal"></i>历史负荷曲线</a>
					</li>
					<li><a class="active-menu" href="#"><i class="fa fa-table"></i>历史负荷数据表<span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
						   <li><a href="${baseUrl}/"><i class="glyphicon glyphicon-list-alt"></i>实时负荷数据记录表</a></li>
							<li><a  href="${baseUrl}/dayloadtable"><i class="glyphicon glyphicon-list-alt"></i>日负荷数据记录表</a></li>
							<li><a class="list-group-item"  href="${baseUrl}/monthloadtable"><i class="glyphicon glyphicon-list-alt"></i>月负荷数据记录表</a></li>
							<li><a href="${baseUrl}/yearloadtable"><i class="glyphicon glyphicon-list-alt"></i>年负荷数据记录表</a></li>
						</ul>
					</li>
					<li><a href="${baseUrl}/getallcustom"><i class="glyphicon glyphicon-align-center"></i>用户信息管理</a>
					</li>
					<li><a href=""><i class="glyphicon glyphicon-user"></i>用户信息</a>
					</li>
					<li><a href=""><i class="glyphicon glyphicon-copyright-mark"></i>关于</a>
					</li>
				</ul>

			</div>

		</nav>
        <!-- /. NAV SIDE  -->
      
		<div id="page-wrapper">
		<div class="header"> 
                        <h4 class="page-header">
                            Tables Page <small>Responsive tables</small>
                        </h4>
        </div>
        
            <div id="page-inner"> 
              <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                                                                                 月负荷数据记录表
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                 <thead>
                                        <tr>
                                            <th>用电量</th>
                                            <th>创建时间</th>
                                            <th>备注</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="load" items="${monthloadlist}">
                                        <tr class="odd gradeX">
                                            <td>${load.getElecAmount()}</td>
                                            <td>${load.getCreateTime()}</td>
                                            <td  </td>
                                        </tr>
                                         </c:forEach>                                
                                       
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
           
       
         </div>
            </div>
        </div>

     <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.metisMenu.js"></script>
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
         <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>

</body>

</html>