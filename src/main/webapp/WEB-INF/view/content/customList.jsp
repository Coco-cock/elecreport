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
											用户信息表  	<a href="#modal-table" role="button"  data-toggle="modal"> <button class="btn btn-xs btn-warning pull-right" ><i class="glyphicon glyphicon-plus"></i>添加</button> </a>
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
                                           			   <th>联系电话</th>
                                                       <th>地址</th>
                                                      <!--  <th>状态</th> -->
                                                       <th>注册时间</th>
                                                       <th>最近编辑时间</th>
                                                       <th>查看负荷信息</th>
                                                       <th></th>
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
                                            <td><c:out value="${uac.customVO.customPhone}"></c:out></td>
                                            <td><c:out value="${uac.customVO.customAddress}"></c:out></td>
                                            <%-- <td><c:out value="${uac.customVO.customStatus}"></c:out></td> --%>
                                            <td><fmt:formatDate value="${uac.customVO.registerTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                            <td><fmt:formatDate value="${uac.customVO.editTime}" pattern="yyyy-MM-dd HH:mm"/></td> 
                                             <td>
                                             <a href="goSeeCustomDynamicData/${uac.customVO.ID}"> <button class="btn btn-xs btn-primary" ><i class="ace-icon fa fa-tachometer bigger-120"></i>实时</button> </a>
                                             <a href="goSeeCustomHistoryData/${uac.customVO.ID}"> <button class="btn btn-xs btn-primary" ><i class="ace-icon glyphicon glyphicon-signal bigger-120"></i>历史</button> </a>
                                            </td>
                                             <td>
                                             <a href=""> <button class="btn btn-xs btn-warning" ><i class="glyphicon glyphicon-wrench bigger-120"></i>重置密码</button> </a>
                                             <a href="goEditCustomForm/${uac.customVO.ID}"> <button class="btn btn-xs btn-warning" ><i class="ace-icon fa fa-pencil bigger-120"></i>编辑</button> </a>
                                              <a><button class="btn btn-xs btn-danger" onclick="sendDeleteAction(${uac.user.ID});"><i class="glyphicon glyphicon-trash bigger-120"></i>删除</button></a>
                                             </td> 
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
													添加用户信息
												</div>
											</div>
									<form class="form-horizontal " id="validation-form" action="${baseUrl}/saveUserAndCustom" method="post" enctype="multipart/form-data">
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right"
														for="name">用户名:</label>
													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<input type="text" id="userName" name="userName"
																class="col-xs-12 col-sm-4" />
														</div>
													</div>
												</div>
								
												<div class="space-2"></div>
								
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right"
														for="password">密码:</label>
								
													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<input type="password" name="password" id="password"
																class="col-xs-12 col-sm-4" />
														</div>
													</div>
												</div>
												
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right"
														for="password2">再次输入密码:</label>
													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<input type="password" name="password2" id="password2"
																class="col-xs-12 col-sm-4" />
														</div>
													</div>
												</div>
														<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right"
														for="state">角色：</label>
								
													<div class="col-xs-12 col-sm-9">
														<select id="state" name="role" class="select2"
															data-placeholder="Click to Choose...">
															<option value="">&nbsp;</option>
															<option value="2">管理员</option>
															<option value="3">客户</option>
													
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right"
														for="name">姓名:</label>
								
													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<input type="text" id="name" name="customName"
																class="col-xs-12 col-sm-4" />
														</div>
													</div>
												</div>
										
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right"
														for="phone">联系电话:</label>
													<div class="col-xs-12 col-sm-9">
														<div class="input-group">
															<span class="input-group-addon"> <i
																class="ace-icon fa fa-phone"></i>
															</span> <input type="tel" id="phone" name="customPhone" />
														</div>
													</div>
												</div>
													<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right"
														for="name">联系地址:</label>
								
													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<input type="text" id="name" name="customAddress"
																class="col-xs-12 col-sm-6" />
														</div>
													</div>
												</div>
															<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right"
														for="name">头像:</label>
								
													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<input type="file" id="name" name="imgFile"
																class="col-xs-12 col-sm-6" />
														</div>
													</div>
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
<script> 
document.getElementById('navleft4').className = 'active'; 
</script>
<%@ include file="../main/footer.jsp" %>
</div><!-- /.main-container -->

<script type="text/javascript">
function sendDeleteAction(data) {	

	$.ajax({
	    type: "post",
	    async: true,          
	    url: "${baseUrl}/deleteSubject/"+data,
	   dataType: "json", 
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
