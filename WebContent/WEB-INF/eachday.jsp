<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Data Center</title>
<link rel="shortcut icon" href="./img/favicon.png">
<script type="text/javascript" src="./js/jquery.min.js"></script>
<link href="./css/bootstrap-datepicker.css" rel="stylesheet">
<link href="./css/bootstrap.css" rel="stylesheet">
<link href="./css/bootstrap-responsive.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 160px;
	padding-bottom: 40px;
}

@media ( max-width : 980px) {
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>

</head>
<body>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">

				<a class="brand" href="#">DCTemplate</a>
				<div class="nav-collapse collapse">
					<p class="navbar-text pull-right">
						欢迎你， <a href="#" class="navbar-link">Username</a>
					</p>
					<ul class="nav" id="navbar">
						<li id="eachday" class="active"><a href="./eachday">每日分析</a></li>
						<li id="trend"><a href="./trend">趋势分析</a></li>
						<li id="datamanage"><a href="./datamanage">数据管理</a></li>

					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<div class="container-fluid" id="main">

		<input id="pickdate" size="16" type="text" value="2014-02-19"
			data-date-format="yyyy-mm-dd"></input>


		<button type="submit" class="btn" id="select">提交</button>
		<div id="chartarea1"
			style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		<div id="chartarea2"
			style="min-width: 310px; height: 400px; margin: 0 auto"></div>

	</div>
	<!--/.fluid-container-->
	<script src="./js/echarts-plain-map.js"></script>
	<script src="./js/bootstrap.js"></script>
	<script src="./js/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
		var Chart1 = echarts.init(document.getElementById('chartarea1'));
		var Chart2 = echarts.init(document.getElementById('chartarea2'));
		jQuery('#select').click(function(){
			var date=jQuery('#pickdate').val().replace(/-/g,"");
			showChart(date);
		});
		
		function showChart(date){
			jQuery.getJSON("Chart1", {
				"date" : date
			}, function(result) {
				alert(result.x);
				Chart1.setOption({
					tooltip : {
						trigger : 'axis'
					},
					legend : {
						data : [ '1' ]
					},
					toolbox : {
						show : true,
						feature : {
							mark : true,
							dataView : {
								readOnly : false
							},
							magicType : [ 'line', 'bar' ],
							restore : true,
							saveAsImage : true
						}
					},
					dataZoom : {
						show : true
					},
					calculable : true,
					xAxis : [ {
						type : 'category',
						data : result.x
					} ],
					yAxis : [ {
						type : 'value',
						splitArea : {
							show : true
						}
					} ],
					series : [ {
						name : '1',
						type : 'bar',
						data : result.y
					} ]
				});

			});
		};
		

		jQuery.getJSON("Chart1", {
			"date" : "20140219"
		}, function(result) {

			Chart2.setOption({
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					data : [ '蒸发量' ]
				},
				toolbox : {
					show : true,
					feature : {
						mark : true,
						dataView : {
							readOnly : false
						},
						magicType : [ 'line', 'bar' ],
						restore : true,
						saveAsImage : true
					}
				},
				dataZoom : {
					show : true
				},
				calculable : true,
				xAxis : [ {
					type : 'category',
					data : result.y
				} ],
				yAxis : [ {
					type : 'value',
					splitArea : {
						show : true
					}
				} ],
				series : [ {
					name : '蒸发量',
					type : 'bar',
					data : result.x
				} ]
			});
		});
		$('#pickdate').datepicker();

	</script>


</body>
</html>
