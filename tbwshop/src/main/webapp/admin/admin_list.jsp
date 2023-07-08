<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>账号列表</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container-fluid">

	<form class="form-inline" action="adminSearch" id="serchform" method="post">
		<div class="form-group">
			<input type="text" class="form-control" id="name" name="name" placeholder="账号">
		</div>
		<a href="javascript:;" onclick="document.getElementById('serchform').submit();" type="submit" class="btn btn-primary">点击搜索</a>
		<a href="adminAdd"  class="btn btn-primary">添加账号</a>
	</form>
	
	<br>
	
	<table class="table table-bordered table-hover">
 
	<tr>
		<th width="5%">ID</th>
		<th width="10%">账号</th>
		<th width="10%">密码</th>
		<th width="10%">用户类型</th>
		<th width="10%">性别</th>
		<th width="10%">年龄</th>
		<th width="10%">电话号码</th>
	</tr>
	
	<c:forEach var="admin" items="${adminList}">
         <tr>
         	<td><p>${admin.id}</p></td>
         	<td><p>${admin.username}</p></td>
         	<td><p>${admin.password}</p></td>
         	<td><p>${admin.type}</p></td>
         	<td><p>${admin.sex}</p></td>
         	<td><p>${admin.age}</p></td>
         	<td><p>${admin.phone}</p></td>
			<td>
				<%-- <a class="btn btn-info" href="adminRe?id=${admin.id}" title="修改密码"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span></a> --%>
				<a class="btn btn-primary" href="adminEdit?id=${admin.id}" title="修改"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
				<a class="btn btn-danger" href="adminDelete?id=${admin.id}" title="删除"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
			</td>
       	</tr>
     </c:forEach>
     
</table>

<br>${pageTool}<br>
</div>
</body>
</html>