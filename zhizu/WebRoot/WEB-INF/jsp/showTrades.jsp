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
    
    <title>商品展示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

	<link href="<%=basePath%>basic/css/demo.css" rel="stylesheet" type="text/css" />

	<link href="<%=basePath%>css/one/seastyle.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="<%=basePath%>basic/js/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/one/script.js"></script>

  </head>
  
  <body>
	    	<!--顶部导航条 -->
			<div class="am-container header">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
							<c:if test="${empty USER_CONTEXT }">
								<a href="<%=basePath %>doLogin.html" target="_top" class="h">亲，请登录</a> 
								<a href="<%=basePath %>doRegister.html" target="_top">免费注册</a>
							</c:if>
							<c:if test="${!empty USER_CONTEXT }">
							       欢迎${USER_CONTEXT.nickName }
							   <a href="<%=basePath %>doLoginOut.html" target="_top">注销用户</a>
							</c:if>	
							
						</div>
					</div>
				</ul>
				<ul class="message-r">
					<div class="topMessage home">
						<div class="menu-hd"><a href="<%=basePath %>myHome.html" target="_top" class="h">商城首页</a></div>
					</div>
					<div class="topMessage my-shangcheng">
						<div class="menu-hd MyShangcheng"><a href="<%=basePath %>user/userInfo" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
					</div>	
				</ul>
			</div>

			<!--悬浮搜索框-->

			<div class="nav white">
				<div class="logo"><img src="img/one/fish2.png" /></div>
				<div class="logoBig">
					<li><img src="img/one/fish2.png" /></li>
				</div>

				<div class="search-bar pr">
					<a name="index_none_header_sysc" href="#"></a>
					<form action="<%=basePath %>trade/showAllByTypeId" method="post">
						<input type="hidden" name="index" value="${pageUtil.index}">
						<input type="hidden" name="typeId" value="${pageUtil.list[0].tradeType.typeId}">
						<input type="hidden" name="tradeDeposit" value="${tradeDeposit1}">
						<input type="hidden" name="price" value="${price1}">
						<input id="searchInput" name="tradeName" type="text" placeholder="搜索" autocomplete="off">
						<input id="ai-topsearch" class="submit am-btn"  value="搜索" index="1" type="submit">
					</form>
				</div>
			</div>

			<div class="clear"></div>
			<b class="line"></b>
            <div class="search">
				<div class="search-list">
					<div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="#">首页</a></li>
                                <li class="qc"><a href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=1&tradeDeposit&price&tradeName">出行用品</a></li>
                                <li class="qc"><a href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=2&tradeDeposit&price&tradeName">数码产品</a></li>
                                <li class="qc"><a href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=3&tradeDeposit&price&tradeName">图书</a></li>
                                <li class="qc"><a href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=4&tradeDeposit&price&tradeName">衣服</a></li>
                                <li class="qc last"><a href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=5&tradeDeposit&price&tradeName">运动用品</a></li>
								<li class="qc last"><a href="<%=basePath %>trade/publishItem"><img style="height:40px; width:40px;" src="img/one/plus.png">发布商品</img></a></li>
							</ul>
						    <!--<div class="nav-extra">
						    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
						    </div> -->
					</div>
				</div>
			
				
					<div class="am-g am-g-fixed">
						<div class="am-u-sm-12 am-u-md-12">
	                  	<div class="theme-popover">		
	                  		
							<div class="clear"></div>
                        </div>
                        
							<div class="search-content">
								<div class="sort">
										<li class="first"><a title="综合"  href="<%=basePath %>trade/showAllByType.html?index&typeId=${pageUtil.list[0].tradeType.typeId}&tradeDeposit=1&price&tradeName">综合排序</a></li>
										<li><a title="押金"  href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=${pageUtil.list[0].tradeType.typeId}&tradeDeposit=1&price&tradeName">押金排序</a></li>
										<li><a title="价格"  href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=${pageUtil.list[0].tradeType.typeId}&tradeDeposit&price=1&tradeName">价格优先</a></li>
										
								</div>
								<div class="clear"></div>

								<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
									

	                                <c:forEach begin="1" end="${pageUtil.count<12?1:pageUtil.count/12}" step="4">
									    <c:forEach items="${pageUtil.list}" var="trade" >
											<li>
												<div class="i-pic limit">
													<img src="${trade.photo}" href="<%=basePath %>trade/introduction?tradeId=${trade.tradeId}" alt="图片显示异常！" />											
													<a href="<%=basePath %>trade/introduction?tradeId=${trade.tradeId}"><p class="title fl">${trade.tradeName}</p></a>
													<p class="price fl">
														
														<b>¥<strong>${trade.price}</strong>/天</b>
														
													</p>
													<p class="number fl">
														押金<span>¥${trade.tradeDeposit}</span>
													</p>
												</div>
											</li>
									
									    </c:forEach>
									</c:forEach>
								</ul>
							</div>
							
							<!-- 经典搭配 -->
							<div class="search-side">

								<div class="side-title">
									优秀租品
								</div>

                                <c:forEach begin="1" end="${pageUtil.pageNumber>pageUtil.index ? 3 : ((pageUtil.count%12)%4==0 ? (pageUtil.count%12)/4 : (pageUtil.count%12)/4+1)}" 
                                   items="${pageUtil.list}" var="trade">
										<li>
											<div class="i-pic limit">
												<img src="${trade.photo}" href="<%=basePath %>trade/introduction?tradeId=${trade.tradeId}" alt="图片显示异常！" />											
												<a href="<%=basePath %>trade/introduction?tradeId=${trade.tradeId}"><p class="title fl">${trade.tradeName}</p></a>
												<p class="price fl">
													<b>¥/天</b>
													<strong>${trade.price}</strong>
												</p>
												<p class="number fl">
													押金<span>${trade.tradeDeposit}¥</span>
												</p>
											</div>
										</li>
								</c:forEach>	
								

							</div>
							
							<div class="clear"></div>
							
							<!--分页 -->
							<ul class="am-pagination am-pagination-right">
								<li class="am-disabled">共 ${pageUtil.pageNumber}页</li>
								<li class="am-active">当前第  ${pageUtil.index}页</li>
								<li><a href="trade/showAllByTypeId.html?index=1&typeId=${pageUtil.list[0].tradeType.typeId}&tradeDeposit=${tradeDeposit1}&price=${price1}&tradeName=${tradeName1}">首页</a></li>
								<li><a href="trade/showAllByTypeId.html?index=${pageUtil.index>1? pageUtil.index-1 : 1}&typeId=${pageUtil.list[0].tradeType.typeId}&tradeDeposit=${tradeDeposit1}&price=${price1}&tradeName=${tradeName1}">上一页</a></li>
								<c:forEach begin="1" end="${pageUtil.pageNumber}" var="i">
								    <li><a href="trade/showAllByTypeId.html?index=${i}&typeId=${pageUtil.list[0].tradeType.typeId}&tradeDeposit=${tradeDeposit1}&price=${price1}&tradeName=${tradeName1}">${i}</a></li>
								</c:forEach>
								<li><a href="trade/showAllByTypeId.html?index=${pageUtil.pageNumber>pageUtil.index ? pageUtil.index+1 : pageUtil.pageNumber}&typeId=${pageUtil.list[0].tradeType.typeId}&tradeDeposit=${tradeDeposit1}&price=${price1}&tradeName=${tradeName1}">下一页</a></li>
								<li><a href="trade/showAllByTypeId.html?index=${pageUtil.pageNumber}&typeId=${pageUtil.list[0].tradeType.typeId}&tradeDeposit=${tradeDeposit1}&price=${price1}&tradeName=${tradeName1}">末页</a></li>
							</ul>

						</div>
					</div>
					
					<!--底部-->
					
					<%@ include file="fontFooter.jsp" %>
				</div>
	
			</div>

		<script>
			window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
		</script>
		<script type="text/javascript" src="<%=basePath%>basic/js/quick_links.js"></script>


  </body>
</html>
