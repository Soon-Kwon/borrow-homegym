<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>빌려줘! 홈짐 - 트레이너 찾기!</title>
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
									<a class="circle-image" href="mypage_main.html">
										<img src="https://via.placeholder.com/300x300" alt="logo">
									</a>
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

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs overlay">
        <div class="container">
            <div class="row align-items-center"></div>
           
            
                <div class="col-lg-8 offset-lg-2 col-md-12 col-12"></div>
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">트레이너 둘러보기</h1>
                        <p>여러분의 건강과 식단을 책임져줄 트레이너! 여러분이 선택하세요!</p>
                    </div>
              
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Events Area-->
    <section class="courses section grid-page">
        <div class="container">
            <form class="d-flex search-form">
                <input class="form-control me-2" type="search" placeholder="트레이너 검색"
                    aria-label="Search">
                <button class="btn btn-outline-success" type="submit"><i
                        class="lni lni-search-alt"></i></button>
            </form>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Start Single Course -->
                    <div class="single-course wow fadeInUp" data-wow-delay=".2s">
                        <div class="course-image">
                            <a href="course-details.html"><img src="../Template Main/assets/images/trainer/kim001.png" alt="Logo"></a>
                               
                        </div>
                        <div class="content">
                            <h3><a href="service-single.html">확찐자 맞춤 트레이닝</a></h3>
                            <p>"가성비 갑 ! 현실적으로 효율적으로 현명하게 몸만들기!"<br>
                                전문분야<br>
                                하체라인, 다이어트, 바른체형</p>
                        </div>
                        <div class="bottom-content">
                            <ul class="review">
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li>22 Reviews</li>
                            </ul>
                            <span class="tag">
                                <i class="lni lni-tag"></i>
                                <a href="course-details.html">자세히 보기</a>
                            </span>
                        </div>
                    </div>
                    <!-- End Single Course -->
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Start Single Course -->
                    <div class="single-course wow fadeInUp" data-wow-delay=".4s">
                        <div class="course-image">
                            <a href="course-details.html"><img src="../Template Main/assets/images/trainer/kim002.png" alt="Logo"></a>

                            
                        </div>
                        <div class="content">
                            <h3><a href="service-single.html">근력강화 맞춤 트레이닝</a></h3>
                            <p>"운동은 보험입니다 그리고 믿음이 느껴지는 선생님과 함께 하세요"<br>
                                기초체력, 하체라인, 다이어트, 대회준비, 근력향상.</p>
                        </div>
                        <div class="bottom-content">
                            <ul class="review">
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li>10 Reviews</li>
                            </ul>
                            <span class="tag">
                                <i class="lni lni-tag"></i>
                                <a href="javascript:void(0)">자세히 보기</a>
                            </span>
                        </div>
                    </div>
                    <!-- End Single Course -->
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Start Single Course -->
                    <div class="single-course wow fadeInUp" data-wow-delay=".6s">
                        <div class="course-image">
                            <a href="course-details.html"><img src="../Template Main/assets/images/trainer/kim003.png" alt="Logo"></a>
                                
                           
                        </div>
                        <div class="content">
                            <h3><a href="service-single.html">하나부터 열까지</a></h3>
                            <p>
                                "안녕하세요. 트레이너 홍길동입니다"<br>
                                전문분야<br>
                                근력향상, 하체라인, 다이어트</p>
                        </div>
                        <div class="bottom-content">
                            <ul class="review">
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li>55 Reviews</li>
                            </ul>
                            <span class="tag">
                                <i class="lni lni-tag"></i>
                                <a href="javascript:void(0)">자세히 보기</a>
                            </span>
                        </div>
                    </div>
                    <!-- End Single Course -->
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Start Single Course -->
                    <div class="single-course wow fadeInUp" data-wow-delay=".2s">
                        <div class="course-image">
                            <a href="course-details.html"><img src="../Template Main/assets/images/trainer/kim004.png" alt="Logo"></a>
                               
                            
                        </div>
                        <div class="content">
                            <h3><a href="service-single.html">이번 여름을 위해</a></h3>
                            <p>"슬림 탄탄 예쁜 몸매, 노력하면 만들수 있습니다" 제가 도와드릴게요💡"
                                전문분야
                                하체라인, 다이어트, 바른체형</p>
                        </div>
                        <div class="bottom-content">
                            <ul class="review">
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li>60 Reviews</li>
                            </ul>
                            <span class="tag">
                                <i class="lni lni-tag"></i>
                                <a href="javascript:void(0)">자세히 보기</a>
                            </span>
                        </div>
                    </div>
                    <!-- End Single Course -->
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Start Single Course -->
                    <div class="single-course wow fadeInUp" data-wow-delay=".4s">
                        <div class="course-image">
                            <a href="course-details.html"><img src="../Template Main/assets/images/trainer/kim005.png">
                               </a>
                            
                        </div>
                        <div class="content">
                            <h3><a href="service-single.html">너도 할 수 있다</a></h3>
                            <p>
                                "저와 함께 예쁜 몸 & 건강한 몸 재밌게 만들어요."
                                전문분야
                                기초체력, 다이어트</p>
                        </div>
                        <div class="bottom-content">
                            <ul class="review">
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li>25 Reviews</li>
                            </ul>
                            <span class="tag">
                                <i class="lni lni-tag"></i>
                                <a href="javascript:void(0)">자세히보기</a>
                            </span>
                        </div>
                    </div>
                    <!-- End Single Course -->
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Start Single Course -->
                    <div class="single-course wow fadeInUp" data-wow-delay=".6s">
                        <div class="course-image">
                            <a href="course-details.html"><img src="../Template Main/assets/images/trainer/kim006.png">
                               </a>
                            
                        </div>
                        <div class="content">
                            <h3><a href="service-single.html">올 여름 저와함께 해요</a></h3>
                            <p>김민지 코치
                                "대한민국 강남구 서초동 퍼스널트레이너 김민지"
                                "가능하다는 것을 보여드리겠습니다"
                            </p>
                        </div>
                        <div class="bottom-content">
                            <ul class="review">
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li>35 Reviews</li>
                            </ul>
                            <span class="tag">
                                <i class="lni lni-tag"></i>
                                <a href="javascript:void(0)">자세히 보기</a>
                            </span>
                        </div>
                    </div>
                    <!-- End Single Course -->
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <!-- Pagination -->
                    <div class="pagination center">
                        <ul class="pagination-list">
                            <li><a href="javascript:void(0)">Prev</a></li>
                            <li class="active"><a href="javascript:void(0)">1</a></li>
                            <li><a href="javascript:void(0)">2</a></li>
                            <li><a href="javascript:void(0)">3</a></li>
                            <li><a href="javascript:void(0)">4</a></li>
                            <li><a href="javascript:void(0)">Next</a></li>
                        </ul>
                    </div>
                    <!--/ End Pagination -->
                </div>
            </div>
        </div>
    </section>
    <!-- End Events Area-->

   
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
</body>

</html>