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
							<li class="active">用户信息管理</li>
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
											用户信息表  	
										</div>

										<!-- div.table-responsive -->

										<!-- div.dataTables_borderWrap -->
										<div>
											<table id="dynamic-table" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
                                         			   <th>序号</th>
                                         			   <th>用户名</th>
                                         			   <th>角色</th>
                                           			   <th>姓名</th>
                                           			
                                                       <th>操作</th>
													</tr>											
												</thead>
												<tbody>
												${customList}
									   <c:forEach var="uac" items="${userAndCustomList}" varStatus="vs">
                                        <tr>
                                            <td><c:out value="${vs.index+1}"></c:out></td>
                                            <td><c:out value="${uac.user.userName}"></c:out></td>
                                            <td><c:out value="${uac.user.role.description}"></c:out></td>
                                            <td><c:out value="${uac.customVO.customName}"></c:out></td>
                                           
                                             <td><a href="#modal-table${vs.index+1}" role="button"  data-toggle="modal"> <button class="btn btn-xs btn-warning pull-right" ><i class="glyphicon glyphicon-plus"></i>添加</button> </a></td> 
											</tr>
								
											</c:forEach>
											</tbody>
											</table>
										</div>
									</div>
								</div>
						<div id="modal-table${vs.index+1}" class="modal fade" tabindex="-1">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header no-padding">
												<div class="table-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														<span class="white">&times;</span>
													</button>
													配置角色
												</div>
											</div>

											<form id="addForm"  action="${baseUrl}/saveUserAndCustom" method="post" >
											<div class="modal-body no-padding">
												<table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
												<tbody>	
														
														<tr>
															<td>用户名：${uac.user.userName}</td>															
															<input name="ID" type="hide"> 
														</tr>
														<tr>
															<td>角色：</td>															
															<td><input name="role" type="text"> </td>
														</tr>
														
													</tbody>
												</table>
											</div>
											<div class="modal-footer no-margin-top">
                                               <button data-dismiss="modal" class="btn btn-sm btn-danger" type="button">关闭</button>
                                               <button class="btn btn-sm btn-primary"  type="submit">提交</button>
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
 <script type="text/javascript">
        function save() {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${baseUrl}/saveUser" ,
                data: $('#addForm').serialize(),
                success: function (result) {
                   // console.log(result);//打印服务端返回的数据(调试用)
                    if (result.resultCode == 200) {
                        alert("SUCCESS");
                    }
                    ;
                },
                error : function() {
                    alert("异常！");
                }
            });
        }
    </script>
<script> 
document.getElementById('navleft4').className = 'active'; 
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
