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
    
    <title>My JSP 'userTrade.jsp' starting page</title>
    
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
	<link href="<%=basePath %>css/one/infstyle.css" rel="stylesheet" type="text/css">
	<link href="<%=basePath %>css/one/orstyle.css" rel="stylesheet" type="text/css">
	
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
								<li class="am-active"><a href="#tab1">我的所有发布</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">租金</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">商品操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											
											<!--交易成功-->
											<div class="order-status5">
												<c:forEach items="${trades }" var="trade">
													<div class="order-title">
														<div class="dd-num">商品编号：${trade.tradeId }</div>
														
														<span>上架时间：
															<fmt:formatDate pattern="yyyy-MM-dd" value="${trade.createDate }"/>
														</span>
														
														<!--    <em>店铺：小桔灯</em>-->
													</div>
													<div class="order-content">
														<div class="order-left">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="<%=basePath %>trade/introduction?tradeId=${trade.tradeId}" class="J_MakePoint">
																			<img src="<%=basePath %>${trade.photo }" class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="<%=basePath %>trade/introduction?tradeId=${order.trade.tradeId}">
																				<p>${trade.tradeName }</p>
																				<p class="info-little">${trade.trDescript }</p>
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		${trade.price }
																	</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>${trade.tradeNum }
																	</div>
																</li>
																<li class="td td-operation">
																	<div class="item-operation">
																		租金：${trade.tradeDeposit }
																	</div>
																</li>
																<li class="td td-amount">
																	<div class="item-amount">
																		<a href="<%=basePath %>trade/deleteTrade-${trade.tradeId}">
																			<div class="am-btn am-btn-danger anniu">删除商品</div>
																		</a>
																		<a href="<%=basePath %>trade//toupdate?tradeId=${trade.tradeId}">
																			<div class="am-btn am-btn-danger anniu">编辑商品</div>
																		</a>
																	</div>
																</li>
															</ul>
	
														</div>
											
													
													
													</div>
												</c:forEach>
												
	
											</div>
											
										
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
							<li class="active"><a href="<%=basePath %>trade/showMyTrade">我的发布</a></li>
							<li><a href="<%=basePath %>showAllComment">我的评价</a></li>
						</ul>
					</li>


				</ul>

			</aside>
		</div>
  </body>
</html>
