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
    
    <title>注册用户</title>
    
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
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<script>
		function mycheck(){
		var checked = false;
 
	    try {
	        if(document.all("password").value != document.all("confirm").value){
	            alert("两次输入的密码不正确，请更正。");
	            password.focus();
	            document.all("confirm").value="";
	            return false;
	        } else {
	            checked = true;
	        }
	    } catch(e) {
	        checked = false;
	    }
 
 
    	return checked ? true : false;
		}
	</script>
  </head>
  <body class="style-3">

		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<div style="height: 110px; width: auto; float: left;" class="col-md-1">
					 	<a href="<%=basePath %>myHome.html">
                     <img style="height: 110px; width: auto; float: left;" src="<%=basePath %>img/ddd.png" alt="...">
                     </a>
					 </div>
					 <div style="height: 100px; float: left;" class="col-md-1">
					 	<a href="<%=basePath %>myHome.html">
 
                     <img style="height: 100px; float: left;" src="img/1499913608_348592.png" alt="...">
                     </a>
					 </div>
					<!--<ul class="menu">
						<li class="active"><a href="index.html">Style 1</a></li>
						<li><a href="index2.html">Style 2</a></li>
						<li><a href="index3.html">Style 3</a></li>
					</ul>-->
				</div>
			</div>
            
            <div>
                <div class="m-tr-block" style="font-size: 15px;text-align: right;">已有帐号？去<a id="btn_Login" href="<%=basePath %>/doLogin.html">登录</a></div>
            </div>
            
			<div class="row">
				<div class="col-md-4 col-md-offset-14">
					
					<!-- Start Sign In Form -->
					<form action="<c:url value="/doRegister.html" />" method="post" class="fh5co-form5 animate-box" data-animate-effect="fadeIn" onsubmit="return mycheck()">
						<img src="img/zhuce.PNG" style="width:60px;height: 25px;margin-left: 100px;"/>			
						<div style="margin-top: 30px;">
						    <div style="float: left;margin-left: 20%;">
							    <label for="userName" style="font-size: 20px;">用&nbsp;户&nbsp;名&nbsp;：</label>
					        </div>
					        <div style="float: left;">
						        <input type="text" class="form-control" id="userName" name="userName" placeholder="Username" aria-describedby="basic-addon1" style="width: 400px;">	
							</div>		
						</div>
						<div style="clear:both; margin-top: 90px;">
						    <div style="float: left;margin-left: 20%;">
							    <label for="password" style="font-size: 20px;">&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;&nbsp;：</label>
					        </div>
					        <div style="float: left;">
						        <input type="password" class="form-control" id="password" name="password" placeholder="Password" aria-describedby="basic-addon1" style="width: 400px;">	
							</div>		
						</div>
						<div style="clear: both; margin-top: 150px;">
						    <div style="float: left;margin-left: 20%;">
							    <label for="confirm" style="font-size: 20px;">确认密码：</label>
					        </div>
					        <div style="float: left;">
						        <input type="password" class="form-control" id="confirm" name="confirm" placeholder="ConfirmPassword" aria-describedby="basic-addon1" style="width: 400px;">	
							</div>		
						</div>
						<div style="clear: both; margin-top: 210px;">
						    <div style="float: left;margin-left: 20%;">
							    <label for="iphone" style="font-size: 20px;">&nbsp;手&nbsp;机&nbsp;号&nbsp;：</label>
					        </div>
					        <div style="float: left;">
						        <input type="text" class="form-control" id="iphone" name="iphone" placeholder="Cell-phone" aria-describedby="basic-addon1" style="width: 400px;">	
							</div>		
						</div>	
						<div class="input-group" style="clear: both;">                   
                        </div>
						
						<div class="form-group" style="clear: both;">
						    <div style="float:left;">
						        <input type="submit" value="注册" class="btn btn-primary" style="margin-top: 20px;margin-left: 325px">
						    </div>
						    <div style="float:left;">
						        <input type="reset" value="重置" class="btn btn-primary" style="margin-top: 20px;margin-left: 50px">
						    </div>
						</div>
						<div class="input-group" style="clear: both;">                   
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
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="js/main.js"></script>


	</body>
</html>
