<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
	<meta charset="utf-8" />
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>빌려줘! 홈짐</title>
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="shortcut icon" type="image/x-icon" href="../assets/images/logo/logo.png" />

	<!-- Place favicon.ico in the root directory -->

	<!-- Web Font -->
	<link
		href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
		rel="stylesheet">

	<!-- ========================= CSS here ========================= -->
	<link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="../assets/css/LineIcons.2.0.css" />
	<link rel="stylesheet" href="../assets/css/animate.css" />
	<link rel="stylesheet" href="../assets/css/tiny-slider.css" />
	<link rel="stylesheet" href="../assets/css/glightbox.min.css" />
	<link rel="stylesheet" href="../assets/css/main.css" />

	<!--========================= 캐러셀 ================================ -->
	<link rel="stylesheet" href="../assets/css/carousel.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!-- ======================== 달력 ================================== -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
		
		.image-container{
			text-align: center;
		}
		
		.ic-child{
			width: 100%;
			padding-bottom: 20px;
			text-align: center;
		}
		
		.icon-tag{
			text-align: center;
			background-color: ffffff;
			color: black;
		}
		
		.icon-tag .fas{
			font-size: 40px;
		}
		
		#manipulateBtn{
			text-align: right;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function () {

			// 첨부파일 데이터를 가져오는 즉시실행함수
			(function(){
			
				var hId = '<c:out value="${board.HId}"/>';
			
				$.getJSON("/homegym/getAttachList.do", {hId: hId}, function(arr){
					
					console.log(arr);

					var str ="";
					
					$(arr).each(function(i, attach){
						
						var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid
								+ "_" + attach.fileName);
						
				
							str += "<div class='ic-child'><img style='width:100%;' src='/display.do?fileName=" + fileCallPath  
								+ "'></div>";   
							
					});					
						$(".image-container").html(str);
				});
				
			})();			
			
			// 해쉬태그 분리 
			var hashtag = '<c:out value='${board.HHashtag}'/>';
			var afterSplit = hashtag.split(', ');
			
			str = "";
			
			for(var i = 0 ; i < afterSplit.length ; i++){
				switch(afterSplit[i]){
				case "주차가능":
				$(".icon-tag").append('<div class="col-lg-2 col-2"><i class="fas fa-parking"></i><br>주차가능</div>');
				break;
				case "와이파이가능":
				$(".icon-tag").append('<div class="col-lg-2 col-2"><i class="fas fa-wifi"></i><br>와이파이</div>');
				break;
				case "정수기보유":
				$(".icon-tag").append('<div class="col-lg-2 col-2"><i class="fas fa-tint"></i><br>정수기</div>');
				break;
				case "에어컨보유":
				$(".icon-tag").append('<div class="col-lg-2 col-2"><i class="fas fa-fan"></i><br>에어컨</div>');
				break;
				case "샤워가능":
				$(".icon-tag").append('<div class="col-lg-2 col-2"><i class="fas fa-shower"></i><br>샤워</div>');	
				break;
				default:
				
				}
			}		
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
								<img src="../Template Main/../assets/images/logo/로고2.png" alt="logo">
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
									<li class="nav-item" style="margin-right: 100px;"><a href="/homegym/homegymListView.do">
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
						<div class="image-container">
						
						</div>
							<div class="detail-inner">
								<!-- post meta -->
								<h2 class="post-title">
									<p style="font-size: 25px;">${board.HTitle }</p>
								</h2>
								<p>${board.HContent }</p>
								<br>
								<h5> 이용 가능한 시설들</h5>
								<br>
								
								<div class="icon-tag row">
									
								</div>
								<br><br>

								<!-- <h3>
									<span></span> 
									<span></span> 
									<span><i class="fas fa-tint"></i>정수기</span>
									<span></span>
									<span></span>
								</h3> -->
								<h5> ${board.MId}님의 홈짐 위치</h5>
								<br>
								
								<!-- 홈짐 위치 나오는 div -->
								<div id="map" style="width: 100%; height: 450px;"></div>
								<br>
								<!-- 집주인일 경우 나오는 수정/삭제버튼 
								목록으로 돌아갈 때나 글을 수정할 때 유저가 게시물을 클릭할 당시의 페이지 번호를 기억해서 그 곳으로 다시 돌아간다. -->
								<div id="manipulateBtn">
									<input type="button" value="수정 및 삭제하기" onclick="location.href='/homegym/homegymModifyView.do?hId=${board.HId }'"
									class="btn btn-time">
									<input type="button" value="목록으로 돌아가기" onclick="location.href='/homegym/homegymListView.do?pageNum=${cri.pageNum}&amount=${cri.amount }'"
									class="btn btn-time">
								</div>	
								
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
								<h4 class="date">
									<i class="lni lni-apartment"></i> ${board.MId }님의 홈짐
								</h4>
								<br>
								<h6 class="title">${board.HAddr}에 위치한 김하우스입니다</h6>
								<br>
							</div>
								<h6>1시간당 가격</h6>
								<br>
								<div style="text-align: right; color: black;">${board.HPrice } 원</div>
								<br>
								<div class="row">
								<input type="button" value="지금 예약하러 가기" onclick="location.href='/homegym/reservationView.do'"
									class="btn btn-time">
								<br /> <br />
									<input type="button" value="집주인에게 문의하기" class="btn btn-time">
								</div>
						</div>
						<!--/ End Single Widget -->
					</div>
				</aside>
			</div>
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
								<a href="main_index.html"><img src="../assets/images/logo/로고1.png" alt="Logo"></a>
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
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/js/count-up.min.js"></script>
	<script src="../assets/js/wow.min.js"></script>
	<script src="../assets/js/tiny-slider.js"></script>
	<script src="../assets/js/glightbox.min.js"></script>
	<script src="../assets/js/main.js"></script>
	<!-- ========================= 카카오 지도 ========================= -->

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9acd85a01adaa0b260e4eb08bf997e9"></script>
	<script>
		var container = document.getElementById('map');
		
		var options = {
			center: new kakao.maps.LatLng(${board.HLocateY}, ${board.HLocateX}),
			level: 3
		};
		// 맵 생성
		var map = new kakao.maps.Map(container, options);

		var imageSrc = '../assets/images/logo/logo.png' // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(54, 69), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(${board.HLocateY}, ${board.HLocateX}); // 마커가 표시될 위치입니다
	
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition, 
		    image: markerImage // 마커이미지 설정 
		});
	
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);  
	</script>
</body>

</html>