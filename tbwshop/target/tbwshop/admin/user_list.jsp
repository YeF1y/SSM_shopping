<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>客户列表</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container-fluid">

	<form class="form-inline" action="userSearch" id="serchform" method="post">
		<div class="form-group">
			<input type="text" class="form-control" id="name" name="name" placeholder="用户名">
		</div>
		<a href="javascript:;" onclick="document.getElementById('serchform').submit();" type="submit" class="btn btn-primary">点击搜索</a>
		<a href="userAdd"  class="btn btn-primary">添加客户</a>
	</form>
	
	<br>
	
	<table class="table table-bordered table-hover">
 
	<tr>
		<th width="5%">ID</th>
		<th width="10%">用户名</th>
		<th width="10%">收货人</th>
		<th width="10%">电话</th>
		<th width="10%">地址</th>
		<th width="10%">操作</th>
	</tr>
	
	<c:forEach var="user" items="${userList}">
         <tr>
         	<td><p>${user.id}</p></td>
         	<td><p>${user.username}</p></td>
         	<td><p>${user.name}</p></td>
         	<td><p>${user.phone}</p></td>
         	<td><p>${user.address}</p></td>
			<td>
				<%-- <a class="btn btn-info" href="userRe?id=${user.id}" title="修改密码"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span></a> --%>
				<a class="btn btn-primary" href="userEdit?id=${user.id}" title="修改"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
				<a class="btn btn-danger" href="userDelete?id=${user.id}" title="删除"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
			</td>
       	</tr>
     </c:forEach>
     
</table>

<br>${pageTool}<br>
</div>
</body>
</html>