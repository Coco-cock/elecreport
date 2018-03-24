<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ include file="../main/menu.jsp"%>
<!-- 主要内容 -->
<div id="main-content" class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a
					href="index">Home</a></li>
				<li class="active">信息编辑</li>
			</ul>
		</div>
		<div class="page-content">
			<form class="form-horizontal " id="validation-form" action="${baseUrl}/editUserAndCustom" method="post">
			<input type="hidden" id="ID" name="ID" value="${userAndCustomVO.user.ID}"/>
				<div class="form-group">
					<label class="control-label col-xs-12 col-sm-3 no-padding-right"
						for="name">用户名:</label>
					<div class="col-xs-12 col-sm-9">
						<div class="clearfix">
							<input type="text" id="userName" name="userName" value="${userAndCustomVO.user.userName}"
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
							<input type="password" name="password" id="password" value="${userAndCustomVO.user.password}
								class="col-xs-12 col-sm-4" />
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-xs-12 col-sm-3 no-padding-right"
						for="password2">再次输入密码:</label>
					<div class="col-xs-12 col-sm-9">
						<div class="clearfix">
							<input type="password" name="password2" id="password2" value="${userAndCustomVO.user.password}
								class="col-xs-12 col-sm-4" />
						</div>
					</div>
				</div>
						<div class="form-group">
					<label class="control-label col-xs-12 col-sm-3 no-padding-right"
						for="state">角色：</label>

					<div class="col-xs-12 col-sm-9">
						<select id="state" name="state" class="select2"
							data-placeholder="Click to Choose...">
							<option value="${userAndCustomVO.user.role.id}">&nbsp;</option>
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
							<input type="text" id="customName" name="customName" value="${userAndCustomVO.customVO.customName}"
								class="col-xs-12 col-sm-4" />
						</div>
					</div>
				</div>
			<div class="form-group">
					<label class="control-label col-xs-12 col-sm-3 no-padding-right"
						for="name">联系电话:</label>

					<div class="col-xs-12 col-sm-9">
						<div class="clearfix">
							<input type="text" id="name" name="customPhone" value="${userAndCustomVO.customVO.customPhone}"
								class="col-xs-12 col-sm-4" />
						</div>
					</div>
				</div> 
				 <%-- <div class="form-group">
					<label class="control-label col-xs-12 col-sm-3 no-padding-right"
						for="phone">联系电话:</label>
					<div class="col-xs-12 col-sm-9">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="ace-icon fa fa-phone"></i>
							</span> 
							<input type="tel" id="phone" name="customPhone"  value="${userAndCustomVO.customVO.customPhone}"/>
						</div>
					</div>
				</div>  --%>
					<div class="form-group">
					<label class="control-label col-xs-12 col-sm-3 no-padding-right"
						for="name">联系地址:</label>

					<div class="col-xs-12 col-sm-9">
						<div class="clearfix">
							<input type="text" id="name" name="customAddress" value="${userAndCustomVO.customVO.customAddress}"
								class="col-xs-12 col-sm-4" />
						</div>
					</div>
				</div>
		
				<div class="hr hr-18 hr-double dotted"></div>
					<div class="form-group">
						<label class="control-label col-xs-12 col-sm-3 no-padding-right"
						></label>
					<div class="col-xs-2 col-sm-2">
					
				<button type="reset" class="btn btn-danger btn-block">取消</button>
			
					</div>

				<div class="col-xs-2 col-sm-2">
				<input type="submit" class="btn btn-info btn-block" value="提交">
				<button  type="submit" class="btn btn-info btn-block">提交</button>
					</div>
				
				</div>
			</form>

		</div>
		<!-- /.page-content -->
	</div>
</div>
<!-- /.main-content -->
<script>
	document.getElementById('navleft5').className = 'active open';
	document.getElementById('navleft5-1').className = 'active';
</script>
<%@ include file="../main/footer.jsp"%>
</div>
<!-- /.main-container -->

<

<!-- inline scripts related to this page -->
<script type="text/javascript">
	jQuery(function($) {

		$('[data-rel=tooltip]').tooltip();

		$('.select2').css('width', '200px').select2({
			allowClear : true
		}).on('change', function() {
			$(this).closest('form').validate().element($(this));
		});

		var $validation = false;
		$('#fuelux-wizard-container')
				.ace_wizard({
				
				})
				.on('actionclicked.fu.wizard', function(e, info) {
					if (info.step == 1 && $validation) {
						if (!$('#validation-form').valid())
							e.preventDefault();
					}
				})
				
				.on(
						'finished.fu.wizard',
						function(e) {
							bootbox
									.dialog({
										message : "Thank you! Your information was successfully saved!",
										buttons : {
											"success" : {
												"label" : "OK",
												"className" : "btn-sm btn-primary"
											}
										}
									});
						}).on('stepclick.fu.wizard', function(e) {
					//e.preventDefault();//this will prevent clicking and selecting steps
				});

	
		/* 手机号验证 */
		$.mask.definitions['~'] = '[+-]';
		$('#phone').mask('999-9999-9999');

		jQuery.validator.addMethod("phone", function(value, element) {
			return this.optional(element)
					|| /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
		}, "Enter a valid phone number.");

		$('#validation-form')
				.validate(
						{
							errorElement : 'div',
							errorClass : 'help-block',
							focusInvalid : false,
							ignore : "",
							rules : {
								email : {
									required : true,
									email : true
								},
								password : {
									required : true,
									minlength : 5
								},
								password2 : {
									required : true,
									minlength : 5,
									equalTo : "#password"
								},
								name : {
									required : true
								},
								phone : {
									required : true,
									phone : 'required'
								},
							
							},

							messages : {
								password : {
									required : "Please specify a password.",
									minlength : "Please specify a secure password."
								},
							
							},

							highlight : function(e) {
								$(e).closest('.form-group').removeClass(
										'has-info').addClass('has-error');
							},

							success : function(e) {
								$(e).closest('.form-group').removeClass(
										'has-error');//.addClass('has-info');
								$(e).remove();
							},

						});

	})
</script>
</body>
</html>
