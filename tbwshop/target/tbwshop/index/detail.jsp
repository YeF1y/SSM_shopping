<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<title>商品详情</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/flexslider.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
	<script>
		$(function() {
		  $('.flexslider').flexslider({ 
			animation: "slide",
			controlNav: "thumbnails"
		  });
		});
	</script>
</head>
<body>
	 
	<jsp:include page="header.jsp"/>
	
	<!--//single-page-->
	<div class="single">
		<div class="container" style="width:80%">
			<div class="single-grids">				
				<div class="col-md-4 single-grid">		
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="../${good.cover}">
								<div class="thumb-image"> <img src="../${good.cover}" data-imagezoom="true" class="img-responsive"> </div>
							</li>
							<li data-thumb="../${good.image1}">
								 <div class="thumb-image"> <img src="../${good.image1}" data-imagezoom="true" class="img-responsive"> </div>
							</li>
							<li data-thumb="../${good.image2}">
							   <div class="thumb-image"> <img src="../${good.image2}" data-imagezoom="true" class="img-responsive"> </div>
							</li> 
						</ul>
					</div>
				</div>	
				<div class="col-md-3 single-grid simpleCart_shelfItem">		
					<h3>${good.name}</h3>
					<div class="tag">
						<p>分类 : <a href="goods?typeid=${good.type.id}">${good.type.name}</a></p>
					</div>
					<p>介绍: ${good.intro}</p>
					<div class="galry">
						<h4>库存: ${good.stock}</h4>
					</div>
					<div class="galry">
						<div class="prices">
							<h5 class="item_price">¥ ${good.price}</h5>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="btn_form">
						<a href="javascript:;" class="add-cart item_add" onclick="buy(${good.id})">加入购物车</a>	
					</div>
				</div>
				<div class="col-md-5 single-grid1" style="height:600px;">

				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	
	
	<jsp:include page="footer.jsp"/>

</body>

<script type="text/javascript">
/**
 * 评论判断
 */
function checkData(){
	var result = document.getElementById("pl").value;
	if(result == ""){
		alert("评论内容不能为空");
		return false;
	}
	return true;
}
</script>
</html>