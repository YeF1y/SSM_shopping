<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<script type="text/javascript">
        .titleUl
        li
        a
        {
            color:white
        }
    </script> 
</head>
<body>
	<div style="background-color: #dc143c; color: white">
		<marquee style="width: 70%; float: left">
			<p style="font-family: Impact; font-size: 13pt; margin-top: 10px;">
				新年新气象，潮款等你来拿。&nbsp;&nbsp;&nbsp;&nbsp; 买它！&nbsp;&nbsp;,&nbsp;&nbsp;买它！！！新年新气象，潮款等你来拿。&nbsp;&nbsp;&nbsp;&nbsp; 买它！&nbsp;&nbsp;,&nbsp;&nbsp;买它！！！新年新气象，潮款等你来拿。&nbsp;&nbsp;&nbsp;&nbsp; 买它！&nbsp;&nbsp;,&nbsp;&nbsp;买它！！！新年新气象，潮款等你来拿。&nbsp;&nbsp;&nbsp;&nbsp; 买它！&nbsp;&nbsp;,&nbsp;&nbsp;买它！！！</p>
		</marquee>
		<div>
			<ul class="titleUl nav navbar-nav">
				<li><a href="cart"> <span style="color: white"
						class="glyphicon glyphicon-shopping-cart" aria-hidden="true"><span
							class="card_num">${order.amount==null ? '' :order.amount}</span></span>
				</a></li>
				<c:if test="${sessionScope.user==null}">
					<li><a style="color: white" href="register?flag=-1"
						<c:if test="${flag==5}">class="active"</c:if>>注&nbsp;册&nbsp;</a></li>
					<li><a style="color: white" href="login?flag=-1"
						<c:if test="${flag==6}">class="active"</c:if>>登&nbsp;录&nbsp;</a></li>
				</c:if>
				<c:if test="${sessionScope.user!=null}">
					<li><a style="color: white" href="order"
						<c:if test="${flag==3}">class="active"</c:if>>我的订单</a></li>
					<li><a style="color: white" href="my"
						<c:if test="${flag==4}">class="active"</c:if>>个人中心</a></li>
					<li><a style="color: white" href="logout2">销户</a></li>
					<li><a style="color: white" href="logout">退出登录</a></li>
				</c:if>
				<li><a style="color: white" href="../admin.jsp" target="_blank">后台管理</a></li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--header-->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"
		style="width: 100%;background:#dc143c;margin-top:0px">
		<ul class="nav navbar-nav" style="width: 50%; margin-left: 10%">
			<li><a style="color: white" href="index"
				<c:if test="${flag==1}">class="active"</c:if>>首页</a></li>
			<li><a style="color: white" href="top?typeid=2"
				<c:if test="${flag==7}">class="active"</c:if>>热销产品</a></li>
			<c:forEach var="type" items="${typeList}">
				<li><a style="color: white" class="list" href="goods?typeid=${type.id}">${type.name}</a></li>
			</c:forEach>
		</ul>
		<!--/.navbar-collapse-->
		<div>
			<form class="navbar-form navbar-left" role="search" action="search">
				<div class="form-group">
					<input type="text" class="form-control" name="name">
				</div>
				<button type="submit" class="btn btn-default">搜索</button>
			</form>
		</div>
	</div>
</body>
</html>