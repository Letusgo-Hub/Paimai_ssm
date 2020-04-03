﻿<%@ page import="com.test.ssm.domain.UserInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="com.test.ssm.domain.UserInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">

<head>
	<meta charset="UTF-8">
	<title></title>
	<!-- Stylesheets -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myresponsee.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<!--Favicon-->
	<link rel="shortcut icon" href="img/favicon.ico" type="${pageContext.request.contextPath}/image/x-icon">
	<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">

	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<!-- Responsive -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="css/responsive.css" rel="stylesheet">
	<!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script><![endif]-->
	<!--[if lt IE 9]><script src="${pageContext.request.contextPath}/js/respond.js"></script><![endif]-->
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>

<div class="size-1140" >

	<div id="app">
		<!-- HIDDEN PRODUCTS MENU START -->
		<!-- HIDDEN PRODUCTS MENU END -->

		<!-- |||||||||||||||||| page start ||||||||||||||||||| -->
		<!-- ||||| -->
			<% String statuep="正在拍卖";%>


        <% String type="0";if(session.getAttribute("backtype")!=null) {type = session.getAttribute("backtype").toString();} %>
        <% UserInfo userInfo = null;if(session.getAttribute("userInfo")!=null) {userInfo = (UserInfo) session.getAttribute("userInfo");} %>
            <% String id="";if(userInfo!=null) {id=userInfo.getId();}%>

        <div id="page-main-content" >
			<!-- ||||| -->
			<!-- ||||||||||||||||||||||||||||||||||||||||||||||||| -->

			<!-- HEADER START -->
			<header>
				<!-- top bar start -->
				<div id="topbar" class="background-primary">
					<div class="line">
						<!-- social icons -->
						<div class="s-12 m-12 l-6">
							<ul>
								<li>
									<a href="#"><i class="fa fa-instagram"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-linkedin"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-twitter"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-google-plus"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-youtube"></i></a>
								</li>
								<li class="hide-s">
									<a href="#"><i class="fa fa-pinterest"></i></a>
								</li>
							</ul>
						</div>
						<!-- contact details -->
						<div class="l-6 hide-s hide-m">
							<div class="right">
								<ul class="topbar-menu">

									<c:choose>
										<c:when test='<%= type.equals("1")%>'>
											<li>
												<a href="#"><h4 style="color: white"> 欢迎你：<%=userInfo.getUsername()%></h4></a>
											</li>
											<li>
												<a onclick="out()"><h4 style="color: white">注销</h4></a>
											</li>
										</c:when>
										<c:when test='<%= type.equals("2")%>'>
											<li>
												<a href="#"><h4 style="color: white"> <%=userInfo.getUsername()%></h4></a>
											</li>
											<li>
												<a onclick="out()"><h4 style="color: white">注销</h4></a>
											</li>
										</c:when>
										<c:otherwise>
											<li>
												<a href="${pageContext.request.contextPath}/u-login.jsp"><h4 style="color: white">登陆</h4></a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/u-register.jsp"><h4 style="color: white">注册</h4></a>
											</li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- top bar end -->

				<!-- navigation and search -->
				<nav class="background-dark" style="text-align: center;">

					<!-- navigation -->
					<a class="nav-text"></a>
					<div class="top-nav s-12 m-12 l-9 ">
						<ul class="left chevron" style="display: inline-block;float: none;">

							<li>
								<a href="${pageContext.request.contextPath}/u-index.jsp">主页</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/user-page/about-us.jsp">关于我们</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/user-page/contact-us.jsp">联系我们</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/vueproduct/findImportPro.do">重点拍卖</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/user-page/cart.jsp">我的拍买</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/user-page/sole.jsp">我的拍卖</a>
							</li>
						</ul>
					</div>
					<div class="tab-nav  " style="padding-top:20px;">
						<!--search-->
                        <form class="navbar-form navbar-left" action="${pageContext.request.contextPath}/vueproduct/findByInput.do" method="post">
                            <div class="form-group">
                                <input type="text" name="inputname"class="form-control .input-group" placeholder="输入名字">
                            </div>
                            <button type="submit" class="btn btn-default">查找</button>
                        </form>
					</div>
				</nav>
			</header>
			<!-- HEADER END -->

			<!-- PRODUCT DETAIL START -->
			<div class="section">
				<div class="line">
					<div class="margin">
						<!-- product image -->
						<div class="s-12 m-4 l-5 margin-bottom">
							<img src="${pageContext.request.contextPath}/${product.pictureURL}" alt="">
						</div>
						<!-- product detail -->
						<div class="s-12 m-8 l-7 padding-l-left">
							<h2 class="text-primary">${product.productName }</h2>
							<p>
                                ${product.pdescribe}							</p>
							<ul class="speciality margin-bottom">
								起拍价格：<li>${product.startbid}$</li>(每次加价不少于1$)
								现在拍卖价格：<li>${product.nowbid}$</li>
                                <c:choose>
                                <c:when test="${product.productstatue eq '正在拍卖'}">
                                截至拍卖时间：<li>${product.pendtime}</li>
                                </c:when>
                                <c:when test="${product.productstatue eq '拍卖结束'}">
                                    <li>拍卖已经截至感谢关注</li>
                            </c:when>
                             </c:choose>
							</ul>
                            <form action="${pageContext.request.contextPath}/order/inserIntoOrder.do" method="post">
							<div class="fullwidth margin-bottom-40">
								<div class="numbers-row">
									<label>价格:</label>
									<input type="text" name="maxmoney" class="quantity" id="french-hens" value="${product.nowbid +1}">
                                    <input type="hidden" name="productId" value="${product.id}">
                                    <input type="hidden" name="userid" value="<%=id%>">
                                    <input type="hidden" name="orderStatus" value="未支付">
                                    <input type="hidden" name="payType" value="未支付">
                                    <input type="hidden" name="succordef" value="正在拍卖">
                                </div>
                                <div class="s-12 m-6 l-4">
                                    <input type="submit" class="button" value="竞价" style="background: white;width: 80px;height: 30px"></input>
                                </div>
							</div>
                            </form>
						</div>
					</div>
				</div>
			</div>
			<!-- PRODUCT DETAIL END -->

			<!-- PRODUCT TAB START -->
			<div class="section padding-top-0">
				<div class="line">
					<div class="fullwidth">
						<div class="tabs left">
							<div class="tab-item tab-active">
								<a class="tab-label active-btn">描述</a>
								<div class="tab-content padding-left-10">
									<h3>描述
                                    </h3>
                                    <p>${product.productName}</p>
									<p>${product.pdescribe}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- PRODUCT TAB END -->

			<!-- RELATED PRODUCTS START -->
			<div class="section padding-top-0">
				<div class="line">
					<div class="margin">
						<div class="fullwidth margin-bottom-20">
							<h2 class="text-center">同类商品</h2>
							<hr class="break-small break-center">
						</div>
						<c:forEach items="${productlist2}" var="product" begin="0" step="2" end="7">

						<!-- product 1 -->
						<div class="s-12 m-4 l-3 margin-bottom-30">
							<div class="margin">
								<div class="fullwidth">
									<figure class="imghvr-reveal-down">
										<img src="${pageContext.request.contextPath}/${product.pictureURL}">
										<figcaption>
											<div class="product-hover-content">
												<div class="btn-box">
													<a href="${pageContext.request.contextPath}/product/uFindProductById.do?id=${product.id}" class="btn">立即竞拍</a>
												</div>
											</div>
										</figcaption>
									</figure>
								</div>
								<div class="fullwidth">
									<h5>${product.productName}</h5>
									<p class="text-center"><span class="strike">${product.startbid}</span> &nbsp;&nbsp; <span class="text-primary">${product.nowbid}</span></p>
								</div>
							</div>
						</div>
						</c:forEach>


					</div>
				</div>
			</div>
			<!-- RELATED PRODUCTS END -->

			<!-- FOOTER START -->
			<footer>
				<!-- footer bottom bar -->
				<div class="copyright">
					<div class="line">
						<div class="margin">
							<!-- left -->
							<div class="s-12 m-12 l-8 footer-links">
								<ul class="footer-bar-links">
									<li>
										<a href="${pageContext.request.contextPath}/user-page/contact-us.jsp">联系我们</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/user-page/products.jsp">购物</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/user-page/about-us.jsp">关于我们</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/user-page/products.jsp">重点拍卖</a>
									</li>
								</ul>
								<p>Copyright &copy; 2020 Made By yanghaobin
								</p>
							</div>
							<!-- right -->
							<div class="s-12 m-12 l-4 payment-methods">
								<i class="fa fa-cc-visa fa-2x"></i>
								<i class="fa fa-cc-mastercard fa-2x"></i>
								<i class="fa fa-cc-paypal fa-2x"></i>
								<i class="fa fa-credit-card fa-2x"></i>
							</div>
						</div>
					</div>
				</div>
			</footer>
			<!-- FOOTER END -->

			<!-- |||||||||||| page end ||||||||||||| -->
			<!-- ||||||||| -->
		</div>
		<!-- ||||||||| -->
		<!-- |||||||||||| page end ||||||||||||| -->

		<!-- jQuery Files -->
		<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="../owl-carousel/owl.carousel.js"></script>
		<script type="text/javascript" src="../js/custom.js"></script>
		<script type="text/javascript" src="../js/bootstrap.min.js"></script>
		<script type="text/javascript">
            function out(){
                var result = confirm("确定要退出吗？");
                if(result){
                    location.href="${pageContext.request.contextPath}/vueproduct/outlogin.do";
                }
            }
		</script>
	</body>

</html>