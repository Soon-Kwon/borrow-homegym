<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
 	String memberId = session.getAttribute("memberId").toString();
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>빌려줘! 홈짐 - 마이페이지</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo/logo.png" />
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
    <style>
        .latest-news-area {
            background-color: #fff;
        }
        .flex-box{
            display: flex;
            justify-content: space-around;
            flex-grow: 2;
        }
    </style>
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
                        <a class="navbar-brand" href="/index.jsp">
                            <img src="../assets/images/logo/로고2.png" alt="logo">
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
                                <li class="nav-item" style="margin-right: 100px;"><a href="/homegym/hg_list.do"><h5>홈짐</h5></a></li>
                                <li class="nav-item" style="margin-right: 120px;"><a href="/trainer/tr_list.do"><h5>트레이너</h5></a></li>
                                <a class="circle-image" href="mp_main.do">
                                    <img src="https://via.placeholder.com/300x300" alt="logo">
                                </a>
                                <li class="nav-item"><a href="mp_main.do"><h5>아이유님</h5></a></li>
                                
                            </ul>
                        </div> <!-- navbar collapse -->
                    </nav> <!-- navbar -->
                </div>
                </div>
            </div> <!-- row -->
        </div> <!-- container -->
    </header>
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs overlay">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">마이페이지</h1>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

        <!-- Course Details Section Start -->
    <div class="course-details section">
        <div class="container">
            <div class="row">
                <!-- Start Course Sidebar -->
                <div class="col-lg-3 col-8">
                    <div class="course-sidebar">
                        
                        <div class="sidebar-widget other-course-wedget">
                            <h3 class="sidebar-widget-title"><a href="profile.do">마이페이지</a></h3>
                            <div class="sidebar-widget-content">
                                <ul class="sidebar-widget-course">
                                    <li class="single-course">
                                        <div class="info">
                                            <h6 class="title"><a href="profile_update.do">내 정보수정</a></h6>
                                        </div>
                                    </li>
                                    <li class="single-course">
                                        <div class="info">
                                            <h6 class="title"><a
                                                    href="myactiv">나의 활동내역</a></h6>
                                        </div>
                                    </li>
                                    <li class="single-course">
                                        <div class="info">
                                            <h6 class="title"><a href="mywrite.do">글 관리</a></h6>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="sidebar-widget">
                            <h3 class="sidebar-widget-title">검색해보세요</h3>
                            <div class="sidebar-widget-content">
                                <div class="sidebar-widget-search">
                                    <form action="#">
                                        <input type="text" placeholder="Search...">
                                        <button><i class="lni lni-search-alt"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Course Sidebar -->


                <!-- Course Details Wrapper Start -->
                <div class="col-lg-8 col-12">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="overview-tab" data-bs-toggle="tab"
                                data-bs-target="#overview" type="button" role="tab" aria-controls="overview"
                                aria-selected="true">빌려준 홈짐</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="curriculum-tab" data-bs-toggle="tab"
                                data-bs-target="#curriculum" type="button" role="tab" aria-controls="curriculum"
                                aria-selected="false">빌린 홈짐</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="instructor-tab" data-bs-toggle="tab"
                                data-bs-target="#instructor" type="button" role="tab" aria-controls="instructor"
                                aria-selected="false">진행중 홈짐</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="reviews-tab" data-bs-toggle="tab" data-bs-target="#reviews"
                                type="button" role="tab" aria-controls="reviews" aria-selected="false">완료된 홈짐</button>
                        </li>
                    </ul>

                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="overview" role="tabpanel"
                            aria-labelledby="overview-tab">
                            <div class="course-overview">
                                
                                <!-- Start Blog Singel Area -->
                                <section class="section latest-news-area blog-grid-page" style="padding-top:40px;">
                                    <div class="container">
                                        <!-- <h3 class="comment-title">Reviews</h3> -->
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-12">
                                                <c:choose>
                                    				<c:when test ="${fn:length(board)==0}">
	                                    				<div style="font-size: 20px; text-align:center;">
															<p style="margin:40px; font-weight: bold;">아직 빌려준 홈짐이 없습니다.😥</p></td>
															<div class="flex-box">
                                                                  <div class="button accept-btn">
                                                                      <a href="blog-single-sidebar.html" class="btn">빌려주러 가기</a>
                                                                   </div>
                                                            </div>
														</div>
                                    				</c:when>
                                    			<c:otherwise>
                                    					<c:forEach var="board" items="${board}" varStatus="status">
                                                <div class="row">
                                                    
                                                    <div class="col-lg-6 col-12">
                                                        <!-- Single News -->
                                                        <div class="single-news custom-shadow-hover wow fadeInUp"
                                                            data-wow-delay=".4s">
                                                            <div class="image">
                                                                <a href="blog-single-sidebar.html"><img class="thumb"
                                                                        src="https://via.placeholder.com/1050x700"
                                                                        alt="#"></a>
                                                            </div>
                                                            <div class="content-body">
                                                                <div class="meta-data">
                                                                    <ul>
                                                                        <li>
                                                                            <i class="lni lni-tag"></i>
                                                                            <a href="javascript:void(0)">임하우스</a>
                                                                        </li>
                                                                        <li>
                                                                            <!-- <i class="lni lni-tag"></i> -->
                                                                            <a href="javascript:void(0)">서울시 종로구 인사동</a>
                                                                        </li>
                                                                        <li>
                                                                            <i class="lni lni-calendar"></i>
                                                                            <a href="javascript:void(0)">요청 대기</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                
                                                                <div class="flex-box">

                                                                    <div class="button accept-btn">
                                                                        <a href="blog-single-sidebar.html" class="btn">수락하기</a>
                                                                    </div>
                                                                    <div class="button deny-btn">
                                                                        <a href="blog-single-sidebar.html" class="btn">거절하기</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- End Single News -->
                                                    </div>
                                           </c:forEach>
                                          </c:otherwise>
                                    </c:choose>
                                                    
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
                                <!-- End Blog Singel Area -->
                            </div>
                        </div>
                       
                       <!-- 빌려준 홈짐 끝 & 빌린 홈짐 시작 --> 
                        
                        
                        
                        <div class="tab-pane fade" id="curriculum" role="tabpanel" aria-labelledby="curriculum-tab">
                            <div class="course-curriculum">
                                <!-- Start Blog Singel Area -->
                                <section class="section latest-news-area blog-grid-page" style="padding-top:40px;">
                                    <div class="container">
                                        <!-- <h3 class="comment-title">Reviews</h3> -->
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-12">
                                                 <c:choose>
                                    				<c:when test ="${fn:length(board)==0}">
	                                    				<div style="font-size: 20px; text-align:center;">
															<p style="margin:40px; font-weight: bold;">아직 빌린 홈짐이 없습니다.😥</p></td>
															<div class="flex-box">
                                                                  <div class="button accept-btn">
                                                                      <a href="blog-single-sidebar.html" class="btn">빌리러 가기</a>
                                                                   </div>
                                                            </div>
														</div>
                                    				</c:when>
                                    			<c:otherwise>
                                    					<c:forEach var="board" items="${board}" varStatus="status">
                                                <div class="row">
                                                    
                                                    <div class="col-lg-6 col-12">
                                                        <!-- 빌린홈짐 -->
                                                        <div class="single-news custom-hover">
                                                            <div class="image">
                                                                <a href="blog-single-sidebar.html"><img class="thumb"
                                                                        src="https://via.placeholder.com/1050x700"
                                                                        alt="#"></a>
                                                            </div>
                                                            <div class="content-body">
                                                                <div class="meta-data">
                                                                    <ul>
                                                                        <li>
                                                                            <i class="lni lni-tag"></i>
                                                                            <a href="javascript:void(0)">임하우스1212</a>
                                                                        </li>
                                                                        <li>
                                                                            <!-- <i class="lni lni-tag"></i> -->
                                                                            <a href="javascript:void(0)">서울시 종로구 인사동</a>
                                                                        </li>
                                                                        <li>
                                                                            <i class="lni lni-calendar"></i>
                                                                            <a href="javascript:void(0)">요청대기</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                
                                                                 <div class="flex-box">

                                                                    <div class="button accept-btn">
                                                                        <a href="blog-single-sidebar.html" class="btn">결제하기</a>
                                                                    
                                                                    </div>
                                                                    <!--  <div class="button accept-btn">
                                                                        <a href="blog-single-sidebar.html" class="btn">수락대기중</a>
                                                                    
                                                                    </div>--> 
                                                                    <div class="button deny-btn">
                                                                        <a href="blog-single-sidebar.html" class="btn">상세보기</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- 빌린홈짐 1  -->
                                                    </div>
                                                  </c:forEach>
                                          </c:otherwise>
                                    </c:choose>
                                                 
                                                  
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
                                <!-- End Blog Singel Area -->
                                
                            </div>
                        </div>

                        <!-- 빌린 홈짐 끝 & 진행 중 홈짐 시작 -->
                        
                        
                        <div class="tab-pane fade" id="instructor" role="tabpanel" aria-labelledby="instructor-tab">
                            <div class="course-instructor">
                                <!-- Start Blog Singel Area -->
                                <section class="section latest-news-area blog-grid-page" style="padding-top:40px;">
                                    <div class="container">
                                        <!-- <h3 class="comment-title">Reviews</h3> -->
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-12">
                                                  <c:choose>
                                    				<c:when test ="${fn:length(board)==0}">
	                                    				<div style="font-size: 20px; text-align:center;">
															<p style="margin:40px; font-weight: bold;">아직 진행중인 홈짐이 없습니다.😥</p></td>
															<div class="flex-box">
                                                                  <div class="button accept-btn">
                                                                      <a href="blog-single-sidebar.html" class="btn">빌려주러 가기</a>
                                                                   </div>
                                                            </div>
														</div>
                                    				</c:when>
                                    			<c:otherwise>
                                    			<c:forEach var="board" items="${board}" varStatus="status">
                                                <div class="row">
                                                    
                                                    <div class="col-lg-6 col-12">
                                                        <!-- 진행중인 홈짐 1 -->
                                                        <div class="single-news custom-hover">
                                                            <div class="image">
                                                                <a href="blog-single-sidebar.html"><img class="thumb"
                                                                        src="https://via.placeholder.com/1050x700"
                                                                        alt="#"></a>
                                                            </div>
                                                            <div class="content-body">
                                                                <div class="meta-data">
                                                                    <ul>
                                                                        <li>
                                                                            <i class="lni lni-tag"></i>
                                                                            <a href="javascript:void(0)">임하우스0000</a>
                                                                        </li>
                                                                        <li>
                                                                            <!-- <i class="lni lni-tag"></i> -->
                                                                            <a href="javascript:void(0)">서울시 종로구 인사동</a>
                                                                        </li>
                                                                        <li>
                                                                            <i class="lni lni-calendar"></i>
                                                                            <a href="javascript:void(0)">요청 대기</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                
                                                                <div class="flex-box">
                                                                    <div class="button deny-btn">
                                                                        <a href="blog-single-sidebar.html" class="btn">취소하기</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- 진행중인 홈짐 1 끝 -->
                                                    </div>
                                                 </c:forEach>
                                          </c:otherwise>
                                    </c:choose>
                                                  
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
                                <!-- End Blog Singel Area -->
                            </div>
                            
                        </div>
                     
                     <!-- 진행중인 홈짐 끝 & 완료된 홈짐 시작 -->   
                        
                        <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                            <div class="course-reviews">
                                <section class="section latest-news-area blog-grid-page" style="padding-top:40px;">
                                    <div class="container">
                                        <!-- <h3 class="comment-title">Reviews</h3> -->
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-12">
                                                <c:choose>
                                    				<c:when test ="${fn:length(board)==0}">
	                                    				<div style="font-size: 20px; text-align:center;">
															<p style="margin:40px; font-weight: bold;">아직 완료된 홈짐이 업습니다.😥</p></td>
															
														</div>
                                    				</c:when>
                                    			<c:otherwise>
                                    			<c:forEach var="board" items="${board}" varStatus="status">
                                                <div class="row">
                                                    
                                                    <div class="col-lg-6 col-12">
                                                        <!-- 완료된 홈짐 1 -->
                                                        <div class="single-news custom-hover">
                                                            <div class="image">
                                                                <a href="blog-single-sidebar.html"><img class="thumb"
                                                                        src="https://via.placeholder.com/1050x700"
                                                                        alt="#"></a>
                                                            </div>
                                                            <div class="content-body">
                                                                <div class="meta-data">
                                                                    <ul>
                                                                        <li>
                                                                            <i class="lni lni-tag"></i>
                                                                            <a href="javascript:void(0)">석하우스</a>
                                                                        </li>
                                                                        <li>
                                                                            <!-- <i class="lni lni-tag"></i> -->
                                                                            <a href="javascript:void(0)">서울시 종로구 인사동</a>
                                                                        </li>
                                                                        <li>
                                                                            <i class="lni lni-calendar"></i>
                                                                            <a href="javascript:void(0)">요청 완료</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                
                                                                 <div class="flex-box">
                                                                    <div class="button accept-btn">
                                                                        <a href="blog-single-sidebar.html" class="btn">리뷰쓰기</a>
                                                                    </div>
                                                                    <div class="button deny-btn">
                                                                        <a href="blog-single-sidebar.html" class="btn">상세보기</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </c:forEach>
                                          </c:otherwise>
                                    </c:choose>
                                                   
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
                                <!-- End Blog Singel Area -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Course Details Wrapper -->

            </div>
        </div>
    </div>
    <!-- Course Details Section End -->

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
                                <a href="/index.jsp"><img src="../assets/images/logo/로고1.png" alt="Logo"></a>
                            </div>
                        </div>
                        <div class="col-md-6" style="text-align: end;">
                            <p>
                                <br>
                                <a href=""> 자주묻는 질문</a>
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
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/count-up.min.js"></script>
    <script src="../assets/js/wow.min.js"></script>
    <script src="../assets/js/tiny-slider.js"></script>
    <script src="../assets/js/glightbox.min.js"></script>
    <script src="../assets/js/main.js"></script>
</body>
</html>