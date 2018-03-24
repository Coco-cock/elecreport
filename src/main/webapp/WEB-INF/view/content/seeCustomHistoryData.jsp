<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ include file="../main/menu.jsp"%>
			<!-- 主要内容 -->
			<c:set var="customId" value="${customVO.ID}"/>
			<div id="main-content" class="main-content">
				<div  class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="index">Home</a>
							</li>
							<li>
								<a href="${baseUrl}/getUserByRoleId">用户信息管理</a>
							</li>	
							<li class="active">用户历史负荷曲线--
							 姓名:<c:out value="${customVO.customName}"/>
							地址:<c:out value="${customVO.customAddress}"/>
							</li>
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
													日负荷数据走势
												</h5>				
											</div>
											<div class="widget-body" id="day-chart">
												
											</div><!-- /.widget-body -->
										</div><!-- /.widget-box -->
									</div><!-- /.col -->

									
										<div class="col-sm-12">

										<div class="widget-box">
											<!-- 窗体头 -->
											<div class="widget-header widget-header-flat widget-header-small">
												<h5 class="widget-title">
													<i class="ace-icon fa fa-signal"></i>
													月负荷数据走势
												</h5>

											
											</div>

											<div class="widget-body">
												<div class="widget-main" id="month-chart">
													

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
													年负荷数据走势
												</h5>
											</div>
											<div class="widget-body">
												<div class="widget-main" id="year-year">
												</div><!-- /.widget-main -->
											</div><!-- /.widget-body -->
										</div><!-- /.widget-box -->
									</div><!-- /.col -->
								</div><!-- /.row -->
								<div class="hr hr32 hr-dotted"></div>
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
							

		<%@ include file="../main/footer.jsp" %>
		</div><!-- /.main-container -->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${baseUrl}/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script>
function domInit(id,widthDom,heightDom) {
	var chartDom =document.getElementById(id);
	chartDom.style.width = window.innerWidth-widthDom+'px';
	chartDom.style.height = window.innerHeight-heightDom+'px';
	return chartDom;
};
var dayChart = echarts.init(domInit("day-chart",250,200));
dayChart.setOption({
    title: {
        text: '日负荷数据',
        subtext: '纯属虚构'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['一月','二月','三月']
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
            //data:${daydata},
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
        {
            name:'二月',
            type:'line',
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
        {
            name:'三月',
            type:'line',
           
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
        }
    ]
});
dayChart.showLoading();
//self.setInterval("getDayDate()",1000*60*5);
window.onload=getDayDate();
function getDayDate(){
var time=[];
var elecAmount1=[];
var elecAmount2=[];
var elecAmount3=[];
$.ajax({
    type: "post",
    async: false,    
    url: "${pageContext.request.contextPath}/seeDayBillByCustomId/${customId}", 
    data: {},
    dataType: "json",    
    success: function (result) {
            for (var i = 0; i < result.length; i++) {
            	time.push(result[i].time);
           	 var month=result[i].time;
             if( month.substring(5,7)=="01"){
            	elecAmount1.push(result[i].elecAmount);	
             	
             };
             if( month.substring(5,7)=="02"){
             	elecAmount2.push(result[i].elecAmount);	
              	
              };
              if( month.substring(5,7)=="03"){
              	elecAmount3.push(result[i].elecAmount);	
               	
               };
            	
            };
            dayChart.hideLoading();
            dayChart.setOption({                   
                series: [{
                	 data: elecAmount1,
                },
                {
               	 data: elecAmount2,
               },
               {
              	 data: elecAmount3,
              },
                ]
            });

    },
    error: function (errorMsg) {
        //请求失败时执行该函数
        alert("图表请求数据失败!");
      
    }
});
}

//------------------------------------------------------------


var monthChart =echarts.init(domInit("month-chart",250,200));

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
            //data:[11, 11, 15, 13, 12, 13, 10],
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
            //data:${monthdata},
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
            //data:[1, 9, 2, 5, 3, 2, 10],
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
monthChart.setOption(option);
monthChart.showLoading();
window.onload=getMonthData();
self.setInterval("getMonthData()",1000*60*5);
function getMonthData(){
var time=[];
var elecAmount2016=[];
var elecAmount2017=[];
var elecAmount2018=[];
$.ajax({
    type: "post",
    async: true,    
    url: "${pageContext.request.contextPath}/seeMonthBillByCustomId/${customId}", 
    data: {},
    dataType: "json",    
    success: function (result) {
            for (var i = 0; i < result.length; i++) {
            	time.push(result[i].time);
            	 var year=result[i].time.substring(0,4);
                 if( year=="2016"){
                	elecAmount2016.push(result[i].elecAmount);	
                 	
                 };
                 if( year=="2017"){
                 	elecAmount2017.push(result[i].elecAmount);	
                  	
                  };
                  if( year=="2018"){
                  	elecAmount2018.push(result[i].elecAmount);	
                   	
                   };
            };
            monthChart.hideLoading();
            monthChart.setOption({                   
                series: [
                	{
                	 data: elecAmount2016,
                },
                
            	{
               	 data: elecAmount2017,
               },
           	{
              	 data: elecAmount2018,
              }
                ]
            });

    },
    error: function (errorMsg) {
        //请求失败时执行该函数
        alert("请求数据失败!");
      
    }
});
};
   

//----------------------------------------------------------------------------------
var yearChart = echarts.init(domInit("year-year",250,200));
yearChart.setOption({
    title: {
        text: '近三年总负荷走势',
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
           // data:${yeardata},
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
yearChart.showLoading();
window.onload=getYearDate();
var i=self.setInterval("getYearDate()",1000*60*5);
function getYearDate(){
var time=[];
var elecAmount=[];

$.ajax({
    type: "post",
    async: true,    
    url: "${pageContext.request.contextPath}/seeYearBillByCustomId/${customId}", 
    data: {},
    dataType: "json",       
    success: function (result) {
            for (var i = 0; i < result.length; i++) {
            	time.push(result[i].time);
             
            	elecAmount.push(result[i].elecAmount);
            	
            };
            yearChart.hideLoading();
            yearChart.setOption({                   
                series: [{
                	 data: elecAmount,
                }]
            });

    },
    error: function (errorMsg) {
        //请求失败时执行该函数
        alert("请求数据失败!");
      
    }
});
};

window.onresize = function () {
	domInit("day-chart",250,200);
	dayChart.resize();
	domInit("month-chart",250,200);
	monthChart.resize();
	domInit("year-year",250,200);
	yearChart.resize();
	
}; 
//------------------------------------------------------------
document.getElementById('navleft4').className = 'active'; 
</script>
	</body>
</html>
	