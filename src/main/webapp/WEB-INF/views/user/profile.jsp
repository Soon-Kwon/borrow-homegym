<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  

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
    
    
<%--     <script>
    	var memberId = '<%=memberId %>';
    	
    	document.addEventListener("DOMContentLoaded", function(){
    		// Handler when the DOM is fully loaded
   		});
    </script>  --%>
<style>
#auth{
    margin-right: 10px;
    font-size: 15px;
    font-weight: bold;
    margin-left: 45px;
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

#sub{
	margin-top: 40px; 
	font-size: 16px;
	font-weight:bold;
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

  <!--Header -->
   <%@ include file="/WEB-INF/views/includes/header.jsp" %>

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
                                            <h6 class="title"><a href="myactiv.do?selectedBtnId=overview-tab">나의 활동내역</a></h6>
                                        </div>
                                    </li>
                                    <li class="single-course">
                                        <div class="info">
                                            <h6 class="title"><a href="mywrite.do?selectedBtnId=overview-tab">글 관리</a></h6>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="sidebar-widget">
                            <h3 class="sidebar-widget-title">고객센터</h3>
                            <div class="sidebar-widget-content">
                                <div class="sidebar-widget-search">
                                    <p><a href="/user/FAQ.do" style="color:#171e29;">💡자주묻는 질문 보러가기</a></p>
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
				                   <div id="userphoto"><img src="${pageContext.request.contextPath }/resources/assets/images/mypage/basicImg.png" class="avatar img-circle img-thumbnail" id="profile" style="border-radius:100px;"></div>
				             </c:if>
				            <c:if test="${not empty member.imagePath}">
				                    <div id="userphoto"><img src="${member.imagePath}" id="profile"  class="avatar img-circle img-thumbnail" name="image"  style="width: 140px; height: 150px; border-radius:100px;"></div>
				            </c:if>
                            <h4 style="margin-left:30px;">${member.name}님</h4>
                            <span id="auth">‍${member.nickname}</span><br> 
                            <span id="memberId">${member.memberId} <span>
                            <div class="button">
                                <a href="profile_update.do" class="btn" style="margin-top:28px;">정보 수정<i class="lni lni-arrow-right"></i></a>
                            </div>
                        </div>
                        <!-- End Single Feature -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12 padding-zero">
                        <!-- Start Single Feature -->
                        <div class="single-feature">
                            <h3><a href="javascript:void(0)">나의 활동내역 보기</a></h3>
                            <p id="sub" >🏠 내가 빌려준 홈짐</p>
                            <h1 style="margin-top: 20px;">${lendCnt}</h1>
                            <p id="sub" >🏠 내가 빌린 홈짐</p>
                            <h1 style="margin-top: 20px;">${rentCnt}</h1>
                            <div class="button">

                                <a href="myactiv.do?memberId=${member.memberId}" class="btn">더보기<i class="lni lni-arrow-right"></i></a>
                                <a href="myactiv.do" class="btn">더보기<i class="lni lni-arrow-right"></i></a>
                            </div>
                        </div>
                        <!-- End Single Feature -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12 padding-zero">
                        <!-- Start Single Feature -->
                        <div class="single-feature">
                            <h3><a href="javascript:void(0)">내가 쓴글 보기</a></h3>
                            <p id="sub">📌 내가 쓴 게시글</p>
                            <h1 style="margin-top: 20px;">${myBoardCnt}</h1>
                            <p id="sub" >📌 내가 쓴 리뷰</p>
                            <h1 style="margin-top: 20px;">${myReviewCnt}</h1>
                            <div class="button">
                                <a href="mywrite.do" class="btn">더보기<i class="lni lni-arrow-right"></i></a>
                            </div>
                        </div>
                        <!-- End Single Feature -->  
                                               
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
     <footer class="footer style2" style="position:fixed;">
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
                                <a href="/user/FAQ.do"> 자주묻는 질문</a>
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