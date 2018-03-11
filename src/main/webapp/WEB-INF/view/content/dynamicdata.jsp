<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ include file="../main/menu.jsp"%>
			<!-- 主要内容 -->
			<div id="main-content" class="main-content">
				<div  class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="index">Home</a>
							</li>					
							<li class="active">实时负荷曲线</li>
						</ul>
					</div>

					<div class="page-content">
					
						
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								

								<div class="row">
									<div class="space-6"></div>

						

									<div class="vspace-12-sm"></div>
									<!-- 第一个内容窗体 -->

									<div class="col-sm-4">

										<div class="widget-box">
											<!-- 窗体头 -->
											<div class="widget-header widget-header-flat widget-header-small">
												<h5 class="widget-title">
													<i class="ace-icon fa fa-signal"></i>
													电压
												</h5>

											
											</div>

											<div class="widget-body" >
												<div class="widget-main" id="voltageG-chart">
													

												</div><!-- /.widget-main -->
											</div><!-- /.widget-body -->
										</div><!-- /.widget-box -->
									</div><!-- /.col -->

										<div class="col-sm-4">

										<div class="widget-box">
											<!-- 窗体头 -->
											<div class="widget-header widget-header-flat widget-header-small">
												<h5 class="widget-title">
													<i class="ace-icon fa fa-signal"></i>
													电流
												</h5>

											
											</div>

											<div class="widget-body">
												<div class="widget-main" id="currentG-chart">
													

												</div><!-- /.widget-main -->
											</div><!-- /.widget-body -->
										</div><!-- /.widget-box -->
									</div><!-- /.col -->
										<div class="col-sm-4">

										<div class="widget-box">
											<!-- 窗体头 -->
											<div class="widget-header widget-header-flat widget-header-small">
												<h5 class="widget-title">
													<i class="ace-icon fa fa-signal"></i>
													功率
												</h5>

											
											</div>

											<div class="widget-body">
												<div class="widget-main" id="powerG-chart">
													

												</div><!-- /.widget-main -->
											</div><!-- /.widget-body -->
										</div><!-- /.widget-box -->
									</div><!-- /.col -->

								</div><!-- /.row -->


								<div class="row">
									<div class="space-6"></div>

						

									<div class="vspace-12-sm"></div>
									<!-- 第一个内容窗体 -->
									
									<div class="col-sm-12">

										<div class="widget-box">
											<!-- 窗体头 -->
											<div class="widget-header widget-header-flat widget-header-small">
												<h5 class="widget-title">
													<i class="ace-icon fa fa-signal"></i>
													电压数据
												</h5>

											
											</div>

											<div class="widget-body" id="voltage-chart">
												
											</div><!-- /.widget-body -->
										</div><!-- /.widget-box -->
									</div><!-- /.col -->
										<div class="col-sm-12">

										<div class="widget-box">
											<!-- 窗体头 -->
											<div class="widget-header widget-header-flat widget-header-small">
												<h5 class="widget-title">
													<i class="ace-icon fa fa-signal"></i>
													电流数据
												</h5>

											
											</div>

											<div class="widget-body">
												<div class="widget-main" id="current-chart">
													

												</div><!-- /.widget-main -->
											</div><!-- /.widget-body -->
										</div><!-- /.widget-box -->
									</div><!-- /.col -->
										<div class="col-sm-12">

										<div class="widget-box">
											<!-- 窗体头 -->
											<div class="widget-header widget-header-flat widget-header-small">
												<h5 class="widget-title">
													<i class="ace-icon fa fa-signal"></i>
													功率数据
												</h5>

											
											</div>

											<div class="widget-body">
												<div class="widget-main" id="power-chart">
													

												</div><!-- /.widget-main -->
											</div><!-- /.widget-body -->
										</div><!-- /.widget-box -->
									</div><!-- /.col -->
								</div><!-- /.row -->

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
						<div class="hr hr32 hr-dotted"></div>
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
	<script>
function domInit(id,widthDom,heightDom){
var chartDom =document.getElementById(id);
chartDom.style.width = window.innerWidth-widthDom+'px';
chartDom.style.height = window.innerHeight-heightDom+'px';
	return chartDom;
	};
 var voltageG = echarts.init(domInit("voltageG-chart",0,0));
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
                     var currentG = echarts.init(domInit("currentG-chart",0,0));

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
                                 name: '实时功率',
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
var i=self.setInterval("timedata()",5000);
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
            
           // alert(daybilldata); 
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
<script> 
document.getElementById('navleft1').className = 'active'; 
</script>  
		
		<%@ include file="../main/footer.jsp" %>
		</div><!-- /.main-container -->

		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="${baseUrl}/assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		  <script src="${baseUrl}/assets/js/excanvas.min.js"></script>
		<script src="${baseUrl}/assets/js/jquery-ui.custom.min.js"></script>
		<script src="${baseUrl}/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="${baseUrl}/assets/js/jquery.sparkline.index.min.js"></script>
		<script src="${baseUrl}/assets/js/jquery.flot.min.js"></script>
		<script src="${baseUrl}/assets/js/jquery.flot.resize.min.js"></script>

		<!-- ace scripts -->
		<script src="${baseUrl}/assets/js/ace-elements.min.js"></script>
		<script src="${baseUrl}/assets/js/ace.min.js"></script>	
	</body>
</html>
	