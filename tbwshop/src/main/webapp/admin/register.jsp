<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>商家注册</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
</head>

<!-- 设置背景图片 -->
<body >
 
	<div class="container">

		<c:if test="${msg!=null}"><div class="alert alert-danger text-center">${msg}</div></c:if>

		<form class="form-horizontal" action="/tbwshop_war_exploded/admin/registerSJ" method="post" style="margin-top:15%;">
			<h2 class="text-center">商家注册</h2>
			<div class="form-group">
				<div class="col-md-4 col-md-offset-4">
					<input type="text" class="form-control" style="height:auto;padding:10px;" placeholder="输入用户名" name="username" value="">
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-4 col-md-offset-4">
					<input type="password" class="form-control" style="height:auto;padding:10px;" placeholder="输入密码" name="password" value="">
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-4 col-md-offset-4">
					<!-- 管理员：<input type="radio" name="role" value="管理员"> -->&nbsp;&nbsp;&nbsp;&nbsp;
					商家：<input type="radio" name="type" checked value="商家">
				</div>
			</div>
			<div class="col-md-4 col-md-offset-4">			
				<input class="btn btn-lg btn-primary btn-block"  type="submit" value="确定">
				<br>
			    
			</div>
			
			<div class="col-md-4 col-md-offset-4">			
			<a href="login.jsp" class="btn btn-primary btn-block" >返回</a>
				<!-- <button class="btn btn-lg btn-primary btn-block"  type="submit">确定</button> 
				<br>
			    <a href="login.jsp" class="btn btn-primary btn-block" >返回</a>-->
			</div>
		</form>

	</div>

</body>
</html>
