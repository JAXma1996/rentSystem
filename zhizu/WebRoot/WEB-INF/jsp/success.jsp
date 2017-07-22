<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<title>付款成功页面</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css" />
		<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="<%=basePath%>css/one/sustyle.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=basePath%>basic/js/jquery-1.7.min.js"></script>

  </head>
  
  <body>
 	<%@ include file="fontHeader.jsp" %>
	<div class="take-delivery">
		<div class="status">
			<h2>您已成功付款</h2>
			<div class="successInfo">
				<ul>
					<li>租借金额<em>${price}</em></li>
					<div class="user-info">
						<p>租借人：${userName}</p>
						<p>联系电话：${userPhone}</p>
						<p>收货地址：${addressInfo}</p>
					</div>
					请认真核对您的收货信息，如有错误请联系客服

				</ul>
				<div class="option">
					<span class="info">您可以回到</span>
					<a href="<%=basePath %>myHome.html" class="J_MakePoint">商城首页</a>	<span class="info">继续浏览商品</span>					
				</div>
			</div>
		</div>
	</div>

	<%@ include file="fontFooter.jsp" %>
  </body>
</html>
