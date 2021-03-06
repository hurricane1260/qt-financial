<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li><a href="index">借款审核</a></li>
	<li class="active">借款记录</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">借款记录 </header>
			<div class="panel-body">
				<table class="display table table-bordered table-striped"
					id="dynamic-table">
					<thead>
						<tr>
							<th>操作时间</th>
							<th>操作内容</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2017年06月26日16:41</td>
							<td>客户申请借款</td>
						</tr>
						<tr>
							<td>2017年06月26日16:41</td>
							<td>客服同意申请</td>
						</tr>
						<tr>
							<td>2017年06月26日16:41</td>
							<td>打款员打款</td>
						</tr>
						<tr>
							<td>2017年06月26日16:41</td>
							<td>客户延期</td>
						</tr>
						<tr>
							<td>2017年06月26日16:41</td>
							<td>客户还款</td>
						</tr>
						<tr>
							<td>2017年06月26日16:41</td>
							<td>订单结束</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>操作时间</th>
							<th>操作内容</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</section>
	</div>
</div>
<!--dynamic table-->
<script type="text/javascript"
	src="${ctx}/common/js/advanced-datatable/js/jquery.dataTables.js"></script>
<script type="text/javascript"
	src="${ctx}/common/js/data-tables/DT_bootstrap.js"></script>

<!--dynamic table initialization -->
<script src="${ctx}/common/js/dynamic_table_init.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		scrollTo(0,0);
		
	});
</script>