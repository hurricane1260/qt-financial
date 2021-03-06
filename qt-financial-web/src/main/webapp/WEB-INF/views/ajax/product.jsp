﻿<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link href="${ctx}/common/js/advanced-datatable/css/demo_page.css"
	rel="stylesheet" />
<link href="${ctx}/common/js/advanced-datatable/css/demo_table.css"
	rel="stylesheet" />
<link href="${ctx}/common/js/data-tables/DT_bootstrap.css"
	rel="stylesheet" />
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">产品列表 </header>
			<div class="panel-body">
				<div class="adv-table">
				<div class="btn-group pull-right">
							<button id="" class="btn btn-success"
								onclick="javacript:LoadAjaxContent('${pageContext.request.contextPath}/view/product_add','wrapper')">
								新增产品 <i class="fa fa-plus"></i>
							</button>
						</div>
					<div class="clearfix"></div>
					<table class="display table table-bordered table-striped"
						id="dynamic-table">
						<thead>
							<tr>
								<th>前段排序号</th>
								<th>产品名称</th>
								<th>借款时长</th>
								<th>借款金额</th>
								<th>信用审核费</th>
								<th>资产保管费</th>
								<th>可借等级</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>前段排序号</th>
								<th>产品名称</th>
								<th>借款时长</th>
								<th>借款金额</th>
								<th>信用审核费</th>
								<th>资产保管费</th>
								<th>可借等级</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</section>
		<!--notification end-->
	</div>
</div>
<!--dynamic table initialization -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var sAjaxSource="${pageContext.request.contextPath}/data/product/all";
						$('#dynamic-table')
								.dataTable(
										{
											"bProcessing" : true,
											"bServerSide" : true,
											"aaSorting" : [ [ 4, "desc" ] ],
											"sAjaxSource" : sAjaxSource,
											"fnServerData" : retrieveData, // 获取数据的处理函数, 
											"oLanguage" : {
												"sPlaceholder" : ""
											},
											//列表表头字段
											"aoColumns" : [
													{
														"mData" : "id"
													},{
														"mData" : "productname"
													},{
														"mData" : "id",
														"mRender" : function(
																data, type,
																full) {
															var str = "hehe";
															return str;
														}
													},{
														"mData" : "amount"
													},{
														"mData" : "auditCost"
													},{
														"mData" : "manageCost"
													},{
														"mData" : "userlevel"
													},{
														"mData" : "isactivated"
													},{
														"mData" : "id",
														"mRender" : function(
																data, type,
																full) {
															var str = "编辑";
															return str;
														}
													}
													]
										});
					});
	
	// 3个参数的名字可以随便命名,但必须是3个参数,少一个都不行
	function retrieveData(sSource, aoData, fnCallback) {
		$.ajax({
			url : sSource,//这个就是请求地址对应sAjaxSource
			data : {
				"aoData" : JSON.stringify(aoData)
			},//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
			type : 'post',
			dataType : 'json',
			async : false,
			success : function(result) {
				fnCallback(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
			},
			error : function(msg) {
				console.error("retrieveData:" + msg);
			}
		});
	}

</script>