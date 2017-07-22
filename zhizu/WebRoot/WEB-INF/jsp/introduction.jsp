<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
	<title>商品页面</title>
	
	<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/admin.css"
		rel="stylesheet" type="text/css" />
	<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.css"
		rel="stylesheet" type="text/css" />
	<link href="<%=basePath %>basic/css/demo.css" rel="stylesheet"
		type="text/css" />
	<link type="text/css" href="<%=basePath %>css/one/optstyle.css"
		rel="stylesheet" />
	<link type="text/css" href="<%=basePath %>css/one/style.css"
		rel="stylesheet" />
	
	<script type="text/javascript"
		src="<%=basePath %>basic/js/jquery-1.7.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath %>basic/js/quick_links.js"></script>
	
	<script type="text/javascript"
		src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	<script type="text/javascript"
		src="<%=basePath %>js/one/jquery.imagezoom.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath %>js/one/jquery.flexslider.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/one/list.js"></script>

</head>

<body>

	<!--头 -->
	<header>
		<article>
			<%@ include file="fontHeader.jsp" %>
		</article>
	</header>
	<b class="line"></b>
	<div class="listMain">

		<!--分类-->
		<div class="nav-table">
			<div class="long-title">
				<span class="all-goods">商品详情</span>
			</div>
		</div>
		<ol class="am-breadcrumb am-breadcrumb-slash">
			<li><a href="<%=basePath %>trade/showAll">首页</a></li>
			<li><a href="#">分类</a></li>
			<li class="am-active">商品详情</li>
		</ol>




		<div class="item-inform">
			<div class="clearfixLeft" id="clearcontent">

				<div class="box">

					<div class="tb-booth tb-pic tb-s310">
						<a><img
							src="<%=basePath %>${trade.photo}"
							rel="<%=basePath %>${trade.photo}"class="jqzoom" /></a>
					</div>
				</div>

				<div class="clear"></div>
			</div>

			<div class="clearfixRight">

				<!--名称-->
				<div class="tb-detail-hd">
					<h1>${trade.tradeName }</h1>
				</div>
				<div class="tb-detail-list">
					<!--价格-->
					<div class="tb-detail-price" style="height: 310px;">
						<li class="price iteminfo_price">
							<dt>租金</dt>
							<dd>
								<b>￥${trade.price }</b>
							</dd>
						</li>
						<li class="price iteminfo_mktprice">
							<dt>原所持人</dt>
							<dd>
								<b>${trade.user.nickName }</b>
							</dd>
						</li>
						<li class="price iteminfo_mktprice">
							<dt>商品分类</dt>
							<dd>${trade.tradeType.typeName }</dd>
						</li>
						<li class="price iteminfo_mktprice">
							<dt>商品详情</dt>
							<dd>
								<b>${trade.trDescript }</b>
							</dd>
						</li>
						<li class="price iteminfo_mktprice">
							<dt>上架数量</dt>
							<dd>
								<b> ${trade.tradeNum }</b>
							</dd>
						</li>
						<li class="price iteminfo_mktprice">
							<dt>上架时间</dt>
							<dd>
								<b><fmt:formatDate type="date" value="${trade.createDate }" /></b>
							</dd>
						</li>
						<li class="price iteminfo_mktprice">
							<dt>押金</dt>
							<dd>
								<em>¥</em><b>${trade.tradeDeposit }</b>
							</dd>
						</li>
						<div class="clear"></div>
					</div>

					<div class="clear"></div>

				</div>

				<div class="pay">

					<li>
						<div class="clearfix tb-btn tb-btn-buy theme-login">
							<a id="LikBuy" title="点此按钮到下一步确认租借信息" href="<%=basePath %>tradeRent/userRent.html?tradeId=${trade.tradeId}">立即租借</a>
						</div>
					</li>
				</div>

			</div>

			<div class="clear"></div>

		</div>

		<!-- introduce-->

		<div class="introduce">

			<div class="introduceMain" style="margin-left: 11%">
				<div class="am-tabs" data-am-tabs>
					<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
						<li><a href="#"> <span class="index-needs-dt-txt">全部评价</span></a>

						</li>
					</ul>

					<div class="am-tabs-bd">

						<div class="am-tab-panel am-fade">

							<div class="clear"></div>

							<ul class="am-comments-list am-comments-list-flip">
								<c:forEach items="${listcom }" var="com">
									<li class="am-comment">
										<!-- 评论容器 --> <a href=""> <img class="am-comment-avatar"
											src="<%=basePath %>${com.user.photo}" /> <!-- 评论者头像 -->
									</a>

										<div class="am-comment-main">
											<!-- 评论内容容器 -->
											<header class="am-comment-hd"> <!--<h3 class="am-comment-title">评论标题</h3>-->
											<div class="am-comment-meta">
												<!-- 评论元数据 -->
												<a href="#link-to-user" class="am-comment-author">${com.user.nickName }
													(匿名)</a>
												<!-- 评论者 -->
												评论于
												<time datetime=""><fmt:formatDate type="date" value="${com.createDate }" />  </time>
											</div>
											</header>

											<div class="am-comment-bd">
												<div class="tb-rev-item " data-id="255776406962">
													<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
														${com.comment }
														
														${com.trade.tradeName }
													</div>
												
												</div>

											</div>
											<!-- 评论内容 -->
										</div>
									</li>
								</c:forEach>

							</ul>

							<div class="clear"></div>

							<!--分页 -->
						
							<div class="clear"></div>

							<div class="tb-reviewsft">
								<div class="tb-rate-alert type-attention">
									租借前请查看该商品的 <a href="#" target="_blank">租借保障</a>，明确您的租借保障权益。
								</div>
							</div>

						</div>

					</div>

				</div>

				<div class="clear"></div>

				<%@ include file="fontFooter.jsp" %>
			</div>

		</div>
	</div>

</body>

</html>