<%@ page language="java" import="java.util.*" pageEncoding="utf-8" 
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
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
					最后<small> <i
						class="ace-icon fa fa-angle-double-right"></i> 
						祭奠那些年搔掉的秀发和逝去的青春!
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="col-sm-12">
				<div class="widget-box">
					<div class="widget-header widget-header-flat">
						<h4 class="widget-title">Lists</h4>
						</div>
							<div class="widget-body">
								<div class="widget-main">
									<div class="row">
											<div class="col-sm-12">
													<ul>
														<li>Unordered List Item</li>

															<li>
																<small>List Item in small tag</small>
																</li>

																<li>
																	<b>List Item in bold tag</b>
																</li>

																<li>
																	<i>List Item in italics tag</i>
																</li>

																<li>
																	<ul class="list-unstyled">
																		<li>
																			<i class="ace-icon fa fa-caret-right blue"></i>
																			Nested List Item
																		</li>

																		<li>
																			<i class="ace-icon fa fa-caret-right blue"></i>
																			Nested List Item
																		</li>

																		<li>
																			<i class="ace-icon fa fa-caret-right blue"></i>
																			Nested List Item
																		</li>
																	</ul>
																</li>
																<li>Unordered List Item which is a longer item and may break into more lines.</li>

																<li>
																	<strong>List Item in strong tag</strong>
																</li>

																<li>
																	<em>List Item in emphasis tag</em>
																</li>
															</ul>
														</div>

														<div class="col-sm-6">
															<ol>
																<li>Ordered List Item</li>
																<li class="text-primary">.text-primary Ordered List Item</li>
																<li class="text-danger">.text-danger Ordered List Item</li>

																<li class="text-success">
																	<b>.text-success</b>
																	Ordered List Item
																</li>
																<li class="text-warning">.text-warning Ordered List Item</li>
																<li class="text-muted">.text-muted Ordered List Item</li>
															</ol>
														</div>
													</div>

													<hr />
													<div class="row">
														<div class="col-xs-12">
															<ul class="list-unstyled spaced">
																<li>
																	<i class="ace-icon fa fa-bell-o bigger-110 purple"></i>
																	List with custom icons and more space
																</li>

																<li>
																	<i class="ace-icon fa fa-check bigger-110 green"></i>
																	Unordered List Item # 2
																</li>

																<li>
																	<i class="ace-icon fa fa-times bigger-110 red"></i>
																	Unordered List Item # 3
																</li>
															</ul>

															<ul class="list-unstyled spaced2">
																<li>
																	<i class="ace-icon fa fa-circle green"></i>
																	Even more space
																</li>

																<li class="text-warning bigger-110 orange">
																	<i class="ace-icon fa fa-exclamation-triangle"></i>
																	Unordered List Item # 5
																</li>

																<li class="muted">
																	<i class="ace-icon fa fa-angle-right bigger-110"></i>
																	Unordered List Item # 6
																</li>

																<li>
																	<ul class="list-inline">
																		<li>
																			<i class="ace-icon fa fa-share green bigger-110"></i>
																			Inline List Item # 1
																		</li>
																		<li>List Item # 2</li>
																		<li>List Item # 3</li>
																	</ul>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div><!-- /.col -->
			<!-- /.row -->
		</div>
		<!-- /.page-content -->
	</div>
</div>
<!-- /.main-content -->
<script>
	document.getElementById('navleft7').className = 'active';
</script>
<%@ include file="../main/footer.jsp"%>
</div>
<!-- /.main-container -->

<script src="${baseUrl}/assets/js/jquery-2.1.4.min.js"></script>

<script type="text/javascript">
	if ('ontouchstart' in document.documentElement)
		document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
				+ "<"+"/script>");
</script>
<script src="${baseUrl}/assets/js/bootstrap.min.js"></script>
<script src="${baseUrl}/assets/js/jquery-ui.custom.min.js"></script>
<script src="${baseUrl}/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${baseUrl}/assets/js/jquery.gritter.min.js"></script>
<script src="${baseUrl}/assets/js/bootbox.js"></script>
<script src="${baseUrl}/assets/js/jquery.easypiechart.min.js"></script>
<script src="${baseUrl}/assets/js/bootstrap-datepicker.min.js"></script>
<script src="${baseUrl}/assets/js/jquery.hotkeys.index.min.js"></script>
<script src="${baseUrl}/assets/js/bootstrap-wysiwyg.min.js"></script>
<script src="${baseUrl}/assets/js/select2.min.js"></script>
<script src="${baseUrl}/assets/js/spinbox.min.js"></script>
<script src="${baseUrl}/assets/js/bootstrap-editable.min.js"></script>
<script src="${baseUrl}/assets/js/ace-editable.min.js"></script>
<script src="${baseUrl}/assets/js/jquery.maskedinput.min.js"></script>
<script src="${baseUrl}/assets/js/ace-elements.min.js"></script>
<script src="${baseUrl}/assets/js/ace.min.js"></script>
</body>
</html>
