<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>标题栏</title>
</head>
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
	<div class="logoBig">
		<li><img height=100px src="<%=basePath %>img/ddd.png" /></li>
	</div>

	<div class="search-bar pr">
		<a name="index_none_header_sysc" href="#"></a>
		<form action="<%=basePath %>trade/showAllByTradeName.html" method="post">
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