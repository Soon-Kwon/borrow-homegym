<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
	<meta charset="utf-8" />
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>빌려줘! 홈짐 - 홈짐 등록</title>
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="shortcut icon" type="image/x-icon" href="assets/images/logo/logo.png" />
	<!-- Place favicon.ico in the root directory -->

	<!-- Web Font -->
	<link
		href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
		rel="stylesheet">

	<!-- ========================= CSS here ========================= -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">	
	<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="assets/css/LineIcons.2.0.css" />
	<link rel="stylesheet" href="assets/css/animate.css" />
	<link rel="stylesheet" href="assets/css/tiny-slider.css" />
	<link rel="stylesheet" href="assets/css/glightbox.min.css" />
	<link rel="stylesheet" href="assets/css/main.css" />
	
	<style>
		.intro {
			background-image: url("assets/images/gym/homegym-image-01.jpg");
			background-size: cover;
			background-position: center;
			background-repeat: no-repeat;
			position: relative;
			padding: 200px 0 80px 0;
			z-index: 2;
			overflow: hidden;
			text-align: center;
		}
	
		.intro.overlay::before {
			background-color: #ffffff;
			opacity: 0.1;
			z-index: -1;
		}
	
		.intro .intro-content {
			position: relative;
			float: none;
			padding: 0px;
		}
	
		.intro .intro-content .page-title {
			font-size: 30px;
			margin-bottom: 5px;
			color: #fff;
		}
	
		.intro .intro-content p {
			font-size: 14px;
			margin: 15px 0px 0px;
			color: #fff;
		}
		
		/* 체크박스 */
		p { 
            margin:10px 5px;
		}

		.checkColor {
			background-color: #9ea9d8;
			border-color: #9ea9d8;
			color: white;
		}
	
		.btn-outline-secondary:hover {
			color: #6c757d;
			background-color: #ededf2;
			border-color: #ededf2;
		}
	
		.btn-outline-secondary {
			border-color: #dadae3;
		}

	</style>
	<!-- 다음 주소 api & 지도 api-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9acd85a01adaa0b260e4eb08bf997e9&libraries=services"></script>
	<!-- 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
			$(document).ready(function () {
					// 주소 오늘 날짜로 
					document.getElementById('now_date').valueAsDate = new Date();

					$("input[name=homegym_options]:checkbox").click(function () {
						//this.checked = true; //checked 처리
						if ($(this).is(":checked")) {
							$(this).parent().addClass("checkColor");
						} else {
							$(this).parent().removeClass("checkColor");
						}
					});
				});	
	</script> 
	<!-- 동적으로 입력 폼 추가/삭제-->
	<script>
		function add_item() {
			// append-form 에 있는 내용을 읽어와서 처리..
			var div = document.createElement('div');
			div.innerHTML = document.getElementById('append-form').innerHTML;
			document.getElementById('field').appendChild(div);
		}
		function remove_item(obj) {
			// obj.parentNode 를 이용하여 삭제
			document.getElementById('field').removeChild(obj.parentNode.parentNode.parentNode);
		}
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
                                <li class="nav-item" style="margin-right: 100px;"><a href="location.html"><h5>홈짐</h5></a></li>
                                <li class="nav-item" style="margin-right: 120px;"><a href="community.html"><h5>트레이너</h5></a></li>
                                <a class="circle-image" href="mypage_main.html">
                                    <img src="https://via.placeholder.com/300x300" alt="logo">
                                </a>
                                <li class="nav-item"><a href="mypage_main.html"><h5>아이유님</h5></a></li>
                                
                            </ul>
                        </div> <!-- navbar collapse -->
                    </nav> <!-- navbar -->
                </div>
                </div>
            </div> <!-- row -->
        </div> <!-- container -->
    </header>
    <!-- End Header Area -->
    <!-- End Header Area -->
	<!-- End Header Area -->

	<!-- Start Breadcrumbs -->
	<div class="intro overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="intro-content">
						<h1 class="page-title">홈짐 등록하기</h1>
						<p>나만의 홈짐을 등록해 볼까요?</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<section id="contact-us" class="contact-us section">
		<div class="container">
			<div class="row">
				<div class="col-lg-13 col-md-12 col-12">
					<div class="form-main">
						<h3 class="title">
							<span>내 홈짐을 공유해보세요!</span>홈짐등록 게시판
						</h3>
						<form class="form" method="post" action="assets/mail/mail.php">
							<div class="row">
								<div class="col-lg-12 col-12">
									<div class="form-group">
										<label>글제목</label> <input name="name" type="text" placeholder=""
											required="required">
									</div>
								</div>

								<div class="col-lg-6 col-10">
									<div class="form-group">
										<label>주소</label> <input type="text" id="sample5_address" class="form-control"
											placeholder="주소" required="true" readonly="true" />
									</div>
								</div>
								<div class="col-lg-2 col-2">
									<input type="button" onclick="sample5_execDaumPostcode()" class="btn btn-warning"
										style="margin-top: 28px; padding: .80rem .100rem;" value="주소 검색"> <br>
								</div>
								<div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none">
								</div>
								<p></p>
								<div class="row">
									<div class="col-lg-3 col-12">
										<div class="form-group">
											<label>예약가능날짜</label>
											<input type='date' id="now_date" name='today' />
										</div>
									</div>
									<div class="col-lg-3 col-12">
										<div class="form-group">
											<label>시작 시간 : </label>
											<input type='time' />
										</div>
									</div>
									<div class="col-lg-3 col-12">
										<div class="form-group">
											<label>종료 시간 : </label>	
											<input type='time' /><br>
										</div>
									</div>
									<div class="col-lg-2 col-12" style="justify-content: center;">
										<button type="button" class="btn btn-warning btnAdd"
											style="margin-top: 1.6rem; padding: .80rem .100rem;"
											onclick="add_item()">추가하기</button>
									</div>
								</div>
								<div id="append-form" style="display:none">
									<div class="row">
										<div class="col-lg-3 col-12">
											<div class="form-group">
												<label>예약가능날짜</label>
												<input type='date' id="now_date" name='today' />
											</div>
										</div>
										<div class="col-lg-3 col-12">
											<div class="form-group">
												<label>시작 시간 : </label>
												<input type='time' />
											</div>
										</div>
										<div class="col-lg-3 col-12">
											<div class="form-group">
												<label>종료 시간 : </label>
												<input type='time' /><br>
											</div>
										</div>
										<div class="col-lg-2 col-12">
											<button type="button" class="btn btn-warning btnAdd"
												style="margin-top: 28px; padding: .80rem .100rem;"
												onclick="remove_item(this)">삭제하기</button>
										</div>
									</div>
								</div>

								<!-- 추가되는 공간-->
								<div class="row" id="field">
								</div>

								<div class="row home_options" style="margin-bottom: 18px;">
									<div class="btn-group-toggle" data-toggle="buttons">
										<p><labal style="color:black; font-size: 13px;">활동 범위를 체크해주세요.</label></p>
										 <label class="btn btn-outline-secondary" style="margin: 5px 10px 5px 0px; padding: 0px 15px 0px 15px;">
											 <input type="checkbox"  id='homegym_op' name='homegym_options'>
											 <p>주차가능</p>
										 </label>
										 <label class="btn btn-outline-secondary" style="margin: 5px 10px 5px 0px; padding: 0px 15px 0px 15px;">
											 <input type="checkbox" id='homegym_op' name='homegym_options'>
											 <p>와이파이가능</p>
										 </label>
										 <label class="btn btn-outline-secondary" style="margin: 5px 10px 5px 0px; padding: 0px 15px 0px 15px;">
											 <input type="checkbox" id='homegym_op' name='homegym_options'>
											 <p>샤워가능</p>
										 </label>
										 <label class="btn btn-outline-secondary" style="margin: 5px 10px 5px 0px; padding: 0px 15px 0px 15px;">
											<input type="checkbox" id='homegym_op' name='homegym_options'>
											<p>정수기보유</p>
										</label>
										<label class="btn btn-outline-secondary" style="margin: 5px 10px 5px 0px; padding: 0px 15px 0px 15px;">
											<input type="checkbox" id='homegym_op' name='homegym_options'>
											<p>에어컨보유</p>
										</label>
									 </div>
							 	</div>
							
								<div class="col-lg-12 col-12">
									<div class="form-group">
										<label sytle="margin-top:10px;">이미지 첨부</label>
									</div>
									<div>
										<input type="file" id="img_upload" name="file" accept="image/*"
											style="margin-bottom: 30px;">
									</div>
								</div>
								<div class="col-12">
									<div class="form-group message">
										<label>글 내용</label>
										<textarea name="message" placeholder=""></textarea>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group button" >
										<button type="submit" class="btn">게시물 등록</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!--/ End Contact Area -->
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


	<!-- 주소api 스크립트-->
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
				level: 5 // 지도의 확대 레벨
			};

		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
			position: new daum.maps.LatLng(37.537187, 127.005476),
			map: map
		});


		function sample5_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function (data) {
					var addr = data.address; // 최종 주소 변수

					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("sample5_address").value = addr;
					// 주소로 상세 정보를 검색
					geocoder.addressSearch(data.address, function (results, status) {
						// 정상적으로 검색이 완료됐으면
						if (status === daum.maps.services.Status.OK) {

							var result = results[0]; //첫번째 결과의 값을 활용

							// 해당 주소에 대한 좌표를 받아서
							var coords = new daum.maps.LatLng(result.y, result.x);
							// 지도를 보여준다.
							mapContainer.style.display = "block";
							map.relayout();
							// 지도 중심을 변경한다.
							map.setCenter(coords);
							// 마커를 결과값으로 받은 위치로 옮긴다.
							marker.setPosition(coords)
						}
					});
				}
			}).open();
		}
	</script>

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
</body>

</html>