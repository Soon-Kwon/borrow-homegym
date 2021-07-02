<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zxx">


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
   <%@ include file="/WEB-INF/views/includes/header.jsp" %>


	<!-- start login section -->
	<section class="blacnk">
		<br> <br> <br> <br> <br> <br>
	</section>
	<section class="login section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
					<div class="form-head">
						<h4 class="title">로그인</h4>
						<h6><c:out value="${error}"/></h6>
						<h6><c:out value="${logout}"/></h6> <br/>
						
						<form action="/login" method="post">
							<div class="form-group">
								<label>아이디</label> <input type="text" name="memberId" class="margin-5px-bottom" 
									id="memberId" placeholder="아이디를 입력하세요" width=""><!-- type="email" -->
							</div>
							<div class="form-group">
								<label>비밀번호</label> <input class="margin-5px-bottom"
									type="password" name="password" id="password"
									placeholder="비밀번호를 입력하세요">
							</div>
							<div class="check-and-pass">
								<div class="row align-items-center">
									<div class="col-lg-6 col-12">
										<div class="form-check">
											<input type="checkbox" class="form-check-input width-auto" id="exampleCheck1"> 
											<label class="form-check-label">비밀번호 저장</label>
										</div>
									</div>
								</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="button">
								<button type="submit" class="btn">LogIn</button>
							</div>
							<p class="outer-link">
								계정이 없으신가요? &nbsp;&nbsp; 
								<a href="/user/registration.do">회원가입 하기</a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Registration section -->


	<!-- ========================= scroll-top ========================= -->


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
  </body>
</html>