<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"></c:set>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta content="" name="description" />
<meta content="webthemez" name="author" />
<title>实时数据</title>
<link href="${baseUrl}/assets/css/bootstrap.css" rel="stylesheet" />
<link href="${baseUrl}/assets/css/font-awesome.css" rel="stylesheet" />
<link href="${baseUrl}/assets/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<link href="${baseUrl}/assets/css/custom-styles.css" rel="stylesheet" />
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<script src="${baseUrl}/assets/js/jquery-3.3.1.min.js"></script>
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
						class="icon glyphicon glyphicon-stats"></i>数据报表</strong></a>

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
					<li><a href="${baseUrl}/index"><i
							class="glyphicon glyphicon-flash"></i>实时负荷曲线</a></li>
					<li><a class="active-menu" href="${baseUrl}/historyload"><i
							class="glyphicon glyphicon-signal"></i>历史负荷曲线</a></li>
					<li><a href="#"><i class="fa fa-table"></i>历史负荷数据表<span
							class="fa arrow"></span></a>
					    <ul class="nav nav-second-level">
						    <li><a  href="${baseUrl}/"><i class="glyphicon glyphicon-list-alt"></i>实时负荷数据记录表</a></li>
							<li><a  href="${baseUrl}/dayloadtable"><i class="glyphicon glyphicon-list-alt"></i>日负荷数据记录表</a></li>
							<li><a href="${baseUrl}/monthloadtable"><i class="glyphicon glyphicon-list-alt"></i>月负荷数据记录表</a></li>
							<li><a href="${baseUrl}/yearloadtable"><i class="glyphicon glyphicon-list-alt"></i>年负荷数据记录表</a></li>
						</ul>
						</li>
					<li><a href="${baseUrl}/getallcustom"><i
							class="glyphicon glyphicon-align-center"></i>用户信息管理</a></li>
					<li><a href=""><i class="glyphicon glyphicon-user"></i>用户信息</a>
					</li>
					<li><a href=""><i
							class="glyphicon glyphicon-copyright-mark"></i>关于</a></li>
				</ul>
			</div>

		</nav>
		<!-- /. NAV SIDE  -->

		<div id="page-wrapper">
			<div class="header">
				<h4 class="page-header">
					Welcome <small>${sessionScope.sessionVo.getUserName()}</small>
				</h4>

			</div>
			<div id="page-inner">
				<div class="row">
					<div class="col-xs-6 col-md-3">
						<div class="panel panel-default">
							<div class="panel-body easypiechart-panel">
								<h4>Profit</h4>
								<div class="easypiechart" id="easypiechart-blue"
									data-percent="82">
									<span class="percent">82%</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<div class="panel panel-default">
							<div class="panel-body easypiechart-panel">
								<h4>Sales</h4>
								<div class="easypiechart" id="easypiechart-orange"
									data-percent="55">
									<span class="percent">55%</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<div class="panel panel-default">
							<div class="panel-body easypiechart-panel">
								<h4>Customers</h4>
								<div class="easypiechart" id="easypiechart-teal"
									data-percent="84">
									<span class="percent">84%</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<div class="panel panel-default">
							<div class="panel-body easypiechart-panel">
								<h4>No. of Visits</h4>
								<div class="easypiechart" id="easypiechart-red"
									data-percent="46">
									<span class="percent">46%</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/.row-->

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div id="month-chart"></div>
							</div>
						</div>
					</div>
					<script>
function domInit(id,widthDom,heightDom) {
	var chartDom =document.getElementById(id);
	chartDom.style.width = window.innerWidth-widthDom+'px';
	chartDom.style.height = window.innerHeight-heightDom+'px';
	return chartDom;
};
var monthChart = echarts.init(domInit("month-chart",350,200));
monthChart.setOption({
    title: {
        text: '月负荷数据',
        subtext: '纯属虚构'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['一月']
    },
    toolbox: {
        show: true,
        feature: {
            dataZoom: {
                yAxisIndex: 'none'
            },
            dataView: {readOnly: false},
            magicType: {type: ['line', 'bar']},
            restore: {},
            saveAsImage: {}
        }
    },
    xAxis:  {
        type: 'category',
        name:'月/天',
        boundaryGap: false,
        data: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
    },
    yAxis: {
        type: 'value',
        name:'电量/KW·H',
        axisLabel: {
            formatter: '{value}'
        }
    },
    series: [
        {
            name:'一月',
            type:'line',
            data:${daydata},
            markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
                ]
            },
            markLine: {
                data: [
                    {type: 'average', name: '平均值'},
                    {type: 'max', name: '最大值'}
                ]
            }
        },
    ]
});

  </script>
				</div>


				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">年数据</div>
							<div class="panel-body">
								<div id="year-chart"></div>
							</div>
						</div>
					</div>

					<script>
var yearChart =echarts.init(domInit("year-chart",350,200));

var option = {
    title: {
        text: '近三年月数据对比',
        subtext: '纯属虚构'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['2018','2017','2016']
    },
    toolbox: {
        show: true,
        feature: {
            dataZoom: {
                yAxisIndex: 'none'
            },
            dataView: {readOnly: false},
            magicType: {type: ['line', 'bar']},
            restore: {},
            saveAsImage: {}
        }
    },
    xAxis:  {
        type: 'category',
        boundaryGap: false,
        data: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
    },
    yAxis: {
    	  type: 'value',
          name:'电量/KW·H',
        axisLabel: {
            formatter: '{value} '
        }
    },
      dataZoom: [{
            startValue: '一月'
        }, {
            type: 'inside'
        }],
    series: [
        {
            name:'2018',
            type:'line',
            data:[11, 11, 15, 13, 12, 13, 10],
            markPoint: {
                data: [
                    //{type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
                ]
            },
            markLine: {
                data: [
                    {type: 'average', name: '平均值'},
                    {type: 'max', name: '最大值'}
                ]
            }
        },
        {
            name:'2017',
            type:'line',
            data:${monthdata},
            markPoint: {
                data: [
                    // {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'},
                    {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
                ]
            },
            markLine: {
                data: [
                    {type: 'average', name: '平均值'},
                    {type: 'max', name: '最大值'}
                ]
            }
        },  {
            name:'2016',
            type:'line',
            data:[1, 9, 2, 5, 3, 2, 10],
            markPoint: {
                data: [
                     {type: 'min', name: '最小值'},
                    {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
                ]
            },
            markLine: {
                data: [
                    {type: 'average', name: '平均值'},
                    {type: 'max', name: '最大值' }
                ]
            }
        }
    ]
};
yearChart.setOption(option);
    </script>


				</div>



				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div id="year-year"></div>
							</div>
						</div>
					</div>

				</div>
					<script>
var yearOldChart = echarts.init(domInit("year-year",350,200));

yearOldChart.setOption({
    title: {
        text: '三年总负荷走势',
        //subtext: '纯属虚构'
    },
    tooltip: {
        trigger: 'axis',
        formatter: "{a} <br/>{b} : {c}KW·H"
    },
    toolbox: {
        show: true,
        feature: {
            dataZoom: {
                yAxisIndex: 'none'
            },
            dataView: {readOnly: false},
            magicType: {type: ['line', 'bar']},
            restore: {},
            saveAsImage: {}
        }
    },
    xAxis:  {
        type: 'category',
        name:'时间',
        boundaryGap: false,
        data: [2016,2017,2018]
    },
    yAxis: {
        type: 'value',
        name:'电量/KW·H',
        axisLabel: {
            formatter: '{value}'
        }
    },
    series: [
        {
            
        	 name:'用电量',
             type:'line',
            data:${yeardata},
            markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
                ]
            },
            markLine: {
                data: [
                    {type: 'average', name: '平均值'},
                    {type: 'max', name: '最大值'}
                ]
            }
        },
    ]
});

window.onresize = function () {

	domInit("month-chart",350,200);
	domInit("year-chart",350,200);
	domInit("year-year",350,200);
    //重置容器高宽
    monthChart.resize();
    yearChart.resize();
    yearOldChart.resize();
};

  </script>
			</div>		
		</div>
	</div>

	<script src="${baseUrl}/assets/js/bootstrap.min.js"></script>
	<script src="${baseUrl}/assets/js/jquery.metisMenu.js"></script>
	<script src="${baseUrl}/assets/js/custom-scripts.js"></script>


</body>

</html>