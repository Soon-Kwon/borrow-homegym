<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.homegym.biz.trainerboard.TrainerBoardVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>

<!-- ========================= CSS here ========================= -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!--========================= 캐러셀 ================================ -->
<!-- ======================모달=============================== -->

<style>
p {
	font-size: 17px;
	line-height: 1.6;
	letter-spacing: -0.6px;
	margin: 16px 0;
	word-break: break-all;
}

.popular-feed-loop {
	width: 250px;
	height: 250px;
	border-radius: 100%;
	overflow: hidden
}

.trainner {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.modal-content {
	font-size: 100px;
}

.sidebar {
	position: sticky;
	top: 30px;
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
</style>


	<!-- ========================= JS here ========================= -->
	<script src="/resources/assets/js/bootstrap.min.js"></script>
	<script src="/resources/assets/js/count-up.min.js"></script>
	<script src="/resources/assets/js/wow.min.js"></script>
	<script src="/resources/assets/js/tiny-slider.js"></script>
	<script src="/resources/assets/js/glightbox.min.js"></script>
	<script src="/resources/assets/js/main.js"></script>

</head>

<body>

	<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- /End Preloader -->

	  <!--Header -->
   <%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<!-- Start Blog Singel Area -->
	<section class="section blog-single">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-12">
					<br>
						<h2 style="font-weight: bold;">${trainerBoard.tbTitle}</h2>
					<div class="single-inner">
						<br>
						<div class="top-slide">
						<div id="subPhoto" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#subPhoto" data-slide-to="0" class="active"></li>
								<li data-target="#subPhoto" data-slide-to="1"></li>
								<li data-target="#subPhoto" data-slide-to="2"></li>
							</ol>
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<img src="/trainer/display.do?fileName=${trainerBoard.tbPhoto1}"  style="width:100%">
									
								</div>
								<div class="item">
									<img src="/trainer/display.do?fileName=${trainerBoard.tbPhoto2}" style="width:100%"> 
								
								</div>
								<div class="item">
									<img src="/trainer/display.do?fileName=${trainerBoard.tbPhoto3}" style="width:100%">
								
								</div>

							</div>
							<!-- Controls -->
							<a class="left carousel-control" href="#carousel-example-generic"
								role="button" data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control"
								href="#carousel-example-generic" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
</div>
						<div class="post-details">
							<div class="detail-inner">
								<h2 class="post-title">
									<p style="font-size: 30px">🏋🏼‍♂️트레이너 소개</p>
								</h2>
								<p style="font-size: 20px; line-height: 30px;">
									${trainerBoard.tbContent}
								
								</p>
								<hr>
								<br>
								<h3>📍 프로그램 소개</h3>
								<p>${trainerBoard.tbProgram}</p>
								
							</div>
						</div>
					</div>
				</div>

				<aside class="col-lg-4 col-md-12 col-12">
					<div class="sidebar">

						<!--/ End Single Widget -->
						<!-- Single Widget -->
						<div class="widget popular-feeds"
							style="position: relative; top: 90px;">
							<div class="tr_image" style="position: relative; left: 10px;">
								<img src="/resources/assets/images/gym/re2.jpg" alt="#"
									style="object-fit: cover; object-position: center center; border-radius: 50%; width: 150px; height: 150px; position: relative; left: 80px">
							</div>
							<div>
								<br>
								<p
									style="font-size: 23px; font-weight: bold; text-align: center;">
									<span>${name}</span> 트레이너
								</p>
								<ul style="text-align: center; font-size: 16px; margin: 10px; ">
									<li><strong style="color:#3c3c3c;">월요일 ~ 토요일 </strong><br>${trainerBoard.dayTimes}
									<strong>~</strong>
									${trainerBoard.dayTimef}</li>
									<!-- <li>월요일~토요일 10:00 ~20:50</li> -->
									<li><strong style="color:#3c3c3c;">일요일</strong>  <br>${trainerBoard.sunTimes}
									<span>~</span>
									 ${trainerBoard.sunTimef}</li>
								</ul>
								<div class="button" data-wow-delay="1s"
									style="position: relative; left: 100px;">
									<button type="button" class="btn" data-toggle="modal"
										data-target="#myModal"
										style="background-color: #5c6dbd; margin-left: 20px;">
										1:1 채팅</button>

								</div>
							</div>
							<div style="margin-top: 20px; text-align: center;">

								<button type="button" class="btn"
									style="background-color: #5c6dbd; margin-left: 20px;">

									<a href="tbUpdate.do">수정하기</a>
								</button>

								<button type="button" class="btn"
									style="background-color: #5c6dbd; margin-left: 20px;">

									<a href="deleteBoard.do?tno=${trainerBoard.tno}">삭제하기</a>
								</button>


							</div>
						</div>
						<!--/ End Single Widget -->

						<!--/ End Single Widget -->
						<!-- 해시태그 -->
						<div class="widget popular-tag-widget"
							style="position: relative; top: 70px; margin:">
							<div class="tags"
								style="font-size: 17px; font-weight: bold; color: black; border-radius: 20px;">
								<p>활동 지역</p>
								<a href="" style="border-radius: 20px;">${trainerBoard.tbActivTag1}</a>
								<a href="" style="border-radius: 20px;">${trainerBoard.tbActivTag2}</a> 
								<a href="" style="border-radius: 20px;">${trainerBoard.tbActivTag3}</a>

								<p>활동 범위</p>
								<a href="" style="border-radius: 20px;">${trainerBoard.tbActivChk1}</a>
								<a href="" style="border-radius: 20px;">${trainerBoard.tbActivChk2}</a> 
								<a href="" style="border-radius: 20px;">${trainerBoard.tbActivChk3}</a>

							</div>

						</div>
						<!--/ End Single Widget -->
					</div>
				</aside>
			</div>
		</div>
	</section>


	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<!-- 사용자 지정 부분① : id명 -->
		<div class="modal-dialog" style="top: 200px; left: 50px;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<p class="modal-title" style="font-size: 30px;">트레이너의 정보를
						받아보세요!😊</p>
					<!-- 사용자 지정 부분② : 타이틀 -->
				</div>

				<div class="modal-body">
					<p style="font-size: 20px">phone : 010 -1234 -5678</p>
					<!-- 사용자 지정 부분③ : 텍스트 메시지 -->
					<p style="font-size: 20px">instagram : @aksakfn12</p>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>



	<br />
	<br />


	<!-- Start Footer Area -->
	<footer class="footer style2">
		<!-- Start Footer Bottom -->
		<div class="footer-bottom">
			<div class="container">
				<div class="inner">
					<div class="row">
						<div class="col-md-6" style="text-align: start;">
							<div class="logo">
								<br> <br> <a href="index.html"><img
									src="/resources/assets/images/logo/로고1.png" alt="Logo"></a>
							</div>
						</div>
						<div class="col-md-6" style="text-align: end;">
							<p>
								<br> <a href="faq.html"> 자주묻는 질문</a> <br> 서울특별시 서초구
								강남대로 459 (서초동, 백암빌딩) 403호<br> (주) 빌려줘홈짐 | 문의 02-123-1234 |
								사업자등록번호 123-12-12345 <br>© 2021. All Rights Reserved.
							</p>

						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--/ End Footer Area -->


	<!-- ========================= scroll-top ========================= -->
	<a href="#" class="scroll-top btn-hover"> <i
		class="lni lni-chevron-up"></i>
	</a>
	
</body>

</html>