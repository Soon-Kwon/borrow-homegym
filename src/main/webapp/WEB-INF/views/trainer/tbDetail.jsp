<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.homegym.biz.trainerboard.TrainerBoardVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>

<!-- ========================= CSS here ========================= -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



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


/* caroucsel  */

.carousel-item,
.carousel-inner,
.carousel-inner img {
  height: 100%;
  width: 100%;
}

.carousel-item {
  text-align: center;
}
.carousel {
  height: 566px;
}

.carousel-inner img {
  width: 100%;
  height: auto;
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
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<!-- Start Blog Singel Area -->
	<section class="section blog-single">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-12">
					<br>
					<h2 style="font-weight: bold; margin-bottom:0px;">${trainerBoard.tbTitle}</h2>
					<div class="single-inner"></div>
					<br>

					<!-- test start -->
					<!-- carousel를 구성할 영역 설정 -->
					<div style="width: 750px; ">
						<!-- carousel를 사용하기 위해서는 class에 carousel와 slide 설정한다. -->
						<!-- carousel는 특이하게 id를 설정해야 한다.-->
						<div id="carousel-example-generic" class="carousel slide">
							<!-- carousel의 지시자 -->
							<!-- 지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다. -->
							<ol class="carousel-indicators">
								<!-- li는 이미지 개수만큼 추가하고 data-target은 carousel id를 가르킨다. -->
								<!-- data-slide-to는 순서대로 0부터 올라가고 0은 active를 설정한다. -->
								<!-- 딱히 이 부분은 옵션별로 설정하게 없다. -->
								<li data-target="#carousel-example-generic" data-slide-to="0"
									class="active"></li>
								<c:if test="${not empty trainerBoard.tbPhoto2}">
									<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								</c:if>
								<c:if test="${not empty trainerBoard.tbPhoto3}">
									<li data-target="#carousel-example-generic" data-slide-to="2"></li>
								</c:if>
							</ol>
							<!-- 실제 이미지 아이템 -->
							<!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->
							<div class="carousel-inner" role="listbox">
								<!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->
								<div class="item active">
									<!-- 이미지 설정- -->
									<img src="/resources/imgUpload/${trainerBoard.tbPhoto1}"
										style="width: 100%">
									<!-- 캡션 설정 (생략 가능) -->
									<!-- 글자 색은 검은색 -->
									<div class="carousel-caption" style="color: black;"></div>
								</div>
								<c:if test="${not empty trainerBoard.tbPhoto2}">
									<div class="item">
										<img src="/resources/imgUpload/${trainerBoard.tbPhoto2}"
											style="width: 100%">
										<div class="carousel-caption" style="color: black;">
										</div>
									</div>
								</c:if>
								<c:if test="${not empty trainerBoard.tbPhoto3}">
									<div class="item">
										<img src="/resources/imgUpload/${trainerBoard.tbPhoto3}"
											style="width: 100%">
										<div class="carousel-caption" style="color: black;">
										</div>
									</div>
								</c:if>
								
							</div>
							<!-- 왼쪽 화살표 버튼 -->
							<!-- href는 carousel의 id를 가르킨다. -->
							<a class="left carousel-control" href="#carousel-example-generic"
								role="button" data-slide="prev"> 
								<!-- 왼쪽 화살표 --> 
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							</a>
							<!-- 오른쪽 화살표 버튼 -->
							<!-- href는 carousel의 id를 가르킨다. -->
							<a class="right carousel-control"
								href="#carousel-example-generic" role="button" data-slide="next">
								<!-- 오른쪽 화살표 --> 
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							</a>
						</div>
					</div>
					<!-- test end -->


			
				<div class="post-details" style="margin-top:30px;">
							<div class="detail-inner">
								<h2 class="post-title">
									<p style="font-size: 30px">🏋🏼‍♂️트레이너 소개</p>
								</h2>
								<p style="font-size: 20px; line-height: 30px;">
									${trainerBoard.tbContent}</p>
								<hr>
								<br>
								<h3>📍 프로그램 소개</h3>
								<p>${trainerBoard.tbProgram}</p>

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
									style="object-fit: cover; object-position: center center; border-radius: 50%; width: 150px; height: 150px; position: relative; left: 50px">
							</div>
							<div>
								<br>
								<p
									style="font-size: 23px; font-weight: bold; text-align: center;">
									<span>${name}</span> 트레이너
								</p>
								<ul style="text-align: center; font-size: 16px; margin: 10px;">
									<li><strong style="color: #3c3c3c;">월요일 ~ 토요일 </strong><br>${trainerBoard.dayTimes}
										<strong>~</strong> ${trainerBoard.dayTimef}</li>
									<!-- <li>월요일~토요일 10:00 ~20:50</li> -->
									<li><strong style="color: #3c3c3c;">일요일</strong> <br>${trainerBoard.sunTimes}
										<span>~</span> ${trainerBoard.sunTimef}</li>
								</ul>
								<div class="button" data-wow-delay="1s" style="position: relative; left: 55px; ">
									<button type="button" class="btn" data-toggle="modal"
										data-target="#myModal" style="background-color: #5c6dbd; text-align:cent; margin-left: 30px; border-radius:5px;">
										1:1 채팅</button>

								</div>
							</div>
							<div style="margin-top: 5px; text-align: center;">
							<div class="button">
                                <a href="/trainer/tbUpdate.do?tno=${trainerBoard.tno}" class="btn" style="margin-top:10px; border-radius:5px;"> 수정 </a>
                                &nbsp;&nbsp;&nbsp;
                                <a href="/trainer/deleteBoard.do" class="btn" style="margin-top:5px; border-radius:10px;">삭제</a>
                            </div>

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
								<!-- 만약 입력값이 없으면 해시태그가 없게 , 있으면 생성되게  -->
								<c:if test="${not empty trainerBoard.tbActivTag1}">
									<a href="" style="border-radius: 20px;">${trainerBoard.tbActivTag1}</a>
								</c:if>
								<c:if test="${not empty trainerBoard.tbActivTag2}">
									<a href="" style="border-radius: 20px;">${trainerBoard.tbActivTag2}</a>
								</c:if>
								<c:if test="${not empty trainerBoard.tbActivTag3}">
									<a href="" style="border-radius: 20px;">${trainerBoard.tbActivTag3}</a>
								</c:if>
						

								<p>활동 범위</p>
								<!-- 만약 입력값이 없으면 활동범위 입력된 값이 없으면 안보이게 , 있으면 생성되게  -->
								<c:if test="${not empty trainerBoard.tbActivChk1}">
									<a href="" style="border-radius: 20px;">${trainerBoard.tbActivChk1}</a>
								</c:if>
								<c:if test="${not empty trainerBoard.tbActivChk2}">
								<a href="" style="border-radius: 20px;">${trainerBoard.tbActivChk2}</a>
								</c:if>
								<c:if test="${not empty trainerBoard.tbActivChk3}">
								<a href="" style="border-radius: 20px;">${trainerBoard.tbActivChk3}</a>
								</c:if>
								

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
					<p class="modal-title" style="font-size: 30px;">트레이너의 정보를 받아보세요!😊</p>
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
	<!--========================= 캐러셀 ================================ -->
	<!-- Bootstrap cdn 설정 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script>
		//첨부파일  캐러셓
		(function() {
			
			// 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
			$('#carousel-example-generic').carousel({
				// 슬리아딩 자동 순환 지연 시간
				// false면 자동 순환하지 않는다.
				interval : 1000,
				// hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
				pause : "hover",
				// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
				wrap : true,
				// 키보드 이벤트 설정 여부(?)
				keyboard : true
			});
	
		})();
	</script>


</body>

</html>