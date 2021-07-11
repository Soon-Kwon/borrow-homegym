<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.homegym.biz.trainerboard.TrainerBoardVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>

<!-- ========================= CSS here ========================= -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- 캐러셀  -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 

	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>



/* caroucsel  */

 .carousel-item,
.carousel-inner,
.carousel-inner img {
  height:100%;
  width: 750px;
 
}
/* carousel 양쪽 사이드 회색 없애는 css  */
a.carousel-control{
opacity:0;
}

.carousel-item {
  text-align: center;
}

.carousel-inner img {
  width: 100%;
  height: auto;
}
.carousel-control.left, .carousel-control.right {
    background-image: none
}
pre{
border:none;
white-space: pre-wrap; 
scroll:no;

}

.modal{
z-index:1050;
}

</style>


<!-- ========================= JS here ========================= -->
<script src="/resources/assets/js/bootstrap.min.js"></script>
<script src="/resources/assets/js/count-up.min.js"></script>
<script src="/resources/assets/js/wow.min.js"></script>
<script src="/resources/assets/js/tiny-slider.js"></script>
<script src="/resources/assets/js/glightbox.min.js"></script>
<script src="/resources/assets/js/main.js"></script>

<!-- ====================== message modal관련 =============================== -->
	<link rel="stylesheet" href="/resources/assets/css/chat.css" /> 
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="/resources/assets/css/chat.css" /> 

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



</head>

<body>

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

	<!-- Start Blog Singel Area -->
	<section class="section blog-single" >
		<div class="container">
			<div class="row">
				<div>			
					<div class="col-lg-8 col-12">
					<br><br><br>

					<div class="single-inner"></div>
					<br>
				<!-- test start -->
					<!-- carousel를 구성할 영역 설정 -->
					<div style="width: 100%;  margin-top:10px; ">
						<!-- carousel를 사용하기 위해서는 class에 carousel와 slide 설정한다. -->
						<!-- carousel는 특이하게 id를 설정해야 한다.-->
						<div id="carousel-example-generic" class="carousel slide" style="height:483px;">
							<!-- carousel의 지시자 -->
							<!-- 지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다. -->
							<ol class="carousel-indicators" style="margin-left:20%;">
								<!-- li는 이미지 개수만큼 추가하고 data-target은 carousel id를 가르킨다. -->
								<!-- data-slide-to는 순서대로 0부터 올라가고 0은 active를 설정한다. -->
								<!-- 딱히 이 부분은 옵션별로 설정하게 없다. -->
								<!-- 첫번째 사진 -->
								<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
								<!-- 두번째 사진 -->
								<c:if test="${not empty trainerBoard.tbPhoto2}">
									<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								</c:if>
								<!-- 세번째 사진 -->
								<c:if test="${not empty trainerBoard.tbPhoto3}">
									<li data-target="#carousel-example-generic" data-slide-to="2"></li>
								</c:if>
							</ol>
							<!-- 실제 이미지 아이템 -->
							<!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->
							<div class="carousel-inner" role="listbox" style="height:483px;">
								<!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->
								<div class="item active">
									<!-- 이미지 설정- -->
									<img src="/resources/imgUpload/${trainerBoard.tbPhoto1}" style="width: 100%; height:483px; text-align:center;">
									<!-- 캡션 설정 (생략 가능) -->
									<!-- 글자 색은 검은색 -->
									<div class="carousel-caption" style="color: black;"></div>
								</div>
								<c:if test="${not empty trainerBoard.tbPhoto2}">
									<div class="item">
										<img src="/resources/imgUpload/${trainerBoard.tbPhoto2}" style="max-width: 100%; height:483px; text-align:center;">
										<div class="carousel-caption" style="color: black;">
										</div>
									</div>
								</c:if>
								<c:if test="${not empty trainerBoard.tbPhoto3}">
									<div class="item">
										<img src="/resources/imgUpload/${trainerBoard.tbPhoto3}" style="max-width: 100%; height:483px;s text-align:center;">
										<div class="carousel-caption" style="color: black;">
										</div>
									</div>
								</c:if>
								
							</div>
							<!-- 왼쪽 화살표 버튼 -->
							<!-- href는 carousel의 id를 가르킨다. -->
							<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> 
								<!-- 왼쪽 화살표 --> 
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							</a>
							<!-- 오른쪽 화살표 버튼 -->
							<!-- href는 carousel의 id를 가르킨다. -->
							<a class="right carousel-control"
								href="#carousel-example-generic" role="button" data-slide="next">
								<!-- 오른쪽 화살표 --> 
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							</a>
						</div>
					</div>
					<!-- test end -->
					
					<br>
				<div class="post-details" style="boarder-radius:4px;" >
					<h2 style="font-weight: bold; ">${trainerBoard.tbTitle}</h2>
					<br><br>
							<div class="detail-inner">
								<h3> 🏋🏼‍♂️트레이너 소개 </h3>
									<pre style="border:none;font-size:17px;font-family: 'Roboto', sans-serif; background-color:#F8F8FF; ">${trainerBoard.tbContent}</pre>
									<hr>
									<br>
								<h3>📍 프로그램 소개</h3>
									<pre style="border:none; font-size:17px; font-family: 'Roboto', sans-serif; background-color:#F8F8FF; ">${trainerBoard.tbProgram}</pre>
							</div>
						</div>
				</div>
				
				

				<aside class="col-lg-4 col-md-12 col-12">
					<div class="sidebar">

						<!--/ End Single Widget -->
						<!-- Single Widget -->
						<div class="widget popular-feeds" style=" height:483px; position:relative; top: 90px; margin-bottom:0px;
						">
							<div class="tr_image" style="position: relative; left: 10px;">
								<img src="${trainerBoard.image}" alt="#" style="object-fit: cover; object-position: center center; border-radius: 50%; width: 150px; height: 150px; position: relative; left: 85px">
							</div>
							<div>
								<br>
								<p style="font-size: 23px; font-weight: bold; text-align: center; color:#323232">
									<span>${trainerBoard.name}</span> 트레이너
								</p>
								<ul style="text-align: center; font-size: 16px; margin: 10px;">
									<li><strong style="color: #3c3c3c;">월요일 ~ 토요일 </strong><br>${trainerBoard.dayTimes}
										<strong>~</strong> ${trainerBoard.dayTimef}</li>
									<!-- <li>월요일~토요일 10:00 ~20:50</li> -->
									<li><strong style="color: #3c3c3c;">일요일</strong> <br>${trainerBoard.sunTimes}
										<span>~</span> ${trainerBoard.sunTimef}</li>
								</ul>
								
									<c:choose>
										<c:when test="${trainerBoard.memberId ne memberId }">
											<div class="button" data-wow-delay="1s" style="position: relative; text-align:center; ">
												<button id="showMsgContent" data-toggle="modal"  data-target="#messageModal" type="button" class="btn msg_send_btn_profile" onclick="showMessageContent('${trainerBoard.memberId}');" style="background-color: #5c6dbd; width: 310px; text-align:center; border-radius:5px;">
													트레이너에게 문의하기</button>
											</div>
										 </c:when>
							
										<c:when test="${trainerBoard.memberId eq memberId }">
							
											<div class="button" style="text-align:center;">
				                                <a href="/trainer/tbUpdate.do?tno=${trainerBoard.tno}" class="btn" style="margin-top:5px; border-radius:5px;"> 수정 </a>
				                                &nbsp;&nbsp;&nbsp;
				                          
				                                <a href="/trainer/deleteBoard.do?tno=${trainerBoard.tno}" class="btn" style="margin-top:5px; border-radius:5px;">삭제</a>
											</div>
									</c:when>
							</c:choose>
							</div>	
						</div>
						<!--/ End Single Widget -->

						<!--/ End Single Widget -->
						<!-- 해시태그 -->
						<div class="widget popular-tag-widget" style=" height:280px; padding-top:30px; margin-top:110px; ">
							<div class="tags" style="font-size: 17px; color: black; border-radius: 20px;">
								<p style="font-weight: bold;">활동 지역</p>
								<!-- 만약 입력값이 없으면 해시태그가 없게 , 있으면 생성되게  -->
								<c:if test="${not empty trainerBoard.tbActivTag1}">
									<a href="" style="border-radius: 20px;">${trainerBoard.tbActivTag1}</a>
								</c:if>
								<c:if test="${not empty trainerBoard.tbActivTag2}">
									<a href="" style="border-radius: 20px;">${trainerBoard.tbActivTag2}</a>
								</c:if>
								<c:if test="${not empty trainerBoard.tbActivTag3}">
									<a href="" style="border-radius: 20px;">${trainerBoard.tbActivTag3}</a>
								</c:if>
						

								<p style="font-weight: bold;">활동 범위</p>
								<!-- 만약 입력값이 없으면 활동범위 입력된 값이 없으면 안보이게 , 있으면 생성되게  -->
								<c:if test="${not empty trainerBoard.tbActivChk1}">
									<a href="" style="border-radius: 20px;">${trainerBoard.tbActivChk1}</a>
								</c:if>
								<c:if test="${not empty trainerBoard.tbActivChk2}">
								<a href="" style="border-radius: 20px;">${trainerBoard.tbActivChk2}</a>
								</c:if>
								<c:if test="${not empty trainerBoard.tbActivChk3}">
								<a href="" style="border-radius: 20px;">${trainerBoard.tbActivChk3}</a>
								</c:if>
								

							</div>

						</div>
						<!--/ End Single Widget -->
					</div>
				</aside>
				</div>
			</div> <!-- row -->
		</div><!-- container -->
	</section>
	
	<!-- 메세지 보내기 모달창 -->
	<!-- Modal -->
	<div class="modal fade" id="messageModal" tabindex="-1"
		aria-labelledby="messageModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<span id="m_writer_profile">
						<div class="message-box">
							<!-- 상대방 프로필 -->
							<c:if test="${trainerBoard.image ne null}">							
								<img src="${trainerBoard.image }" alt="상대방 프로필"
									class="avatar img_circle img-profile" alt="avatar">
							</c:if>
							<c:if test="${trainerBoard.image eq null}">
								<img src="/resources/assets/images/mypage/basicImg.png" alt="기본프로필"
									class="avatar img_circle img-profile" alt="avatar">
							</c:if>
						</div>
					</span>
					<h5 class="modal-title" id="messageModalLabel">&nbsp;
						${trainerBoard.name}</h5>
					<button type="button" class="btn btn-close" data-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body ">
					<!-- 메세지 내용 영역 -->
					<div class="mesgs col-12">
						<!-- 메세지 내용 목록 -->
						<div class="msg_history" name="contentList">
							<!-- 메세지 내용이 올 자리 -->
						</div>
						<div class="send_message"></div>
						<!-- 메세지 입력란이 올자리 -->
						<div class='type_msg'>
							<div class='input_msg_write row'>
								<div class='col-11'>
									<input type='text' name="" class='write_msg form-control'
										placeholder='메세지를 입력해주세요' />
								</div>
								<div class='col-1'>
									<button class='msg_send_btn' type='button'
										onclick="sendMessage('${trainerBoard.memberId}', '${memberId}');">
										<i class='fa fa-paper-plane-o' aria-hidden='true'></i>
									</button>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	
	

	<!-- Start Footer Area -->
	<footer class="footer style2">
		<!-- Start Footer Bottom -->
		<div class="footer-bottom">
			<div class="container">
				<div class="inner">
					<div class="row">
						<div class="col-md-6" style="text-align: start;">
							<div class="logo">
								<br> <br> <a href="index.html">
								<img src="/resources/assets/images/logo/로고1.png" alt="Logo"></a>
							</div>
						</div>
						<div class="col-md-6" style="text-align: end;">
							<p>
								<br> <a href="/user/faq.do"> 자주묻는 질문</a> <br> 서울특별시 서초구
								강남대로 459 (서초동, 백암빌딩) 403호<br> (주) 빌려줘홈짐 | 문의 02-123-1234 |
								사업자등록번호 123-12-12345 <br>© 2021. All Rights Reserved.
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
	<!--========================= 캐러셀 ================================ -->
	<!-- Bootstrap cdn 설정 -->
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	
	<script>
		//첨부파일  캐러셓
		(function() {
			
			// 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
			$('#carousel-example-generic').carousel({
				// 슬리아딩 자동 순환 지연 시간
				// false면 자동 순환하지 않는다.
				interval : 2000,
				// hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
				pause : "hover",
				// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
				wrap : true,
				// 키보드 이벤트 설정 여부(?)
				keyboard : true
			});
	
		})();
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			// 트레이너에게 문의하기 버튼 클릭시 모달창 보이기
			$("#showMsgContent").on("click", function(e){
				
				$("#messageModal").modal("show");
				console.log("showMessageContent보여주기");
				// getInfiniteChat();
				
			});
			
			// 1:1 문의할 때, 엔터로 메세지 보내기
			$('.write_msg').keydown(function(e){
				if(e.keyCode == 13){
					e.preventDefault();
					$('.msg_send_btn').trigger('click');
				} 
			});
			
			// x버튼 누르면 동작
			$(".btn-close").on("click", function(e){
				$("#messageModal").modal("hide");				
			});
		})
		
		// 1:1문의할 떄, 메세지 내역 가져오는 함수
		const showMessageContent = function(otherId){
			$.ajax({
				url:"/message/msgContentByAsking.do",
				method:"GET",
				data:{
					otherId : otherId,
					curId : '${memberId}'
				},
				success : function(data){
					console.log("1:1문의하기에서 메세지 내용 가져오기 성공 data : "+data);
					
					// 메세지 내용을 html에 넣기
					$('.msg_history').html(data);
					
					// 이 함수로 메세지 내용 가져온 후, 스크롤을 맨아래로
					$('.msg_history').scrollTop($('.msg_history')[0].scrollHeight); 
				},
				error: function(){
					alert('showMessageContent(${board.memberId}); 에러');
				}
			});
			console.log("showMessageContent() msgRoomNo : "+msgRoomNo);
			// 해당 채팅방의 메세지 내용을 읽었음으로 읽음처리 
			$('.unread' + msgRoomNo).empty();
			
			
		};
		
		// 1:1문의할 떄, 메세지 전송하기
		const sendMessage = function(otherId, curId){
			console.log("sendMessage otehrId : "+otherId);
			let msgContent = $('.write_msg').val();
			console.log(msgContent);
			
			msgContent = msgContent.trim();
			
			if(msgContent ==""){
				alert('메세지를 입력해주세요');
			} else {
				$.ajax({
					url : "/message/msgSendByAsking.do",
					method:"GET",
					data:{
						otherId : otherId,
						curId, curId,
						msgContent : msgContent
					},
					success:function(data){
						console.log('메세지 전송 성공');
						
						
						// 메세지 입력칸 비우기
						$('.write_msg').val("");
						
						
						// 메세지 내용 리로드
						showMessageContent(otherId);
					},
					error: function(){
						alert('sendMessage() 에러');
					}
				});
			}
		};
		
		function getInfiniteChat(){
			interval = setInterval(function(){
				showMessageContent('${trainerBoard.memberId}');
			}, 3000);
		}
	</script>


</body>

</html>