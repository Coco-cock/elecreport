<%@ page language="java" import="java.util.*" pageEncoding="utf-8" 
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ include file="../main/menu.jsp"%>
			<!-- 主要内容 -->
			<div id="main-content" class="main-content">
				<div  class="main-content-inner">
				
					<div class="page-content">
                       <div class="row">
							<div class="col-xs-12">
								<div class="row">
									<div class="col-xs-12">
										<div class="clearfix">
											<div class="pull-right tableTools-container"></div>
										</div>
										<div class="table-header ">
											权限管理 
										</div>

										<!-- div.table-responsive -->

										<!-- div.dataTables_borderWrap -->
										<div>
											<table id="dynamic-table" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
                                         			   <th>ID</th>
                                           			   <th>权限名</th>
                                           			   <th>描述</th>
                                                       <th>所属角色</th>
                                                       <th>操作</th>
													</tr>											
												</thead>
												<tbody>
												   <c:forEach var="permission" items="${permissionList}">
			                                        <tr>
			                                            <td><c:out value="${permission.id}"></c:out></td>
			                                            <td><c:out value="${permission.permissionName}"></c:out></td>
			                                            <td><c:out value="${permission.description}"></c:out></td>
			                                            <td><c:out value="${permission.role.description}"></c:out></td>
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
													添加权限
												</div>
											</div>

											<form action="${baseUrl}/saveSubject" method="post">
											<div class="modal-body no-padding">
												<table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
												<tbody>	
														<tr>
															<td>权限名：</td>															
															<td><input name="subjectId" type="text"> </td>
														</tr>
														<tr>
															<td>描述：</td>															
															<td><input name="subjectName" type="text"> </td>
														</tr>
														<tr>
															<td>所属角色</td>															
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
document.getElementById('navleft5-1').className = 'active'; 
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

		<!--[if !IE]> -->
		<script src="${baseUrl}/assets/js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="${baseUrl}/assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="${baseUrl}/assets/js/jquery.dataTables.min.js"></script>
		<script src="${baseUrl}/assets/js/jquery.dataTables.bootstrap.min.js"></script>
		<script src="${baseUrl}/assets/js/dataTables.buttons.min.js"></script>
		<script src="${baseUrl}/assets/js/buttons.flash.min.js"></script>
		<script src="${baseUrl}/assets/js/buttons.html5.min.js"></script>
		<script src="${baseUrl}/assets/js/buttons.print.min.js"></script>
		<script src="${baseUrl}/assets/js/buttons.colVis.min.js"></script>
		<script src="${baseUrl}/assets/js/dataTables.select.min.js"></script>

		<!-- ace scripts -->
		<script src="${baseUrl}/assets/js/ace-elements.min.js"></script>
		<script src="${baseUrl}/assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
				//initiate dataTables plugin
				var myTable = 
				$('#dynamic-table')
				//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
				.DataTable( {
					bAutoWidth: false,
					"aoColumns": [
					  { "bSortable": false },
					  null, null,null, null, null,
					  { "bSortable": false }
					],
					"aaSorting": [],	
					select: {
						style: 'multi'
					}
			    } );
			
				
				
				$.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';
				
				new $.fn.dataTable.Buttons( myTable, {
					buttons: [
					  {
						"extend": "colvis",
						"text": "<i class='fa fa-search bigger-110 blue'></i> <span class='hidden'>Show/hide columns</span>",
						"className": "btn btn-white btn-primary btn-bold",
						columns: ':not(:first):not(:last)'
					  },
					  {
						"extend": "copy",
						"text": "<i class='fa fa-copy bigger-110 pink'></i> <span class='hidden'>Copy to clipboard</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "csv",
						"text": "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'>Export to CSV</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "excel",
						"text": "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'>Export to Excel</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "pdf",
						"text": "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'>Export to PDF</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "print",
						"text": "<i class='fa fa-print bigger-110 grey'></i> <span class='hidden'>Print</span>",
						"className": "btn btn-white btn-primary btn-bold",
						autoPrint: false,
						message: 'This print was produced using the Print button for DataTables'
					  }		  
					]
				} );
				myTable.buttons().container().appendTo( $('.tableTools-container') );
				
				//style the message box
				var defaultCopyAction = myTable.button(1).action();
				myTable.button(1).action(function (e, dt, button, config) {
					defaultCopyAction(e, dt, button, config);
					$('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
				});
				
				
				var defaultColvisAction = myTable.button(0).action();
				myTable.button(0).action(function (e, dt, button, config) {
					
					defaultColvisAction(e, dt, button, config);
					
					
					if($('.dt-button-collection > .dropdown-menu').length == 0) {
						$('.dt-button-collection')
						.wrapInner('<ul class="dropdown-menu dropdown-light dropdown-caret dropdown-caret" />')
						.find('a').attr('href', '#').wrap("<li />")
					}
					$('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
				});
			
				////
			
				setTimeout(function() {
					$($('.tableTools-container')).find('a.dt-button').each(function() {
						var div = $(this).find(' > div').first();
						if(div.length == 1) div.tooltip({container: 'body', title: div.parent().text()});
						else $(this).tooltip({container: 'body', title: $(this).text()});
					});
				}, 500);
				
				
				
				
				
				myTable.on( 'select', function ( e, dt, type, index ) {
					if ( type === 'row' ) {
						$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', true);
					}
				} );
				myTable.on( 'deselect', function ( e, dt, type, index ) {
					if ( type === 'row' ) {
						$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', false);
					}
				} );
			
			
			
			
				/////////////////////////////////
				//table checkboxes
				$('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);
				
				//select/deselect all rows according to table header checkbox
				$('#dynamic-table > thead > tr > th input[type=checkbox], #dynamic-table_wrapper input[type=checkbox]').eq(0).on('click', function(){
					var th_checked = this.checked;//checkbox inside "TH" table header
					
					$('#dynamic-table').find('tbody > tr').each(function(){
						var row = this;
						if(th_checked) myTable.row(row).select();
						else  myTable.row(row).deselect();
					});
				});
				
				//select/deselect a row when the checkbox is checked/unchecked
				$('#dynamic-table').on('click', 'td input[type=checkbox]' , function(){
					var row = $(this).closest('tr').get(0);
					if(this.checked) myTable.row(row).deselect();
					else myTable.row(row).select();
				});
			
			
			
				$(document).on('click', '#dynamic-table .dropdown-toggle', function(e) {
					e.stopImmediatePropagation();
					e.stopPropagation();
					e.preventDefault();
				});
				
				
				
				//And for the first simple table, which doesn't have TableTools or dataTables
				//select/deselect all rows according to table header checkbox
				var active_class = 'active';
				$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
					var th_checked = this.checked;//checkbox inside "TH" table header
					
					$(this).closest('table').find('tbody > tr').each(function(){
						var row = this;
						if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
						else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
					});
				});
				
				//select/deselect a row when the checkbox is checked/unchecked
				$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
					var $row = $(this).closest('tr');
					if($row.is('.detail-row ')) return;
					if(this.checked) $row.addClass(active_class);
					else $row.removeClass(active_class);
				});
			
				
			
				/********************************/
				//add tooltip for small view action buttons in dropdown menu
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				
				//tooltip placement on right or left
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					//var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
				
				
				
				
				/***************/
				$('.show-details-btn').on('click', function(e) {
					e.preventDefault();
					$(this).closest('tr').next().toggleClass('open');
					$(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
				});
			})
		</script>
	</body>
</html>
