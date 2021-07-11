<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
   
<!DOCTYPE html>
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
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->
	
	<!--Header -->
   <%@ include file="/WEB-INF/views/includes/header.jsp" %>

    <!-- Start Hero Area -->
    <section class="hero-area style2" 
    style="background-image: url('/resources/assets/images/main/메인_1.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover; height:900px">
        <!-- Single Slider -->
        <div class="hero-inner">
            <div class="container">
                <div class="row ">
                    <div class="col-lg-6 co-12">
                        <div class="home-slider" style="margin-left:10%;">
                            <div class="hero-text">
                                <h2 class="wow fadeInLeft" data-wow-delay=".3s"><b>빌려줘! 홈짐</b></h2><br>
                                <h6 class="wow fadeInLeft" data-wow-delay=".5s">나만 쓰기 아까운 내 운동 공간, 함께 공유해볼까요?<br> 
                                    먼저 홈짐 등록부터 진행해주세요! 🏠</h6>
                                <!-- <p class="wow fadeInLeft" data-wow-delay=".7s">Lorem Ipsum is simply dummy text of the
                                    printing and typesetting <br> industry. Lorem Ipsum has been the industry's standard
                                    <br>dummy text ever since.</p> -->                           
                                <sec:authorize access="isAuthenticated()">
									<div class="button style2 wow fadeInLeft" data-wow-delay=".7s">
                                    	<a href="/homegym/registerView.do" class="btn" style="border-radius: 8px;">홈짐 등록하기</a>
                                	</div>
                                </sec:authorize>
                                <sec:authorize access="isAnonymous()">
                                	<div class="button style2 wow fadeInLeft" data-wow-delay=".7s ">
                                    	<a href="#myModal" data-toggle="modal" data-target="#myModal" class="btn" style="border-radius: 8px;">홈짐 등록하기</a>
                                	</div>
                                </sec:authorize>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ End Single Slider -->
    </section>
    <!--/ End Hero Area -->

    <!-- Start Hero Area -->
    <section class="hero-area style2" 
    style="background-image: url('/resources/assets/images/main/메인_2.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover; height:900px"">
        <!-- Single Slider -->
        <div class="hero-inner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 co-12">
                        <div class="home-slider">
                            <div class="hero-text" style="position:absolute; right:13%;">
                                <h2 class="wow fadeInLeft" data-wow-delay=".3s"><b>내 근처의 <br>
                                                                                가까운 홈짐</b></h2><br>
                                <h6 class="wow fadeInLeft" data-wow-delay=".5s">동네 이웃의 다양한 홈짐을 경험해보세요👫🏻<br></h6>
                                <div class="button style2 wow fadeInLeft" data-wow-delay=".7s">
                                    <a href="/homegym/homegymListView.do" class="btn">대여하러 가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ End Single Slider -->
    </section>
    <!--/ End Hero Area -->

    <!-- Start Hero Area -->
    <section class="hero-area style2"
    style="background-image: url('/resources/assets/images/main/메인_3.jpg') ; background-repeat: no-repeat; background-position: center; background-size: cover; height:900px"">
        <!-- Single Slider -->
        <div class="hero-inner">
            <div class="container">
                <div class="row ">
                    <div class="col-lg-6 co-12">
                        <div class="home-slider" style="margin-left:10%">
                            <div class="hero-text" >
                                <h2 class="wow fadeInLeft" data-wow-delay=".3s"><b>딱!맞는<br>
                                                                                트레이너를 만나세요</b></h2><br>
                                <h6 class="wow fadeInLeft" data-wow-delay=".5s">조건에 딱 맞는 트레이너를 찾으시나요? 🏋🏻 </h6>
                                <div class="button style2 wow fadeInLeft" data-wow-delay=".7s">
                                    <a href="/trainer/tbList" class="btn">찾아보러 가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ End Single Slider -->
    </section>
    <!--/ End Hero Area -->

    <!-- Start Hero Area -->
    <section class="hero-area style2" 
    style="background-image: url('/resources/assets/images/main/메인_4.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover; height:900px"">
        <!-- Single Slider -->
        <div class="hero-inner">
            <div class="container">
                <div class="row ">
                    <div class="col-lg-6 co-12">
                        <div class="home-slider">
                            <div class="hero-text" style="position:absolute; right:13%;">
                                <h2 class="wow fadeInLeft" data-wow-delay=".3s"><b>Now Open<br/>
                                                                                 채팅 기능!</b></h2><br/>
                                <h6 class="wow fadeInLeft" data-wow-delay=".5s">실시간으로 운동에 관해 소통할 수 있는 <br/>
                                                                                채팅 기능을 이용해보세요! 📢<br/></h6>
                                <div class="button style2 wow fadeInLeft" data-wow-delay=".7s">
                                    <a href="/Template Main/coming-soon.html" class="btn">채팅하러 가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ End Single Slider -->
    </section>
    <!--/ End Hero Area -->

    <!-- Start Footer Area -->
    <footer class="footer style2">
        <!-- Start Middle Top -->
        
                                <!-- End Single Widget -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ End Footer Middle -->
        <!-- Start Footer Bottom -->
        <div class="footer-bottom">
            <div class="container">
                <div class="inner">
                    <div class="row">
                        <div class="col-12">
                            <div class="left">
                                <p>Designed and Developed by 빌려줘 홈짐</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Footer Middle -->
    </footer>
    <!--/ End Footer Area -->

	<!-- 비로그인시 이동 Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">서비스 안내</h5>
	        <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button> -->
	      </div>
	      <div class="modal-body" style="font-size: 15px; text-align: center";>
	        해당 서비스는 <b>로그인 후</b> 사용 가능합니다. <br>
	        비회원인 경우 <b>회원가입</b>을 먼저 진행해주세요!
	      </div>
	      <div class="modal-footer justify-content-center">
	        <button type="button" style="width: 80px;" class="btn btn-secondary" onclick="goLoginpage()" data-dismiss="modal">로그인</button>
	        <button type="button" style="border: none; width: 80px; background-color:#5c6dbd;" class="btn btn-primary" data-dismiss="modal">창닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	

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
    <!-- 모달 -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></script>
    <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"></script>
    <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
    
    <script>
    
 	// Search box change by Readiz 
 	$("#desktopNav input").focus(function(){ 
 		$("#desktopNav form").animate({ 
 			"width": "200px" 
 			}, 300, function() {}); }); 
 	
 	$("#desktopNav input").blur(function(){ 
 		$("#desktopNav form").animate({ 
 			"width": "60px" }, 300, function() {}); }); 
 	
 	$("#desktopNav form").click(function(){ 
 		$("#desktopNav input").focus(); });

    출처: https://blog.readiz.com/213 [Readiz - Read easy]
    
    /* 로그인 페이지 이동 */
    function goLoginpage() {
    	self.location = "/user/loginpage";
    }
    /* 모달 숨기기 */
    function missModal(){
		$("#loginModal").hide();
	}
    </script>

</body>
</html>