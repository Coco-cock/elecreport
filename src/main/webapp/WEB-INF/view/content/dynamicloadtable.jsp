<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"
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
							<li class="active">实时负荷数据记录表</li>
						</ul>
					</div>
				<div class="page-content">
                       <div class="row">
							<div class="col-xs-12">

								<div class="row">
									<div class="col-xs-12">
									
										<div class="clearfix">
											<div class="pull-right tableTools-container"></div>
										</div>
										<div class="table-header">
											     年负荷数据记录表
										</div>

										<!-- div.table-responsive -->

										<!-- div.dataTables_borderWrap -->
										<div>
											<table id="dynamic-table" class="table table-striped table-bordered table-hover">
												<thead>
												<tr>
                                                        <th>ID</th>
                                                        <th>电流(A)</th>
                                                        <th>电压(V)</th>
                                                        <th>功率(W)</th>
                                                        <th>时间</th>
                                                </tr>											
												</thead>
												<tbody>
									     <c:forEach var="load" items="${LoadDataList}">
                                        <tr>
                                        	<td>${load.ID}</td>
                                            <td>${load.current}</td>
                                            <td>${load.voltage}</td>
                                            <td>${load.powerValue}</td>
                                            <td><fmt:formatDate value="${load.editTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                        </tr> 
                                         </c:forEach>     
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
<script> 
document.getElementById('navleft3').className = 'active open'; 
 document.getElementById('navleft3-1').className = 'active'; 
</script>
		<%@ include file="../main/footer.jsp" %>
		</div><!-- /.main-container -->

		<script type="text/javascript">		
			$(document).ready(function() {
			    $('#dynamic-table').DataTable();
			} );
		</script>
	</body>
</html>
