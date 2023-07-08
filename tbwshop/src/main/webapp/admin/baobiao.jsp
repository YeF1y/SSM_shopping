<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>客户修改</title>
<meta charset="utf-8"/>
    <link rel="stylesheet" href="css/bootstrap.css"/>
	<script src="js/ercharts.js"></script>
</head>
<body>
<div class="container-fluid">


	<br><br>

	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 1000px;height:400px;"></div>
	<div id="main2" style="width: 1000px;height:400px;"></div>
	<script type="text/javascript">
		var bbxx = '<%=request.getAttribute("bbxx")%>';
		console.log(66);
		console.log(bbxx);
		bbxx = JSON.parse(bbxx);
		// 各商品情况
		var gspbb = bbxx.gspbb;
		console.log(gspbb)
		var sp = [];// 商品名称
		var sps = [];// 商品数据
		gspbb.forEach(function (item) {
			sp.push(item.name);
			sps.push(item.sm);
		})

		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));

		// 指定图表的配置项和数据
		var option = {
			title: {
				text: '各商品销售情况'
			},
			tooltip: {},
			legend: {
				data:['营业额']
			},
			xAxis: {
				data: sp // ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
			},
			yAxis: {},
			series: [{
				name: '营业额',
				type: 'bar',
				data: sps //[5, 20, 36, 10, 10, 20]
			}]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);



		// 每月销售情况
		var mybb = bbxx.mybb[0];
		console.log(mybb)
		console.log(mybb.Jan)
		console.log(mybb.Jan == 'Jan')
		var yf = [];// 月份
		var yfs = [];// 商品数据
		//mybb.forEach(function (item) {
			if(mybb.Jan >= 0) {yf.push("一月");yfs.push(mybb.Jan);}
			if(mybb.Feb >= 0) {yf.push("二月");yfs.push(mybb.Feb);}
			if(mybb.Mar >= 0) {yf.push("三月");yfs.push(mybb.Mar);}
			if(mybb.Apr >= 0) {yf.push("四月");yfs.push(mybb.Apr);}
			if(mybb.May >= 0) {yf.push("五月");yfs.push(mybb.May);}
			if(mybb.Jun >= 0) {yf.push("六月");yfs.push(mybb.Jun);}
			if(mybb.Jul >= 0) {yf.push("七月");yfs.push(mybb.Jul);}
			if(mybb.Aug >= 0) {yf.push("八月");yfs.push(mybb.Aug);}
			if(mybb.Sep >= 0) {yf.push("九月");yfs.push(mybb.Sep);}
			if(mybb.Oct >= 0) {yf.push("十月");yfs.push(mybb.Oct);}
			if(mybb.Nov >= 0) {yf.push("十一月");yfs.push(mybb.Nov);}
			if(mybb.Dec >= 0) {yf.push("十二月");yfs.push(mybb.Dec);}
		//})

		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main2'));
		// 指定图表的配置项和数据
		var option = {
			title: {
				text: '每月销售情况'
			},
			tooltip: {},
			legend: {
				data:['销量']
			},
			xAxis: {
				data: yf // ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
			},
			yAxis: {},
			series: [{
				name: '销量',
				type: 'bar',
				data: yfs //[5, 20, 36, 10, 10, 20]
			}]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	</script>
	
</div>	
</body>
</html>