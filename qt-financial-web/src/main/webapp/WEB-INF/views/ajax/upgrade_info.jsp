<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb panel">
	<li><a href="index"><i class="fa fa-home"></i>清投金服</a></li>
	<li class="active">升级策略管理</li>
</ul>
<div class="row">
	<div class="col-md-12">
		<!--notification start-->
		<section class="panel">
			<header class="panel-heading">升级策略管理 </header>
			<div class="panel-body">
				<table class="display table table-bordered table-striped"
					id="dynamic-table">
					<thead>
						<tr>
							<th>等级</th>
							<th>升级需要次数</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="content">
					</tbody>
					<tfoot>
						<tr>
							<th>等级</th>
							<th>升级需要次数</th>
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
		var url ="${pageContext.request.contextPath}/data/getUserLevel";
		LoadAjaxData(url,loadData);
		function loadData(data){
			try{
				var htmlStr = '';
				for(var i = 0 ;i < data.objList.length;i++){
					htmlStr+='<tr>'
						+'<td>'+data.objList[i].name+'</td>'
						+'<td>'+data.objList[i].num+'</td>'
						+'<td>'
						+'	<a href="javascript:void(0)" onclick="LoadAjaxContent(\'${pageContext.request.contextPath}/view/upgrade_edit?id='+data.objList[i].id+'\', \'wrapper\');">编辑</a>'
						+'</td>'
						+'</tr>';
				}
				$("#content").html(htmlStr);
			} catch(arr){
				console.log(arr);
			}
		}
	});
	
</script>
