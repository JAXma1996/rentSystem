<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<!--<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>-->
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/style.css">


	<!-- Modernizr JS -->
	<script src="<%=basePath %>js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<style>
		#bu:Arial,Helvetica,sans-serif;font-size:100%;
	</style>
  </head>
  <body class="style-3">

		<div class="container">
			<div class="row">
				<div style="height: 80px;" class="col-md-12 text-center">
					 <div style="height: 110px; width: auto; float: left;" class="col-md-1">
					 	<a href="<%=basePath %>myHome.html">
                     <img style="height: 110px; width: auto; float: left;" src="<%=basePath %>img/ddd.png" alt="找不到图片">
                     </a>
					 </div>
					 <div style="height: 100px; float: left;" class="col-md-1">
					 	<a href="<%=basePath %>myHome.html">
 
                     <img style="height: 100px; float: left;" src="<%=basePath %>img/1499913608_348592.png" alt="找不到图片">
                     </a>
					 </div>
					<!--<ul class="menu">
						<li><a href="index.html">Style 1</a></li>
						<li><a href="index2.html">Style 2</a></li>
						<li class="active"><a href="index3.html">Style 3</a></li>
					</ul>-->
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 col-md-push-8">
				    <span class="glyphicon glyphicon-align-left" aria-hidden="true"></span>
   					
					<!-- Start Sign In Form -->
					<form action="<c:url value="/doLogin.html" />" method="post" class="fh5co-form animate-box" data-animate-effect="fadeInRight">
						<h1>登录</h1>
						<div class="form-group">
							<label for="username" class="sr-only">用户名</label>
							<input type="text" class="form-control" id="username" name="userName" placeholder="userName" autocomplete="off">
							<c:if test="${errorMsg.equals('用户名不存在') }">
								<div style="color:red; font-size:15px;">${ errorMsg }</div>
							</c:if>
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">密码</label>
							<input type="password" class="form-control" id="password" name="password" placeholder="password" autocomplete="off">
							<c:if test="${errorMsg.equals('用户密码不正确')}">
								<div style="color:red; font-size:15px;">${ errorMsg }</div>
							</c:if>
						</div>
						<div class="form-group">
							<label for="remember"><input type="checkbox" id="remember"> 记住密码？</label>
						</div>
						
						<div class="form-group">
							<p>还没注册? <a href="<%=basePath %>doRegister.html">点击注册</a> </p>
						</div>
						<div class="form-group">
							<input id="bu" type="submit" value="登录" class="btn btn-primary">
						</div>
					</form>
					<!-- END Sign In Form -->


				</div>
			</div>
			<div class="row" style="padding-top: 60px; clear: both;">
				<div class="col-md-12 text-center"><p><small>&copy; 知租网 <a href="#" target="_blank" title="知租网">知租网</a> - Collect from </small></p></div>
			</div>
		</div>
	
	<!-- jQuery -->
	<script src="<%=basePath %>js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="<%=basePath %>js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="<%=basePath %>js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="<%=basePath %>js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="<%=basePath %>js/main.js"></script>

	</body>
</html>
