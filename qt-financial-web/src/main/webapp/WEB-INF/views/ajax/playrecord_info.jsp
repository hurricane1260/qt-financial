<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li class="active">审核记录</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">审核记录 </header>
			<div class="panel-body">
				<div class="clearfix">
					<div class="col-sm-2" style="padding-left: 0;">
						<select id="examine_choice_first" name="examine_choice_first">
							<option value="">选择初审审核结果</option>
							<option value="">同意</option>
							<option value="">拒绝</option>
						</select>
					</div>
					<div class="col-sm-2">
						<select id="examine_choice_second" name="examine_choice_second">
							<option value="">选择复审审核结果</option>
							<option value="">同意</option>
							<option value="">拒绝</option>
						</select>
					</div>
					<div class="col-sm-2">
						<select id="examine_choice_third" name="examine_choice_third">
							<option value="">选择终审审核结果</option>
							<option value="">同意</option>
							<option value="">拒绝</option>
						</select>
					</div>
					<div class="col-sm-2">
						<select id="examine_choice_play" name="examine_choice_play">
							<option value="">选择打款情况</option>
							<option value="">已打款</option>
							<option value="">未打款</option>
						</select>
					</div>
					<div class="col-sm-2">
						<select id="examine_choice_grade" name="examine_choice_grade">
							<option value="">选择客户等级</option>
							<option value="">白银</option>
							<option value="">黄金</option>
							<option value="">钻石</option>
						</select>
					</div>
				</div>
				<table class="display table table-bordered table-striped"
					id="dynamic-table">
					<thead>
						<tr>
							<th>时间</th>
							<th>订单编号</th>
							<th>客户名称</th>
							<th>客户手机</th>
							<th>客户等级</th>
							<th>客户状态</th>
							<th>初审结果</th>
							<th>复审结果</th>
							<th>终审结果</th>
							<th>打款情况</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2017-07-30</td>
							<td>124154635478</td>
							<td>张某某</td>
							<td>13812345678</td>
							<td>白银</td>
							<td>高级</td>
							<td>同意</td>
							<td>同意</td>
							<td>同意</td>
							<td>未打款</td>
							<td>
								<a href="javascript:void(0)" onclick="LoadAjaxContent('${pageContext.request.contextPath}/view/playmoney_detail', 'wrapper');">查看订单</a>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>时间</th>
							<th>订单编号</th>
							<th>客户名称</th>
							<th>客户手机</th>
							<th>客户等级</th>
							<th>客户状态</th>
							<th>初审结果</th>
							<th>复审结果</th>
							<th>终审结果</th>
							<th>打款情况</th>
							<th>操作</th>
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
		Select2Test();
	});
	function Select2Test() {
		$("#examine_choice_first").select2();
		$("#examine_choice_second").select2();
		$("#examine_choice_third").select2();
		$("#examine_choice_grade").select2();
		$("#examine_choice_play").select2();
	}
	
</script>
