<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>빌려줘! 홈짐 - 홈짐 예약</title>
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
	
	<style>
	/*라디오 버튼 CSS*/
	.select {
    	padding: 15px 10px;
	}
	.select input[type=radio]{
	    display: none;
	}
	.select input[type=radio]+label{
	    display: inline-block;
	    cursor: pointer;
	    height: 24px;
	    width: 90px;
	    border: 1px solid #333;
	    line-height: 24px;
	    text-align: center;
	    font-weight:bold;
	    font-size:13px;
	}
	.select input[type=radio]+label{
	    background-color: #fff;
	    color: #333;
	}
	.select input[type=radio]:checked+label{
	    background-color: #333;
	    color: #fff;
	}
	
	label{
		display: block;
	    margin-bottom: .5rem;
	    color: #081828;
	    font-size: 19px;
	    font-weight: 500;
	}
	
	#backBtn{
		border-radius : 30px;
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

    <!-- Start Contact Area -->
    <section id="contact-us" class="contact-us section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-12 col-12" style="margin-left: 170px;">
                    <div class="form-main" style="margin-left: 200px;">
                        <h3 class="title" style="text-align:center; font-size:20px;">📌홈짐 예약이 완료되었습니다.<h3>
                       
                        <input type="hidden" name="hId" value="${hId }"/>
							<div class="row" >
								<div class="col-lg-10 col-10">
									<div class="form-group">
										<label>📌  홈짐이름</label> ${myRequest.borrowerId}
									</div>
								</div>
								<div class="col-lg-10 col-10">
									<div class="form-group">
										<label>📞  가격</label> ${myRequest.phoneNum}
									</div>
								</div>
								<div class="col-lg-10 col-12">
									<div class="form-group">
										<label>📅  요청 예약날짜</label> 
									</div>
								</div>
								<div class="col-lg-5 col-12">
									<div class="form-group">
										<label>⏰  시작 시간  </label>
									</div>
								</div>
								<div class="col-lg-5 col-12">
									<div class="form-group">
										<label>⏰  종료 시간  </label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group message">
										<strong>📫  요청 메세지</strong>
										<textarea name="message" readonly>${myRequest.message}</textarea>
										
									</div>
								</div>
								<div class="col-12">
									<div class="form-group button">
										<button class="btn" id="backBtn" style="margin-left: 200px;">확인</button>
									</div>
								</div>
							</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                    </div>
                </div>
          
                        <!-- End Single Info -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/ End Contact Area -->

    <!-- Start Google-map Area -->

    <!-- End Google-map Area -->

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
    
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    
    <!-- 뒤로가기 버튼 -->
    <script>

	$(document).ready(function(){
		$("#backBtn").click(function(){
			window.history.back();
		});
	});

</script>


</body>

</html>