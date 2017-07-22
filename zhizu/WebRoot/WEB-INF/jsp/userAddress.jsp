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
    
    <title>My JSP 'userAddress.jsp' starting page</title>
    
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
	<link href="<%=basePath %>css/one/addstyle.css" rel="stylesheet" type="text/css">
	<link href="<%=basePath %>css/one/stepstyle.css" rel="stylesheet" type="text/css">
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
                <!--  修改地址  -->
				<div class="main-wrap">

					<div class="user-address">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
						</div>
						<hr/>
						<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails" id="useraddress">
							<c:forEach items="${userAddresses }" var="address">
							<c:if test="${address.addressType == true }">
								<li class="user-addresslist defaultAddr">
							</c:if>
							<c:if test="${address.addressType != true }">
								<li class="user-addresslist">
							</c:if>
									<span class="new-option-r">
										<i class="am-icon-check-circle"></i>
										<input type="hidden" value="${address.addressId }" name="addressId">
										<a href="<%=basePath %>address/defaultAddress-${address.addressId}" style="color :white">设为默认</a>
									</span>
									
									<p class="new-tit new-p-re">
										<span class="new-txt">${address.userName }</span>
										<span class="new-txt-rd2">${address.userPhone }</span>
									</p>
									<div class="new-mu_l2a new-p-re">
										<p class="new-mu_l2cw">
											<span class="title">地址：</span>
											<span class="street">${address.addressInfo }</span></p>
									</div>
									<div class="new-addr-btn">
										<a href="<%=basePath %>address/updateAddress-${address.addressId}"><i class="am-icon-edit"></i>编辑</a>
										<span class="new-addr-bar">|</span>
										<a href="<%=basePath %>address/deleteAddress-${address.addressId}"><i class="am-icon-trash"></i>删除</a>
									</div>
								</li>
								
							</c:forEach>
							

						</ul>
						<div class="clear"></div>
						<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
						<!--例子-->
						<c:if test="${addr == null }">
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">
								
								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small> <strong style="color: red">（最多只能有六个地址）</strong></div>
								</div>
								
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									
									
									<form class="am-form am-form-horizontal" action="<c:url value="address/addAddress" />" method="post">
																	
								
										<div class="am-form-group">
											<label for="user-name" class="am-form-label">收货人</label>
											<div class="am-form-content">

												<input type="text" id="user-name" name="userName"  placeholder="收货人">
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-phone" class="am-form-label">手机号码</label>
											<div class="am-form-content">
												<input id="user-phone" name="userPhone" placeholder="手机号必填" type="tel">
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">详细地址</label>
											<div class="am-form-content">
												<textarea class="" rows="3" name="addressInfo" id="user-intro" placeholder="输入详细地址"></textarea>
												<small>100字以内写出你的详细地址...</small>
											</div>
										</div>

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<input type="submit" class="am-btn am-btn-danger" value="保存"/>	
											</div>
										</div>
									</form>
								</div>

							</div>

						</div>
						</c:if>
						
						<c:if test="${addr != null }">
							<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">
								
								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改地址</strong> / <small>Update&nbsp;address</small> </div>
								</div>
								
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									
										<form class="am-form am-form-horizontal" action="<c:url value="address/updateAddress" />" method="post">

										<div class="am-form-group">
											<label for="user-name" class="am-form-label">收货人</label>
											<div class="am-form-content">
												<input type="hidden" name="addressId" value="${addressId }"/>
												<input type="text" id="user-name" name="userName" value="${addr.userName }" placeholder="收货人">
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-phone" class="am-form-label">手机号码</label>
											<div class="am-form-content">
												<input id="user-phone" name="userPhone" value="${addr.userPhone }" placeholder="手机号必填" type="tel">
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">详细地址</label>
											<div class="am-form-content">
												<input type="hidden" name="addressType" value="${addressType }"/>
												<textarea class="" rows="3" name="addressInfo" id="user-intro" placeholder="输入详细地址">${addr.addressInfo }</textarea>
												<small>100字以内写出你的详细地址...</small>
											</div>
										</div>

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
											
												<input type="submit" class="am-btn am-btn-danger" value="保存修改"/>	

											</div>
										</div>
									</form>
								</div>

							</div>

						</div>
							
						</c:if>
					</div>

					<script type="text/javascript">
						$(document).ready(function() {
							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
							});
                            var temp = document.getElementById('useraddress');
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn");
							}
							if(temp.getElementsByTagName("li").length==6){
                                $("#doc-modal-1").addClass("am-modal am-modal-no-btn");
                            }
							
						});
					</script>

					<div class="clear"></div>

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
							<li class="active"> <a href="<%=basePath %>address/myAddress">收货地址</a></li>
						</ul>
					</li>
					<li class="person">

						<ul>
							<li><a href="<%=basePath %>order/showAllOrder">我的订单</a></li>
							<li><a href="<%=basePath %>publish/showAllPublish">租借申请</a></li>
							<li><a href="<%=basePath %>trade/showMyTrade">我的发布</a></li>
							<li><a href="<%=basePath %>showAllComment">我的评价</a></li>
						</ul>
					</li>


				</ul>

			</aside>
		</div>
  </body>
</html>
