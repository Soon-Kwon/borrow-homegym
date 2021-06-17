<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>빌려줘! 홈짐 - 홈짐 찾기</title>
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
                <span></span>
                <span></span>
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
								data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
							</button>
							<form class="d-flex search-form">
								<input class="form-control me-2" type="search" placeholder="동네 이름을 검색해보세요!" aria-label="Search">
								<button class="btn btn-outline-success" type="submit"><i class="lni lni-search-alt"></i></button>
							</form>
							<div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
								<ul id="nav" class="navbar-nav ms-auto">
									<li class="nav-item" style="margin-right: 100px;"><a href="location.html">
											<h5>홈짐</h5>
										</a></li>
									<li class="nav-item" style="margin-right: 120px;"><a href="community.html">
											<h5>트레이너</h5>
										</a></li>
										<li class="nav-item" style="margin-right: 120px;">
									<a class="circle-image" href="mypage_main.html">
										<img src="https://via.placeholder.com/300x300" alt="logo">
									</a>
									</li>
									<li class="nav-item">
										<a href="mypage_main.html"><h5>아이유님</h5></a>
										</li>
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
    <!-- Start Event Details -->
    <div class="event-details section">
        <div class="container">
            <div class="row">
                <!-- Start Event Details Content -->
                <div class="col-lg-8 col-12">
                  <div id="map" style="width:100%;height:650px;"></div>
                    <div class="details-content">
                        <!-- Start Google-map Area -->
                        <div class="map-section">
            			  <p class="location"> <i class="lni lni-map-marker"></i> 홈짐 주소 나오는 곳</p>
                 	   </div>
                    <!-- End Google-map Area -->
                </div>
            </div>
            <!-- End Event Details Content -->
            <!-- Start Event Details Sidebar -->
            <div class="col-lg-4 col-12">
                <div class="event-sidebar">
                    <!-- Start Single Widget -->
                    <div class="single-widget other-event-wedget">
                        <h3 class="sidebar-widget-title" style="margin-bottom: 0px;"> 플레이스🏠</h3>
                        <div style="margin: 30px 0px;">
                        </div>
                        <ul class="other-event">
                            <li class="single-event">
                                <div class="thumbnail">
                                    <a href="javascript:void(0)" class="image"><img
                                            src="https://via.placeholder.com/170x170" alt="Event Image"></a>
                                </div>
                                <div class="info">
                                    <span class="date"><i class="lni lni-apartment"></i>임윤아님의 홈짐</span>
                                    <h6 class="title"><a href="homegym-details.html">각종 헬스기구들을 보유한 임하우스입니다</a></h6>
                                    <span style="font-size: 11px; padding-top: 20px">서울시 종로구 인사동</span>
                                </div>
                            </li>
                            <li class="single-event">
                                <div class="thumbnail">
                                    <a href="javascript:void(0)" class="image"><img
                                            src="https://via.placeholder.com/170x170" alt="Event Image"></a>
                                </div>
                                <div class="info">
                                    <span class="date"><i class="lni lni-apartment"></i> 김연아님의 홈짐</span>
                                    <h6 class="title"><a href="homegym-details.html">각종 헬스기구들을 보유한 김하우스입니다</a></h6>
                                    <span style="font-size: 11px; padding-top: 20px">서울시 서초구 논현동</span>
                                </div>
                            </li>
                            <li class="single-event">
                                <div class="thumbnail">
                                    <a href="javascript:void(0)" class="image"><img
                                            src="https://via.placeholder.com/170x170" alt="Event Image"></a>
                                </div>
                                <div class="info">
                                    <span class="date"><i class="lni lni-apartment"></i> 권지용님의 홈짐</span>
                                    <h6 class="title"><a href="homegym-details.html">각종 헬스기구들을 보유한 권하우스입니다</a></h6>
                                    <span style="font-size: 11px; padding-top: 20px">서울시 강서구 화곡동</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                     <div class="row">
                <div class="col-12">
                    <!-- Pagination -->
                    <div class="pagination right" style="margin: 0px 50px 0px 0px;">
                        <ul class="pagination-list">
                            <li><a href="javascript:void(0)">이전</a></li>
                            <li class="active"><a href="javascript:void(0)">1</a></li>
                            <li><a href="javascript:void(0)">2</a></li>
                            <li><a href="javascript:void(0)">3</a></li>
                            <li><a href="javascript:void(0)">4</a></li>
                            <li><a href="javascript:void(0)">다음</a></li>
                        </ul>
                    </div>
                    <!--/ End Pagination -->
                </div>
            </div>
                    <!-- End Single Widget -->
                </div>
            </div>
            <!-- End Event Details Sidebar -->
        </div>
    </div>
    </div>
    <!-- Start Event Details -->


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
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
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