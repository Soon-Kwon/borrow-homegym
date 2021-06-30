<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
 <%
 	String memberId = session.getAttribute("memberId").toString();
 %>

<html class="no-js" lang="zxx">

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
    <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/resources/assets/css/LineIcons.2.0.css" />
    <link rel="stylesheet" href="/resources/assets/css/animate.css" />
    <link rel="stylesheet" href="/resources/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="/resources/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="/resources/assets/css/main.css" />
    
    <script>
    	var memberId = '<%=memberId %>';
    	
    	document.addEventListener("DOMContentLoaded", function(){
    		// Handler when the DOM is fully loaded
   		});
    </script>
<style>
#auth{
    margin-right: 5px;
    font-size: 15px;
    font-weight: bold;
    margin-left: 17px;
    margin-top: 10px;
}
.userphoto_menu label { 
	display: inline-block; 
	padding: .5em .75em; 
	color: #999;
	font-size: inherit;
	line-height: normal; 
	vertical-align: middle; 
	background-color: #fdfdfd;
	cursor: pointer; 
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
 } 

.img {
  vertical-align: middle;
}

.img-img-thumbnail {
  display: inline-block;
  max-width: 100%;
  height: auto;
  padding: 4px;
  line-height: 1.42857143;
  background-color: #fff;
  transition: all .2s ease-in-out;
}

.img-circle {
  border-radius: 50%;
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
                                <li class="nav-item" style="margin-right: 100px;"><a href="/homegym/hg_list.do"><h5>홈짐</h5></a></li>
                                <li class="nav-item" style="margin-right: 120px;"><a href="/trainer/tr_list.do"><h5>트레이너</h5></a></li>
                                <a class="circle-image" href="mp_main.do">
                                    <img src="https://via.placeholder.com/300x300" alt="logo">
                                </a>
                                <li class="nav-item"><a href="profile.do"><h5>${member.name} 님</h5></a></li>
                                
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

                <!-- Start Features Area -->
                <section class="features style2">
                    <div class="container-fluid" style="padding-bottom: 80px;">
                        <div class="single-head">
                        <div class="row">
                        <h3><a href="javascript:void(0)">MY PROFILE</a></h3>
                        <div class="col-lg-4 col-md-6 col-12 padding-zero">
                        <!-- Start Single Feature -->
                        
                        <div class="single-feature">
                            
                            <c:if test="${empty member.imagePath}">
				                   <div id="userphoto"><img src="${pageContext.request.contextPath}/resources/assets/images/mypage/basicImg.png" class="avatar img-circle img-thumbnail" id="profile"></div>
				             </c:if>
				            <c:if test="${not empty member.imagePath}">
				                    <div id="userphoto"><img src="${member.imagePath}" id="profile"  class="avatar img-circle img-thumbnail" name="image"  style="width: 140px; height: 150px;"></div>
				            </c:if>
                            <h4 style="margin-left:30px;">${member.name}님</h4>
                            <span id="auth">🌱${member.auth}</span> <br>
                            <span id="memberId"> ${member.memberId} <span>
                            <div class="button">
                                <a href="profile_update.do?memberId=silverbi99@naver.com" class="btn" style="margin-top:28px;">정보 수정<i class="lni lni-arrow-right"></i></a>
                            </div>
                        </div>
                        <!-- End Single Feature -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12 padding-zero">
                        <!-- Start Single Feature -->
                        <div class="single-feature">
                            <h3><a href="javascript:void(0)">나의 활동내역 보기</a></h3>
                            <p style="margin-top: 40px; font-size: 16px;">🏠 내가 빌려준 홈짐</p>
                            <h1 style="margin-top: 20px;">${lendCnt}</h1>
                            <p style="margin-top: 40px; font-size: 16px;">🏠 내가 빌린 홈짐</p>
                            <h1 style="margin-top: 20px;">${rentCnt}</h1>
                            <div class="button">
                                <a href="myactiv.do?memberId=silverbi99@naver.com" class="btn">더보기<i class="lni lni-arrow-right"></i></a>
                            </div>
                        </div>
                        <!-- End Single Feature -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12 padding-zero">
                        <!-- Start Single Feature -->
                        <div class="single-feature">
                            <h3><a href="javascript:void(0)">내가 쓴글 보기</a></h3>
                            <p style="margin-top: 40px; font-size: 16px;">📌 내가 쓴 게시글</p>
                            <h1 style="margin-top: 20px;">${myBoardCnt}</h1>
                            <p style="margin-top: 40px; font-size: 16px;">📌 내가 쓴 댓글</p>
                            <h1 style="margin-top: 20px;">${myReplyCnt}</h1>
                            <div class="button">
                                <a href="mywrite.do?memberId=silverbi99@naver.com" class="btn">더보기<i class="lni lni-arrow-right"></i></a>
                            </div>
                        </div>
                        <!-- End Single Feature -->
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview-tab">
                                <div class="course-overview">
        
        
                                </div>
                            </div>
                            <div class="tab-pane fade" id="curriculum" role="tabpanel" aria-labelledby="curriculum-tab">
                                <div class="course-curriculum">
                                    <ul class="curriculum-sections">
                                        <li class="single-curriculum-section">
                                            <div class="section-header">
                                                <div class="section-left">
        
                                                    <h5 class="title">jQuery Effects</h5>
        
                                                </div>
                                            </div>
                                            <ul class="section-content">
        
                                                <li class="course-item">
                                                    <a class="section-item-link lesson" href="JavaScript:Void(0);">
                                                        <span class="item-name">jQuery Effects: Hide and Show</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta duration">30 min</span>
                                                            <span class="item-meta item-meta-icon video">
                                                                <i class="lni lni-video"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                                <li class="course-item">
                                                    <a class="section-item-link lesson" href="JavaScript:Void(0);">
                                                        <span class="item-name">Live meeting about Infotech
                                                            Strategies</span>
                                                        <div class="course-item-meta">
                                                            <i class="lni lni-lock"></i>
                                                            <span class="item-meta item-meta-icon zoom-meeting">
                                                                <i class="lni lni-users"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                                <li class="course-item">
                                                    <a class="section-item-link" href="JavaScript:Void(0);">
                                                        <span class="item-name">Quiz 1: Yes or No?</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta count-questions">3 questions</span>
                                                            <span class="item-meta duration">15 min</span>
                                                            <span class="item-meta item-meta-icon">
                                                                <i class="lni lni-lock"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                                <li class="course-item">
                                                    <a class="section-item-link" href="JavaScript:Void(0);">
                                                        <span class="item-name">Quiz 2: A simple simulation game</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta count-questions">0 question</span>
                                                            <span class="item-meta duration">50 min</span>
                                                            <span class="item-meta item-meta-icon">
                                                                <i class="lni lni-lock"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                                <li class="course-item">
                                                    <a class="section-item-link lesson" href="JavaScript:Void(0);">
                                                        <span class="item-name">Lesson 02: A/B Testing</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta duration">02 hour</span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                                <li class="course-item">
                                                    <a class="section-item-link" href="JavaScript:Void(0);">
                                                        <span class="item-name">Quiz 3: Role-play game</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta count-questions">1 question</span>
                                                            <span class="item-meta duration">01 hour</span>
                                                            <span class="item-meta item-meta-icon">
                                                                <i class="lni lni-lock"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                                <li class="course-item">
                                                    <a class="section-item-link" href="JavaScript:Void(0);">
                                                        <span class="item-name">Quiz 4: Short Interview</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta count-questions">9 questions</span>
                                                            <span class="item-meta duration">10 min</span>
                                                            <span class="item-meta item-meta-icon">
                                                                <i class="lni lni-lock"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                                <li class="course-item">
                                                    <a class="section-item-link lesson" href="JavaScript:Void(0);">
                                                        <span class="item-name">Lesson 03: Wrap up about A/B
                                                            testing</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta duration">30 min</span>
                                                            <span class="item-meta item-meta-icon">
                                                                <i class="lni lni-lock"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                                <li class="course-item">
                                                    <a class="section-item-link" href="JavaScript:Void(0);">
                                                        <span class="item-name">Quiz 5: 15 mins of Yes/No
                                                            questions</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta count-questions">3 questions</span>
                                                            <span class="item-meta duration">10 min</span>
                                                            <span class="item-meta item-meta-icon">
                                                                <i class="lni lni-lock"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                                <li class="course-item">
                                                    <a class="section-item-link" href="JavaScript:Void(0);">
                                                        <span class="item-name">Quiz 6: Quick answers</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta count-questions">0 question</span>
                                                            <span class="item-meta duration">10 min</span>
                                                            <span class="item-meta item-meta-icon">
                                                                <i class="lni lni-lock"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="single-curriculum-section">
                                            <div class="section-header">
                                                <div class="section-left">
        
                                                    <h5 class="title">Customer Advisory Board</h5>
                                                    <p class="section-desc">Learn about the basics of Customer Advisory
                                                        Board</p>
        
                                                </div>
                                            </div>
                                            <ul class="section-content">
        
                                                <li class="course-item">
                                                    <a class="section-item-link lesson" href="JavaScript:Void(0);">
                                                        <span class="item-name">Lesson 04: Customer Advisory
                                                            Board</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta duration">30 min</span>
                                                            <span class="item-meta item-meta-icon">
                                                                <i class="lni lni-lock"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                                <li class="course-item">
                                                    <a class="section-item-link lesson" href="JavaScript:Void(0);">
                                                        <span class="item-name">Lesson 05: The role of Customer Advisory
                                                            Board</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta duration">45 min</span>
                                                            <span class="item-meta item-meta-icon">
                                                                <i class="lni lni-lock"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                                <li class="course-item">
                                                    <a class="section-item-link lesson" href="JavaScript:Void(0);">
                                                        <span class="item-name">Lesson 06: Customer Advisory Board
                                                            Institutions</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta count-questions">3 questions</span>
                                                            <span class="item-meta duration">15 min</span>
                                                            <span class="item-meta item-meta-icon">
                                                                <i class="lni lni-lock"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                                <li class="course-item">
                                                    <a class="section-item-link" href="JavaScript:Void(0);">
                                                        <span class="item-name">Mid-term test : 60-min writing
                                                            test</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta count-questions">5 question</span>
                                                            <span class="item-meta duration">01 hour</span>
                                                            <span class="item-meta item-meta-icon">
                                                                <i class="lni lni-lock"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                            </ul>
                                        </li>
                                        <li class="single-curriculum-section">
                                            <div class="section-header">
                                                <div class="section-left">
        
                                                    <h5 class="title">Feedback survey</h5>
                                                    <p class="section-desc">The major things about conducting a survey
                                                        and manage feedback</p>
        
                                                </div>
                                            </div>
                                            <ul class="section-content">
        
                                                <li class="course-item">
                                                    <a class="section-item-link lesson" href="JavaScript:Void(0);">
                                                        <span class="item-name">Lesson 07: The importance of customer
                                                            feedback</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta duration">30 min</span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                                <li class="course-item">
                                                    <a class="section-item-link lesson" href="JavaScript:Void(0);">
                                                        <span class="item-name">Lesson 08: Customers’ roles</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta duration">45 min</span>
                                                            <span class="item-meta item-meta-icon">
                                                                <i class="lni lni-lock"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                                <li class="course-item">
                                                    <a class="section-item-link lesson" href="JavaScript:Void(0);">
                                                        <span class="item-name">Lesson 09: How to conduct the
                                                            survey</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta duration">01 hour</span>
                                                            <span class="item-meta item-meta-icon">
                                                                <i class="lni lni-lock"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                                <li class="course-item">
                                                    <a class="section-item-link" href="JavaScript:Void(0);">
                                                        <span class="item-name">Discussion: How to write good survey and
                                                            poll questions?</span>
                                                        <div class="course-item-meta">
                                                            <span class="item-meta count-questions">0 question</span>
                                                            <span class="item-meta duration">01 hour</span>
                                                            <span class="item-meta item-meta-icon">
                                                                <i class="lni lni-lock"></i>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </li>
        
                                            </ul>
                                        </li>
                                    </ul>
                                    <div class="bottom-content">
                                        <div class="row align-items-center">
                                            <div class="col-lg-6 col-md-6 col-12">
                                                <div class="button">
                                                    <a href="#0" class="btn">Buy this course</a>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-12">
                                                <ul class="share">
                                                    <li><span>Share this course:</span></li>
                                                    <li><a href="javascript:void(0)"><i
                                                                class="lni lni-facebook-original"></i></a>
                                                    </li>
                                                    <li><a href="javascript:void(0)"><i
                                                                class="lni lni-twitter-original"></i></a>
                                                    </li>
                                                    <li><a href="javascript:void(0)"><i
                                                                class="lni lni-linkedin-original"></i></a>
                                                    </li>
                                                    <li><a href="javascript:void(0)"><i class="lni lni-google"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="instructor" role="tabpanel" aria-labelledby="instructor-tab">
                                <div class="course-instructor">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="profile-image">
                                                <img src="https://via.placeholder.com/270x340" alt="#">
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="profile-info">
                                                <h5><a href="javascript:void(0)">Maggie Strickland</a></h5>
                                                <p class="author-career">/Advanced Educator</p>
                                                <p class="author-bio">Maggie is a brilliant educator, whose life was
                                                    spent for computer science and love of nature. Being a female, she
                                                    encountered a lot of obstacles and was forbidden to work in this
                                                    field by her family. With a true spirit and talented gift, she was
                                                    able to succeed and set an example for others.</p>
        
        
                                                <ul class="author-social-networks">
                                                    <li class="item">
                                                        <a href="JavaScript:Void(0);" target="_blank" class="social-link">
                                                            <i class="lni lni-facebook-original"></i> </a>
                                                    </li>
                                                    <li class="item">
                                                        <a href="JavaScript:Void(0);" target="_blank" class="social-link">
                                                            <i class="lni lni-twitter-original"></i> </a>
                                                    </li>
                                                    <li class="item">
                                                        <a href="JavaScript:Void(0);" target="_blank" class="social-link">
                                                            <i class="lni lni-instagram"></i> </a>
                                                    </li>
                                                    <li class="item">
                                                        <a href="JavaScript:Void(0);" target="_blank" class="social-link">
                                                            <i class="lni lni-linkedin-original"></i> </a>
                                                    </li>
                                                    <li class="item">
                                                        <a href="JavaScript:Void(0);" target="_blank" class="social-link">
                                                            <i class="lni lni-youtube"></i> </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="bottom-content">
                                    <div class="row align-items-center">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="button">
                                                <a href="#0" class="btn">Buy this course</a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <ul class="share">
                                                <li><span>Share this course:</span></li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-facebook-original"></i></a>
                                                </li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a>
                                                </li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-linkedin-original"></i></a>
                                                </li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-google"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                <div class="course-reviews">
                                    <div class="course-rating">
                                        <div class="course-rating-content">
                                            <!-- Comments -->
                                            <div class="post-comments">
                                                <h3 class="comment-title">Reviews</h3>
                                                <ul class="comments-list">
                                                    <li>
                                                        <div class="comment-img">
                                                            <img src="https://via.placeholder.com/100x100" alt="img">
                                                        </div>
                                                        <div class="comment-desc">
                                                            <div class="desc-top">
                                                                <h6 class="name"><a href="JavaScript:Void(0);">Rosalina
                                                                        Kelian</a>
                                                                </h6>
                                                                <ul class="rating-star">
                                                                    <li><i class="lni lni-star-filled"></i></li>
                                                                    <li><i class="lni lni-star-filled"></i></li>
                                                                    <li><i class="lni lni-star-filled"></i></li>
                                                                    <li><i class="lni lni-star-filled"></i></li>
                                                                    <li><i class="lni lni-star-filled"></i></li>
                                                                </ul>
                                                                <p class="time">1 days ago</p>
                                                            </div>
                                                            <p>
                                                                Donec aliquam ex ut odio dictum, ut consequat leo interdum.
                                                                Aenean nunc
                                                                ipsum, blandit eu enim sed, facilisis convallis orci. Etiam
                                                                commodo
                                                                lectus
                                                                quis vulputate tincidunt. Mauris tristique velit eu magna
                                                                maximus
                                                                condimentum.
                                                            </p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="comment-img">
                                                            <img src="https://via.placeholder.com/100x100" alt="img">
                                                        </div>
                                                        <div class="comment-desc">
                                                            <div class="desc-top">
                                                                <h6 class="name"><a href="JavaScript:Void(0);">Arista
                                                                        Williamson</a>
                                                                </h6>
                                                                <ul class="rating-star">
                                                                    <li><i class="lni lni-star-filled"></i></li>
                                                                    <li><i class="lni lni-star-filled"></i></li>
                                                                    <li><i class="lni lni-star-filled"></i></li>
                                                                    <li><i class="lni lni-star-filled"></i></li>
                                                                    <li><i class="lni lni-star-filled"></i></li>
                                                                </ul>
                                                                <p class="time">5 days ago</p>
                                                            </div>
                                                            <p>
                                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                                sed do eiusmod
                                                                tempor incididunt ut labore et dolore magna aliqua. Ut enim
                                                                ad minim
                                                                veniam.
                                                            </p>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="comment-form">
                                                <h3 class="comment-reply-title">Add a review</h3>
                                                <form action="#" method="POST">
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-12 col-12">
                                                            <div class="form-box form-group">
                                                                <input type="text" name="#"
                                                                    class="form-control form-control-custom"
                                                                    placeholder="Your Name" />
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-12">
                                                            <div class="form-box form-group">
                                                                <input type="email" name="#"
                                                                    class="form-control form-control-custom"
                                                                    placeholder="Your Email" />
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-box form-group">
                                                                <textarea name="#" rows="6"
                                                                    class="form-control form-control-custom"
                                                                    placeholder="Your Comments"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="button">
                                                                <button type="submit" class="btn">Submit review<span
                                                                        class="dir-part"></span></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
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
    </section>
    <!-- /End Features Area -->
                
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
                                <a href="main_index.html"><img src="/resources/assets/images/logo/로고1.png" alt="Logo"></a>
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
    <script src="/resources/assets/js/bootstrap.min.js"></script>
    <script src="/resources/assets/js/count-up.min.js"></script>
    <script src="/resources/assets/js/wow.min.js"></script>
    <script src="/resources/assets/js/tiny-slider.js"></script>
    <script src="/resources/assets/js/glightbox.min.js"></script>
    <script src="/resources/assets/js/main.js"></script>
</body>

</html>