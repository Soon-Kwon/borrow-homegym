<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
 
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>빌려줘! 홈짐 - 트레이너 찾기!</title>
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
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/assets/css/LineIcons.2.0.css" />
<link rel="stylesheet" href="/resources/assets/css/animate.css" />
<link rel="stylesheet" href="/resources/assets/css/tiny-slider.css" />
<link rel="stylesheet" href="/resources/assets/css/glightbox.min.css" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<!-- jquery -->    
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <!-- 페이징 관련 자바스크립트 -->
    <script>
		$(document).ready(function(){
			
			// 페이지 버튼 클릭했을 때 이동
			var actionForm = $("#actionForm");
			
			$(".paginate_button a").on("click", function(e){
				
				e.preventDefault();
				
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			// 제목 클릭시 해당 글로 이동하는 form
			$(".move").on("click", function(e){
				
				e.preventDefault();
				
				actionForm.append("<input type='hidden' name='hId' value='" 
						+ $(this).attr("href") + "'>");
				actionForm.attr("action", "/trainer/tbDetail.do");
				actionForm.submit();
			});
		
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
							<a class="navbar-brand" href="main_index.html"> <img
								src="/resources/assets/images/logo/로고2.png"
								alt="logo">
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
									<a class="circle-image" href="mypage_main.html"> <img
										src="https://via.placeholder.com/300x300" alt="logo">
									</a>
									<li class="nav-item"><a href="mypage_main.html"><h5>아이유님</h5></a>
									</li>
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
	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center"></div>


			<div class="col-lg-8 offset-lg-2 col-md-12 col-12"></div>
			<div class="breadcrumbs-content">
				<h1 class="page-title">트레이너 둘러보기</h1>
				<p>여러분의 건강과 식단을 책임져 줄 트레이너! 여러분이 선택하세요!</p>
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
				<button class="btn btn-outline-success" type="submit">
					<i class="lni lni-search-alt"></i>
				</button>
			</form>
			<!-- 글 리스트 나오는 구역 -->
				<div class="row">
			<c:forEach items="${trainerBoardList}" var="trBoard">
					<div class="col-lg-4 col-md-6 col-12">
						<!-- Start Single Course -->
						<div class="single-course wow fadeInUp" data-wow-delay=".2s">
							<div class="course-image">
								<a href="tbDetail.do?tno=${trBoard.tno}"> 
									<img src="/resources/assets/images/trainer/kim001.png">
								</a>

							</div>
							<div class="content">
								<h3>
									<a href="service-single.html">${trBoard.tbTitle}</a>
								</h3>
								<p>${trBoard.tbContent}</p>
							</div>
						</div>
					</div>
			</c:forEach>
				</div>
			         <div class="row">
                <div class="col-12">
                    <!-- Pagination -->
                    <div class="pagination center" >
                        <ul class="pagination-list">
                        	<c:if test="${pageMaker.prev }">
                        		<li class="paginate_button previous"><a href="${pageMaker.startPage -1 }">이전</a></li>
                        	</c:if>
                        
                        	<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                        		<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }">
                        		<a href="${num }">${num }</a></li>
                        	</c:forEach>
                        	
                        	<c:if test="${pageMaker.next }">
                        		<li class="paginate_button next"><a href="${pageMaker.endPage + 1 }">다음</a>
                        	</c:if>
                        </ul>
                        <!-- 페이지 번호 클릭했을 때 전송되는 form -->
                        <form id="actionForm" action="/trainer/tbList.do" method="get">
                        	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
                        	<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
                        </form>
                    </div>
                    <!--/ End Pagination -->
                </div>
                <div class="button" style="margin-top: 30px; text-align: center">
							<button type="button" class="btn"
								style="background-color: #5c6dbd; color: aliceblue; border-radius: 5px;">
								<a href="tbWrite.do">글쓰기 </a>
							</button>
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
								<br> <br> <a href="main_index.html"><img
									src="/resources/assets/images/logo/로고1.png"
									alt="Logo"></a>
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

	<!-- ========================= JS here ========================= -->
	<script
		src="/resources/assets/js/bootstrap.min.js"></script>
	<script
		src="/resources/assets/js/count-up.min.js"></script>
	<script
		src="/resources/assets/js/wow.min.js"></script>
	<script
		src="/resources/assets/js/tiny-slider.js"></script>
	<script
		src="/resources/assets/js/glightbox.min.js"></script>
	<script
		src="/resources/assets/js/main.js"></script>
</body>

</html>