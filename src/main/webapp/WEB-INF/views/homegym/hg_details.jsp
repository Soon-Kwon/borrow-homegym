<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
	<meta charset="utf-8" />
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>빌려줘! 홈짐</title>
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="shortcut icon" type="image/x-icon" href="assets/images/logo/logo.png" />

	<!-- Place favicon.ico in the root directory -->

	<!-- Web Font -->
	<link
		href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
		rel="stylesheet">

	<!-- ========================= CSS here ========================= -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="assets/css/LineIcons.2.0.css" />
	<link rel="stylesheet" href="assets/css/animate.css" />
	<link rel="stylesheet" href="assets/css/tiny-slider.css" />
	<link rel="stylesheet" href="assets/css/glightbox.min.css" />
	<link rel="stylesheet" href="assets/css/main.css" />

	<!--========================= 캐러셀 ================================ -->
	<link rel="stylesheet" href="assets/css/carousel.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!-- ======================== 달력 ================================== -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
	<script src="https://kit.fontawesome.com/a0fcc69da7.js" crossorigin="anonymous"></script>
	
	<style>
		p {
			font-size: 17px;
			line-height: 1.6;
			letter-spacing: -0.6px;
			margin: 16px 0;
			word-break: break-all;
		}

		.popular-feed-loop {
			width: 150px;
			height: 150px;
			border-radius: 70%;
			overflow: hidden
		}

		.trainner {
			width: 100%;
			height: 100%;
			object-fit: cover;
		}

		#re_plus {
			background-color: #9ea9d8;
			width: 150px;
			height: 50px;
			font-size: 20px;
			color: white;
			font-weight: bold;
			position: relative;
			left: 300px;
			top: 20px;
		}

		.sidebar {
			position: sticky;
			top: 30px;
		}

		.btn-time {
			border-radius: 2rem;
			background-color: #9ea9d8;
			margin: 10px 0px;
		}
		
		.icon-tag{
			
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function () {
			// 달력 오늘 날짜로
			document.getElementById('now_date').valueAsDate = new Date();
		});
	</script>
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

	<!-- Start Header Area -->
	<header class="header style2 navbar-area">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<div class="nav-inner">
						<nav class="navbar navbar-expand-lg">
							<a class="navbar-brand" href="main_index.html">
								<img src="../Template Main/assets/images/logo/로고2.png" alt="logo">
							</a>
							<button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
								aria-expanded="false" aria-label="Toggle navigation">
								<span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
							</button>
							<form class="d-flex search-form">
								<input class="form-control me-2" type="search" placeholder="동네 이름을 검색해보세요!"
									aria-label="Search">
								<button class="btn btn-outline-success" type="submit"><i
										class="lni lni-search-alt"></i></button>
							</form>
							<div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
								<ul id="nav" class="navbar-nav ms-auto">
									<li class="nav-item" style="margin-right: 100px;"><a href="location.html">
											<h5>홈짐</h5>
										</a></li>
									<li class="nav-item" style="margin-right: 120px;"><a href="community.html">
											<h5>커뮤니티</h5>
										</a></li>
									<a class="circle-image" href="mypage_main.html">
										<img src="https://via.placeholder.com/300x300" alt="logo">
									</a>
									<li class="nav-item"><a href="mypage_main.html">
											<h5>아이유님</h5>
										</a></li>

								</ul>
							</div> <!-- navbar collapse -->
						</nav> <!-- navbar -->
					</div>
				</div>
			</div> <!-- row -->
		</div> <!-- container -->
	</header>
	<!-- End Header Area -->

	<!-- Start Blog Singel Area -->
	<section class="section blog-single">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-12">
					<div class="single-inner">
						<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							</ol>
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<img src="assets/images/gym/homegym-image-01.jpg" alt="...">
									<div class="carousel-caption"></div>
								</div>
								<div class="item">
									<img src="assets/images/gym/homegym-image-02.jpg" alt="...">
									<div class="carousel-caption"></div>
								</div>
								<div class="item">
									<img src="assets/images/gym/homegym-image-03.jpg" alt="...">
									<div class="carousel-caption"></div>
								</div>
							</div>
							<!-- Controls -->
							<a class="left carousel-control" href="#carousel-example-generic" role="button"
								data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
									aria-hidden="true"></span>
								<span class="sr-only"></span>
							</a> <a class="right carousel-control" href="#carousel-example-generic" role="button"
								data-slide="next">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span
									class="sr-only"></span>
							</a>
						</div>
						<class="post-details">
							<div class="detail-inner">
								<!-- post meta -->
								<h2 class="post-title">
									<p style="font-size: 25px;">홈짐 소개</p>
								</h2>
								<p>홈짐 설명</p>
								<ul class="icon-tag row" style="font-size:40px;">
									<div class="col-lg-3 col-2"><i class="fas fa-parking"></i>주차</div>
									<div class="col-lg-3 col-2"><i class="fas fa-wifi"></i>와이파이</div>
									<div class="col-lg-3 col-2"><i class="fas fa-tint"></i>정수기</div>
									<div class="col-lg-3 col-2"><i class="fas fa-fan"></i>에어컨</div>
									<div class="col-lg-3 col-2"><i class="fas fa-shower"></i>샤워</div>
								</ul>

								<!-- <h3>
									<span></span> 
									<span></span> 
									<span><i class="fas fa-tint"></i>정수기</span>
									<span></span>
									<span></span>
								</h3> -->
								<div id="map" style="width: 100%; height: 450px;"></div>

								<!-- 댓글 -->
								<div class="post-comments">
									<h2>리뷰 💌</h2>
									<hr>
									<br>
									<ul class="comments-list">
										<li>
											<div class="comment-img">
												<img src="https://via.placeholder.com/100x100" alt="img"
													style="width: 100px;">
											</div>
											<div class="comment-desc">
												<div class="desc-top">
													<h6>혜선짱</h6>
													<span class="date">2021/05/25</span> <a href="javascript:void(0)"
														class="reply-link"><i class="lni lni-reply"></i>답글 달기</a>
												</div>
												<p>깨끗하고 좋아요</p>
											</div>
										</li>
										<li class="children">
											<div class="comment-img">
												<img class="trainner" src="https://via.placeholder.com/100x100"
													width="100px" alt="img">
											</div>
											<div class="comment-desc">
												<div class="desc-top">
													<h6>
														권지용<span class="saved"><i class="lni lni-bookmark"></i></span>
													</h6>
													<span class="date">15th May 2023</span> <a href="javascript:void(0)"
														class="reply-link"><i class="lni lni-reply"></i>Reply</a>
												</div>
												<p>감사합니다 ! 다음에도 방문해주세요.</p>
											</div>
										</li>
										<li>
											<div class="comment-img">
												<img src="https://via.placeholder.com/100x100" alt="img">
											</div>
											<div class="comment-desc">
												<div class="desc-top">
													<h6>한예슬</h6>
													<span class="date">12th May 2023</span> <a href="javascript:void(0)"
														class="reply-link"><i class="lni lni-reply"></i>댓글 달기</a>
												</div>
												<p>굿굿!</p>
											</div>
										</li>
									</ul>
								</div>								
							</div>
							<button type="button" class="btn btn-outline-info" id="re_plus">더보기</button>
						</div>
				</div>
				<aside class="col-lg-4 col-md-12 col-12">
					<div class="sidebar" id="sidebar">
						<!-- Single Widget -->
						<div class="widget popular-feeds" style="position: relative; top: 30px;">
							<div class="info">
								<h3 class="date">
									<i class="lni lni-apartment"></i> 김연아님의 홈짐
								</h3>
								<h6 class="title">서울시 서초구 논현동에 위치한 김하우스입니다</h6>
								<br>
							</div>
							<form action="#" method="get">
								<h6>예약 날짜 선택</h6>
								<br>
								<input type="date" id="now_date" name="today" /> <br /> <br />
								<h6>예약 시간 선택</h6>
								<br>
								<div class="row">
								<input type="button" value="19시 30분 ~ 20시 30분" onclick="javascript:void(0)"
									class="btn btn-time">
								<input type="button" value="20시 30분 ~ 21시 30분" onclick="javascript:void(0)"
									class="btn btn-time" style="border-radius: 2rem; background-color: #9ea9d8;">
								<input type="button" value="22시 30분 ~ 23시 30분" onclick="javascript:void(0)"
									class="btn btn-time" style="border-radius: 2rem; background-color: #9ea9d8;">
								<br /> <br />
								<div>
								<div style="padding: 20px 0px">
									<!-- <span style="font-size: 25px; color: black;">₩4,000</span>  -->
									<input type="submit" value="예약하기" class="btn"
										style="float: right; background-color: #9ea9d8;">
								</div>
							</form>

						</div>
						<!--/ End Single Widget -->
					</div>
				</aside>
			</div>
	</section>
	<!-- End Blog Singel Area -->

	<!-- Start Footer Area -->
	<footer class="footer style2">
		<!-- Start Footer Bottom -->
		<div class="footer-bottom">
			<div class="container">
				<div class="inner">
					<div class="row">
						<div class="col-md-6" style="text-align: start;">
							<div class="logo">
								<br><br>
								<a href="main_index.html"><img src="assets/images/logo/로고1.png" alt="Logo"></a>
							</div>
						</div>
						<div class="col-md-6" style="text-align: end;">
							<p>
								<br>
								<a href="faq.html"> 자주묻는 질문</a>
								<br>
								서울특별시 서초구 강남대로 459 (서초동, 백암빌딩) 403호<br>
								(주) 빌려줘홈짐 | 문의 02-123-1234 | 사업자등록번호 123-12-12345
								<br>© 2021. All Rights Reserved.
							</p>

						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--/ End Footer Area -->


	<!-- ========================= scroll-top ========================= -->
	<a href="#" class="scroll-top btn-hover"> <i class="lni lni-chevron-up"></i>
	</a>

	<!-- ========================= JS here ========================= -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/count-up.min.js"></script>
	<script src="assets/js/wow.min.js"></script>
	<script src="assets/js/tiny-slider.js"></script>
	<script src="assets/js/glightbox.min.js"></script>
	<script src="assets/js/main.js"></script>
	<!-- ========================= 카카오 지도 ========================= -->

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9acd85a01adaa0b260e4eb08bf997e9"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.503293, 127.024297),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>

</html>