<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>客户修改</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container-fluid">


	<br><br>
	
	<form class="form-horizontal" action="adminUpdate2" method="post">
		<input type="hidden" name="id" value="${admin.id}">
		<%-- <input type="hidden" name="adminname" value="${admin.adminname}">
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">用户名</label>
			<div class="col-sm-5">${admin.adminname}</div>
		</div> --%>
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">用户名</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="username" required="required" value="${admin.username}">
			</div>
		</div>
		<div class="form-group"> 
			<label for="input_name" class="col-sm-1 control-label">密码</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="password" required="required" value="${admin.password}">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">账号类型</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="type" value="${admin.type}">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">性别</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="sex" value="${admin.sex}">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">年龄</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="age" value="${admin.age}">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">电话</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="phone" value="${admin.phone}">
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-1 col-sm-10">
				<button type="submit" class="btn btn-success">提交修改</button>
			</div>
		</div>
	</form>
	
	<span style="color:red;">${msg}</span>
	
</div>	
</body>
</html>