<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
	<title>商品列表</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/simpleCart.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
</head>
<body>
	
	<jsp:include page="header.jsp"/>
	 
	<!--products-->
	<div class="products" style="margin-top:-40px;background:#fbffc038">	 
		<div class="container">
			<hr>
			<c:if test="${type!=null}">
			<h2>${type.name}</h2>
			</c:if>
			<c:if test="${type==null}">
				<c:if test="${typeid==2}"><h2>热销推荐</h2></c:if>		
				<c:if test="${typeid==3}"><h2>新品推荐</h2></c:if>
			</c:if>		
			<c:if test="${goodList == null || fn:length(goodList) < 1 }">
			    <div style="text-align:center">
					暂无商品
				</div>
				<br><br><br><br><br><br><br><br><br><br><br>
				<br><br><br><br><br><br><br><br><br><br><br>
			</c:if>
			<div class="col-md-12 product-model-sec">
				<c:forEach var="good" items="${goodList}">
				     
					<div class="product-grid" style="height: 380px;width:244px;">
						<a href="detail?goodid=${good.id}">				
							<div class="more-product"><span> </span></div>						
							<div class="product-img b-link-stripe b-animate-go  thickbox" style="height: 245px;width:245px;">
								<img src="../${good.cover}" class="img-responsive" alt="${good.name}" width="240px" height="240px">
								<div class="b-wrapper">
									<h4 class="b-animate b-from-left  b-delay03">							
										<button>查看详情</button>
									</h4>
								</div>
							</div>
						</a>				
						<div class="product-info simpleCart_shelfItem">
							<div class="product-info-cust prt_name">
								<h4>${good.name}</h4>								
								<span class="item_price">¥ ${good.price}</span>
								<input type="button" class="item_add items" value="加入购物车" onclick="buy(${good.id})">
								<div class="clearfix"> </div>
							</div>												
						</div> 
					</div>
				</c:forEach>
				<div class="clearfix"> </div>
			</div>
			<div>${pageTool}</div>
		</div>
	</div>
	<!--//products-->	
	
	<jsp:include page="footer.jsp"/>

</body>
</html>