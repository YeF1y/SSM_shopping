<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>商品列表</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.css" />
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" /> -->
<style type="text/css">
/*预览图片大小*/
#myImg img {
	width: 250px;
	height: 250px;
}
</style>
</head>
<body>
	<div class="container-fluid">
 

		<div class="text-right"></div>

		<br>

		<form class="form-inline" action="goodSearch" id="serchform"
			method="post">
			<div class="form-group">
				<input type="text" class="form-control" id="name" name="name"
					placeholder="商品名称">
			</div>
			<a href="javascript:;"
				onclick="document.getElementById('serchform').submit();"
				type="submit" class="btn btn-primary">点击搜索</a> <a
				class="btn btn-warning" href="goodAdd">添加商品</a>
		</form>

		<br>


		<%-- <ul role="tablist" class="nav nav-tabs">
			<li <c:if test='${status==0}'>class="active"</c:if>
				role="presentation"><a href="goodList">全部商品</a></li>
			<li <c:if test='${status==1}'>class="active"</c:if>
				role="presentation"><a href="goodList?status=1">首页轮播</a></li>
			<li <c:if test='${status==2}'>class="active"</c:if>
				role="presentation"><a href="goodList?status=2">热销产品</a></li>
			<li <c:if test='${status==3}'>class="active"</c:if> role="presentation"><a href="goodList?status=3">最新推出</a></li>
		</ul> --%>

		<c:if test="${status == 1}">
			<br>
			<p>首页默认只显示前[5]条记录</p>
		</c:if>
		<c:if test="${status == 2}">
			<br>
			<p>首页默认只显示前[6]条记录</p>
		</c:if>
		<c:if test="${status == 3}">
			<br>
			<p>首页默认只显示前[8]条记录</p>
		</c:if>

		<br>

		<table class="table table-bordered table-hover">

			<tr>
				<th width="5%">ID</th>
				<th width="10%">名称</th>
				<th width="10%">图片</th>
				<th width="20%">介绍</th>
				<th width="10%">价格</th>
				<th width="10%">库存</th>
				<th width="10%">类目</th>
				<!-- <th width="10%">图片</th> -->
				<th width="25%">操作</th>
			</tr>

			<c:forEach var="good" items="${goodList}">
				<tr>
					<td><p>${good.id}</p></td>
					<td><p>
							<a href="../index/detail?goodid=${good.id}" target="_blank">${good.name}</a>
						</p>
					</td>
					<td><p>
							<a href="../index/detail?goodid=${good.id}" target="_blank">
								<img src="../${good.cover}" width="100px" height="100px">
							</a>
						</p>
					</td>
					<td><p style="color: #ec2e2ad9">${good.intro}</p></td>
					<td><p style="font-weight: bold">￥ ${good.price}</p></td>
					<td><p>${good.stock}</p></td>
					<td><p>${good.type.name}</p></td>
					
					<%-- <td><a href="#myModal" data-toggle="modal"
						onclick="showImage('${good.cover}')">查看图片</a>
					</td> --%>
					<td>
						<p>
						<c:if test="${type eq '管理员'}">
							<c:if test="${good.topScroll}">
								<a class="btn btn-info topDelete" href="javascript:;" type="1"
									goodid="${good.id}" text="轮播">下播</a>
							</c:if>
							<c:if test="${!good.topScroll}">
								<a class="btn btn-primary topSave" href="javascript:;" type="1"
									goodid="${good.id}" text="下播">轮播</a>
							</c:if>
							<c:if test="${good.topLarge}">
								<a class="btn btn-info topDelete" href="javascript:;" type="2"
									goodid="${good.id}" text="热销">下架</a>
							</c:if>
							<c:if test="${!good.topLarge}">
								<a class="btn btn-primary topSave" href="javascript:;" type="2"
									goodid="${good.id}" text="下架">热销</a>
							</c:if>
						</c:if>
							<%-- <c:if test="${good.topSmall}"><a class="btn btn-info topDelete" href="javascript:;" type="3" goodid="${good.id}" text="加入新品">移出新品</a></c:if>
							<c:if test="${!good.topSmall}"><a class="btn btn-primary topSave" href="javascript:;" type="3" goodid="${good.id}" text="移出新品">加入新品</a></c:if> --%>
							<a class="btn btn-success" href="goodEdit?id=${good.id}" title="修改">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							</a> 
							<a class="btn btn-danger" href="goodDelete?id=${good.id}" title="删除">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							</a>
						</p> 
					</td>
				</tr>
			</c:forEach>

		</table>
		<!-- Button trigger modal -->

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" id="test">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
					</div>
					<div class="modal-body">
						<img src="../picture/19121648096273100.jpg" alt="" id="showImg"
							style="width: 100%;">
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<br>${pageTool}<br>
	</div>


	<script type="text/javascript" src="js/jquery.js"></script>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> -->
	<script type="text/javascript">
		function showImage(url) {
			$("#showImg").attr("src", "../" + url);
		}

		$(function() {
			$(document).on(
					"click",
					".topSave",
					function() {
						var type = $(this).attr("type");
						var goodid = $(this).attr("goodid");
						var text = $(this).attr("text");
						var old = $(this).text();
						var obj = this;
						$.post("topSave.action", {
							"goodId" : goodid,
							"type" : type
						}, function(data) {
							if (data == "ok") {
								$(obj).text(text).attr("class",
										"btn btn-info topDelete").attr("text",
										old);
								toastr.info('操作成功！')
							} else {
								toastr.error('操作失败！')
							}
						}, "text");
					});
			$(document).on(
					"click",
					".topDelete",
					function() {
						var type = $(this).attr("type");
						var goodid = $(this).attr("goodid");
						var text = $(this).attr("text");
						var old = $(this).text();
						var obj = this;
						$.post("topDelete.action", {
							"goodId" : goodid,
							"type" : type
						}, function(data) {
							if (data == "ok") {
								$(obj).text(text).attr("class",
										"btn btn-primary topSave").attr("text",
										old);
								toastr.info('操作成功！')
							} else {
								toastr.error('操作失败！')
							}
						}, "text");
					});
		});
	</script>
</body>
</html>