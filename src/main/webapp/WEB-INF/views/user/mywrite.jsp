<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- <%
 	String memberId = session.getAttribute("memberId").toString();
 %> --%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<style>
	#addBtn{
		height: 50px;
	    width: 150px;
	    font-size: 18px;
	    margin-left: 350px;
	    border-color: #5c6dbd;
	    color: #5c6dbd;
	    font-weight: 400;
	}
	
	/* .fouc{
		display: none;
	}
 */
</style>
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

                <div class="col-lg-9 col-9">
                    <h5 style="margin-bottom: 20px;">글 관리</h5>
                    <ul class="nav nav-tabs" id="myTab" role="tablist">

                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="overview-tab" data-bs-toggle="tab"
                                data-bs-target="#overview" type="button" role="tab" aria-controls="overview"
                                aria-selected="true" onclick="fnGetBtnId(this)">게시글</button>
                        </li>
                      
                        <li class="nav-item" role="presentation">
         				  <button class="nav-link" id="instructor-tab" data-bs-toggle="tab"
                                data-bs-target="#instructor" type="button" role="tab" aria-controls="instructor"
                                aria-selected="false" onclick="fnGetBtnId(this)">리뷰</button>
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
			                                            <td><a href="/trainer/tbDetail.do?tno=${board.tno}" style="color:black;">${board.tbContent}</a></td>
			                                            <td>${board.memberId}</td>
			                                            <td><fmt:formatDate pattern= "yyyy-MM-dd" value="${board.tbRegDate}" /></td>
			                                        </tr>
                                    			</c:forEach>
                                    		</c:otherwise>
                                    	</c:choose>
                                		</tbody>
                                    </table>
                                    
                                   <form id="actionForm" action="user/mypage/mywrite.do" method="get">
                                     	<input type="hidden" name="memberId" value="${member.memberId}"/>
                                    	<input type="hidden" name="pageNum" value="${tb_pageMaker.cri.pageNum}">
                                    	<input type="hidden" name="amount" value="${tb_pageMaker.cri.amount}">
                                    	<input type="hidden" name="selectedBtnId" id="selectedBtnId" value="${selectedBtnId }"/>
                                    </form> 
                                               <!-- Pagination -->
                                                <div class="pagination center">
                                                    <ul class="pagination-list">
	                                                   <c:if test ="${tb_pageMaker.prev}">
	                                                        <li class="pageInfo_btn previous"><a href="${tb_pageMaker.startPage-1}">Prev</a></li>
	                                                    </c:if>
	                                                    <c:forEach var="num" begin="${tb_pageMaker.startPage}" end="${tb_pageMaker.endPage}">
	                                                        <li class="pagenate_button ${tb_pageMaker.cri.pageNum == num ? "active": ""} "><a href="${num}">${num}</a></li>
	                                                    </c:forEach>
	                                                    <c:if test="${tb_pageMaker.next}">
	                                                        <li class="paginate_button next"><a href="${tb_pageMaker.endPage+1}">Next</a></li>
	                                                    </c:if>
	                                                    </ul>
                                                </div>  
                                </div> 
                            </div>
                        </div>
       
                        <div class="tab-pane fade" id="instructor" role="tabpanel" aria-labelledby="instructor-tab">
                            <div class="course-instructor">
                                <div class="row">
                                    <div class="table-responsive">
                                        <table class="table table-hover" style="text-align: center; line-height: 35px;">
                                            <thead class="thead-light">
                                            <tr>
                                                <th>홈짐이름</th>
                                                <th>리뷰내용</th>
                                                <th>별점</th>
                                                <th>리뷰 작성일</th>
                                            </tr>
                                            </thead>
                                            <tbody id="listBody">
                                   				 <c:choose>
                                    				<c:when test ="${fn:length(myReviews)==0}">
                                    				<div style="font-size: 20px">
                                    					<tr>
															<td colspan="4"><p style="margin:40px; font-weight: bold;">아직 작성한 리뷰가 없습니다.😥</p></td>
														</tr>
											
													</div>
                                    			</c:when>
                                    			<c:otherwise>
                                    			
                                    				<c:forEach var="myReviews" items="${myReviews}" varStatus="status">
		                                    			<tr>
				                                            <td>${myReviews.h_title}</td>
				                                            <td><a href="/homegym/homegymDetailView.do?hId=${myReviews.h_id}" style="color:black;">${myReviews.hr_content}</a></td>
					                                            <c:if test="${myReviewshr_score==1}">
					                                            	<td>⭐</td><
					                                            </c:if>
					                                            <c:if test="${myReviews.hr_score==2}">
					                                            	<td>⭐⭐</td>
					                                            </c:if>
					                                            <c:if test="${myReviews.hr_score==3}">
					                                            	<td>⭐⭐⭐</td>
					                                            </c:if>
					                                            <c:if test="${myReviews.hr_score==4}">
					                                            	<td>⭐⭐⭐⭐</td>
					                                            </c:if>
					                                            <c:if test="${myReviews.hr_score==5}">
					                                            	<td>⭐⭐⭐⭐⭐</td>
					                                            </c:if>
				                                            <td><fmt:formatDate pattern= "yyyy-MM-dd" value="${myReviews.hr_regdate}" /></td>
		                                       		    </tr>
                                    			   </c:forEach>
                                    			  
                                    	     	</c:otherwise>
                                     		 </c:choose>
                                     		
                               			  </tbody>
                                       </table>
                                        <form id="actionForm" action="user/mypage/mywrite.do" method="get">
                                     	<input type="hidden" name="memberId" value="${member.memberId}"/>
                                    	<input type="hidden" name="pageNum" value="${rv_pageMaker.cri.pageNum}">
                                    	<input type="hidden" name="amount" value="${rv_pageMaker.cri.amount}">
                                    	<input type="hidden" name="selectedBtnId" id="selectedBtnId" value="${selectedBtnId }"/>
                                    </form> 
                                               <!-- Pagination -->
                                                <div class="pagination center">
                                                    <ul class="pagination-list">
	                                                   <c:if test ="${rv_pageMaker.prev}">
	                                                        <li class="pageInfo_btn previous"><a href="${rv_pageMaker.startPage-1}">Prev</a></li>
	                                                    </c:if>
	                                                    <c:forEach var="num" begin="${rv_pageMaker.startPage}" end="${rv_pageMaker.endPage}">
	                                                        <li class="pagenate_button ${rv_pageMaker.cri.pageNum == num ? "active": ""} "><a href="${num}">${num}</a></li>
	                                                    </c:forEach>
	                                                    <c:if test="${rv_pageMaker.next}">
	                                                        <li class="paginate_button next"><a href="${rv_pageMaker.endPage+1}">Next</a></li>
	                                                    </c:if>
	                                                    </ul>
		                                       </div>  
		                                </div> 
		                            </div>
		                        </div>
                                      
                                    <!-- </div> -->
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
    
    
    
        <script type="text/javascript">/* 
    	var selectedBtnId = 'overview-tab'; */
    	
    	$(document).ready(function(){
    /* 		$('#'+$('#selectedBtnId').val()).trigger('click');
    		 */
    		var actionForm= $("#actionForm");
    		
    		
			/* 페이징 */    		
    	 	 $(".pagination-list a").on("click",function(e){
    			e.preventDefault();
    			//actionForm.find("input[name='memberId']").val($(this).attr("href"));
    			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    			actionForm.attr("action","/user/mypage/mywrite.do");
    			
    	
    			actionForm.submit();
    		}); 
	
/*      	 	$("#overview-tab").on("click", function(e){
				e.preventDefault();

				window.location.href="/user/mypage/mywrite.do?memberId=&pageNum=1&amount=4&selectedBtnId=overview-tab"
			});

    	 	
    		$("#instructor-tab").on("click", function(e){
				e.preventDefault();

				window.location.href="/user/mypage/mywrite.do?memberId=&pageNum=1&amount=4&selectedBtnId=instructor-tab"
			});
    		
  	function fnGetBtnId(obj) {
		selectedBtnId = obj.id;
		$('#selectedBtnId').val(selectedBtnId);
	} 
    	});  */
    </script>
</body>

</html>