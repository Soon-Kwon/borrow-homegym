<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>빌려줘! 홈짐 - 회원가입</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo/logo.png" />
    <!-- Place favicon.ico in the root directory -->

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
    <link rel="stylesheet" href="/assets/css/board/board.css">
    <link rel="stylesheet" href="/assets/css/seok.css">
    
    <script
  	src="https://code.jquery.com/jquery-3.4.1.js"
  	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  	crossorigin="anonymous">
    </script>
    
    <!-- 체크박스 하나만 선택하게 하기(성별) -->
    <script>
    function doOpenCheck(chk){
        var obj = document.getElementsByName("gender");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != chk){
                obj[i].checked = false;
            }
        }
    }
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
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->

    <header class="header style2 navbar-area">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<div class="nav-inner">
						<nav class="navbar navbar-expand-lg">
							<a class="navbar-brand" href="/index.jsp">
								<img src="/assets/images/logo/로고2.png" alt="logo">
							</a>
							<button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
							</button>
							<form class="d-flex search-form">
								<input class="form-control me-2" type="search" placeholder="동네 이름을 검색해보세요!" aria-label="Search">
								<button class="btn btn-outline-success" type="submit"><i class="lni lni-search-alt"></i></button>
							</form>
							<div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
								<ul id="nav" class="navbar-nav ms-auto">
									<li class="nav-item" style="margin-right: 100px;"><a href="location.html">
											<h5>홈짐</h5>
										</a></li>
									<li class="nav-item" style="margin-right: 120px;"><a href="community.html">
											<h5>트레이너</h5>
										</a></li>
									<a class="circle-image" href="/index">
										<img src="https://via.placeholder.com/300x300" alt="logo">
									</a>
									<li class="nav-item">
										<a href="mypage_main.html"><h5>아이유님</h5></a>
										</li>
								</ul>
							</div> <!-- navbar collapse -->
						</nav> <!-- navbar -->
					</div>
				</div>
			</div> <!-- row -->
		</div> <!-- container -->
	</header>
	<!-- End Header Area -->
    <!-- start Registration section -->
    <section class="login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                    <div class="form-head">
                        <h4 class="title">회원 가입</h4>
                        <form id="join_form" method="post" action="/member/join">
                            <div class="form-group">
                              <div class="form-group">
                                <label>이름</label>
                                <input class="margin-5px-bottom" type="text" id="name" name="name" placeholder="이름" button style="width:80%">
                                </div>
                                <label>아이디</label>
                                <input class="margin-5px-bottom" type="text" id="memberId" name="memberId" placeholder="아이디" button style="width:80%">
                                <button type="button" id="idChk" class="btnjo">중복 확인</button>
                            </div>
                            <div class="form-group">
                                <label>닉네임</label>
                                <input class="margin-5px-bottom" type="text" id="nickname" name="nickname" placeholder="닉네임" button style="width:80%">
                                <button type="check" class="btnjo" >중복 확인</button>
                            </div>
                            <div class="form-group">
                                <label>비밀번호</label>
                                <input class="margin-5px-bottom" type="password" id="password" name="password" placeholder="비밀번호" button style="width:80%">
                            </div>
                            <div class="form-group">
                                <label>전화번호</label>
                                <input class="margin-5px-bottom" type="text" id="phone" name="phone" placeholder="'-' 빼고 입력해주세요" button style="width:80%">
                            </div>
                          
                            <div class="form-group">
                                <label>생년월일</label>
                                <input class="margin-5px-bottom" type="text" id="birth" name="birth" placeholder="생년월일 6자리" button style="width:80%">
                            </div>
                            <div class="form-group">
                                <label>우편번호</label>
                                <input class="margin-5px-bottom" type="text" id="zipCode" name="zipCode" placeholder="주소를 입력해주세요" button style="width:80%">
                            </div>
                            <div class="form-group">
                                <label>주소</label>
                                <input class="margin-5px-bottom" type="text" id="address" name="address" placeholder="주소를 입력해주세요" button style="width:80%">
                            </div>
                            
                            <div class="gender">
                                <label>성별</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" id="gender" name="gender" value="남성" onclick="doOpenCheck(this);" > 남성</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="checkbox" id="gender" name="gender" value="여성" onclick="doOpenCheck(this);" > 여성</label>
                            </div>

                            <div class="button">
                                <button type="submit" class="btn" id="join_button">회원가입</button>
                            </div>
                            <p class="outer-link">아이디가 있으신가요?&nbsp;&nbsp; <a href="/user/login">로그인</a></p>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Registration section -->

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
                                <a href="main_index.html"><img src="/assets/images/logo/로고1.png" alt="Logo"></a>
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
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/count-up.min.js"></script>
    <script src="../assets/js/wow.min.js"></script>
    <script src="../assets/js/tiny-slider.js"></script>
    <script src="../assets/js/glightbox.min.js"></script>
    <script src="../assets/js/main.js"></script>
    <script type="text/javascript"></script>
    
    <script>
    /* $(document).ready(function(){
    	//회원가입 버튼(회원가입 기능 작동)
    	$("#join_button").click(function(){
    		$("#join_form").attr("action", "/member/join");
    		$("#join_form").submit();
    	});
    }); */
    </script>

</body>

</html>