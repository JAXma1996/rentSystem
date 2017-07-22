<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的评价</title>
    
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
	
	<link href="<%=basePath %>css/one/cmstyle.css" rel="stylesheet" type="text/css">
	<link href="<%=basePath %>css/one/personal1.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript" src="<%=basePath %>js/one/jquery-1.7.2.min.js"></script>
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	
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
				<div class="main-wrap">

					<div class="user-comment">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">评价管理</strong> / <small>Manage&nbsp;Comment</small></div>
						</div>
						<hr/>
	
						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>
	
							<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">我的所有评价</a></li>
								<li><a href="#tab2">来自买家的评价</a></li>
							</ul>
	
							<div class="am-tabs-bd">
								 <div class="am-tab-panel am-fade am-in am-active" id="tab1">
	
			                                    <div class="comment-main">
			                                        <div class="comment-list">
			                                            <ul class="item-list">
			
			
			                                                <div class="comment-top">
			                                                    <div class="th th-price">
			                                                        <td class="td-inner">评价</td>
			                                                    </div>
			                                                    <div class="th th-item">
			                                                        <td class="td-inner">商品</td>
			                                                    </div>
			                                                </div>
			                                                <c:forEach items="${commentAll }" var="comment">
			                                                    <li class="td td-item">
			                                                        <div class="item-pic">
			                                                            <a href="<%=basePath %>trade/introduction?tradeId=${comment.trade.tradeId}" class="J_MakePoint">
			                                                                <img src="<%=basePath %>${comment.trade.photo }" class="itempic">
			                                                            </a>
			                                                        </div>
			                                                    </li>
			
			                                                    <li class="td td-comment">
			                                                        <div class="item-title">
			                                                            <div class="item-opinion">
			                                                                <c:if test="${comment.commentScore == 20 }">好评</c:if>
			                                                                <c:if test="${comment.commentScore == 10 }">中评</c:if>
			                                                                <c:if test="${comment.commentScore < 0 }">差评</c:if>
			                                                            </div>
			                                                            <div class="item-name">
			                                                                <a href="<%=basePath %>trade/introduction?tradeId=${comment.trade.tradeId}">
			                                                                    <p class="item-basic-info">${comment.trade.tradeName }</p>
			                                                                </a>
			                                                            </div>
			                                                        </div>
			                                                        <div class="item-comment">
			                                                            ${comment.comment }
			                                                        </div>
			
			                                                        <div class="item-info">
			                                                            <div>
			                                                                <p class="info-little">${comment.trade.trDescript }</p>
			                                                                <p class="info-time">
			                                                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${comment.createDate }"/>
			                                                                </p>
			                                                            </div>
			                                                        </div>
			                                                    </li>
			                                                </c:forEach>
			                                            </ul>
			
			                                        </div>
			                                    </div>
			
			                                </div>
	
			                                <div class="am-tab-panel am-fade am-in am-active" id="tab2">
			                                    <div class="comment-main">
			                                        <div class="comment-list">
			                                            <ul class="item-list">
			
			
			                                                <div class="comment-top">
			                                                    <div class="th th-price">
			                                                        <td class="td-inner">评价</td>
			                                                    </div>
			                                                    <div class="th th-item">
			                                                        <td class="td-inner">商品</td>
			                                                    </div>
			                                                </div>
			                                                <c:forEach items="${commentAllByBuyer }" var="comment1">
			                                                    <li class="td td-item">
			                                                        <div class="item-pic">
			                                                            <a href="#" class="J_MakePoint">
			                                                                <img src="<%=basePath %>${comment1.trade.photo }" class="itempic">
			                                                            </a>
			                                                        </div>
			                                                    </li>
			
			                                                    <li class="td td-comment">
			                                                        <div class="item-title">
			                                                            <div class="item-opinion">
			                                                                <c:if test="${comment1.commentScore == 20 }">好评</c:if>
			                                                                <c:if test="${comment1.commentScore == 10 }">中评</c:if>
			                                                                <c:if test="${comment1.commentScore < 0 }">差评</c:if>
			                                                            </div>
			                                                            <div class="item-name">
			                                                                <a href="#">
			                                                                    <p class="item-basic-info">${comment1.trade.tradeName }</p>
			                                                                </a>
			                                                            </div>
			                                                        </div>
			                                                        <div class="item-comment">
			                                                            ${comment1.comment }
			                                                        </div>
			
			                                                        <div class="item-info">
			                                                            <div>
			                                                                <p class="info-little"></p>
			                                                                <p class="info-time">
			                                                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${comment1.createDate }"/>
			                                                                </p>
			
			                                                            </div>
			                                                        </div>
			                                                    </li>
			                                                </c:forEach>
			                                            </ul>
			
			                                        </div>
			                                    </div>
			                                </div>
							</div>
						</div>
					</div>

				</div>
				<!--底部-->
				<%@ include file="fontFooter.jsp" %>
			</div>

			<aside class="menu">
				<ul>
					<li class="person">
						<a>个人中心</a>
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
							<li class="active"><a href="<%=basePath %>showAllComment">我的评价</a></li>
						</ul>
					</li>


				</ul>
			</aside>
		</div>
  </body>
</html>
