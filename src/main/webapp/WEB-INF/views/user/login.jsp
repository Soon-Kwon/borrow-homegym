<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>빌려줘! 홈짐 - 로그인</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/assets/images/logo/logo.png" />



<!-- Place favicon.ico in the root directory -->

<!-- Web Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- ========================= CSS here ========================= -->
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css" />
 	<link rel="stylesheet" href="/assets/css/LineIcons.2.0.css" />
    <link rel="stylesheet" href="/assets/css/animate.css" />
    <link rel="stylesheet" href="/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="/assets/css/main.css" />


</head>

<body>
	<!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

	<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- /End Preloader -->

	<header class="header style2 navbar-area">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<div class="nav-inner">
						<nav class="navbar navbar-expand-lg">
							<a class="navbar-brand" href="/index.jsp"> <img
								src="../assets/images/logo/로고2.png" alt="logo">
							</a>
							<button class="navbar-toggler mobile-menu-btn" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="toggler-icon"></span> <span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
							</button>
							<form class="d-flex search-form">
								<input class="form-control me-2" type="search"
									placeholder="동네 이름을 검색해보세요!" aria-label="Search">
								<button class="btn btn-outline-success" type="submit">
									<i class="lni lni-search-alt"></i>
								</button>
							</form>
							<div class="collapse navbar-collapse sub-menu-bar"
								id="navbarSupportedContent">
								<ul id="nav" class="navbar-nav ms-auto">
									<li class="nav-item" style="margin-right: 100px;"><a
										href="location.html">
											<h5>홈짐</h5>
									</a></li>
									<li class="nav-item" style="margin-right: 120px;"><a
										href="community.html">
											<h5>트레이너</h5>
									</a></li>
									<a class="circle-image" href="mp_main.jsp"> <img
										src="https://via.placeholder.com/300x300" alt="logo">
									</a>
									<li class="nav-item"><a href="mp_main.jsp">
											<h5>아이유님</h5>
									</a></li>
								</ul>
							</div>
							<!-- navbar collapse -->
						</nav>
						<!-- navbar -->
					</div>
				</div>
			</div>
			<!-- row -->
		</div>
		<!-- container -->
	</header>
	<!-- End Header Area -->
	<!-- End Header Area -->

	<!-- Start Breadcrumbs -->

	<!-- End Breadcrumbs -->

	<!-- start login section -->
	<section class="blacnk">
		<br> <br> <br> <br> <br> <br>
	</section>
	<section class="login section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
					<div class="form-head">
						<h4 class="title">로그인</h4>
						<h6><c:out value="${error}"/></h6>
						<h6><c:out value="${logout}"/></h6> <br/>
						
						<form action="/login" method="post">
							<div class="form-group">
								<label>아이디</label> <input type="text" name="memberId" class="margin-5px-bottom" 
									id="memberId" placeholder="아이디" width="" value="admin"><!-- type="email" -->
							</div>
							<div class="form-group">
								<label>비밀번호</label> <input class="margin-5px-bottom"
									type="password" name="password" id="password"
									placeholder="패스워드" value="admin">
							</div>
							<div class="check-and-pass">
								<div class="row align-items-center">
									<div class="col-lg-6 col-12">
										<div class="form-check">
											<input type="checkbox" class="form-check-input width-auto" id="exampleCheck1"> 
											<label class="form-check-label">비밀번호 저장</label>
										</div>
									</div>
								</div>
							</div>
							<div class="button">
								<button type="submit" class="btn" href="index">LogIn</button>
							</div>
							<p class="outer-link">
								계정이 없으신가요? &nbsp;&nbsp; 
								<a href="/user/registration.do">회원가입 하기</a>
							</p>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Registration section -->


	<!-- ========================= scroll-top ========================= -->


	<!-- ========================= JS here ========================= -->
	<script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/count-up.min.js"></script>
    <script src="../assets/js/wow.min.js"></script>
    <script src="../assets/js/tiny-slider.js"></script>
    <script src="../assets/js/glightbox.min.js"></script>
    <script src="../assets/js/main.js"></script>
    <script type="text/javascript">
        //========= testimonial Slider
        tns({
            container: '.testimonial-slider',
            items: 3,
            slideBy: 'page',
            autoplay: false,
            mouseDrag: true,
            gutter: 0,
            nav: true,
            controls: false,
            controlsText: ['<i class="lni lni-arrow-left"></i>', '<i class="lni lni-arrow-right"></i>'],
            responsive: {
                0: {
                    items: 1,
                },
                540: {
                    items: 1,
                },
                768: {
                    items: 2,
                },
                992: {
                    items: 2,
                },
                1170: {
                    items: 3,
                }
            }
        });
        //====== Clients Logo Slider
        tns({
            container: '.client-logo-carousel',
            slideBy: 'page',
            autoplay: true,
            autoplayButtonOutput: false,
            mouseDrag: true,
            gutter: 15,
            nav: false,
            controls: false,
            responsive: {
                0: {
                    items: 1,
                },
                540: {
                    items: 3,
                },
                768: {
                    items: 4,
                },
                992: {
                    items: 4,
                },
                1170: {
                    items: 6,
                }
            }
        });
    </script>
  </body>
</html>