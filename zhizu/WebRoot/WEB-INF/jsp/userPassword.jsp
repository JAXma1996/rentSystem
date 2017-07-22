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
    
    <title>我的密码</title>
    
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
	
	<link href="<%=basePath %>css/one/stepstyle.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
	
	
	<script>
		function mycheck(){
		var checked = false;
 		
	    try {
	    	
	        if(document.all("newPassword").value != document.all("confirmPassword").value){
	            alert("两次输入的密码不正确，请更正。");
	            newpassword.focus();
	            document.all("newPassword").value="";
	            document.all("confirmPassword").value="";
	            return false;
	        } else {
	        	
	        	alert("密码更新成功！");
	        	
	            checked = true;
	        }
	    } catch(e) {
	        checked = false;
	    }
 
 
    	return checked ? true : false;
		}
		function finish(){
			document.getElementById("finish").setAttribute('class','step-1 step');
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
                <!--  修改密码  -->
				<div class="main-wrap">

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">重置密码</p>
                            </span>
							<span class="step-2 step" id="finish">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<form class="am-form am-form-horizontal" action="<c:url value="user/updatePassword" />" method="post" onsubmit="return mycheck()">
						<div class="am-form-group">
							<label for="oldPassword" class="am-form-label">原密码</label>
							<div class="am-form-content">
								<input type="password" id="oldPassword" placeholder="请输入原登录密码" >
								
								<input type="hidden" id="check" value="原密码不正确，请重新输入">
							</div>
						</div>
						
						<script type="text/javascript">  
						    $(document.all("oldPassword")).blur(function myFunction() {
						      
						    	if(document.all("oldPassword").value != ${USER_CONTEXT.password}){
	           						 oldPassword.focus();
	           						 document.all("oldPassword").value="";
	           						 $("input[id='check']").prop("type","text");
	           						 //document.getElementById('check').setAttribute("hidden",false);
	           						 //$("input[id='check']").css('background-color','red');
	           					}else{
	           						 $("input[id='check']").prop("type","hidden");
	           					}
						        //new BacklogOverview("${param.alert}");  
						    });  
						</script>  
						
						<div class="am-form-group">
							<label for="newPassword" class="am-form-label">新密码</label>
							<div class="am-form-content">
								<input type="password" id="newPassword" name="newPassword" placeholder="由数字、字母组合">
							</div>
						</div>
						<div class="am-form-group">
							<label for="confirmPassword" class="am-form-label">确认密码</label>
							<div class="am-form-content">
								<input type="password" id="confirmPassword" placeholder="请再次输入上面的密码" onblur="finish()">
							</div>
						</div>
						<div class="info-btn">
							<input type="submit" class="am-btn am-btn-danger" value="保存修改"/>	
						</div>

					</form>

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
							<li class="active"> <a href="<%=basePath %>user/myPassword">我的密码</a></li>
							<li><a href="<%=basePath %>address/myAddress">收货地址</a></li>
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
