<%@ page import="com.test.ssm.domain.UserInfo" %>
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
			<% String type="0";if(session.getAttribute("backtype")!=null) {type = session.getAttribute("backtype").toString();} %>
			<% UserInfo userInfo = null;if(session.getAttribute("userInfo")!=null) {userInfo = (UserInfo) session.getAttribute("userInfo");} %>
			<% String uid="";if(userInfo!=null) {uid=userInfo.getId();}%>
			<% String uemail="";if(userInfo!=null) {uemail=userInfo.getEmail();}%>

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
								<a href="${pageContext.request.contextPath}/vueproduct/findAllCart.do?userid=<%=uid%>">我的拍买</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/vueproduct/findAllsole.do?uemail=<%=uemail%>">我的拍卖</a>
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

			<!-- PAGE CONTENT START -->
			<div class="section">
				<div class="line">
					<div class="margin">
						<div class="s-12 m-12 l-4 margin-bottom-30">
							<div class="fullwidth margin-bottom-40">
								<h2>联系我们</h2>
								<hr class="break-small">
								<p>联系方式</p>
							</div>
							<div class="fullwidth margin-bottom-50">
								<div class="float-left">
									<i class="fa fa-home text-white background-primary icon-square-small"></i>
								</div>
								<div class="margin-left-100">
									<h4 class="text-primary">地址</h4>
									<p>
										Xyz Street 7<br /> P.O.Box: 12345
									</p>
								</div>
							</div>
							<div class="fullwidth margin-bottom-50">
								<div class="float-left">
									<i class="fa fa-phone icon-square-small"></i>
								</div>
								<div class="margin-left-100">
									<h4 class="text-primary">Calls</h4>
									<p>
										0000 1234 567 89<br /> 0000 1234 567 89
									</p>
								</div>
							</div>
							<div class="fullwidth margin-m-bottom-60">
								<div class="float-left">
									<i class="fa fa-envelope text-white background-primary icon-square-small"></i>
								</div>
								<div class="margin-left-100">
									<h4 class="text-primary">邮箱</h4>
									<p>
										873551076@qq.com<br /> xyz@yourwe.com
									</p>
								</div>
							</div>
						</div>
						<div class="s-12 m-12 l-8">
							<div class="padding-m-s-left-50">
								<div class="fullwidth margin-bottom-40">
									<h2>提供建议</h2>
									<hr class="break-small">
									<p>填写个人信息以及建议</p>
								</div>
								<form class="customform" name="contact-us-form" method="post">
									<div class="margin">
										<div class="s-12 m-6 l-6">
											<input type="text" name="name" placeholder="Full Name" title="Full Name" required />
										</div>
										<div class="s-12 m-6 l-6">
											<input type="text" name="email" placeholder="Email" title="Email" required />
										</div>
									</div>
									<div class="margin">
										<div class="s-12 m-6 l-6">
											<input type="text" name="mobile" placeholder="Mobile" title="Mobile Number" required />
										</div>
										<div class="s-12 m-6 l-6">
											<input type="text" name="subject" placeholder="Subject" title="Subject" />
										</div>
									</div>
									<div class="fullwidth">
										<textarea name="message" placeholder="Type your message" rows="2" required></textarea>
									</div>
									<div class="fullwidth">
										<input type="submit" value="提交">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- PAGE CONTENT END -->



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