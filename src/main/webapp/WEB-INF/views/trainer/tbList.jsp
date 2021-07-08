<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- 페이징 관련 자바스크립트 -->
<script>
	$(document)
			.ready(
					function() {

						// 페이지 버튼 클릭했을 때 이동
						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						// 제목 클릭시 해당 글로 이동하는 form
						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();

											actionForm
													.append("<input type='hidden' name='hId' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/trainer/tbDetail.do");
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

	<!--Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>

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
							<div class="course-image" style="width: 100%; ">
								<a href="tbDetail.do?tno=${trBoard.tno}" style="width: 100%; "> 
									<img src="/resources/imgUpload/${trBoard.tbImg}" style="height:400px;">
									<%-- <img src="/trainer/display/main.do?fileName=${trBoard.tbImg}" > --%>
								</a>

							</div>
							<div class="content" style="height: 230px;">
								<h4>${trBoard.tbTitle}</h4>
								<br>
								<p>${trBoard.tbContent}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- 페이징 시작  -->
			<div class="row">
				<div class="col-12">
					<div class="pagination center">
						<ul class="pagination-list">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous"><a
									href="${pageMaker.startPage -1 }">이전</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }">
								<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }">
									<a href="${num }">${num }</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next }">
								<li class="paginate_button next"><a
									href="${pageMaker.endPage + 1 }">다음</a>
							</c:if>
						</ul>
						<!-- 페이지 번호 클릭했을 때 전송되는 form -->
						<form id="actionForm" action="/trainer/tbList.do" method="get">
							<input type='hidden' name='pageNum'
								value='${pageMaker.cri.pageNum }'> <input type='hidden'
								name='amount' value='${pageMaker.cri.amount }'>
						</form>
					</div>
					<!--/ End Pagination -->
				</div>
				<div class="button" style="margin-top: 30px; text-align: center">
					<a href="tbWrite.do" class="btn" style="border-radius:5px;" >글쓰기 </a>
				</div>
				<!-- 로그인  정보가 있을 때 글쓰기 작성할 수 있게 막는 것  -->
<%-- 				<c:if test="${member.memberId eq null}">
				<div class="button" style="margin-top: 30px; text-align: center">
					<a href="tbWrite.do" class="btn" style="border-radius:5px;" onclick="logCheck();">글쓰기 </a>
				</div>
				</c:if> --%>
			
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
									src="/resources/assets/images/logo/로고1.png" alt="Logo"></a>
							</div>
						</div>
						<div class="col-md-6" style="text-align: end;">
							<p>
								<br> <a href="faq.html"> 자주묻는 질문</a> <br> 
								서울특별시 서초구 강남대로 459 (서초동, 백암빌딩) 403호<br> 
								(주) 빌려줘홈짐 | 문의 02-123-1234 | 사업자등록번호 123-12-12345 
								<br> © 2021. All Rights Reserved.
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
<!-- 	<script type="text/javascript">
	$(document).on("click", function(){
		alert("로그인이 필요합니다.");
		location.href="/user/loginpage.do"
	});
	
	</script> -->
</body>

</html>