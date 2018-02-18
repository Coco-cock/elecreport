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
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<link href="assets/css/custom-styles.css" rel="stylesheet" />
<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
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
					<li><a class="active-menu" href="${baseUrl}/index"><i class="glyphicon glyphicon-flash"></i>实时负荷曲线</a>
					</li>
					<li><a  href="${baseUrl}/historyload"><i class="glyphicon glyphicon-signal"></i>历史负荷曲线</a>
					</li>
					<li><a href=""><i class="fa fa-table"></i>负荷数据表</a>
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
					Welcome <small>${sessionScope.sessionVo.getUserName()}</small>
				</h4>

			</div>
			<div id="page-inner">
				<div class="row">
					<div class="col-sm-4 col-xs-4">
						<div class="panel panel-default chartJs">
							<div class="panel-body">
								<div id="voltageG-chart"></div>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-4">
						<div class="panel panel-default chartJs">
							<div class="panel-body">
								<div id="currentG-chart"></div>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-4">
						<div class="panel panel-default chartJs">
						
							<div class="panel-body">
								<div id="powerG-chart"></div>
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
								<div id="voltage-chart"></div>
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
								<div id="current-chart"></div>
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
								<div id="power-chart" ></div>
							</div>
						</div>
					</div>
				</div>
				<script>
function domInit(id,widthDom,heightDom){
var chartDom =document.getElementById(id);
chartDom.style.width = window.innerWidth-widthDom+'px';
chartDom.style.height = window.innerHeight-heightDom+'px';
	return chartDom;
	};
 var voltageG = echarts.init(domInit("voltageG-chart",1080,400));
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
                                 data: [{value:0, name: '电压'}]
                             }
                         ]
                     });


                     voltageG.showLoading(); 
                     var currentG = echarts.init(domInit("currentG-chart",1080,400));

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
                     var powerG = echarts.init(domInit("powerG-chart",1080,400));

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
var voltageChart = echarts.init(domInit("voltage-chart",350,250));
voltageChart.setOption({
    title: {
        text: '电压',
        subtext: '每分钟刷新'
    },
    tooltip: {
        trigger: 'axis',
       
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

var currentChart = echarts.init(domInit("current-chart",350,250));

currentChart.setOption({
    title: {
        text: '电流',
        subtext: '每分钟刷新'
    },
    tooltip: {
        trigger: 'axis',
      
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

var powerChart = echarts.init(domInit("power-chart",350,250));

powerChart.setOption({
    title: {
        text: '功率',
        subtext: '每分钟刷新'
    },
    tooltip: {
        trigger: 'axis',
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
            name:'功率',
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

window.onresize = function () {
	domInit("voltageG-chart",1080,400);
	domInit("currentG-chart",1080,400);
	domInit("powerG-chart",1080,400)
	domInit("voltage-chart",350,250);
	domInit("current-chart",350,250);
	domInit("power-chart",350,250);
	voltageG.resize();
	 currentG.resize();
	 powerG.resize();
	 voltageChart.resize();
	 currentChart.resize();
	 powerChart.resize();
};
var i=self.setInterval("timedata()",1000);
function timedata(){
var Vdata=[];
var Adata=[];
var Pdata=[];
$.ajax({
    type: "post",
    async: true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
    url: "${pageContext.request.contextPath}/getdynamicdata", 
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
             voltageG.hideLoading(); 
             voltageG.setOption({                  
                series: [{
                	 data: [{value:Vpoint, name: '电压'}]
                }]
            }); 
             currentG.hideLoading();    
             currentG.setOption({                   
                series: [{
                	 data: [{value:Apoint, name: '电流'}]
                }]
            });
             powerG.hideLoading();  
             powerG.setOption({        
                series: [{
                	 data: [{value:Ppoint, name: '功率'}]
                }]
            });
             voltageChart.hideLoading(); 
             voltageChart.setOption({            
                series: [{
                    data: Vdata
                }]
            });
             
             currentChart.hideLoading(); 
            currentChart.setOption({                
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




		



				<footer>
				

				</footer>
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
   
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.metisMenu.js"></script>
    <script src="assets/js/custom-scripts.js"></script>



</body>

</html>