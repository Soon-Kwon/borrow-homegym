<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--   <%
 	String memberId = session.getAttribute("memberId").toString();
 %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
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
			background-color: #5c6dbd;
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
	    
	    
	    #detailBtn, #acceptBtn{
		    bottom: 10px;
		    left: 30px;
		    border-radius: 40px;
		 }
		 #payOK{
		   	bottom: 10px;
		    left: 30px;
		    border-radius: 40px;
		 	background-color:#4c5277;
		 }
		 #detailBtn2 {
		    bottom: 10px;
		    border-radius: 40px;
		    background-color:#5c6dbd;
		 }
		 
    </style>

</head>
<script>
	/*버튼 선택시 상태값 변경*/
	function changeHomegymStatus(object) {
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		// 수락버튼(id = acceptBtn)을 눌렀을 때
		if(object.id == 'acceptBtn') {
			//상태(status ) 가 'Y'값을 가지게 된다.
			var data = { 
				'dId'	 : object.value,
				'status' : 'Y'	
			};
		} else { //id가 acceptBtn이 아닌경우
			//상태 (status) 가  'N' 값을 가지게 된다.
			var data = { 
				'dId'	 : object.value,
				'status' : 'N'	
			};
		}
		$.ajax({
			type: 'POST',
			url: '/user/acceptCheck.do',
			dataType: 'json',
			data: JSON.stringify(data),
			contentType: "application/json",
			/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
            },
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
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="overview-tab" data-bs-toggle="tab"
                                data-bs-target="#overview" type="button" role="tab" aria-controls="overview"
                                aria-selected="true" onclick="fnGetBtnId(this)">홈짐 관리</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="curriculum-tab" data-bs-toggle="tab"
                                data-bs-target="#curriculum" type="button" role="tab" aria-controls="curriculum"
                                aria-selected="false" onclick="fnGetBtnId(this)">빌려준 홈짐</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="instructor-tab" data-bs-toggle="tab"
                                data-bs-target="#instructor" type="button" role="tab" aria-controls="instructor"
                                aria-selected="false" onclick="fnGetBtnId(this)">빌린 홈짐</button>
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
                                    				<c:when test ="${wait_total==0 }">
	                                    				<div style="font-size: 20px; text-align:center;">
															<p style="margin:40px; font-weight: bold;">관리할 홈짐이 없습니다.😥</p></td>
															
														</div>
                                    				</c:when>
                                    			<c:otherwise>
                                    		<c:forEach var="waitingHomegym" items="${waitingHomegym}" varStatus="status">
                                                 <div class="col-lg-6 col-12">
                                                        <!-- Single News -->
                                                        <div class="single-news custom-shadow-hover wow fadeInUp"
                                                            data-wow-delay=".1s">
                                                            <div class="image">
                                                                <a href="/user/mypage/reservationForm.do?d_id=${waitingHomegym.d_id}">
                                                                <img src="${pageContext.request.contextPath }/resources/assets/images/mypage/formImg.PNG" style="height:260px;"></a>
                                                            </div>
                                                            <div class="content-body">
                                                                <div class="meta-data">
                                                                    <ul style="font-weight:bold; font-size:15px;">
                                                                        <%-- <li>📌${homegym.h_title}</li> --%>
                                                                        <li>📌${waitingHomegym.h_title}</li><br>
                                                                        <li>🏡위치 : ${waitingHomegym.h_addr}</li><br>
                                                                        <li>📆 대여일: ${waitingHomegym.rental_date}</li>
                                                                    </ul>
                                                                </div>
                                                            </div>  
                                                              
                                                             <div class="flex-box">
                                                                    <c:choose>
                                                                    <c:when test="${waitingHomegym.agreeYN == 'Y' }"> 
                                                           			 	 <div class="button accept">
			                                                                        <button class="btn" id="accept" value="${waitingHomegym.d_id}" >수락함</button>
			                                                                 </div>
			                                                                  
																		</c:when>
                                                           			 <c:when test="${waitingHomegym.agreeYN == 'N'}"> 
                                                           			 		<div class="button rejectBtn">
			                                                                        <button class="btn" id="reject" value="${waitingHomegym.d_id}" >거절함</button>
			                                                                 </div>
			                                                                  
																		</c:when>
																		<c:otherwise> 
																			<div class="button accept-btn">
                                                                        		<button class="btn" id="acceptBtn" value="${waitingHomegym.d_id}" onclick="changeHomegymStatus(this);">수락하기</button>
                                                                   		 		
                                                                   		 	</div>
			                                                               <div class="button deny-btn">
                                                                        		<button class="btn" id="rejectBtn" value="${waitingHomegym.d_id}" onclick="changeHomegymStatus(this);" data-toggle="modal" data-target="#myModal" id="Modal_button">거절하기</button>
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
                                    
                                     <form id="actionForm" action="user/mypage/myactiv.do" method="get">
                                     	<input type="hidden" name="memberId" value="${member.memberId}"/>
                                    	<input type="hidden" name="pageNum" value="${wait_pageMaker.cri.pageNum}">
                                    	<input type="hidden" name="amount" value="${wait_pageMaker.cri.amount}">
                                    	<input type="hidden" name="selectedBtnId" id="selectedBtnId" value="${selectedBtnId }"/>
                                    </form> 
                                               <!-- Pagination -->
                                                 <div class="pagination center">
                                                    <ul class="pagination-list">
	                                                   <c:if test ="${wait_pageMaker.prev}">
	                                                        <li class="pageInfo_btn previous"><a href="${wait_pageMaker.startPage-1}">Prev</a></li>
	                                                    </c:if>
	                                                    <c:forEach var="num" begin="${wait_pageMaker.startPage}" end="${wait_pageMaker.endPage}">
	                                                        <li class="pagenate_button ${wait_pageMaker.cri.pageNum == num ? "active": ""} "><a href="${num}">${num}</a></li>
	                                                    </c:forEach>
	                                                    <c:if test="${wait_pageMaker.next}">
	                                                        <li class="paginate_button next"><a href="${wait_pageMaker.endPage+1}">Next</a></li>
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
                                    				<c:when test ="${ld_total == 0}">
	                                    				<div style="font-size: 20px; text-align:center;">
															<p style="margin:40px; font-weight: bold;">아직 빌려준 홈짐이 없습니다.😥</p>
															<div class="flex-box">
                                                                  <div class="button accept-btn">
                                                                      <a href="/homegym/registerView.do" class="btn" style="border-radius:30px; background-color:lightsteelblue">빌려주러 가기</a>
                                                                   </div>
                                                            </div>
														</div>
                                    				</c:when>
                                    			<c:otherwise>
                                    		<c:forEach var="lendHomegym" items="${lendHomegym}" varStatus="status">
                                                 <div class="col-lg-6 col-12">
                                                        <!-- Single News -->
                                                        <div class="single-news custom-shadow-hover wow fadeInUp"
                                                            data-wow-delay=".1s">
                                                            <div class="image">
                                                                <a href="/homegym/homegymDetailView.do?hId=${lendHomegym.h_id}">
                                                                <img src="/display.do?fileName=${lendHomegym.uploadPath}${lendHomegym.uuid}_${lendHomegym.fileName}" style="height:260px;"></a>
                                                            </div>
                                                            <div class="content-body">
                                                                <div class="meta-data">
                                                                    <ul style="font-weight:bold; font-size:15px;">
                                                                        <li>💜${lendHomegym.h_title}</li><br>
                                                                        <li>💜위치 : ${lendHomegym.h_addr}</li><br>
                                                                        <li>💜홈짐 등록일 : <fmt:formatDate value="${lendHomegym.h_regdate}" pattern="yyyy-MM-dd"/></li>
                                                                       
                                                                    </ul>
                                                                </div>
                                                            </div>    
                                                            
                                                            <!-- 버튼 시작 -->
                                                                <div class="flex-box">
                                                           			 <div class="button accept-btn">
			                                                            <button class="btn" id="detailBtn2" value="${homegym.HId}" onClick="location.href='/homegym/homegymDetailView.do?hId=${lendHomegym.h_id}'">상세보기</button>
			                                                         </div>
                                                                </div>
                                                            </div>
                                                        </div>
      
                                           </c:forEach>
                                          </c:otherwise>
                                    </c:choose>
                                                                
                                      <form id="actionForm" action="user/mypage/lendHomegym.do" method="get">
                                      	<input type="hidden" name="memberId" value="${member_memberId}" id="ld_memberId"> 
                                      	<input type="hidden" name="tabindex" value="2">
                                    	<input type="hidden" name="pageNum" value="${ld_pageMaker.cri.pageNum}" id="ld_pageNum">
                                    	<input type="hidden" name="amount" value="${ld_pageMaker.cri.amount}" id="ld_pageNum">
                                    	<input type="hidden" name="selectedBtnId" id="selectedBtnId" value="${selectedBtnId }"/>
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
                                    				<c:when test ="${rt_total == 0}">
	                                    				<div style="font-size: 20px; text-align:center;">
															<p style="margin:40px; font-weight: bold;">아직 빌린 홈짐이 없습니다.😥</p>
															<div class="flex-box">
                                                                  <div class="button accept-btn">
                                                                      <a href="/homegym/homegymListView.do" class="btn" style="border-radius:30px; background-color:lightsteelblue">빌리러 가기</a>
                                                                   </div>
                                                            </div>
														</div>
                                    				</c:when>
                                    			<c:otherwise>
	                                    		<c:forEach var="rentHomegym" items="${rentHomegym}" varStatus="status">
	                                    		
	                                    			<input type="hidden" value="${rentHomegym.h_title}" name="h_name" id="h_name_${status.index}"  />
									                <input type="hidden" value="${rentHomegym.h_memberId}" name="email" id="email_${status.index}"/>
													<input type="hidden" value="${rentHomegym.h_addr}" name="address" id="address_${status.index}"/>
													<input type="hidden" value="${rentHomegym.h_price}" name="price" id="price_${status.index}"/>
													<input type="hidden" value="${rentHomegym.phoneNum}" name="phoneNum" id="phoneNum_${status.index}"/>
													<input type="hidden" value="${rentHomegym.d_id}" name="dId" id="dId_${status.index}"/>
	                                    			
	                                                 <div class="col-lg-6 col-12">
	                                                        <!-- Single News -->
	                                                        <div class="single-news custom-shadow-hover wow fadeInUp"
	                                                            data-wow-delay=".1s">
	                                                            <div class="image">
	                                                                <a href="/homegym/homegymDetailView.do?hId=${rentHomegym.h_id}">
	                                                                <img class="listImage" src="/display.do?fileName=${rentHomegym.uploadPath}${rentHomegym.uuid}_${rentHomegym.fileName}" style="height:260px;"></a>
	                                                            </div>
	                                                            <div class="content-body">
	                                                                <div class="meta-data">
	                                                                    <ul style="font-weight:bold; font-size:15px;">
	                                                                        <li>📌${rentHomegym.h_title}</li><br>
	                                                                        <li>🏡위치: ${rentHomegym.h_addr}</li><br>
	                                                                        <li>📆 대여일 : ${rentHomegym.rental_date}</li>
	                                                                    </ul>
	                                                                </div>
	                                                            </div>    
	                                                            <!-- 버튼 시작 -->
	                                                                <div class="flex-box">
	                                                                    <c:if test="${rentHomegym.payYN =='N' and rentHomegym.agreeYN == 'Y'}"> 
																				<div class="button accept-btn" id="acceptBtn">
				                                                                     <button class="btn payBtn" id="payBtn_${status.index}" value="${homegym.HId}" name="homegymPay" data-attr="${status.index}" 
				                                                                     style="bottom: 10px; border-radius: 40px; background-color: #4154a8;"> 결제 하기</button>
				                                                                </div>
																		</c:if>
	                                                           		 	 <c:if test="${rentHomegym.payYN =='Y'}"> 
	                                                           			 	<div class="button accept-btn">
				                                                                 <button class="btn" id="payOK">결제 완료</button>
				                                                            </div>
				                                                             <div class="button review-btn">
				                                                                  <button class="btn" id="reviewBtn" onClick="location.href='/homegym/homegymDetailView.do?hId=${rentHomegym.h_id}'">리뷰쓰기</button>
				                                                              </div> 
																		</c:if>   
																		<c:if test="${rentHomegym.agreeYN == 'N'}"> 
	                                                           			 	<div class="button deny-btn">
				                                                                   <button class="btn" id="reject">거절 됨</button>
				                                                             </div>
																		</c:if> 
																		<c:if test="${rentHomegym.agreeYN == null}"> 
	                                                           			 	<div class="button wait-btn">
				                                                                   <button class="btn" id="reject" >수락 대기중</button>
				                                                             </div>
																		</c:if> 
	                                                                </div>
	                                                            </div>
	                                                        </div>
	      
	                                           </c:forEach>
	                                           		       <form id="actionForm" action="user/mypage/rentHomegym.do" method="get">
						                                     	<input type="hidden" name="memberId" value="${member_memberId }"/>
						                                    	<input type="hidden" name="pageNum" value="${rt_pageMaker.cri.pageNum}">
						                                    	<input type="hidden" name="amount" value="${rt_pageMaker.cri.amount}">
						                                    	<input type="hidden" name="selectedBtnId" id="selectedBtnId" value="${selectedBtnId }"/>
                                    					  </form>
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
	                                          </c:otherwise>
                                    		</c:choose>
                         
                                           	 </div>
                                         </div>
                                      </div>
                                   </div>         
                                </section>
                                <!-- End Blog Singel Area -->
                            </div>
                            
                        </div> 
                     
                     <!-- 진행중인 홈짐 끝 & 완료된 홈짐 시작 -->   
                        
                       <%--  <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
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
                        </div>--%>
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
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- 결제 api 아임포트 -->
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
    
    <script type="text/javascript">
    	var selectedBtnId = 'overview-tab';
    	$(document).ready(function(){
    		$('#'+$('#selectedBtnId').val()).trigger('click');
    		
    		var actionForm= $("#actionForm");
    		
    		
			/* 페이징 */    		
    	 	 $(".pagination-list a").on("click",function(e){
    			e.preventDefault();
    			//actionForm.find("input[name='memberId']").val($(this).attr("href"));
    			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    			actionForm.attr("action","/user/mypage/myactiv.do");
    			
    	
    			actionForm.submit();
    		}); 
			
			/* 결제 api */
    			$(document).on("click", "#acceptBtn > button ", function() {
					
    				var idx = $(this).attr("data-attr");
				
					var name    = $("#h_name_"+idx).val(); //홈짐 명
				 	var email   = $("#email_"+idx).val(); //주문자 이메일
					var address = $("#address_"+idx).val(); // 주문자 주소
					var price   = $("#price_"+idx).val();
					var phone   = $("#phoneNum_"+idx).val(); 
					var dId = $("#dId_"+idx).val();
					
			 		var IMP = window.IMP; // 생략가능
					IMP.init('imp97132347');
			 		
					IMP.request_pay({
						pg: 'inicis', 
						pay_method: 'card',
						merchant_uid: 'merchant_' + new Date().getTime(),
						name: name,
						//결제창에서 보여질 이름
						amount: price,
						//가격
						buyer_email: email,
						/* buyer_name: '구매자이름', */
						buyer_tel: 'phone',
						buyer_addr: 'address',
						buyer_postcode: '123-456',
						m_redirect_url: 'https://www.yourdomain.com/payments/complete'
					}, function (rsp) {
						console.log(rsp);
						if (rsp.success) {
							var msg = '홈짐 결제가 완료되었습니다.☺';
							location.href="/user/payUpdate.do?payYN=Y&d_id="+dId;
							/* msg += '고유ID : ' + rsp.imp_uid;
							msg += '상점 거래ID : ' + rsp.merchant_uid;
							msg += '결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num; */
						} else {
							var msg = '홈짐 결제에 실패하였습니다. 다시 시도해주세요 !';
							location.href="/user/mypage/myactiv.do?payYN=N";
						}
							alert(msg);
						});
					}); 
			
    		   	$("#overview-tab").on("click", function(e){
    				e.preventDefault();

    				window.location.href="/user/mypage/myactiv.do?memberId=&pageNum=1&amount=4&selectedBtnId=overview-tab"
    			});
    		   	
    		   	$("#curriculum-tab").on("click", function(e){
    				e.preventDefault();

    				window.location.href="/user/mypage/myactiv.do?memberId=&pageNum=1&amount=4&selectedBtnId=curriculum-tab"
    			});
    			$("#instructor-tab").on("click", function(e){
    				e.preventDefault();

    				window.location.href="/user/mypage/myactiv.do?memberId=&pageNum=1&amount=4&selectedBtnId=instructor-tab"
    			});
    	});
				

	function fnGetBtnId(obj) {
		selectedBtnId = obj.id;
		$('#selectedBtnId').val(selectedBtnId);
	}

    </script>
</body>
</html>