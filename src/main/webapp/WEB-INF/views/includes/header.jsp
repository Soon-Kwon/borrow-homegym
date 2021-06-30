<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
 	<meta charset="utf-8" />
 	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
 	
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>빌려줘! 홈짐</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="/resources/assets/images/logo/logo.png" />
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

</head>
<body>
 <!-- Start Header Area -->
    <header class="header style2 navbar-area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                <div class="nav-inner">
                    <nav class="navbar navbar-expand-lg">
                        <a class="navbar-brand" href="/index.jsp">
                            <img src="/resources/assets/images/logo/로고2.png" alt="logo">
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
                           		
                           		<sec:authorize access="isAnonymous()">
                                <!-- <a class="circle-image" href="user/mp_main.do">
                                    <img src="https://via.placeholder.com/500x500" alt="logo">
                                </a>  -->
                                <li class="nav-item"><a href='<c:url value="../user/loginpage"/>' style="text-size: 50px">로그인</a></li>
                                <li class="nav-item"><a>|</a></li>
                                <li class="nav-item"><a href="/user/registration.do">회원가입</a></li>
                                
                                </sec:authorize>
                                <sec:authorize access="hasRole('ROLE_MEMBER')">
									<li class="nav-item" style="margin-right: 100px;"><a href="/homegym/hg_board.jsp">홈짐</a></li>
									<li class="nav-item" style="margin-right: 120px;"><a href="community.html">트레이너</a></li>
									<a class="circle-image" href="mp_main.jsp"> <img src="https://via.placeholder.com/300x300" alt="logo"></a>
									<li class="nav-item">
                                        <a class="page-scroll dd-menu collapsed" href="javascript:void(0)"
                                        data-bs-toggle="collapse" data-bs-target="#submenu-1-4"
                                        aria-controls="navbarSupportedContent" aria-expanded="false"
                                        aria-label="Toggle navigation"><sec:authentication property="principal.nickname" />님</a>
                                        <ul class="sub-menu collapse" id="submenu-1-4">
                                        <li class="nav-item"><a href="/user/profile.do">마이페이지</a></li>
                                       	 <li class="nav-item"><a href="/user/profile_update">&nbsp 내 정보 수정</a></li>
                                         <li class="nav-item"><a href="/user/myactiv">&nbsp 활동 내역</a></li>
                                       	 <li class="nav-item"><a href="/user/mywrite">&nbsp 글 관리</a></li>
                                        <li class="nav-item"><a href="#" onclick="document.getElementById('logout').submit();">로그아웃</a></li>
                                        </ul>
                                  		</li>
										<form id="logout" action="/logout" method="POST">
   										<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
										</form>
								</sec:authorize>
								
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<li class="nav-item" style="margin-right: 100px;"><a href="/homegym/hg_board.jsp">홈짐</a></li>
									<li class="nav-item" style="margin-right: 120px;"><a href="community.html">트레이너</a></li>
									<a class="circle-image" href="mp_main.jsp"> <img src="https://via.placeholder.com/300x300" alt="logo"></a>
									<li class="nav-item">
                                        <a class="page-scroll dd-menu collapsed" href="javascript:void(0)"
                                        data-bs-toggle="collapse" data-bs-target="#submenu-1-4"
                                        aria-controls="navbarSupportedContent" aria-expanded="false"
                                        aria-label="Toggle navigation"><%-- <sec:authentication property="principal.nickname" /> --%>님</a>
                                        <ul class="sub-menu collapse" id="submenu-1-4">
                                        <li class="nav-item"><a href="/user/profile.do">관리자페이지</a></li>
                                       	 <li class="nav-item"><a href="/user/profile_update">&nbsp 회원정보 관리</a></li>
                                         <li class="nav-item"><a href="/user/myactiv">&nbsp 활동 관리</a></li>
                                       	 <li class="nav-item"><a href="/user/mywrite">&nbsp 글 관리</a></li>
                                        <li class="nav-item"><a href="#" onclick="document.getElementById('logout').submit();">로그아웃</a></li>
                                        </ul>
                                    </li>
										<form id="logout" action="/logout" method="POST">
   										<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
										</form>
								</sec:authorize>
							</div>
                            </ul>
                        </div> <!-- navbar collapse -->
                    </nav> <!-- navbar -->
                    </form>
                </div>
                </div>
            </div> <!-- row -->
        </div> <!-- container -->
    </header>
    <!-- End Header Area -->
</body>
  <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="/resources/assets/js/bootstrap.min.js"></script>
    <script src="/resources/assets/js/count-up.min.js"></script>
    <script src="/resources/assets/js/wow.min.js"></script>
    <script src="/resources/assets/js/tiny-slider.js"></script>
    <script src="/resources/assets/js/glightbox.min.js"></script>
    <script src="/resources/assets/js/main.js"></script>
    <script type="text/javascript">
        //========= testimonial Slider
        tns({
            container: '.testimonial-slider',
            items: 3,
            slideBy: 'page',
            autoplay: false,
            mouseDrag: true,
            gutter: 0,
            nav: true,
            controls: false,
            controlsText: ['<i class="lni lni-arrow-left"></i>', '<i class="lni lni-arrow-right"></i>'],
            responsive: {
                0: {
                    items: 1,
                },
                540: {
                    items: 1,
                },
                768: {
                    items: 2,
                },
                992: {
                    items: 2,
                },
                1170: {
                    items: 3,
                }
            }
        });
        //====== Clients Logo Slider
        tns({
            container: '.client-logo-carousel',
            slideBy: 'page',
            autoplay: true,
            autoplayButtonOutput: false,
            mouseDrag: true,
            gutter: 15,
            nav: false,
            controls: false,
            responsive: {
                0: {
                    items: 1,
                },
                540: {
                    items: 3,
                },
                768: {
                    items: 4,
                },
                992: {
                    items: 4,
                },
                1170: {
                    items: 6,
                }
            }
        });
    </script>
</html>