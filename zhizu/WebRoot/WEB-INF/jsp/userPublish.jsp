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
    
    <title>My JSP 'userPublish.jsp' starting page</title>
    
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
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
	
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
                <!--  个人资料  -->
				<div class="main-wrap">

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有订单</a></li>
								<li><a href="#tab2">来自买家的提交</a></li>
								<li><a href="#tab3">已同意的订单</a></li>
								<li><a href="#tab4">已归还</a></li>
								<li><a href="#tab5">已超期</a></li>
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
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">租金</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											
											<!--交易成功-->
											<div class="order-status5">
												<c:forEach items="${tradeRents }" var="order">
													<div class="order-title">
														<div class="dd-num">订单编号：${order.rentId }</div>
														<c:if test="${order.rentType.rentTypeId ==1 }">
															<span>提交时间：
																<fmt:formatDate pattern="yyyy-MM-dd" value="${order.rentSubmitDate }"/>
															</span>
														</c:if>
														<c:if test="${order.rentType.rentTypeId ==2 }">
															<span>完成时间：
																<fmt:formatDate pattern="yyyy-MM-dd" value="${order.rentEndDate }"/>
															</span>
														</c:if>
														<c:if test="${order.rentType.rentTypeId ==3 }">
															<span>归还时间：
																<fmt:formatDate pattern="yyyy-MM-dd" value="${order.returnRealDate }"/>
															</span>
														</c:if>
														<c:if test="${order.rentType.rentTypeId ==4 }">
															<span>最迟归还时间：
																<fmt:formatDate pattern="yyyy-MM-dd" value="${order.returnLastDate }"/>
															</span>
														</c:if>
														
														<!--    <em>店铺：小桔灯</em>-->
													</div>
													<div class="order-content">
														<div class="order-left">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="<%=basePath %>trade/introduction?tradeId=${order.trade.tradeId}" class="J_MakePoint">
																			<img src="<%=basePath %>${order.trade.photo }" class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="<%=basePath %>trade/introduction?tradeId=${order.trade.tradeId}">
																				<p>${order.trade.tradeName }</p>
																				
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		${order.trade.price }
																	</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>${order.rentNum }
																	</div>
																</li>
																<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
															</ul>
	
														</div>
														<div class="order-right">
															<li class="td td-amount">
																<div class="item-amount">
																	租金：${order.trade.tradeDeposit }
																</div>
															</li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">${order.rentType.rentTypeName }</p>
																	</div>
																</li>
																<li class="td td-change">
																	
																	<c:if test="${order.rentType.rentTypeId ==1 }">
																		<a href="<%=basePath %>publish/agreeOrder-${order.rentId}">
																			<div class="am-btn am-btn-danger anniu">同意提交</div>
																		</a>
																	</c:if>
																	<c:if test="${order.rentType.rentTypeId !=1 }">
																		<a href="<%=basePath %>order/deleteOrder-${order.rentId}">
																			<div class="am-btn am-btn-danger anniu">删除订单</div>
																		</a>
																	</c:if>
																	<c:if test="${order.rentType.rentTypeId == 2 }">
																	<a href="<%=basePath %>order/returnOrder-${order.rentId}">
																		<div class="am-btn am-btn-danger anniu">已归还</div>
																	</a>
																	</c:if>
																</li>
															</div>
														</div>
													</div>
												</c:forEach>
												
	
											</div>
											
										
										</div>

									</div>

								</div>
								<div class="am-tab-panel am-fade" id="tab2">

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
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">租金</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<div class="order-status1">
											<c:forEach items="${tradeRents1 }" var="order1">
												<div class="order-title">
													<div class="dd-num">订单编号：${order1.rentId }</div>
													<span>提交时间：
														<fmt:formatDate pattern="yyyy-MM-dd" value="${order1.rentSubmitDate }"/>
													</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
														<div class="order-left">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="<%=basePath %>trade/introduction?tradeId=${order1.trade.tradeId}" class="J_MakePoint">
																			<img src="<%=basePath %>${order1.trade.photo }" class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="<%=basePath %>trade/introduction?tradeId=${order1.trade.tradeId}">
																				<p>${order1.trade.tradeName }</p>
																				
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		${order1.trade.price }
																	</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>${order1.rentNum }
																	</div>
																</li>
																<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
															</ul>
	
														</div>
														<div class="order-right">
															<li class="td td-amount">
																<div class="item-amount">
																	租金：${order1.trade.tradeDeposit }
																</div>
															</li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">${order1.rentType.rentTypeName }</p>
																	</div>
																</li>
																<li class="td td-change">
																	<a href="<%=basePath %>order/agreeOrder-${order1.rentId}">
																		<div class="am-btn am-btn-danger anniu">同意提交</div>
																	</a>
																</li>
															</div>
														</div>

												</div>
												</c:forEach>
											</div>
										</div>

									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab3">
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
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">租金</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<div class="order-status1">
											<c:forEach items="${tradeRents2 }" var="order2">
												<div class="order-title">
													<div class="dd-num">订单编号：${order2.rentId }</div>
													<span>完成时间：
														<fmt:formatDate pattern="yyyy-MM-dd" value="${order2.rentSubmitDate }"/>
													</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
														<div class="order-left">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="<%=basePath %>trade/introduction?tradeId=${order2.trade.tradeId}" class="J_MakePoint">
																			<img src="<%=basePath %>${order2.trade.photo }" class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="<%=basePath %>trade/introduction?tradeId=${order2.trade.tradeId}">
																				<p>${order2.trade.tradeName }</p>
																				
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		${order2.trade.price }
																	</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>${order2.rentNum }
																	</div>
																</li>
																<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
															</ul>
	
														</div>
														<div class="order-right">
															<li class="td td-amount">
																<div class="item-amount">
																	租金：${order2.trade.tradeDeposit }
																</div>
															</li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">${order2.rentType.rentTypeName }</p>
																	</div>
																</li>
																<li class="td td-change">
																	<a href="<%=basePath %>order/returnOrder-${order2.rentId}">
																		<div class="am-btn am-btn-danger anniu">已归还</div>
																	</a>
																</li>
															</div>
														</div>

												</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab4">
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
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">租金</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<div class="order-status1">
											<c:forEach items="${tradeRents3 }" var="order3">
												<div class="order-title">
													<div class="dd-num">订单编号：${order3.rentId }</div>
													<span>完成时间：
														<fmt:formatDate pattern="yyyy-MM-dd" value="${order3.rentSubmitDate }"/>
													</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
														<div class="order-left">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="<%=basePath %>trade/introduction?tradeId=${order3.trade.tradeId}" class="J_MakePoint">
																			<img src="<%=basePath %>${order3.trade.photo }" class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="<%=basePath %>trade/introduction?tradeId=${order3.trade.tradeId}">
																				<p>${order3.trade.tradeName }</p>
																				
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		${order3.trade.price }
																	</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>${order3.rentNum }
																	</div>
																</li>
																<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
															</ul>
	
														</div>
														<div class="order-right">
															<li class="td td-amount">
																<div class="item-amount">
																	租金：${order3.trade.tradeDeposit }
																</div>
															</li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">${order3.rentType.rentTypeName }</p>
																	</div>
																</li>
																<li class="td td-change">
																	<a href="<%=basePath %>order/deleteOrder-${order3.rentId}">
																		<div class="am-btn am-btn-danger anniu">删除订单</div>
																	</a>
																</li>
															</div>
														</div>

												</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>

								<div class="am-tab-panel am-fade" id="tab5">
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
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">租金</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<div class="order-status1">
											<c:forEach items="${tradeRents4 }" var="order4">
												<div class="order-title">
													<div class="dd-num">订单编号：${order4.rentId }</div>
													<span>完成时间：
														<fmt:formatDate pattern="yyyy-MM-dd" value="${order4.rentSubmitDate }"/>
													</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
														<div class="order-left">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="<%=basePath %>trade/introduction?tradeId=${order4.trade.tradeId}" class="J_MakePoint">
																			<img src="<%=basePath %>${order4.trade.photo }" class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="<%=basePath %>trade/introduction?tradeId=${order4.trade.tradeId}">
																				<p>${order4.trade.tradeName }</p>
																				
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		${order4.trade.price }
																	</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>${order4.rentNum }
																	</div>
																</li>
																<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
															</ul>
	
														</div>
														<div class="order-right">
															<li class="td td-amount">
																<div class="item-amount">
																	租金：${order4.trade.tradeDeposit }
																</div>
															</li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">${order4.rentType.rentTypeName }</p>
																	</div>
																</li>
																<li class="td td-change">
																	<a href="<%=basePath %>order/deleteOrder-${order3.rentId}">
																		<div class="am-btn am-btn-danger anniu">删除订单</div>
																	</a>
																</li>
															</div>
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
							<li> <a href="<%=basePath %>address/myAddress">收货地址</a></li>
						</ul>
					</li>
					<li class="person">

						<ul>
							<li><a href="<%=basePath %>order/showAllOrder">我的订单</a></li>
							<li class="active"><a href="<%=basePath %>publish/showAllPublish">租借提交</a></li>
							<li><a href="<%=basePath %>trade/showMyTrade">我的发布</a></li>
							<li><a href="<%=basePath %>showAllComment">我的评价</a></li>
						</ul>
					</li>


				</ul>

			</aside>
		</div>
	
  </body>
</html>
