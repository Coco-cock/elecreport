<%@ page language="java" import="java.util.*" pageEncoding="utf-8" 
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"
%><%@ include file="../main/menu.jsp"%>

<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
				</li>
				<li class="active">用户信息</li>
			</ul>
		</div>
		<div class="page-content">
			<div class="page-header">
				<h1>
					用户信息详情 <small> <i
						class="ace-icon fa fa-angle-double-right"></i> 
						welcome!
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->

					<div>
						<div id="user-profile-1" class="user-profile row">
							<div class="col-xs-12 col-sm-3 center">
								<div>
									<span class="profile-picture"> 
									<img id="avatar" class="editable img-responsive" alt="照片"
									style="width: 200px;height: 200px"
										src="<c:out value="${sessionScope.sessionVO.userAndCustomVO.user.imgPath}"/>" />
									</span>

									<div class="space-4"></div>

									<div
										class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
										<div class="inline position-relative">
											<a href="#" class="user-title-label dropdown-toggle"
												data-toggle="dropdown"> <i
												class="ace-icon fa fa-circle light-green"></i> &nbsp; <span
												class="white"><c:out value="${sessionScope.sessionVO.userAndCustomVO.customVO.customName}"></c:out></span>
											</a>

										</div>
									</div>
								</div>

								<div class="space-6"></div>


							</div>

							<div class="col-xs-12 col-sm-9">
								<div class="space-12"></div>

								<div class="profile-user-info profile-user-info-striped">
									<div class="profile-info-row">
										<div class="profile-info-name">登陆名</div>
										<div class="profile-info-value">
											<span class="editable" id="username"><c:out value="${sessionScope.sessionVO.userAndCustomVO.user.userName}"></c:out></span>
										</div>
									</div>
									<div class="profile-info-row">
										<div class="profile-info-name">角色</div>

										<div class="profile-info-value">
											<span class="editable" id="role"><c:out value="${sessionScope.sessionVO.userAndCustomVO.user.role.role}"/></span>
										</div>
									</div>
									<div class="profile-info-row">
										<div class="profile-info-name">地址</div>

										<div class="profile-info-value">
											<i class="fa fa-map-marker light-orange bigger-110"></i> <span
												class="editable" >${sessionScope.sessionVO.userAndCustomVO.customVO.customAddress}</span> 
										</div>
									</div>

									<div class="profile-info-row">
										<div class="profile-info-name">注册时间</div>

										<div class="profile-info-value">
											<span class="editable"><fmt:formatDate value="${sessionScope.sessionVO.userAndCustomVO.customVO.registerTime}" pattern="yyyy-MM-dd HH:mm"/></span>
										</div>
									</div>

									<div class="profile-info-row">
										<div class="profile-info-name">最后编辑时间</div>

										<div class="profile-info-value">
											<span class="editable" id="signup"><fmt:formatDate value="${sessionScope.sessionVO.userAndCustomVO.customVO.editTime}" pattern="yyyy-MM-dd HH:mm"/></span>
										</div>
									</div>

									<div class="profile-info-row">
										<div class="profile-info-name">Last Online</div>

										<div class="profile-info-value">
											<span class="editable" id="login">3 hours ago</span>
										</div>
									</div>

									<div class="profile-info-row">
										<div class="profile-info-name">About Me</div>

										<div class="profile-info-value">
											<span class="editable" id="about">Editable as WYSIWYG</span>
										</div>
									</div>
								</div>

								<div class="space-20"></div>




								<div class="space-6"></div>

							</div>
						</div>
					</div>



					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.page-content -->
	</div>
</div>
<!-- /.main-content -->
<script>
	document.getElementById('navleft6').className = 'active';
</script>
<%@ include file="../main/footer.jsp"%>
</div><!-- /.main-container -->
</body>
</html>
