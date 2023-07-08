<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>购物车</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
</head>
<body>
	
	<jsp:include page="header.jsp"/>
	
	<!--cart-items-->
	<div class="cart-items">
		<div class="container">
		
		<c:if test="${msg!=null}"><div class="alert alert-success">${msg}</div></c:if>
		<c:if test="${order!=null}">
			<h2>我的购物车</h2>
			<table class="table table-bordered table-hover">
			
				<tr>
					<th width="10%">序号</th> 
					<th width="20%">名称</th>
					<th width="20%">商品图片</th>
					<th width="10%">单价</th>
					<th width="10%">数量</th>
					<th width="20%">操作</th>
				</tr>
				
				<c:forEach var="item" items="${order.itemList}" varStatus="status">
			         <tr>
			         	<td><p>${status.index+1}</p></td>
			         	<td><a href="detail?goodid=${item.good.id}">${item.good.name}</a></td>
			         	<td><p><a href="detail?goodid=${item.good.id}" target="_blank"><img src="../${item.good.cover}" width="100px" height="100px"></a></p></td>
			         	<td><p>¥ ${item.good.price}</p></td>
			         	<td><p>${item.amount}</p></td>
			         	<td>
							<a class="btn btn-info" href="javascript:buy(${item.good.id});" title="添加"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
							<a class="btn btn-warning" href="javascript:lessen(${item.good.id});" title="减少"><span class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span></a>
							<a class="btn btn-danger" href="javascript:deletes(${item.good.id});"  title="删除"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
						</td>
			       	</tr>
				</c:forEach>
				<tr>
					<td colspan="5" style="text-align:center">订单总金额</td>
					<td>¥ ${order.total}</td>
				</tr>
				<tr>
					<td colspan="6" style="text-align:center"><a class="btn btn-success btn-lg" style="margin-left:74%" href="save">提交订单</a></td>
				</tr>
			     
			</table>
			</c:if>
			<c:if test="${order==null}"><div class="alert alert-info">空空如也</div>
				<br><br><br><br><br><br>
				<br><br><br><br><br><br>
				<br><br><br><br><br><br>
				<br><br><br><br>
			</c:if>
			
		</div>
	</div>
	<!--//cart-items-->	
	
	<jsp:include page="footer.jsp"/>

</body>
</html>