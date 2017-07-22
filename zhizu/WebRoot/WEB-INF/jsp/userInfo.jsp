
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户信息</title>
    
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
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
    <script>
	   function mycheck(){
	   		var iphone = document.all("iphone").value;
	   		if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(iphone))){ 
		        alert("不是完整的11位手机号或者正确的手机号前七位"); 
		        document.all("iphone").focus(); 
		        return false; 
		    } 
		    else
	        {
	           alert("资料保存成功！");
	           return true;
	        }
	   }
	</script>

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

					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
						</div>
						<hr/>
						<form class="am-form am-form-horizontal" action="<c:url value="user/userInfo" />" method="post" onSubmit="return mycheck()" enctype="multipart/form-data">
						<!--头像 -->
						<div class="user-infoPic">

							<div class="filePic">

								<img class="am-circle am-img-thumbnail" src="<%=basePath %>${user.photo}" alt="" />
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i><strong>${user.userName }</strong></i></b></div>

								<div class="filePic">
									<input type="file" class="inputPic" name="file" value="<%=basePath %>${user.photo}" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
                                        <div class="am-btn am-btn-danger">修改头像</div>
                                    </input>
								</div>
							</div>
						</div>

						<!--个人信息 -->
						<div class="info-main">
							
								
								<div class="am-form-group">
									<label for="nickName" class="am-form-label">用户昵称</label>
									<div class="am-form-content">
										<input type="text" id="nickName" name="nickName" value="${user.nickName }" placeholder="nickname">
										<input type="hidden" name="userId" value="${user.userId }">
										
									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">性别</label>
									<div class="am-form-content sex">
										<c:choose>
							  				<c:when test="${user.sex.equals('男') }">
							  					<label class="am-radio-inline">
													<input type="radio" name="sex" value="男" checked="checked"> 男
												</label>
												<label class="am-radio-inline">
													<input type="radio" name="sex" value="女" > 女
												</label>
												<label class="am-radio-inline">
													<input type="radio" name="sex" value="密" > 保密
												</label>
							  				</c:when>
							  				<c:when test="${user.sex.equals('女') }">
							  					<label class="am-radio-inline">
													<input type="radio" name="sex" value="男" > 男
												</label>
												<label class="am-radio-inline">
													<input type="radio" name="sex" value="女" checked="checked"> 女
												</label>
												<label class="am-radio-inline">
													<input type="radio" name="sex" value="密" > 保密
												</label>
							  				</c:when>
							  				<c:otherwise>
							  					<label class="am-radio-inline">
													<input type="radio" name="sex" value="男" > 男
												</label>
												<label class="am-radio-inline">
													<input type="radio" name="sex" value="女" > 女
												</label>
												<label class="am-radio-inline">
													<input type="radio" name="sex" value="密" checked="checked"> 保密
												</label>
							  				</c:otherwise>
							  			</c:choose>
										
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-birth" class="am-form-label">生日</label>
									<div class="am-form-content birth">
										<% 
											if(request.getAttribute("birthDate") !=null){
												String birthDate = request.getAttribute("birthDate").toString();
											}
										%>
										<input type="date" id="user-birth" name="birthDate" value="${birthDate }">
									</div>
							
								</div>
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">电话</label>
									<div class="am-form-content">
										<input id="user-phone" name="iphone" value="${user.iphone }" placeholder="telephonenumber" type="tel">

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">用户地址</label>
									<div class="am-form-content">
										<input id="user-email" name="address" value="${user.address }" placeholder="Email" type="text">

									</div>
								</div>
								
								<div class="info-btn">
									<input type="submit" class="am-btn am-btn-danger" value="保存修改"/>	
								</div>
								
							</form>
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
							<li class="active"> <a href="<%=basePath %>user/userInfo">个人信息</a></li>
							<li> <a href="<%=basePath %>user/myPassword">我的密码</a></li>
							<li> <a href="<%=basePath %>address/myAddress">收货地址</a></li>
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
