<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String memberId = session.getAttribute("memberId").toString();
 %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>글 관리</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo/logo.png" />
    <!-- Place favicon.ico in the root directory -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                            <img src="/assets/images/logo/로고2.png" alt="logo">
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

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs overlay">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">글 관리</h1>
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
                            <h3 class="sidebar-widget-title">마이페이지</h3>
                            <div class="sidebar-widget-content">
                                <ul class="sidebar-widget-course">
                                    <li class="single-course">
                                        <div class="info">
                                            <h6 class="title"><a href="course-details.html">내 정보수정</a></h6>
                                        </div>
                                    </li>
                                    <li class="single-course">
                                        <div class="info">
                                            <h6 class="title"><a
                                                    href="course-details.html">나의 활동내역</a></h6>
                                        </div>
                                    </li>
                                    <li class="single-course">
                                        <div class="info">
                                            <h6 class="title"><a href="course-details.html">글 관리</a></h6>
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

                <div class="col-lg-9 col-9">
                    <h5 style="margin-bottom: 20px;">글 관리</h5>
                    <ul class="nav nav-tabs" id="myTab" role="tablist">

                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="overview-tab" data-bs-toggle="tab"
                                data-bs-target="#overview" type="button" role="tab" aria-controls="overview"
                                aria-selected="true">게시글</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="curriculum-tab" data-bs-toggle="tab"
                                data-bs-target="#curriculum" type="button" role="tab" aria-controls="curriculum"
                                aria-selected="false">댓글</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="instructor-tab" data-bs-toggle="tab"
                                data-bs-target="#instructor" type="button" role="tab" aria-controls="instructor"
                                aria-selected="false">리뷰</button>
                        </li>
                    </ul>
                    
                  <!-- 게시글 탭 -->
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="overview" role="tabpanel"
                            aria-labelledby="overview-tab">
                            <div class="course-overview">
                                <div class="table-responsive">
                                    <table class="table table-hover" style="text-align: center; line-height: 35px;">
                                        <thead class="thead-light">
                                        <tr>
                                            <th>게시글번호</th>
                                            <th>게시글제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                        </tr>
                                        </thead>
                                      <tbody>
                                    <c:choose>
                                    	<c:when test ="${fn:length(board)==0}">
                                    	<div style="font-size: 20px">
                                    		<tr>
												<td colspan="4"><p style="margin:40px; font-weight: bold;">아직 작성한 게시글이 없습니다.😥</p></td>
											</tr>
											
										</div>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<c:forEach var="board" items="${board}" varStatus="status">
		                                    	<tr>
		                                            <td>${board.tno}</td>
		                                            <td><a href="course-details.html">${board.TContent}</a></td>
		                                            <td>${board.memberId}</td>
		                                            <td><fmt:formatDate pattern= "yyyy-MM-dd" value="${board.TRegDate}" /></td>
		                                        </tr>
                                    		</c:forEach>
                                    	</c:otherwise>
                                    </c:choose>
                                </tbody>
                                    </table>
                                </div> 
                                  <!-- <div class="bottom-content"> -->
                                    <div class="row align-items-center">
                                        <div class="col-lg-12 col-md-12 col-12">
                                            <div class="button" style="width: 200px; margin: 20px auto 0 auto; col">
                                                <a href="" class="btn">게시글 쓰러가기</a>
                                            </div>
                                        </div>
                                    </div>
                                <!-- </div> -->
                            </div>
                        </div>
                        <div class="tab-pane fade" id="curriculum" role="tabpanel" aria-labelledby="curriculum-tab">
                            <div class="course-curriculum">
            
                                        <div class="table-responsive">
                                            <table class="table table-hover" style="text-align: center; line-height: 35px;">
                                                <thead class="thead-light">
                                                <tr>
                                                    <th>댓글번호</th>
                                                    <th>댓글제목</th>
                                                    <th>작성자</th>
                                                    <th>작성일</th>
                                                </tr>
                                                </thead>
                                                  <tbody>
                                    <c:choose>
                                    	<c:when test ="${fn:length(borad)==0}">
                                    	<div style="font-size: 20px">
                                    		<tr>
												<td colspan="4"><p style="margin:40px; font-weight: bold;">아직 작성한 댓글이 없습니다.😥</p></td>
											</tr>
											
										</div>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<c:forEach var="board" items="${board}" varStatus="status">
		                                    	<tr>
		                                            <td>4</td>
		                                            <td><a href="course-details.html">${board.tbTitle}</a></td>
		                                            <td>김영광</td>
		                                            <td>${board.tRegDate}</td>
		                                        </tr>
                                    		</c:forEach>
                                    	</c:otherwise>
                                    </c:choose>
                                </tbody>
                                                
                                            </table>
                                        </div>            
                                    </div>
                                    <!-- <div class="bottom-content"> -->
                                            <div class="row align-items-center">
                                                <div class="col-lg-12 col-md-12 col-12">
                                                    <div class="button" style="width: 200px; margin: 20px auto 0 auto; col">
                                                        <a href="href="course-details.html" class="btn">댓글 쓰러 가기</a>
                                                    </div>
                                                </div>
                                            </div>
                                        <!-- </div> -->
                            
                        </div>
                        <div class="tab-pane fade" id="instructor" role="tabpanel" aria-labelledby="instructor-tab">
                            <div class="course-instructor">
                                <div class="row">
                                    <div class="table-responsive">
                                        <table class="table table-hover" style="text-align: center; line-height: 35px;">
                                            <thead class="thead-light">
                                            <tr>
                                                <th>리뷰번호</th>
                                                <th>리뷰제목</th>
                                                <th>작성자</th>
                                                <th>작성일</th>
                                            </tr>
                                            </thead>
                                              <tbody>
                                    <c:choose>
                                    	<c:when test ="${fn:length(borad)==0}">
                                    	<div style="font-size: 20px">
                                    		<tr>
												<td colspan="4"><p style="margin:40px; font-weight: bold;">아직 작성한 리뷰가 없습니다.😥</p></td>
											</tr>
											
										</div>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<c:forEach var="board" items="${board}" varStatus="status">
		                                    	<tr>
		                                            <td>4</td>
		                                            <td><a href="course-details.html">${board.tbTitle}</a></td>
		                                            <td>김영광</td>
		                                            <td>${board.tRegDate}</td>
		                                        </tr>
                                    		</c:forEach>
                                    	</c:otherwise>
                                    </c:choose>
                                </tbody>
                                        </table>
                                    </div>            
                                </div>
                                <!-- <div class="bottom-content"> -->
                                        <div class="row align-items-center">
                                            <div class="col-lg-12 col-md-12 col-12">
                                                <div class="button" style="width: 200px; margin: 20px auto 0 auto; col">
                                                    <a href="href="course-details.html" class="btn">리뷰 쓰러가기</a>
                                                </div>
                                            </div>
                                        </div>
                                    <!-- </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Course Details Wrapper -->
                
            </div>
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