<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ include file="menu.jsp"%>
			<!-- 主要内容 -->
			<div id="main-content" class="main-content">
				<div  class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="index">Home</a>
							</li>	
							<li class="active">历史负荷曲线</li>
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
									
									<div class="col-sm-12">

										<div class="widget-box">
											<!-- 窗体头 -->
											<div class="widget-header widget-header-flat widget-header-small">
												<h5 class="widget-title">
													<i class="ace-icon fa fa-signal"></i>
													电压数据
												</h5>				
											</div>
											<div class="widget-body" id="month-chart">
												
											</div><!-- /.widget-body -->
										</div><!-- /.widget-box -->
									</div><!-- /.col -->
							
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
												<div class="widget-main" id="year-chart">
													

												</div><!-- /.widget-main -->
											</div><!-- /.widget-body -->
										</div><!-- /.widget-box -->
										
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
												<div class="widget-main" id="year-year">
													

												</div><!-- /.widget-main -->
											</div><!-- /.widget-body -->
										</div><!-- /.widget-box -->
										
										
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
									</div><!-- /.col -->
								</div><!-- /.row -->


								<div class="hr hr32 hr-dotted"></div>

								

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
<script> 
var div = document.getElementById('navleft2'); 
div.className = 'active'; 
</script>
		<%@ include file="footer.jsp" %>
		</div><!-- /.main-container -->
		<script src="assets/js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery-ui.custom.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="assets/js/jquery.sparkline.index.min.js"></script>
		<script src="assets/js/jquery.flot.min.js"></script>
		<script src="assets/js/jquery.flot.resize.min.js"></script>
		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>	
	</body>
</html>
	