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
									<input type="radio" id='male' name='sex' value='M' ><label for="male">남성</label>
									<input type="radio" id='female' name='sex' value='F'><label for="female">여성</label>
								</div>
								<div class="col-lg-6 col-12">
									<div class="form-group">
										<label>전화번호</label> <input name="phoneNum" type="text"
											placeholder="전화번호를 입력해주세요." required="required">
									</div>
								</div>
								<div class="col-lg-6 col-12">
									<div class="form-group">
										<label>예약가능날짜</label> <input type='date' id="rentalDate"
											name='rentalDate' required />
									</div>
								</div>
								<div class="col-lg-6 col-12">
									<div class="form-group">
										<label>시작 시간 : </label> 
										<input class="timepicker" name='startTime' required/>
									</div>
								</div>
								
								<div class="col-lg-6 col-12">
									<div class="form-group">
										<label>종료 시간 : </label> 
										<input class="timepicker" name='endTime' required/><br>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group message">
										<label>메세지📣</label>
										<textarea name="message" placeholder="호스트에게 문의할 사항이 있으신가요?"></textarea>
									</div>
								</div>
								<br>
								<div class="col-12">
									<div class="form-group button" style="text-align: center;">
										<button type="submit" class="btn" id="reservationFormBtn">신청하기</button>
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
						<div id="map" style="width: 100%; height: 350px;">
						<!-- 맵 공간 -->
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
    <script>
    	/* 타임피커 이용한 시간 출력조정*/
    	$(document).ready(function(){
    		$('.timepicker').timepicker({
    		    timeFormat: 'HH:mm',
    		    interval: 30,
    		    minTime: '9',
    		    maxTime: '19:00',
    		    defaultTime: '11',
    		    startTime: '09:00',
    		    dynamic: false,
    		    dropdown: true,
    		    scrollbar: true
    		});
    	});
    </script>
	<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9acd85a01adaa0b260e4eb08bf997e9"></script>
		<script>
		var container = document.getElementById('map');
		
		var options = {
			center: new kakao.maps.LatLng(${address.HLocateY}, ${address.HLocateX}),
			level: 3
		};
		// 맵 생성
		var map = new kakao.maps.Map(container, options);

		var imageSrc = '/resources/assets/images/logo/logo.png' // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(54, 69), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(${address.HLocateY}, ${address.HLocateX}); // 마커가 표시될 위치입니다
	
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition, 
		    image: markerImage // 마커이미지 설정 
		});
	
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);  
	</script>
	<script>
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		 if(dd<10){
		        dd='0'+dd
		    } 
		    if(mm<10){
		        mm='0'+mm
		    } 
	
		today = yyyy+'-'+mm+'-'+dd;
		
		var maxDay = new Date();
		var mdd = maxDay.getDate() + 21; 
		var mmm = maxDay.getMonth()+1; 
		var myyyy = maxDay.getFullYear();
		
		if( mmm == 1 || mmm == 3 || mmm == 5 || mmm == 7 || mmm == 8 || mmm == 10 || mmm ==12 ){
			if(mdd > 31) {
				mdd = mdd - 31;
				mmm += 1
				if ( mmm == 12 && mdd > 31){
					myyyyy += 1
					mmm = 1 
					mdd = mdd - 31;
				}
			}
		}
		
		if( mmm == 4 || mmm == 6 || mmm == 8 || mmm == 9 || mmm == 11 ){
			if(mdd > 30) {
				mdd = mdd - 30;
				mmm += 1
			}
		}
		
		if( mmm == 2){
			if(mdd > 28) {
				mdd = mdd - 28;
				mmm += 1
			}
			if(myyyy == 2024 || 2028 || 2032 || 2036){
				if(mdd > 29) {
					mdd = mdd -29;
					mmm += 1
				}
			}
		}
		
		 if(mdd<10){
		        mdd='0'+mdd
		    } 
		    if(mmm<10){
		       mmm='0'+mmm
		    } 
		    
		var maxDate = myyyy+'-'+mmm+'-'+mdd;
		
		document.getElementById("rentalDate").setAttribute("min", today);
		document.getElementById("rentalDate").setAttribute("max", maxDate);
	</script>
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
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<!-- JQuery Timepicker -->
	<script src="/resources/assets/js/jquery.timepicker.min.js"></script>
</body>
</html>