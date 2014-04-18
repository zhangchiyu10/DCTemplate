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
						<li id="eachday"><a href="./eachday">每日分析</a></li>
						<li id="trend" class="active"><a href="./trend">趋势分析</a></li>
						<li id="datamanage"><a href="./datamanage">数据管理</a></li>

					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<div class="container-fluid" id="main">
		<div class="row-fluid">

			<input id="startDate" data-date-format="yyyy-mm-dd"
				placeholder="startDate"> <input id="endDate"
				data-date-format="yyyy-mm-dd" placeholder="endDate">
			<button type="submit" class="btn" id="select">提交</button>
			<br />
			<div id="chartarea1"
				style="min-width: 310px; height: 400px; margin: 0 auto"></div>
			<div id="chartarea2"
				style="min-width: 310px; height: 400px; margin: 0 auto"></div>

		</div>
	</div>
	<!--/.fluid-container-->
	<script src="./js/echarts-plain-map.js"></script>
	<script src="./js/bootstrap.js"></script>
	<script src="./js/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
		jQuery('#select').click(function() {
			var startDate = jQuery('#startDate').val().replace(/-/g, "");
			var endDate = jQuery('#endDate').val().replace(/-/g, "");
			showChart(startDate, endDate);
		});

		$('#startDate')
				.datepicker()
				.on(
						'changeDate',
						function(ev) {
							if (ev.date.valueOf() > endDate.valueOf()) {
								$('#alert')
										.show()
										.find('strong')
										.text(
												'The start date can not be greater then the end date');
							} else {
								$('#alert').hide();
								startDate = new Date(ev.date);
								$('#startDate').text(
										$('#startDate').data('date'));
							}
							$('#startDate').datepicker('hide');
						});
		$('#endDate')
				.datepicker()
				.on(
						'changeDate',
						function(ev) {
							if (ev.date.valueOf() < startDate.valueOf()) {
								$('#alert')
										.show()
										.find('strong')
										.text(
												'The end date can not be less then the start date');
							} else {
								$('#alert').hide();
								endDate = new Date(ev.date);
								$('#endDate').text($('#endDate').data('date'));
							}
							$('#endDate').datepicker('hide');
						});
		var Chart1 = echarts.init(document.getElementById('chartarea1'));
		var Chart2 = echarts.init(document.getElementById('chartarea2'));

		function showChart(startDate, endDate) {
			jQuery.getJSON("Chart1", {
				"startDate" : startDate,
				"endDate" : endDate,
			}, function(result) {

				Chart1.setOption({
					tooltip : {
						trigger : 'axis'
					},
					legend : {
						data : [ 'money' ]
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
						name : 'money',
						type : 'bar',
						data : result.y
					} ]
				});

			});

			jQuery.getJSON("Chart1", function(result) {

				Chart2.setOption({
					tooltip : {
						trigger : 'axis'
					},
					legend : {
						data : [ 'money' ]
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
						name : 'money',
						type : 'bar',
						data : result.x
					} ]
				});
			});
		}
	</script>


</body>
</html>

