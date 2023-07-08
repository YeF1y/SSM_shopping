<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>用户登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/simpleCart.min.js"></script>
</head>
<style>
* {
	margin: 0;
	padding: 0;
}

.account {
	background: url('../picture/bg001.jpg') no-repeat;
	height: 90%;
	width: 100%; 
	overflow: hidden;
	background-size: cover;
}

.container2 {
	width: 30%;
	margin-left: 150px;
}
</style>
<body>

	<jsp:include page="header.jsp" />


	<!--account-->
	<div class="account">
		<div class="container container2">
			<div class="register">
				<c:if test="${msg!=null}">
					<div class="alert alert-danger">${msg}</div>
				</c:if>
				<form action="login" method="post">
					<div class="register-top-grid">
						<br> <br> <br>
						<h3>用户登录</h3>
						<div class="input">
							<span>用户名 <label style="color: red;">*</label></span> <input
								type="text" name="username" placeholder="请输入用户名"
								required="required">
						</div>
						<div class="input">
							<span>密码 <label style="color: red;">*</label></span> <input
								type="text" name="password" placeholder="请输入密码"
								required="required">
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="register-but text-center">
						<input type="submit" value="登录">
						<div class="clearfix"></div>
					</div>
				</form>
				<div class="clearfix"></div>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
	<!--//account-->

	<jsp:include page="footer.jsp" />

</body>
</html>