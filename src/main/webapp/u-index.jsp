<%@ page import="com.test.ssm.domain.UserInfo"  %>
<% request.setCharacterEncoding("UTF-8");%>
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

			<!-- SLIDESHOW START -->
			<div class="carousel-fade-transition owl-carousel carousel-main">
				<!-- slide 1 -->
				<div class="item">
					<!-- slideshow photo -->
					<div class="image-box">
						<div class="image">
							<img src="img/slideshow/slide1.jpg" alt="">
						</div>
					</div>
					<!-- slideshow content -->
					<div class="carousel-content">
						<div class="content-center-vertical line">
							<div class="s-12 m-8 l-7">
								<h1 class="margin-bottom-10 animated-carousel-element"><font color="white">Watches Online</font></h1>
								<p class="margin-bottom-30 animated-carousel-element slow">
									<font color="white">网上竞标截止时间：2020年3月26日| 太平洋标准时间下午10:00</font>
								</p>
								<div class="animated-carousel-element">
									<a href="${pageContext.request.contextPath}/product/uFindProductById.do?id=8AF6C7D9E4304C6C88549A75B7839C8D" class="slideshow-btn">立即竞拍</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- slide 2 -->
				<div class="item">
					<!-- slideshow photo -->
					<div class="image-box">
						<div class="image">
							<img src="img/slideshow/slide1.jpg" alt="">
						</div>
					</div>
					<!-- slideshow content -->
					<div class="carousel-content">
						<div class="content-center-vertical line">
							<div class="s-12 m-8 l-7">
								<h1 class="margin-bottom-10 animated-carousel-element"><font color="white">``ZENITH''DAYTONA
</font></h1>
								<p class="margin-bottom-30 animated-carousel-element slow">
									<font color="white">劳力士| ``ZENITH''DAYTONA，Ref 16528玫瑰金计时码表，带手链和``Inverted 6''表盘，约1991年</font>
								</p>
								<div class="animated-carousel-element">
									<a href="" class="slideshow-btn">立即竞拍</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- SLIDESHOW END -->

			<!-- ABOUT US START -->
			<div class="section">
				<div class="line">
					<!-- heading -->
					<h1 class="text-center">关于我们</h1>
					<hr class="break-small break-center">
					<div class="margin">
						<!-- block 1 -->
						<div class="s-12 m-6 l-4 margin-bottom-60">
							<div class="float-left">
								<i class="fa fa-paper-plane-o fa-3x text-primary"></i>
							</div>
							<div class="margin-left-60">
								<h3>注册账户</h3>
								<p>为了有资格参加在线拍卖，您必须注册并维护一个帐户。将有后台审核，保证本在线购买拍卖。</p>
							</div>
						</div>
						<!-- block 2 -->
						<div class="s-12 m-6 l-4 margin-bottom-60">
							<div class="float-left">
								<i class="fa fa-eye fa-3x text-primary"></i>
							</div>
							<div class="margin-left-60">
								<h3>浏览拍卖品 </h3>
								<p>一旦相关的在线拍卖开始，在线拍卖中每个待售批次的在线销售信息便可供您查看。 </p>
							</div>
						</div>
						<!-- block 3 -->
						<div class="s-12 m-6 l-4 margin-bottom-60">
							<div class="float-left">
								<i class="fa fa-eye fa-3x text-primary"></i>
							</div>
							<div class="margin-left-60">
								<h3>售前估计 </h3>
								<p>每手的在线销售信息包括预售估计，这是由网站提供的，作为潜在竞标者的指南，以帮助他们确定合适的竞标价格。 </p>
							</div>
						</div>
						<!-- block 4 -->
						<div class="s-12 m-6 l-4 margin-m-bottom-60">
							<div class="float-left">
								<i class="fa fa-calendar fa-3x text-primary"></i>
							</div>
							<div class="margin-left-60">
								<h3>出处</h3>
								<p>出于各种原因，可能不会公开卖方或先前所有者的身份。例如，可以排除这样的信息以适应卖方的保密要求，或者因为鉴于艺术品的年代，前任所有者的身份是未知的。</p>
							</div>
						</div>
						<!-- block 5 -->
						<div class="s-12 m-6 l-4 margin-m-bottom-60">
							<div class="float-left">
								<i class="fa fa-heart-o fa-3x text-primary"></i>
							</div>
							<div class="margin-left-60">
								<h3>招标方式</h3>
								<p>在被允许竞标的人对某批次有直接或间接利益的情况下，例如出售该批次的房地产的受益人或遗嘱执行人，该批次的共同所有人或提供或参与其中的一方作为拍卖品的担保</p>
							</div>
						</div>
						<!-- block 6 -->
						<div class="s-12 m-6 l-4">
							<div class="float-left">
								<i class="fa fa-question-circle-o fa-3x text-primary"></i>
							</div>
							<div class="margin-left-60">
								<h3>帮助</h3>
								<p>有关投标和注册的帮助，请联系： 13640556746 873551076@qq.com</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ABOUT US END -->

			<!-- BRAND OVERVIEW START -->
			<div class="background-dark section">
				<div class="line">
					<!-- heading -->
					<h1 class="text-white text-center">拍卖品按类别：美术、珠宝、手表、艺术</h1>

					<!-- slideshow end -->
				</div>
			</div>

			<!-- PRODUCTS TAB START -->
			<div class="section" id="myProductlist">
				<div class="line">
					<!-- heading -->
					<h1 class="text-center"><span class="text-primary">我们的 </span> 拍卖品</h1>
					<hr class="break-small break-center">
					<!-- products tabs start -->
					<div class="tabs" >
						<!-- tab 1 start -->
						<div class="tab-item"  v-for="(item,ind) in tabList" :key="ind" :class="indexKey == ind ?  'tab-active' : '' ">

							<a class="tab-label" :class="indexKey == ind ?  'active-btn' : ''" @click='change(ind)' >{{item.type}}</a>
							<div class="tab-content"  >

								<div class="margin">

									<!-- Product  -->
                                    <div class="s-12 m-4 l-3 margin-bottom-30" v-for="(el,index) in item.list">
                                        <div class="fullwidth">
                                            <div class="imghvr-reveal-down">
                                                <img :src="el.picUrl">
                                                <figcaption>
                                                    <div class="product-hover-content">
                                                        <div class="btn-box">
                                                            <a :href="'${pageContext.request.contextPath}/product/uFindProductById.do?id='+el.id" class="btn">Buy Now</a>
                                                        </div>
                                                    </div>
                                                </figcaption>
                                            </div>
                                        </div>
                                        <div class="fullwidth">
                                            <h5>{{el.productName}}
                                            </h5>
                                           <p> <span class="text-primary">{{el.nowbid}}$</span></p>
                                        </div>
                                    </div>
								</div>
							</div>
						</div>
					</div>
                </div>
            </div>
		<!-- tab 1 end -->



		</div>
		<!-- products tabs end -->
		</div>
		<!-- PRODUCTS END -->

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
		<!-- ||||||||| -->
		<!-- |||||||||||| page end ||||||||||||| -->
	</div>
		<!-- jQuery Files -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/owl-carousel/owl.carousel.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/custom.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

        <script src="${pageContext.request.contextPath}/js/axios-0.18.0.js"></script>
        <script src="${pageContext.request.contextPath}/js/user.js"></script>
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