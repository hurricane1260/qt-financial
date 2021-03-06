<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
caption {
	text-align: left;
	margin-top: 15px;
	margin-bottom: 10px;
	font-size: 16px;
	font-weight: 900;
}
</style>
<!-- 手机认证模态框（Modal） -->
<div aria-hidden="false" aria-labelledby="authIdLabel" role="dialog"
	tabindex="-1" id="authId" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">关闭</button>
				<h4 class="modal-title">身份证认证</h4>
			</div>
			<div class="modal-body">
				<table class="table table-bordered">
					<caption>自动认证</caption>
					<tbody>
						<tr>
							<td>身份证</td>
							<td>图</td>
						</tr>
						<tr>
							<td>人脸</td>
							<td>图</td>
						</tr>
							<tr>
							<td>提交时间</td>
							<td>207-06-26 14:11</td>
						</tr>
						<tr>
							<td>通过时间</td>
							<td>207-06-26 14:11</td>
						</tr>
					</tbody>
				</table>
					<table class="table table-bordered">
					<caption>人工审核</caption>
					<tbody>
						<tr>
							<td>身份证</td>
							<td>图</td>
						</tr>
						<tr>
							<td>人脸</td>
							<td>图</td>
						</tr>
							<tr>
							<td>提交时间</td>
							<td>207-06-26 14:11</td>
						</tr>
						<tr>
							<td>通过时间</td>
							<td>207-06-26 14:11</td>
						</tr>
						<tr>
							<td>操作人</td>
							<td>王丽</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 模态框（Modal） -->