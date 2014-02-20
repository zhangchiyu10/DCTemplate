<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录入口</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="./css/bootstrap.css" rel="stylesheet">
<link href="./css/bootstrap-responsive.css" rel="stylesheet">
<link href="./css/login.css" rel="stylesheet">
<link rel="shortcut icon" href="./img/favicon.png">

</head>

<body>

	<div class="container">

		<form class="form-signin" action="Login.action" method="post">
			<h2 class="form-signin-heading">登录入口</h2>
			<input type="text"  class="input-block-level"  placeholder="用户名" name="user.username"> 
			<input type="password" class="input-block-level"  placeholder="密码"name="user.password"> 
			<button class="btn btn-large btn-primary" type="submit">登录</button>
		</form>

	</div>
	<!-- /container -->

	<script src="./js/bootstrap.js"></script>

</body>
</html>
