<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>빌려줘! 홈짐 - 트레이너</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo/logo.png" />
    <!-- Place favicon.ico in the root directory -->

    <!-- Web Font -->
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">

    <!-- ========================= CSS here ========================= -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/LineIcons.2.0.css" />
    <link rel="stylesheet" href="assets/css/animate.css" />
    <link rel="stylesheet" href="assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    


   <!--========================= 캐러셀 ================================ -->

    
<!-- ======================모달=============================== -->


  

<style>
    p {
            font-size: 17px;
            line-height: 1.6;
            letter-spacing: -0.6px;
            margin: 16px 0;
            word-break: break-all;
    }
    
    .popular-feed-loop{
    width: 250px;
    height: 250px; 
    border-radius: 100%;
    overflow: hidden
    }
    
    .trainner{
    width: 100%;
    height: 100%;
    object-fit: cover;
    }
    
    .modal-content{
        font-size: 100px;
    }
    
    .sidebar{
      position: sticky;
      top: 30px;
    }
    
    #re_plus{
        background-color: #9ea9d8;
        width:150px; 
        height: 50px;
        font-size: 20px;
        color: white; 
        font-weight: bold;
        position: relative;
        left: 300px;
        top: 20px;
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
							<a class="navbar-brand" href="main_index.html">
								<img src="../Template Main/assets/images/logo/로고2.png" alt="logo">
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
											<h5>커뮤니티</h5>
										</a></li>
									<a class="circle-image" href="mypage.html">
										<img src="https://via.placeholder.com/300x300" alt="logo">
									</a>
									<li class="nav-item">
										<a href="mypage.html"><h5>아이유님</h5></a>
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



     <!-- Start Blog Singel Area -->
   <section class="section blog-single">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-12">
                  <br>
                   <h2 style="font-weight: bold;">확찐자 맞춤 트레이닝💪🏼</h2>
                    <div class="single-inner">
                       <br>
                       <div id="carousel-example-generic" class="carousel slide"
                     data-ride="carousel">
                     <!-- Indicators -->
                     <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0"
                           class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                     </ol>
                     <!-- Wrapper for slides -->
                     <div class="carousel-inner" role="listbox">
                        <div class="item active">
                           <img src="assets/images/gym/gym1.jpg" alt="...">
                           <div class="carousel-caption"></div>
                        </div>
                        <div class="item">
                           <img src="assets/images/gym/gym2.jpg" alt="...">
                           <div class="carousel-caption"></div>
                        </div>
                       
                     </div>
                     <!-- Controls -->
                     <a class="left carousel-control" href="#carousel-example-generic"
                        role="button" data-slide="prev"> <span
                        class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                     </a> <a class="right carousel-control"
                        href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"
                        aria-hidden="true"></span> <span class="sr-only">Next</span>
                     </a>
                  </div>
                       
                        <div class="post-details">
                            <div class="detail-inner">
                                <h2 class="post-title">
                                    <p style="font-size: 30px">🏋🏼‍♂️트레이너 소개</p>
                                </h2>
                                <p style="font-size: 20px; line-height:30px;">안녕하세요. 김영광 트레이너 입니다.<br>
                                항상 더 좋은 트레이닝을 제공해드리기 위해 교육과 세미나에 참석하여 이론(해부학,근육학 등)과 실제 트레이닝 방법을 꾸준히 연마하고 있습니다. 무엇보다 회원님께서 원하시는 운동 목표를 이뤄드리는데에 있어서, 운동에 전적으로 집중하실 수 있도록 진정성 있는 트레이닝을 진행 할 것을 약속드립니다.</p><hr>
                                
                                <br><h3>📍 프로그램 소개</h3>
                                <ul class="list" style="font-size: 18px; line-height:30px;">
                                    <li><i class="lni lni-chevron-right-circle"></i>인바디를 통한 상태파악 <br>-현재 까지의 식습관과 생활 패턴에 대한 문제점 파악</li>
                                    
                                    <li><i class="lni lni-chevron-right-circle"></i>필요한 운동<br>수준에 맞춰 실시하여 예를 들어 앉아서 일을 많이 하는분들은 라운드 숄더, 척추 측만증 등의 문제점을 교정하는 맞춤 운동 실시</li>
                                   
                                   <li>수업을 진행하면서도 여러 운동방법을 제시해 알려드리고 왜 이런 운동방법이 필요한지 알아가고 변해가는 모습에 대한 피드백을 계속 이어갑니다! 지금 바로 연락 주세요!📞
                                   </li>
                                </ul>
                              
                            </div>
                            
                            
                            <!-- 댓글 -->
                            <div class="post-comments">
                                <h2>리뷰 💌</h2><hr><br>
                                
                                <ul class="comments-list">
                                    <li>
                                        <div class="comment-img">
                                            <img src="assets/images/gym/re1.jpg" alt="img" style="width: 100px;">
                                        </div>
                                        <div class="comment-desc">
                                            <div class="desc-top">
                                                <h6>혜선짱</h6>
                                                <span class="date">2021/05/25</span>
                                                <a href="javascript:void(0)" class="reply-link"><i class="lni lni-reply"></i>답글 달기</a>
                                            </div>
                                            <p>
                                               바벨 한번 안들어본 상태로 스쿼트 기본자세부터 기구 운동시 사용되는 근육에 대해 사진까지 보여주시며 친절하고 자세하게 설명해주시면서 코치해주십니다!! 강추!
                                            </p>
                                        </div>
                                    </li>
                                    <li class="children">
                                        <div class="comment-img">
                                            <img class ="trainner" src="assets/images/gym/re2.jpg"  alt="img">
                                        </div>
                                        <div class="comment-desc">
                                            <div class="desc-top">
                                                <h5><span>김영광 </span>트레이너<span class="saved"><i
                                                            class="lni lni-bookmark"></i></span></h5>
                                                <span class="date">15th May 2023</span>
                                                <a href="javascript:void(0)" class="reply-link"><i class="lni lni-reply"></i>리뷰</a>
                                            </div>
                                            <p>
                                                감사합니다 ! 다음에도 방문해주시면 열심히 알려드리겠습니다.
                                            </p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="comment-img">
                                            <img src="assets/images/gym/re3.png" alt="img">
                                        </div>
                                        <div class="comment-desc">
                                            <div class="desc-top">
                                                <h6>한예슬</h6>
                                                <span class="date">12th May 2023</span>
                                                <a href="javascript:void(0)" class="reply-link"><i class="lni lni-reply"></i>댓글 달기</a>
                                            </div>
                                            <p>
                                                목표 의식을 잘 가질수 있도록 옆에서 든든히 자리를 지켜주시는 좋은 PT쌤이십니다! 
                                            </p>
                                        </div>
                                        
                                    </li>
                                </ul>
                            </div>
                    <button type="button" class="btn btn-outline-info" id="re_plus">더보기</button>
                        </div>
                       
                    </div>
                </div>
                
                <aside class="col-lg-4 col-md-12 col-12">
                    <div class="sidebar">
                       
                        <!--/ End Single Widget -->
                        <!-- Single Widget -->
                        <div class="widget popular-feeds" style ="position: relative; top: 90px;">
                            <div class="tr_image" style="position: relative; left: 10px;">
                                        <img src="assets/images/gym/re2.jpg" alt="#" style="object-fit: cover; object-position: center center; border-radius: 50%; width: 150px; height: 150px; position: relative; left: 80px">
                            </div>
                            <div>
                               <br>
                                <p style="font-size: 23px; font-weight: bold;text-align: center;"><span>김영광</span> 트레이너</p>
                                   <ul style="text-align: center; font-size: 16px; margin: 10px">
                                        <li>평일 10:00 ~20:50</li>
                                        <li>토요일 10:00 ~17:00</li>
                                        <li> 휴무일 일요일</li>
                                    </ul>
                                     <div class="button wow fadeInUp" data-wow-delay="1s" style="position: relative; left: 100px;">
                                    <button type="button" class="btn" data-toggle="modal" data-target="#myModal" style="background-color: #5c6dbd;">문의하기</button>
                            </div>
                            </div>
                        </div>
                        <!--/ End Single Widget -->
                       
                        <!--/ End Single Widget -->
                        <!-- 해시태그 -->
                        <div class="widget popular-tag-widget" style="position: relative; top: 70px; margin: " >
                            <div class="tags" style="font-size: 17px; font-weight: bold; color: black; border-radius:20px;">
                                <p>활동 지역</p>
                                <a href="" style ="border-radius: 20px;">#강남구</a>
                                <a href="" style ="border-radius: 20px;">#서초구</a>
                                <a href="" style ="border-radius: 20px;">#송파구</a>
                                
                                <p>활동 범위</p>
                                <a href="" style ="border-radius: 20px;">#홈짐방문</a>
                                <a href="" style ="border-radius: 20px;">#헬스장</a>
                                <a href="" style ="border-radius: 20px;">#홈짐보유</a>
                
                            </div>
                        </div>
                        <!--/ End Single Widget -->
                    </div>
                </aside>
            </div>
        </div>
    </section>
    
    
   <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog" > <!-- 사용자 지정 부분① : id명 -->
    <div class="modal-dialog" style="top:200px; left:50px;">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <p class="modal-title" style="font-size: 30px;">트레이너의 정보를 받아보세요!😊</p> <!-- 사용자 지정 부분② : 타이틀 -->
        </div>

        <div class="modal-body">
          <p style="font-size: 20px">phone : 010 -1234 -5678</p> <!-- 사용자 지정 부분③ : 텍스트 메시지 -->
          <p style="font-size: 20px">instagram : @aksakfn12 </p>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>



<br/><br/>


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
                            <a href="index.html"><img src="assets/images/logo/로고1.png" alt="Logo"></a>
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
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/count-up.min.js"></script>
    <script src="assets/js/wow.min.js"></script>
    <script src="assets/js/tiny-slider.js"></script>
    <script src="assets/js/glightbox.min.js"></script>
    <script src="assets/js/main.js"></script>
</body>

</html>