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
						<!-- left side -->
						<div class="s-12 m-12 l-4">
							<div class="fullwidth margin-bottom-60">
								<img src="../img/about-us.jpg" alt="">
							</div>
							<div class="fullwidth hide-s hide-m">
								<div class="fullwidth">
									<div class="s-4 m-4 l-4">
										<a href="">
											<i class="fa fa-facebook follow-facebook"></i>
										</a>
									</div>
									<div class="s-4 m-4 l-4">
										<a href="">
											<i class="fa fa-twitter follow-twitter"></i>
										</a>
									</div>
									<div class="s-4 m-4 l-4">
										<a href="">
											<i class="fa fa-pinterest follow-pinterest"></i>
										</a>
									</div>
									<div class="s-4 m-4 l-4">
										<a href="">
											<i class="fa fa-instagram follow-instagram"></i>
										</a>
									</div>
									<div class="s-4 m-4 l-4">
										<a href="">
											<i class="fa fa-youtube follow-youtube"></i>
										</a>
									</div>
									<div class="s-4 m-4 l-4">
										<a href="">
											<i class="fa fa-google-plus follow-gplus"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
						<!-- right side -->
						<div class="s-12 m-12 l-8 padding-l-left-40">
							<h1>关于我们</h1>
							<hr class="break-small">
							<div class="fullwidth margin-bottom-60">
								<p>想要出售？访问我们简单的拍卖估算服务页面。

									我们的拍卖品手工艺品销售超过50 种，包括古董，艺术，美术，钟表。</p>
							</div>
							<div class="fullwidth margin-bottom-60">
								<div class="float-left">
									<i class="fa fa-paper-plane-o fa-3x text-primary"></i>
								</div>
								<div class="margin-left-70">
									<h3>成功买卖的提示</h3>
									<p>托运人始终如一地求助于本行，以实现其特殊物品的最高价格，精明的买家在寻找最优质的房产时依靠我们的专业知识。坐落在超过70℃ 我联系，我们的多种语言的工作人员可以指导您完成整个过程。艺术品收藏世界的新手？查看词汇条件以熟悉拍卖的语言。</p>
									<!--<a class="text-more-info text-primary-hover" href="">Read more</a>-->
								</div>
							</div>
							<div class="fullwidth margin-bottom-60">
								<div class="float-left">
									<i class="fa fa-eye fa-3x text-primary"></i>
								</div>
								<div class="margin-left-70">
									<h3>放心购买</h3>
									<p>当您希望购买精美的艺术品，珠宝，古董或其他有价值的财产时，我们经验丰富的专家可以帮助您确保拥有所需物品的所有权，从而增加您目前的收藏品。</p>
									<!--<a class="text-more-info text-primary-hover" href="">Read more</a>-->
								</div>
							</div>
							<div class="fullwidth margin-bottom-60">
								<div class="float-left">
									<i class="fa fa-diamond fa-3x text-primary"></i>
								</div>
								<div class="margin-left-70">
									<h3>以最高价卖出</h3>
									<p>当您要寄送特殊物品时，我们的专家团队将指导您完成列出特殊物品的基本步骤，并帮助确保成功销售。</p>
									<!--<a class="text-more-info text-primary-hover" href="">Read more</a>-->
								</div>
							</div>
							<div class="fullwidth margin-bottom-60">
								<div class="float-left">
									<i class="fa fa-calendar fa-3x text-primary"></i>
								</div>
								<div class="margin-left-70">
									<h3>需要帮助？</h3>
									<p>有关寻找或购买特定艺术品的指导，请查看我们的部门清单，以确定最适合您的需求的类别。我们的一位专家将很高兴为您提供咨询。</p>
									<!--<a class="text-more-info text-primary-hover" href="">Read more</a>-->
								</div>
							</div>
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
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/owl-carousel/owl.carousel.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/custom.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript">
        function out(){
            var result = confirm("确定要退出吗？");
            if(result){
                location.href="${pageContext.request.contextPath}/vueproduct/outlogin.do";
            }
        }
	</script>
	</div>

</html>