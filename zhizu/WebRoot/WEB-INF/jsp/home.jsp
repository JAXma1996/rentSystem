<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>首页</title>

		<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="<%=basePath %>basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="<%=basePath %>css/one/hmstyle.css" rel="stylesheet" type="text/css" />
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
				   <div class="long-title"><span class="all-goods">首页</span></div>
				   <div class="nav-cont">
						<ul>
                            <li class="qc"><a href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=1&tradeDeposit&price&tradeName">出行用品</a></li>
                            <li class="qc"><a href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=2&tradeDeposit&price&tradeName">数码产品</a></li>
                            <li class="qc"><a href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=3&tradeDeposit&price&tradeName">图书</a></li>
                            <li class="qc"><a href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=4&tradeDeposit&price&tradeName">衣服</a></li>
                            <li class="qc last"><a href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=5&tradeDeposit&price&tradeName">运动用品</a></li>
                            <li class="qc last"><a href="<%=basePath %>trade/publishItem"><img style="height:40px; width:40px;" src="<%=basePath %>img/one/plus.png">发布商品</img></a></li>
						</ul>
				  </div>
			</div>		
		</div>
		<b class="line"></b>
			
			<div class="shopMainbg">
				<div class="shopMain" id="shopmain">

					<!--今日推荐 -->

					<div class="am-g am-g-fixed recommendation">
						<div class="clock am-u-sm-3" >
							<img src="<%=basePath %>img/one/findgood.JPG "></img>
							<p>今日<br>推荐</p>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3> <a href="<%=basePath %>trade/introduction?tradeId=${guessULike[0].tradeId}">${guessULike[0].tradeName}</a></h3>
								
							</div>
							<div class="recommendationMain ">
								<img href="<%=basePath %>trade/introduction?tradeId=${guessULike[0].tradeId}" src="<%=basePath %>${guessULike[0].photo} "></img>
							</div>
						</div>						
						<div class="am-u-sm-4 am-u-lg-3 ">
						<div class="info ">
								<h3><a href="<%=basePath %>trade/introduction?tradeId=${guessULike[4].tradeId}">${guessULike[4].tradeName}</a></h3>
								
							</div>
							<div class="recommendationMain ">
								<img href="<%=basePath %>trade/introduction?tradeId=${guessULike[4].tradeId}" src="<%=basePath %>${guessULike[4].photo} "></img>
							</div>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3><a href="<%=basePath %>trade/introduction?tradeId=${guessULike[3].tradeId}">${guessULike[3].tradeName}</a></h3>
								
							</div>
							<div class="recommendationMain ">
								<img href="<%=basePath %>trade/introduction?tradeId=${guessULike[3].tradeId}" src="<%=basePath %>${guessULike[3].photo} "></img>
							</div>
						</div>

					</div>
					<div class="clear "></div>
				

					  <!--甜点-->
					  <!-- 循环五次，输出五个总类的list -->
			          <c:forEach items="${list}" var="tr" varStatus="Tid">		
					
			                 	<div class="clear "></div>
								<!--坚果-->
								<div class="am-container ">
									<div class="shopTitle ">
										<h4>${tr[0].tradeType.typeName}</h4>
										
										<span class="more ">
					                    	<a class="more-link" href="<%=basePath %>trade/showAllByTypeId.html?index&typeId=${tr[0].tradeType.typeId }&tradeDeposit&price&tradeName">
					                    		发现更多
					                    	</a>
			                        	</span>
									</div>
								</div>
								<div class="am-g am-g-fixed floodTwo ">
									<div class="am-u-sm-5 am-u-md-4 text-one ">
										<a href="<%=basePath %>trade/introduction?tradeId=${tr[0].tradeId}">
											<img src="<%=basePath %>${tr[0].photo }" />
											<div class="outer-con ">
												<div class="title ">
												<a href="<%=basePath %>trade/introduction?tradeId=${tr[0].tradeId}">
													${tr[0].tradeName }
												</a>
												</div>
												<div class="sub-title ">
													仅售：¥${tr[0].price }
												</div>
												
											</div>
										</a>
									</div>
									
									<div class="am-u-sm-7 am-u-md-4 am-u-lg-2 text-two">
											<div class="outer-con ">
												<div class="title ">
												${tr[1].tradeName }
												</div>
												
												<div class="sub-title ">
													仅售：¥${tr[1].price }
												</div>
											</div>
											<a href="<%=basePath %>trade/introduction?tradeId=${tr[1].tradeId}">
												<img width="100%" height="100%" src="<%=basePath %>${tr[1].photo } " />
											</a>						
									</div>
							
									
									<div class="am-u-md-4 am-u-lg-2 text-three">
										<div class="outer-con ">
											<div class="title ">
												${tr[2].tradeName }
											</div>
											
											<div class="sub-title ">
												仅售：¥${tr[2].price }
											</div>
										</div>
										<a href="<%=basePath %>trade/introduction?tradeId=${tr[3].tradeId}">
											<img width="100%" height="100%" src="<%=basePath %>${tr[2].photo } " />
										</a>	
									</div>
									
										<div class="am-u-md-4 am-u-lg-2 text-three">
											<div class="outer-con ">
												<div class="title ">
													${tr[3].tradeName }
												</div>
												
												<div class="sub-title ">
													仅售：¥${tr[3].price }
												</div>
											</div>
											<a href="<%=basePath %>trade/introduction?tradeId=${tr[3].tradeId}">
												<img width="100%" height="100%" src="<%=basePath %>${tr[3].photo } " />
											</a>	
										</div>
									
									<div class="am-u-sm-6 am-u-md-4 am-u-lg-2 text-two ">
											<div class="outer-con ">
												<div class="title ">
												${tr[4].tradeName }
												</div>
												
												<div class="sub-title ">
													仅售：¥${tr[4].price }							
												</div>
											</div>
											<a href="<%=basePath %>trade/introduction?tradeId=${tr[4].tradeId}">
												<img src="<%=basePath %>${tr[4].photo } " />
											</a>					
									</div>	
													
									<div class="am-u-sm-6 am-u-md-3 am-u-lg-2 text-four ">
											<div class="outer-con ">
											<div class="title ">
												${tr[5].tradeName }
											</div>
											
											<div class="sub-title ">
												仅售：¥${tr[5].price }
											</div>
										</div>
										<a href="<%=basePath %>trade/introduction?tradeId=${tr[5].tradeId}">
											<img width="100%" height="100%" src="<%=basePath %>${tr[5].photo } " />
										</a>				
									</div>	
											
									<div class="am-u-sm-4 am-u-md-3 am-u-lg-4 text-five">
										<div class="outer-con ">
											<div class="title ">
												${tr[6].tradeName }
											</div>
											
											<div class="sub-title ">
												仅售：¥${tr[6].price }
											</div>
										</div>
										<a href="<%=basePath %>trade/introduction?tradeId=${tr[6].tradeId}">
											<img src="<%=basePath %>${tr[6].photo } " />
										</a>	
									</div>
									
									<div class="am-u-sm-4 am-u-md-3 am-u-lg-2 text-six">
									<div class="outer-con ">
											<div class="title ">
												${tr[7].tradeName }
											</div>
											
											<div class="sub-title ">
												仅售：¥${tr[7].price }
											</div>
										</div>
										<a href="<%=basePath %>trade/introduction?tradeId=${tr[7].tradeId}">
											<img width="100%" height="100%" src="<%=basePath %>${tr[7].photo } " />
										</a>	
									</div>
									
										<div class="am-u-sm-4 am-u-md-3 am-u-lg-4 text-five">
										<div class="outer-con ">
												<div class="title ">
													${tr[8].tradeName }
												</div>
												
												<div class="sub-title ">
													仅售：¥${tr[8].price }
												</div>
											</div>
											<a href="<%=basePath %>trade/introduction?tradeId=${tr[8].tradeId}">
												<img width="100%" height="100%" src="<%=basePath %>${tr[8].photo } " />
											</a>
										</div>						
								</div>
			            		
								<div class="clear "></div>
			 
			
			                 </c:forEach>
				

					 
					<%@ include file="fontFooter.jsp" %>
				</div>
			</div>
		<!--引导 -->

		
		<!--菜单 -->

		<script>
			window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>
		
		<script type="text/javascript " src="<%=basePath %>basic/js/quick_links.js "></script>
	</body>

</html>