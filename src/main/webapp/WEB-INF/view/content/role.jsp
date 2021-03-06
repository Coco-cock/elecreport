<%@ page language="java" import="java.util.*" pageEncoding="utf-8" 
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
							<li class="active">角色管理</li>
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
											角色管理
										</div>

										<!-- div.table-responsive -->

										<!-- div.dataTables_borderWrap -->
										<div>
											<table id="dynamic-table" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
                                         			   <th>ID</th>
                                           			   <th>角色名</th>
                                           			   <th>描述</th>
                                                       <th>状态</th>
                                                       <th>操作</th>
													</tr>											
												</thead>
												<tbody>
									   <c:forEach var="role" items="${roleList}">
                                        <tr>
                                            <td><c:out value="${role.id}"></c:out></td>
                                            <td><c:out value="${role.role}"></c:out></td>
                                            <td><c:out value="${role.description}"></c:out></td>
                                            <td><c:out value="${role.available}"></c:out></td>
                                            <td><c:out value=""></c:out></td> 
											</tr>
											</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
									
								<div id="modal-table" class="modal fade" tabindex="-1">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header no-padding">
												<div class="table-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														<span class="white">&times;</span>
													</button>
													添加角色
												</div>
											</div>

											<form action="${baseUrl}/saveSubject" method="post">
											<div class="modal-body no-padding">
												<table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
												<tbody>	
														<tr>
															<td>角色名：</td>															
															<td><input name="subjectId" type="text"> </td>
														</tr>
														<tr>
															<td>描述：</td>															
															<td><input name="subjectName" type="text"> </td>
														</tr>
														<tr>
															<td>状态：</td>															
															<td><input type="text"> </td>
														</tr>
																															
													</tbody>
												</table>
											</div>
											<div class="modal-footer no-margin-top">
                                               <button data-dismiss="modal" class="btn btn-sm btn-danger" type="button">关闭</button>
                                               <button class="btn btn-sm btn-primary" type="submit">提交</button>
                                             </div>
										</form>
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
document.getElementById('navleft5').className = 'active open'; 
document.getElementById('navleft5-2').className = 'active'; 
</script>
		<%@ include file="../main/footer.jsp" %>
		</div><!-- /.main-container -->

	<script type="text/javascript">
function sendDeleteAction(data) {	

	$.ajax({
	    type: "post",
	    async: true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
	    url: "${baseUrl}/deleteSubject/"+data,
	   // data: data,//$('#addForm').serialize(),
	   dataType: "json",  //返回数据形式为json
	    success: function (result) {
	      alert("结果"+result);
	      window.location.reload();
	    },
	    error: function (errorMsg) {  
	    	alert("错误！");
	    	 window.location.reload();
	    }
	});
	}
</script>	

<script type="text/javascript">
		$(document).ready(function() {
		    $('#dynamic-table').DataTable();
		} );			
</script>
		
	</body>
</html>
