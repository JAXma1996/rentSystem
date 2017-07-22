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
	
	<title>结算页面</title>

		<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

		<link href="<%=basePath%>basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/one/cartstyle.css" rel="stylesheet" type="text/css" />

		<link href="<%=basePath%>css/one/jsstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="<%=basePath%>js/one/address.js"></script>

  </head>
  
  <body>
  
    	<%@ include file="fontHeader.jsp" %>
		
		<div class="concent">
			<!--地址 -->
			<form action="tradeRent/addRent.html" method="post">
			<div class="paycont">
				<div class="address">
					<h3>确认收货地址 </h3>
					<div class="clear"></div>
					<ul id="test">
					    <c:forEach begin="1" end="${count<=3?1:2}" step="3">
							<c:forEach items="${userAddresses}" var="addresses" >
							    <div class="per-border"></div>
									<li class="user-addresslist defaultAddr" id="${addresses.addressId}" onclick="liclick(this)">
		
										<div class="address-left">
											<div class="user DefaultAddr">
		
												<span class="buy-address-detail">   
		                                        <span class="buy-user">${addresses.userName}</span>
												<span class="buy-phone">${addresses.userPhone}</span>
												</span>
											</div>
											<div class="default-address DefaultAddr">
												<span class="buy-line-title buy-line-title-type">收货地址：</span>
												<span class="buy--address-detail">
										            <span class="province">${addresses.addressInfo}</span>
												</span>
											</div>
											<c:choose>
											    <c:when test="${addresses.addressType==true}">
											        <ins class="deftip">默认地址</ins>
											    </c:when>
											</c:choose>
										</div>
									</li>
							</c:forEach>
						</c:forEach>
					</ul>
					
					<script type="text/javascript">
						function liclick(self){//这里self接收节点中定义的this
							document.getElementById("address").value = self.id;//获取当前点击的li的id，这里会弹出id的值是test
							document.getElementById("name").value = self.getElementsByTagName("span")[1].innerHTML;
							document.getElementById("phone").value = self.getElementsByTagName("span")[2].innerHTML;
							document.getElementById("info").value = self.getElementsByTagName("span")[4].innerHTML;
							}
		            </script>

					<div class="clear"></div>
				</div>

				<!--订单 -->
				<!-- <form action="tradeRent/addRent.html" method="post"> -->
					<div class="concent">
						<div id="payTable">
							<h3>确认订单信息</h3>
							<div class="cart-table-th">
								<div class="wp">
	
									<div class="th th-item">
										<div class="td-inner">商品信息</div>
									</div>
									<div class="th th-price">
										<div class="td-inner">持有人</div>
									</div>
									<div class="th th-amount">
										<div class="td-inner">数量</div>
									</div>
									<div class="th th-sum">
										<div class="td-inner">租金</div>
									</div>
									<div class="th th-oplist">
										<div class="td-inner">商品类型</div>
									</div>
	
								</div>
							</div>
							<div class="clear"></div>
							
							<tr class="item-list">
								<div class="bundle  bundle-last">
	
									<div class="bundle-main">
										<ul class="item-content clearfix">
											<div class="pay-phone">
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint">
															<img style="height:80px; width: 80px " src="<%=basePath %>${trade.photo}" class="itempic J_ItemImg"></a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11">${trade.tradeName}</a>
														</div>
													</div>
												</li>
												<li class="td td-info">
													<div class="item-props">
														<span class="sku-line">${trade.trDescript}</span>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price price-promo-promo">
														<div class="price-content">
															<em class="J_Price price-now">${trade.user.nickName}</em>
														</div>
													</div>
												</li>
											</div>
											<li class="td td-amount">
												<div class="amount-wrapper ">
													<div class="item-amount ">
														<span class="phone-title">购买数量</span>
														<div class="sl">
															<input class="min am-btn" name="" type="button" value="-" />
															<input class="text_box" name="rentNum" type="text" value="${trade.tradeNum}" style="width:30px;" />
															<input class="add am-btn" name="" type="button" value="+" />
														</div>
													</div>
												</div>
											</li>
											<li class="td td-sum">
												<div class="td-inner">
													<em tabindex="0" class="J_ItemSum number">${trade.price}</em>
												</div>
											</li>
											<li class="td td-oplist">
												<div class="td-inner">
													<span class="phone-title">商品类型</span>
													<div class="pay-logis">
														${trade.tradeType.typeName}
													</div>
												</div>
											</li>
	
										</ul>
										<div class="clear"></div>
	
									</div>
							</tr>
							
							<div class="clear"></div>
						</div>
	                </div>
	                
						<div class="clear"></div>
						<!--含运费小计 -->
						<div class="buy-point-discharge ">
							<p class="price g_price ">
								押金： <span>¥</span><em class="pay-sum">${trade.tradeDeposit}</em>
							</p>
						</div>
		
					<!--信息 -->
					<div class="order-go clearfix">
						<div class="pay-confirm clearfix">
							<div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
								<span class="price g_price ">
	                                  <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">${trade.tradeDeposit+trade.price}</em>
								</span>
							</div>
	
							<div id="holyshit269" class="submitOrder" style="float: right;">
								<div class="go-btn-wrap" style="float: right;">
								    
										<input type="hidden" name="rentTradeId" value="${trade.tradeId}">
										<input type="hidden" name="rentUserId" value="${trade.user.userId}">
										<input type="hidden" name="price" value="${trade.tradeDeposit+trade.price}">
										<input type="hidden" name="typeId" value="${trade.tradeType.typeId}">
										<input type="hidden" id="name" name="userName" value="">
									    <input type="hidden" id="phone" name="userPhone" value="">
									    <input type="hidden" id="info" name="addressInfo" value="">
										<input type="hidden" id="address" name="addressId" value="">
										<input id="J_Go" class="btn-go submit am-btn"  value="提交订单" type="submit">
									
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
				</form>
			    <div class="clear"></div>
		</div>
		<%@ include file="fontFooter.jsp" %>
		</div>

		<div class="clear"></div>
		
  </body>
</html>
