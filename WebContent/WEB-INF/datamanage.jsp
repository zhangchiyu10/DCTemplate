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

#alert {
	display: none;
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
						<li id="trend"><a href="./trend">趋势分析</a></li>
						<li id="datamanage" class="active"><a href="./datamanage">数据管理</a></li>


					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<div class="container-fluid" id="main">
		<form>
			<div class="alert alert-error" id="alert">
				<strong>Oh snap!</strong>
			</div>
			<input id="startDate" data-date-format="yyyy-mm-dd"
				placeholder="startDate"> <input id="endDate"
				data-date-format="yyyy-mm-dd" placeholder="endDate"><br />
			<input type="checkbox">chart1<br /> <input type="checkbox">chart2<br />
			<input type="checkbox">chart3<br />
			<button type="submit" class="btn" id="submit">提交</button>
		</form>
	</div>
	<!--/.fluid-container-->
	<script src="./js/echarts-plain-map.js"></script>
	<script src="./js/bootstrap.js"></script>
	<script src="./js/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
	
		$('#submit').click(function() {
			jQuery.getJSON("manage", function(result) {
				alert(result.x);
			});
			

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
	</script>

</body>
</html>

