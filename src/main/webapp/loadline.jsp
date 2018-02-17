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
<title>BRILLIANT Free Bootstrap Admin Template</title>
<!-- Bootstrap Styles-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
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

					<li><a class="active-menu" href="${baseUrl}/index"><i
							class="glyphicon glyphicon-signal"></i> 负荷走势</a></li>

					<li><a href="#"><i class="fa fa-sitemap"></i> Charts<span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="chart.html">Charts JS</a></li>
							<li><a href="morris-chart.html">Morris Chart</a></li>
						</ul></li>

					<li><a href="table.html"><i class="fa fa-table"></i> 数据管理</a>
					</li>
					<li><a href="form.html"><i class="fa fa-edit"></i> Forms </a>
					</li>


					<li><a href="#"><i class="fa fa-sitemap"></i>负荷节点<span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#">Second Level Link</a></li>
							<li><a href="#">Second Level Link</a></li>
							<li><a href="#">Second Level Link<span class="fa arrow"></span></a>
								<ul class="nav nav-third-level">
									<li><a href="#">Third Level Link</a></li>
									<li><a href="#">Third Level Link</a></li>
									<li><a href="#">Third Level Link</a></li>

								</ul></li>
						</ul></li>
					<li><a href="empty.html"><i class="fa fa-fw fa-file"></i>
							Empty Page</a></li>
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
					<div class="col-sm-4 col-xs-4">
						<div class="panel panel-default chartJs">
							<div class="panel-body">
								<div id="voltageG-chart" style="width: 300px; height: 300px;"></div>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-4">
						<div class="panel panel-default chartJs">
							<div class="panel-body">
								<div id="currentG-chart" style="width: 300px; height: 300px;"></div>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-4">
						<div class="panel panel-default chartJs">
						
							<div class="panel-body">
								<div id="powerG-chart" style="width: 300px; height: 300px;"></div>
							</div>
						</div>
					</div>
				</div>

				<!-- 实时数据表 -->
				<div class="row">
					<div class="col-sm-12 col-xs-12">
						<div class="panel panel-default chartJs">
							<div class="panel-heading">
								<div class="card-title">
									<div class="title">电压数据</div>
								</div>
							</div>
							<div class="panel-body">
								<div id="voltage-chart" style="width: 1000px; height: 300px;"></div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12 col-xs-12">
						<div class="panel panel-default chartJs">
							<div class="panel-heading">
								<div class="card-title">
									<div class="title">电流数据</div>
								</div>
							</div>
							<div class="panel-body">
								<div id="current-chart" style="width: 1000px; height: 300px;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-xs-12">
						<div class="panel panel-default chartJs">
							<div class="panel-heading">
								<div class="card-title">
									<div class="title">功率数据</div>
								</div>
							</div>
							<div class="panel-body">
								<div id="power-chart" style="width: 1000px; height: 300px;"></div>
							</div>
						</div>
					</div>
				</div>
				<script>
 var voltageG = echarts.init(document.getElementById("voltageG-chart" ));

                     voltageG.setOption({
                         title: {
                             text: '电压',
                             subtext: '每分钟刷新'
                         },
                         tooltip : {
                             formatter: "{a} <br/>{b} : {c}V"
                         },
                         toolbox: {
                             feature: {
                                 restore: {},
                                 saveAsImage: {}
                             }
                         },
                         series: [
                             {
                                 name: '实时电压',
                                 type: 'gauge',
                                 detail: {formatter:'{value}V'},
                                 min:0,
                                 max:250,
                                 data: [{value:50, name: '电压'}]
                             }
                         ]
                     });


                     voltageG.showLoading(); 
                     var currentG = echarts.init(document.getElementById("currentG-chart" ));

                     currentG.setOption({
                         title: {
                             text: '电流',
                             subtext: '每分钟刷新'
                         },
                         tooltip : {
                             formatter: "{a} <br/>{b} : {c}A"
                         },
                         toolbox: {
                             feature: {
                                 restore: {},
                                 saveAsImage: {}
                             }
                         },
                         series: [
                             {
                                 name: '实时电流',
                                 type: 'gauge',
                                 detail: {formatter:'{value}A'},
                                 min:0,
                                 max:25,
                                 data: [{value:0, name: '电流'}]
                             }
                         ]
                     });


                     currentG.showLoading();
                     var powerG = echarts.init(document.getElementById("powerG-chart" ));

                     powerG.setOption({
                         title: {
                             text: '功率',
                             subtext: '每分钟刷新'
                         },
                         tooltip : {
                             formatter: "{a} <br/>{b} : {c}W"
                         },
                         toolbox: {
                             feature: {
                                 restore: {},
                                 saveAsImage: {}
                             }
                         },
                         series: [
                             {
                                 name: '功率',
                                 type: 'gauge',
                                 detail: {formatter:'{value}W'},
                                 min:0,
                                 max:5000,
                                 data: [{value:0, name: '功率'}]
                             }
                         ]
                     });


                     powerG.showLoading(); 
var voltageChart = echarts.init(document.getElementById("voltage-chart" ));

voltageChart.setOption({
    title: {
        text: '电压',
        subtext: '每分钟刷新'
    },
    tooltip: {
        trigger: 'axis'
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
        name:'时间/minute'
    
    },
    yAxis: {
        type: 'value',
        name:'电压/V'
    }, dataZoom: [
        {
            show: true,
            realtime: true,
            start: 65,
            end:100
        },
        {
            type: 'inside',
            realtime: true,
            start: 65,
            end:100
        }
    ],
       
    series: [
        {
            name:'电压',
            type:'line',
            data:[],
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


voltageChart.showLoading();  

var currentChart = echarts.init(document.getElementById("current-chart" ));

currentChart.setOption({
    title: {
        text: '电流',
        subtext: '每分钟刷新'
    },
    tooltip: {
        trigger: 'axis'
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
        name:'时间/minute'
    
    },
    yAxis: {
        type: 'value',
        name:'电流/A'
    }, dataZoom: [
        {
            show: true,
            realtime: true,
            start: 65,
            end:100
        },
        {
            type: 'inside',
            realtime: true,
            start: 65,
            end:100
        }
    ],
       
    series: [
        {
            name:'电流',
            type:'line',
            data:[],
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


currentChart.showLoading(); 

var powerChart = echarts.init(document.getElementById("power-chart" ));

powerChart.setOption({
    title: {
        text: '功率',
        subtext: '每分钟刷新'
    },
    tooltip: {
        trigger: 'axis'
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
        name:'时间/minute'
    
    },
    yAxis: {
        type: 'value',
        name:'功率/W'
    }, dataZoom: [
        {
            show: true,
            realtime: true,
            start: 65,
            end:100
        },
        {
            type: 'inside',
            realtime: true,
            start: 65,
            end:100
        }
    ],
       
    series: [
        {
            name:'电功率',
            type:'line',
            data:[],
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


powerChart.showLoading(); 


var i=self.setInterval("timedata()",1000);
function timedata()
{
var Vdata=[];
var Adata=[];
var Pdata=[];
$.ajax({
    type: "post",
    async: true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
    url: "${pageContext.request.contextPath}/getdynamicdata",    //请求发送到TestServlet处
    data: {},
    dataType: "json",        //返回数据形式为json
    success: function (result) {
        //请求成功时执行该函数内容，result即为服务器返回的json对象
        if (result) {
            	//alert(result["time"][0]);
            	var Vpoint=result["Vdata"][result["Vdata"].length-1];
            	var Apoint=result["Adata"][result["Adata"].length-1];
            	var Ppoint=result["Pdata"][result["Pdata"].length-1];
            for (var i = 0; i < result["time"].length; i++) {
            	var V = []; 
            	var A = [];
            	var P = [];
            	V.push(result["time"][i]);
            	A.push(result["time"][i]);
            	P.push(result["time"][i]);
            	V.push(result["Vdata"][i]);
            	A.push(result["Adata"][i]);
            	P.push(result["Pdata"][i]);
            	Vdata.push(V);
            	Adata.push(A);
            	Pdata.push(P);
            };
            
            //alert(daybilldata); 
             voltageG.hideLoading();    //隐藏加载动画
             voltageG.setOption({        //加载数据图表             
                series: [{
                	 data: [{value:Vpoint, name: '电压'}]
                }]
            }); 
             currentG.hideLoading();    //隐藏加载动画
             currentG.setOption({        //加载数据图表             
                series: [{
                	 data: [{value:Apoint, name: '电流'}]
                }]
            });
             powerG.hideLoading();    //隐藏加载动画
             powerG.setOption({        //加载数据图表             
                series: [{
                	 data: [{value:Ppoint, name: '功率'}]
                }]
            });
             voltageChart.hideLoading();    //隐藏加载动画
             voltageChart.setOption({        //加载数据图表             
                series: [{
                    data: Vdata
                }]
            });
             
             currentChart.hideLoading();    //隐藏加载动画
            currentChart.setOption({        //加载数据图表             
                series: [{
                    data: Adata
                }]
            });
            powerChart.hideLoading();    //隐藏加载动画
            powerChart.setOption({        //加载数据图表             
                series: [{
                    data: Pdata
                }]
            });

        }

    },
    error: function (errorMsg) {
        //请求失败时执行该函数
        alert("图表请求数据失败!");
        timeChart.hideLoading();
    }
})};



    </script>

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
								<div id="day-chart" style="width: 900px; height: 400px;"></div>
							</div>
						</div>
					</div>
					<script>
var dayChart = echarts.init(document.getElementById("day-chart"));

dayChart.setOption({
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
					<div class="col-md-3s col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">Donut Chart Example</div>
							<div class="panel-body">
								<div id="morris-donut-chart"></div>
							</div>
						</div>
					</div>

				</div>


				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">年数据</div>
							<div class="panel-body">
								<div id="year-chart" style="width: 1000px; height: 400px;"></div>
							</div>
						</div>
					</div>

					<script>
var myChart = echarts.init(document.getElementById("year-chart"));

var option = {
    title: {
        text: '三年数据对比',
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
        axisLabel: {
            formatter: '{value} KW·H'
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
myChart.setOption(option);
    </script>


				</div>




				<div class="row">
					<div class="col-md-12"></div>
				</div>
				<!-- /. ROW  -->





				<div class="row">
					<div class="col-md-4 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">Tasks Panel</div>
							<div class="panel-body">
								<div class="list-group">

									<a href="#" class="list-group-item"> <span class="badge">7
											minutes ago</span> <i class="fa fa-fw fa-comment"></i> Commented on
										a post
									</a> <a href="#" class="list-group-item"> <span class="badge">16
											minutes ago</span> <i class="fa fa-fw fa-truck"></i> Order 392
										shipped
									</a> <a href="#" class="list-group-item"> <span class="badge">36
											minutes ago</span> <i class="fa fa-fw fa-globe"></i> Invoice 653 has
										paid
									</a> <a href="#" class="list-group-item"> <span class="badge">1
											hour ago</span> <i class="fa fa-fw fa-user"></i> A new user has been
										added
									</a> <a href="#" class="list-group-item"> <span class="badge">1.23
											hour ago</span> <i class="fa fa-fw fa-user"></i> A new user has
										added
									</a> <a href="#" class="list-group-item"> <span class="badge">yesterday</span>
										<i class="fa fa-fw fa-globe"></i> Saved the world
									</a>
								</div>
								<div class="text-right">
									<a href="#">More Tasks <i class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>

					</div>
					<div class="col-md-8 col-sm-12 col-xs-12">

						<div class="panel panel-default">
							<div class="panel-heading">Responsive Table Example</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>S No.</th>
												<th>First Name</th>
												<th>Last Name</th>
												<th>User Name</th>
												<th>Email ID.</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>John</td>
												<td>Doe</td>
												<td>John15482</td>
												<td>name@site.com</td>
											</tr>
											<tr>
												<td>2</td>
												<td>Kimsila</td>
												<td>Marriye</td>
												<td>Kim1425</td>
												<td>name@site.com</td>
											</tr>
											<tr>
												<td>3</td>
												<td>Rossye</td>
												<td>Nermal</td>
												<td>Rossy1245</td>
												<td>name@site.com</td>
											</tr>
											<tr>
												<td>4</td>
												<td>Richard</td>
												<td>Orieal</td>
												<td>Rich5685</td>
												<td>name@site.com</td>
											</tr>
											<tr>
												<td>5</td>
												<td>Jacob</td>
												<td>Hielsar</td>
												<td>Jac4587</td>
												<td>name@site.com</td>
											</tr>
											<tr>
												<td>6</td>
												<td>Wrapel</td>
												<td>Dere</td>
												<td>Wrap4585</td>
												<td>name@site.com</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- /. ROW  -->


				<footer>
					<p>
						Copyright &copy; 2016.Company name All rights reserved.<a
							target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
					</p>


				</footer>
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- Metis Menu Js -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- Morris Chart Js -->
	<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
	<script src="assets/js/morris/morris.js"></script>
	<script src="assets/js/easypiechart.js"></script>
	<script src="assets/js/easypiechart-data.js"></script>
	<script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>
	<!-- Custom Js -->
	<script src="assets/js/custom-scripts.js"></script>

	<!-- Chart Js -->
	<script type="text/javascript" src="assets/js/Chart.min.js"></script>
	<script type="text/javascript" src="assets/js/chartjs.js"></script>

</body>

</html>