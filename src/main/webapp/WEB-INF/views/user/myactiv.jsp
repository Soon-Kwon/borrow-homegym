<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%
 	String memberId = session.getAttribute("memberId").toString();
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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

<!-- Bootstrap 설정 CDN 방식 -->


    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/resources/assets/css/LineIcons.2.0.css" />
    <link rel="stylesheet" href="/resources/assets/css/animate.css" />
    <link rel="stylesheet" href="/resources/assets/css/tiny-slider.css"/>
    <link rel="stylesheet" href="/resources/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="/resources/assets/css/main.css" />
     <script src="https://code.jquery.com/jquery-latest.min.js"></script>
     
    <style>
    

    	
        .latest-news-area {
            background-color: #fff;
        }
        .flex-box{
            display: flex;
            justify-content: space-around;
            flex-grow: 2;
        }
        .button .btn::before {
       		background-color: lightsteelblue;
       		border-radius: 30px;
       		position: sticky;
        }
        
		.button .btn{
			background-color: #616c9c;
		} 
		
		#reject {
			background-color: #414141;
			bottom: 10px;
			border-radius: 40px;
		}
		
		#accept{
			background-color: #8192d9;
			bottom: 10px;
			border-radius: 40px;
		}
	    #rejectBtn ,#reviewBtn {
		    bottom: 10px;
		    right: 30px;
		    border-radius: 40px;
	    }
	    #reviewBtn{
	    	bottom: 10px;
		    right: 30px;
		    background-color: #7c85b1;
		    border-radius: 40px;
	    }
	    
	    
	    #detailBtn, #payOK, #acceptBtn{
		    bottom: 10px;
		    left: 30px;
		    border-radius: 40px;
		 }
		 #detailBtn2 , #payBtn{
		    bottom: 10px;
		    border-radius: 40px;
		 }
	
    </style>

</head>
<script>
	/*버튼 선택시 상태값 변경*/
	function changeHomegymStatus(object) {
		// 수락버튼(id = acceptBtn)을 눌렀을 때
		if(object.id == 'acceptBtn') {
			//상태(status ) 가 'Y'값을 가지게 된다.
			var data = { 
				'hId'	 : object.value,
				'status' : 'Y'	
			};
		} else { //id가 acceptBtn이 아닌경우
			//상태 (status) 가  'N' 값을 가지게 된다.
			var data = { 
				'hId'	 : object.value,
				'status' : 'N'	
			};
		}
		$.ajax({
			type: 'POST',
			url: '/user/acceptCheck.do',
			dataType: 'json',
			data: JSON.stringify(data),
			contentType: "application/json",
			success: function(data) {
				//성공시에 페이지 리로드 후 
				//acceptYN이 Y가 될경우 텍스트 변경이 되도록 구현
				if(data.resultCode=="Acceept"){
					console.log("성공");
            		alert(data.resultMessage);
            		location.reload();
            	}else{
            		console.log("실패");
            		alert(data.resultMessage);
            		location.reload();

            	}
			},
			error: function(e) {
				console.log(e);
			}
		})
	}
</script>
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
                                data-bs-target="#overview" type="button" role="tab" aria-controls="borrow"
                                aria-selected="true">홈짐관리</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="curriculum-tab" data-bs-toggle="tab"
                                data-bs-target="#curriculum" type="button" role="tab" aria-controls="curriculum"
                                aria-selected="false">빌려준 홈짐</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="instructor-tab" data-bs-toggle="tab"
                                data-bs-target="#instructor" type="button" role="tab" aria-controls="instructor"
                                aria-selected="false">빌린 홈짐</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="reviews-tab" data-bs-toggle="tab" data-bs-target="#reviews"
                                type="button" role="tab" aria-controls="reviews" aria-selected="false">진행중 홈짐</button>
                        </li>
                    </ul>

                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="overview" role="tabpanel"
                            aria-labelledby="overview-tab">
                            <div class="course-overview">
                                
                                <!-- 홈짐관리 시작  -->
                                <section class="section latest-news-area blog-grid-page" style="padding-top:40px;">
                                    <div class="container">
                                        <!-- <h3 class="comment-title">Reviews</h3> -->
                                        <div class="row">
                                        	<div class="col-lg-12 col-md-12 col-12">
                                                
                                                <div class="row">
                                                <c:choose>
                                    				<c:when test ="${fn:length(waitingHomegym)==0}">
	                                    				<div style="font-size: 20px; text-align:center;">
															<p style="margin:40px; font-weight: bold;">관리할 홈짐이 없습니다.😥</p></td>
															
														</div>
                                    				</c:when>
                                    			<c:otherwise>
                                    		<c:forEach var="homegym" items="${waitingHomegym}" varStatus="status">
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
                                                                        <li><i class="lni lni-tag"></i>
                                                                            ${homegym.HTitle}
                                                                        </li>
                                                                        <li>
                                                                            <!-- <i class="lni lni-tag"></i> -->
                                                                            ${homegym.HAddr}
                                                                        </li>
                                                                        <li>
                                                                            <i class="lni lni-calendar"></i>
                                                                            ${homegym.status}
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>  
                                                              
                                                             <div class="flex-box">
                                                                    <c:choose>
                                                                    <c:when test="${homegym.acceptYN == 'Y' and homegym.status == 'ready'}"> 
                                                           			 	 <div class="button accept">
			                                                                        <button class="btn" id="accept" value="${homegym.HId}" >수락됨</button>
			                                                                 </div>
			                                                                  
																		</c:when>
                                                           			 <c:when test="${homegym.acceptYN == 'N'}"> 
                                                           			 		<div class="button rejectBtn">
			                                                                        <button class="btn" id="reject" value="${homegym.HId}" >취소됨</button>
			                                                                 </div>
			                                                                  
																		</c:when>
																		<c:otherwise> 
																			<div class="button accept-btn">
                                                                        		<button class="btn" id="acceptBtn" value="${homegym.HId}" onclick="changeHomegymStatus(this);">수락하기</button>
                                                                   		 	</div>
			                                                               <div class="button deny-btn">
                                                                        		<button class="btn" id="rejectBtn" value="${homegym.HId}" onclick="changeHomegymStatus(this);" data-toggle="modal" data-target="#myModal" id="Modal_button">거절하기</button>
                                                                    		</div>
			                                                                  
																		 </c:otherwise>
																	</c:choose>
                                                                   
                                                                </div>
                                                            </div>
                                                        </div>
      
                                           </c:forEach>
                                          </c:otherwise>
                                    </c:choose>
                                    </div>
                                    </div>
                                    <%-- <form id="actionForm" action="user/mypage/myactiv" method="get">
                                    	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                    	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                    </form> --%>
                                               <!-- Pagination -->
                                                <div class="pagination center">
                                                    <ul class="pagination-list">
	                                                    <c:if test ="${pageMaker.prev}">
	                                                        <li class="paginate_button previous"><a href="{pageMaker.startPage-1}">Prev</a></li>
	                                                    </c:if>
	                                                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                                                        <li class="pagenate_button ${pageMaker.cri.pageNum == num ? "active": ""} "><a href="${num}">${num}</a></li>
	                                                    </c:forEach>
	                                                    <c:if test="${pageMaker.next}">
	                                                        <li class="paginate_button next"><a href="${pageMaker.endPage+1}">Next</a></li>
	                                                    </c:if>
	                                                    </ul>
                                                </div>  
                                                <!-- End Pagination -->     
                                            </div>
                                            </div>
                                           
                                               
                                </section>
                                <!-- End Blog Singel Area -->
                            </div>
                        </div>
                       <!-- 수락대기중 끝 & 빌려준 홈짐 시작--> 
                        
                        
                        
                        <div class="tab-pane fade" id="curriculum" role="tabpanel" aria-labelledby="curriculum-tab">
                            <div class="course-curriculum">
                                <!-- Start Blog Singel Area -->
                                <section class="section latest-news-area blog-grid-page" style="padding-top:40px;">
                                    <div class="container">
                                        <!-- <h3 class="comment-title">Reviews</h3> -->
                                        <div class="row">
                                        	<div class="col-lg-12 col-md-12 col-12">
                                                
                                                <div class="row">
                                                <c:choose>
                                    				<c:when test ="${fn:length(lendHomegym)==0}">
	                                    				<div style="font-size: 20px; text-align:center;">
															<p style="margin:40px; font-weight: bold;">아직 빌려준 홈짐이 없습니다.😥</p>
															<div class="flex-box">
                                                                  <div class="button accept-btn">
                                                                      <a href="blog-single-sidebar.html" class="btn" style="border-radius:30px; background-color:lightsteelblue">빌려주러 가기</a>
                                                                   </div>
                                                            </div>
														</div>
                                    				</c:when>
                                    			<c:otherwise>
                                    		<c:forEach var="homegym" items="${lendHomegym}" varStatus="status">
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
                                                                            ${homegym.HTitle}
                                                                        </li>
                                                                        <li>
                                                                            <!--  <i class="lni lni-tag11"></i>  -->
                                                                            ${homegym.HAddr}
                                                                        </li>
                                                                        <li>
                                                                            <i class="lni lni-calendar"></i>
                                                                            ${homegym.memberId}
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>    
                                                            
                                                            <!-- 버튼 시작 -->
                                                                <div class="flex-box">
                                                                	
                                                                  
                                                           			 	<div class="button accept-btn">
			                                                                        <button class="btn" id="detailBtn2" value="${homegym.HId}" onclick="changeHomegymStatus(this);">상세보기</button>
			                                                                    </div>
			                                                   
                                                                </div>
                                                            </div>
                                                        </div>
      
                                           </c:forEach>
                                          </c:otherwise>
                                    </c:choose>
                                                                
                                      <form id="actionForm" action="user/mypage/myactiv.do" method="get">
                                    	<input type="hidden" name="pageNum" value="${ld_pageMaker.cri.pageNum}">
                                    	<input type="hidden" name="amount" value="${ld_pageMaker.cri.amount}">
                                    </form> 
                                               <!-- Pagination -->
                                                <div class="pagination center">
                                                    <ul class="pagination-list">
	                                                    <c:if test ="${ld_pageMaker.prev}">
	                                                        <li class="pageInfo_btn previous"><a href="${ld_pageMaker.startPage-1}">Prev</a></li>
	                                                    </c:if>
	                                                    <c:forEach var="num" begin="${ld_pageMaker.startPage}" end="${ld_pageMaker.endPage}">
	                                                        <li class="pageInfo_btn ${ld_pageMaker.cri.pageNum == num ? "active" :""}"><a href="${num}">${num}</a></li>
	                                                    </c:forEach>
	                                                    <c:if test="${ld_pageMaker.next}">
	                                                        <li class="pageInfo_btn next"><a href="${ld_pageMaker.endPage+1}">Next</a></li>
	                                                    </c:if>
	                                                </ul>
                                                </div>  
                                                
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                                
                                </section>
                                <!-- End Blog Singel Area -->
                            </div>
                        </div>
                       

                        <!-- 빌려준 홈짐 끝 & 빌린 홈짐 시작 -->
                        
                        
                        <div class="tab-pane fade" id="instructor" role="tabpanel" aria-labelledby="instructor-tab">
                            <div class="course-instructor">
     <!-- Start Blog Singel Area -->
                                <section class="section latest-news-area blog-grid-page" style="padding-top:40px;">
                                    <div class="container">
                                        <!-- <h3 class="comment-title">Reviews</h3> -->
                                        <div class="row">
                                        	<div class="col-lg-12 col-md-12 col-12">
                                                
                                                <div class="row">
                                                 <c:choose>
                                    				<c:when test ="${fn:length(rentHomegym)==0}">
	                                    				<div style="font-size: 20px; text-align:center;">
															<p style="margin:40px; font-weight: bold;">아직 빌린 홈짐이 없습니다.😥</p>
															<div class="flex-box">
                                                                  <div class="button accept-btn">
                                                                      <a href="blog-single-sidebar.html" class="btn" style="border-radius:30px; background-color:lightsteelblue">빌리러 가기</a>
                                                                   </div>
                                                            </div>
														</div>
                                    				</c:when>
                                    			<c:otherwise>
                                    		<c:forEach var="homegym" items="${rentHomegym}" varStatus="status">
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
                                                                            ${homegym.HTitle}
                                                                        </li>
                                                                        <li>
                                                                            <!-- <i class="lni lni-tag"></i> -->
                                                                            ${homegym.HAddr}
                                                                        </li>
                                                                        <li>
                                                                            <i class="lni lni-calendar"></i>
                                                                            ${homegym.memberId}
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>    
                                                            <!-- 버튼 시작 -->
                                                                <div class="flex-box">
                                                                    <c:if test="${homegym.payYN =='N'}"> 
																			<div class="button accept-btn">
			                                                                        <button class="btn" id="payBtn" value="${homegym.HId}" onclick="changeHomegymStatus(this);">결제 하기</button>
			                                                                    </div>
			                                                                   <!--  <div class="button deny-btn">
			                                                                        <button class="btn" id="denyBtn" value="${homegym.HId}" onclick="changeHomegymStatus(this);">수락 취소</button>
			                                                                    </div>  -->
																		 </c:if>
                                                           		 	  <c:if test="${homegym.payYN =='Y'}"> 
                                                           			 	<div class="button accept-btn">
			                                                                        <button class="btn" id="payOK" value="${homegym.HId}" onclick="changeHomegymStatus(this);">결제 완료</button>
			                                                                    </div>
			                                                                   <div class="button deny-btn">
			                                                                        <button class="btn" id="reviewBtn" value="${homegym.HId}" onclick="changeHomegymStatus(this);">리뷰쓰기</button>
			                                                                    </div> 
																		</c:if>   
																		<c:if test="${homegym.acceptYN == 'N'}"> 
                                                           			 	<div class="button accept-btn">
			                                                                        <button class="btn" id="reject" value="${homegym.HId}" onclick="changeHomegymStatus(this);">거절됨</button>
			                                                                    </div>
			                                                                    
																		</c:if> 
                                                                </div>
                                                            </div>
                                                        </div>
      
                                           </c:forEach>
                                          </c:otherwise>
                                    </c:choose>
                                               <!-- Pagination -->
                                                <div class="pagination center">
                                                    <ul class="pagination-list">
	                                                    <c:if test ="${rt_pageMaker.prev}">
	                                                        <li class="pageInfo_btn previous"><a href="${rt_pageMaker.startPage-1}">Prev</a></li>
	                                                    </c:if>
	                                                    <c:forEach var="num" begin="${rt_pageMaker.startPage}" end="${rt_pageMaker.endPage}">
	                                                        <li class="pageInfo_btn ${rt_pageMaker.cri.pageNum == num ? "active" :""}"><a href="${num}">${num}</a></li>
	                                                    </c:forEach>
	                                                    <c:if test="${rt_pageMaker.next}">
	                                                        <li class="pageInfo_btn next"><a href="${rt_pageMaker.endPage+1}">Next</a></li>
	                                                    </c:if>
	                                                </ul>
                                                </div>  
                                            </div>
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
                                <!-- Start Blog Singel Area -->
                                <section class="section latest-news-area blog-grid-page" style="padding-top:40px;">
                                    <div class="container">
                                        <!-- <h3 class="comment-title">Reviews</h3> -->
                                        <div class="row">
                                        	<div class="col-lg-12 col-md-12 col-12">
                                                
                                                <div class="row">
                                                <c:choose>
                                    				<c:when test ="${fn:length(progressHomegym)==0}">
	                                    				<div style="font-size: 20px; text-align:center;">
															<p style="margin:40px; font-weight: bold;">아직 진행중인 홈짐이 없습니다.😥</p></td>
															
														</div>
                                    				</c:when>
                                    			<c:otherwise>
                                    		<c:forEach var="homegym" items="${progressHomegym}" varStatus="status">
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
                                                                        <li><i class="lni lni-tag"></i>
                                                                            ${homegym.HTitle}
                                                                        </li>
                                                                        <li>
                                                                            <!-- <i class="lni lni-tag22"></i> -->
                                                                            ${homegym.HAddr}
                                                                        </li>
                                                                        <li>
                                                                            <i class="lni lni-calendar"></i>
                                                                            ${homegym.status}
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>    
                                                            
                                                            <!-- 버튼 시작 -->
                                                                <div class="flex-box">
                                                                    <div class="button accept-btn">
                                                                        <a href="blog-single-sidebar.html" class="btn">취소하기</a>
                                                                    
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
	                                                    <c:if test ="${pageMaker.prev}">
	                                                        <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Prev</a></li>
	                                                    </c:if>
	                                                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                                                        <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active" :""}"><a href="${num}">${num}</a></li>
	                                                    </c:forEach>
	                                                    <c:if test="${pageMaker.next}">
	                                                        <li class="pageInfo_btn next"><a href="${pageMaker.endPage+1}">Next</a></li>
	                                                    </c:if>
	                                                </ul>
                                                </div>    
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                                
                                </section>
                                <!-- End Blog Singel Area -->
                            </div>
                        </div>
                    </div>
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
    <script src="/resources/assets/js/bootstrap.min.js"></script>
    <script src="/resources/assets/js/count-up.min.js"></script>
    <script src="/resources/assets/js/wow.min.js"></script>
    <script src="/resources/assets/js/tiny-slider.js"></script>
    <script src="/resources/assets/js/glightbox.min.js"></script>
    <script src="/resources/assets/js/main.js"></script>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		var actionForm= $("#actionForm");

    		
    		$(".pagination-list a").on("click",function(e){
    			e.preventDefault();
    			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    			actionForm.attr("action","/user/mypage/myactiv");
    			actionForm.submit();
    		});
    	});

    </script>
</body>
</html>