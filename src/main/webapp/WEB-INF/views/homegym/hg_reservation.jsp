<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

   <!--Header -->
   <%@ include file="/WEB-INF/views/includes/header.jsp" %>

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

    <!-- Start Contact Area -->
    <section id="contact-us" class="contact-us section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-12 col-12">
                    <div class="form-main">
                        <h3 class="title" ><span style="color: #2f3e83;">집에서 만나는 헬스장!</span>
                            홈짐 예약하기😊
                        </h3>
                        <form class="form" method="post" action="/details/reservation.do">
                        <input type="hidden" name="hId" value="${hId}"/>
                        <input type="hidden" name="borrowerId" value="${member_memberId}"/>
							<div class="row">
								<div class="col-lg-8 col-8 select">
									<label>성별</label> 
									<input type="radio" id='male' name='sex' value='M' ><label for="male">남</label>
									<input type="radio" id='female' name='sex' value='F'><label for="female">여</label>
								</div>
								<div class="col-lg-10 col-10">
									<div class="form-group">
										<label>전화번호</label> <input name="phoneNum" type="text"
											placeholder="전화번호를 입력해주세요." required="required">
									</div>
								</div>
								<div class="col-lg-10 col-12">
									<div class="form-group">
										<label>예약가능날짜</label> <input type='date' id="rentalDate"
											name='rentalDate' required />
									</div>
								</div>
								<div class="col-lg-5 col-12">
									<div class="form-group">
										<label>시작 시간 : </label> <input type='time' name='startTime' required/>
									</div>
								</div>
								<div class="col-lg-5 col-12">
									<div class="form-group">
										<label>종료 시간 : </label> <input type='time' name='endTime' required/><br>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group message">
										<label>메세지📣</label>
										<textarea name="message" placeholder="호스트에게 문의할 사항이 있으신가요?"></textarea>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group button" style="text-align: center;">
										<button type="submit" class="btn">전송하기</button>
									</div>
								</div>
							</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
                    </div>
                </div>
                <div class="col-lg-4 col-12">
                    <div class="contact-info">
                        <!-- Start Single Info -->
                        <div class="single-info">
                            <i class="lni lni-map-marker"></i>
                            <h4>잠깐! 홈짐의 위치를 확인하세요</h4>
                            <p class="no-margin-bottom">${address.HAddr }
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
    <script src="/resources/assets/js/main.js"></script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    
</body>

</html>