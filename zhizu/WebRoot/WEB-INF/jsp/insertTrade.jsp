<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	
	<title>上架商品</title>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
	<title>首页</title>
	
	<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
		type="text/css" />
	<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
		type="text/css" />
	
	<link href="<%=basePath %>basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath %>css/one/hmstyle.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath %>css/one/cartstyle.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath %>css/one/optstyle.css" rel="stylesheet" type="text/css" />
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>

<body>

	<!--头 -->
	<header>
		<article>
			<div class="hmtop">
					<%@ include file="fontHeader.jsp" %>
			</div>
		</article>
	</header>	
	
	<div class="shopNav">
		<div class="slideall" style="height: 40px;" >				  
			   <div class="long-title"><span class="all-goods">上架商品</span></div>
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
	</div>
	<b class="line"></b>
	<div class="concent">
		<div id="cartTable">
			<div class="cart-table-th">
				<div class="wp">
					<div class="th th-chk">
						<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
					</div>
					<div class="th th-item">
					<c:if test="${empty trade.tradeId }">
						<form class="am-form" action="<%=basePath %>trade/itemSave" method="post" enctype="multipart/form-data">
					</c:if>
					<c:if test="${!empty trade.tradeId }">
						<form class="am-form" action="<%=basePath %>trade/itemupdate" method="post" enctype="multipart/form-data">
					</c:if>
							<fieldset>
								
								<div class="am-form-group" >
									<label for="doc-ipt-email-1">商品名称</label> <input name="tradeName" type="text"
										class="am-input-sm" id="doc-ipt-email-1" value="${trade.tradeName }"
										 placeholder="请输入要上架的商品名称">
								</div>
								<label for="yuan">商品价格</label>
								<div class="am-input-group">
									<span class="am-input-group-label">￥</span> <input name="price" type="text"
										id="yuan" value="${trade.price }" class="am-form-field" style="width: 100px;">

								</div>
								<label for="yajin">商品押金</label>
								<div class="am-input-group">
									<span class="am-input-group-label">￥</span> <input type="text" name="tradeDeposit"
										id="yajin" value="${ trade.tradeDeposit}" class="am-form-field" style="width: 100px;">

								</div>


								<label for="yajin">商品数量</label>
								<div class="am-input-group">
									<span class="am-input-group-label">￥</span> <input type="text"
										value="${trade.tradeNum }" name="tradeNum" id="yajin" class="am-form-field" style="width: 100px;">

								</div>
								
								<c:if test="${empty trade.tradeId }">								
									<div class="am-form-group">
										<label class="am-radio-inline"> <input type="radio"
											name="tradeTypeId" value="3"> 图书
										</label> <label class="am-radio-inline"> <input type="radio"
											name="tradeTypeId" value="4">服饰
										</label> <label class="am-radio-inline"> <input type="radio"
											name="tradeTypeId" value="1"> 出行用品
										</label> <label class="am-radio-inline"> <input type="radio"
											name="tradeTypeId" value="5"> 运动
										</label> <label class="am-radio-inline"> <input type="radio"
											name="tradeTypeId" value="2"> 数码
										</label>
									</div>								
								</c:if>
								
								<c:if test="${!empty trade.tradeId }">	
									<input type="hidden"
											name="tradeId" value="${trade.tradeId }"> 
									<input type="hidden"
											name="tradeTypeId" value="${trade.tradeType.typeId }"> 
								</c:if>

								<!--<img style="height: 70px; width: 400px;" src="../images/1500106844_451481.png" />-->
								<div class=" am-form-file">
									<button type="button" class="am-btn am-btn-dange am-btn-sm">
										<i class="am-icon-cloud-upload"></i> 选择要上传的图片
									</button>
									<input value="${trade.photo }"  name="file" type="file" id="doc-ipt-file-2">
								</div>

								<div class="am-form-group">
									<label for="doc-ta-1">商品描述</label>
									<textarea name="trDescript" value="${trade.trDescript }" class="am-input-lg" rows="5" id="doc-ta-1">${trade.trDescript }</textarea>
								</div>

								<p>
									<button type="submit" class="am-btn am-btn-default">提交</button>
								</p>
							</fieldset>
						</form>
					</div>

				</div>

			</div>

			<div class="clear"></div>

			<div class="clear"></div>

		</div>
		<div class="clear"></div>

		<%@ include file="fontFooter.jsp" %>
	</div>

	<!--操作页面-->
<!-- 
	<div class="theme-popover-mask"></div>

	<div class="theme-popover">
		<div class="theme-span"></div>
		<div class="theme-poptit h-title">
			<a href="javascript:;" title="关闭" class="close">×</a>
		</div>
		<div class="theme-popbod dform">
			<form class="theme-signin" name="loginform" action="" method="post">

				<div class="theme-signin-left">

					<li class="theme-options">
						<div class="cart-title">颜色：</div>
						<ul>
							<li class="sku-line selected">12#川南玛瑙<i></i></li>
							<li class="sku-line">10#蜜橘色+17#樱花粉<i></i></li>
						</ul>
					</li>
					<li class="theme-options">
						<div class="cart-title">包装：</div>
						<ul>
							<li class="sku-line selected">包装：裸装<i></i></li>
							<li class="sku-line">两支手袋装（送彩带）<i></i></li>
						</ul>
					</li>
					<div class="theme-options">
						<div class="cart-title number">数量</div>
						<dd>
							<input class="min am-btn am-btn-default" name="" type="button"
								value="-" /> <input class="text_box" name="" type="text"
								value="1" style="width:30px;" /> <input
								class="add am-btn am-btn-default" name="" type="button"
								value="+" /> <span class="tb-hidden">库存<span
								class="stock">1000</span>件
							</span>
						</dd>

					</div>
					<div class="clear"></div>
					<div class="btn-op">
						<div class="btn am-btn am-btn-warning">确认</div>
						<div class="btn close am-btn am-btn-warning">取消</div>
					</div>

				</div>
				<div class="theme-signin-right">
					<div class="img-info">
						<img src="../images/kouhong.jpg_80x80.jpg" />
					</div>
					<div class="text-info">
						<span class="J_Price price-now">¥39.00</span> <span id="Stock"
							class="tb-hidden">库存<span class="stock">1000</span>件
						</span>
					</div>
				</div>

			</form>
		</div>
	</div>
	引导
	<div class="navCir">
		<li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
		<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
		<li class="active"><a href="shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>
	</div> -->
</body>

</html>
