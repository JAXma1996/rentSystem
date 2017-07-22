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
    
    <title>My JSP 'userComment.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
	<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

	<link href="<%=basePath %>css/one/personal.css" rel="stylesheet" type="text/css">
	<link href="<%=basePath %>css/one/apstyle.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=basePath %>js/one/jquery-1.7.2.min.js"></script>
	
  </head>
  
  <body>
	  	 <!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<%@ include file="fontHeader.jsp" %>
				</div>
			</article>
		</header>
           <div class="nav-table">
		   <div class="long-title"><span class="all-goods">个人中心</span></div>
		   <div class="nav-cont">
				<ul>
                          <li class="qc"><a href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=1&tradeDeposit&price&tradeName">出行用品</a></li>
                          <li class="qc"><a href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=2&tradeDeposit&price&tradeName">数码产品</a></li>
                          <li class="qc"><a href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=3&tradeDeposit&price&tradeName">图书</a></li>
                          <li class="qc"><a href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=4&tradeDeposit&price&tradeName">衣服</a></li>
                          <li class="qc last"><a href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=5&tradeDeposit&price&tradeName">运动用品</a></li>
                          <li class="qc last"><a href="<%=basePath %>trade/publishItem"><img style="height:40px; width:40px;" src="img/one/plus.png">发布商品</img></a></li>
				</ul>
			</div>
		</div>
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
                <!-- 用户评价 -->
				<div class="main-wrap">

					<div class="user-comment">
						<form action="<c:url value="userComment" />" method="post">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">发表评论</strong> / <small>Make&nbsp;Comments</small></div>
						</div>
						<hr/>

						<div class="comment-main">
							<div class="comment-list">
								<div class="item-pic">
									<a href="#" class="J_MakePoint">
										<input type="hidden"  name="tradeId" value="${trade.tradeId }">
										<img src="<%=basePath %>${trade.photo }" alt="图裂了" class="itempic">
									</a>
								</div>

								<div class="item-title">

									<div class="item-name">
										<a href="#">
											<p class="item-basic-info">${trade.tradeName }</p>
										</a>
									</div>
									<div class="item-info">
										<div class="item-price">
											价格：<strong>${trade.price }</strong>
										</div>										
									</div>
								</div>
								<div class="clear"></div>
								<div class="item-comment">
									<textarea placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！" name="comment"></textarea>
								</div>
								
								<div class="item-opinion">
										<input type="hidden" id="score" name="commentSorce">
										<li id="op1"><i class="op1" ></i>好评</li>
										<li id="op2"><i class="op2" ></i>中评</li>
										<li id="op3"><i class="op3">></i>差评</li>

								</div>
							</div>

								<div class="info-btn">
									<input type="submit" class="am-btn am-btn-danger" value="发表评论"/>	
								</div>	
												
							<script type="text/javascript">
								$(document).ready(function() {
									$(".comment-list .item-opinion li").click(function() {	
										$(this).prevAll().children('i').removeClass("active");
										$(this).nextAll().children('i').removeClass("active");
										$(this).children('i').addClass("active");
										var str = this.id;
										var str1 = new String("op1");
										var str2 = new String("op2");
										var str3 = new String("op3");
										if(str == str1 ){
											document.all("score").value="20";
										}else if(str == str2){
											document.all("score").value="10";
										}else{
											document.all("score").value="-10";
										}
										 
										 
									});
						     })
							</script>					
					
												
							
						</div>
						</form>
					</div>

				</div>

				<!--底部-->
				<%@ include file="fontFooter.jsp" %>
			</div>

			<aside class="menu">
				<ul>
					<li class="person">
						<a href="index.html">个人中心</a>
					</li>
					<li class="person">
						<ul>
							<li> <a href="<%=basePath %>user/userInfo">个人信息</a></li>
							<li> <a href="<%=basePath %>user/myPassword">我的密码</a></li>
							<li><a href="<%=basePath %>address/myAddress">收货地址</a></li>
						</ul>
					</li>
					<li class="person">

						<ul>
							<li><a href="<%=basePath %>order/showAllOrder">我的订单</a></li>
							<li><a href="<%=basePath %>publish/showAllPublish">租借申请</a></li>
							<li><a href="<%=basePath %>trade/showMyTrade">我的发布</a></li>
							<li class="active"><a href="<%=basePath %>publish/showAllComment">我的评价</a></li>
						</ul>
					</li>


				</ul>

			</aside>
		</div>
  </body>
</html>
