<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String memberId = request.getParameter("memberId");
session.setAttribute("memberId", memberId);
%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- -->
<link rel="stylesheet" href="/resources/ad_assets/css/message.css">
<!--부트스트랩 설정-->

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	type="text/css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link
	href="/resources/ad_assets/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a0fcc69da7.js"
	crossorigin="anonymous"></script>

<!-- ========================= CSS here ========================= -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/assets/css/LineIcons.2.0.css" />
<link rel="stylesheet" href="/resources/assets/css/animate.css" />
<link rel="stylesheet" href="/resources/assets/css/tiny-slider.css" />
<link rel="stylesheet" href="/resources/assets/css/glightbox.min.css" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />

<!-- bootstrap, jquery modal창 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<!-- 웹소켓 -->
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<style>
.envelope-icon {
	font-size: 25px;
}

.badge-red {
	position: absolute;
	bottom: 24px;
	right: -16px;
	font-size: .45em;
}
</style>
<script type="text/javascript">
	// 안읽은 메세지 카운트 가져오기
	function getUnread(){
		$.ajax({
				type:"POST",
				async:"true",
				dataType:"text",
				data:{
					memberId : '${memberId}' // data로 넘겨주기
				},
				url: "${contextPath}/message/getNewNoticeCnt.do",
				success:function(result){
					// 안읽은게 1개 이상이면
					if(result >= 1){
						// 화면에 출력
						showUnread(result); 
					} else {
						showUnread('');
					}
				}
			})
	}
	
	// 서버에서 일정주기마다 읽지 않은 메세지 갯수 가져옴 
	function getInfiniteUnread(){
		setInterval(function(){
			getUnread();
		}, 4000); // 3초마다 요청
	}
	
	// 안읽은 메세지 갯수 출력
	function showUnread(result){
		$('#newNoticeCnt').text(result);
	}
	
	// 메세지아이콘 클릭 - 대화창popup(list, content함께)
	function openMsgPopup(){
		var popupOpener;
		let memberId = '${memberId}';
		// 팝업창 열릴 때 이벤트
		popupOpener = window.open("${contextPath}/message/msgMain.do?memberId="+memberId, "popupOpener", "fullscreen=yes, scrollbars=no, left=160, top=100, width=1150,height=600");
		
	}
	
	// 웹소켓 연결
	var socket = null;
	
	$(document).ready(function() {
		// navbar의 안읽은 메세지 가져오기
		getInfiniteUnread();
		
		getNewNoticeCnt();
		// 웹소켓 연결
		/* sock = new SockJS("<c:url value="/notice-ws"/>");
		socket = sock;

		// 데이터 전달 받았을 때
		sock.onmessage = onMessage; // toast생성 */
		
		
	
	});
	
	// 실시간 알림 받았을 시
	function onMessage(evt) {
		var data = evt.data;

		// toast
		let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
		toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
		toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
		toast += "<span aria-hidden='true'>&times;</span></button>";
		toast += "</div> <div class='toast-body'>" + data + "</div></div>";
		/* let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
		toast +=		"<div class='toast-header'>";
		toast +=			"<i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
		toast +=			"<small class='text-muted'>just now</small>";
		toast +=			"<button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
		toast +=				"<span aria-hidden='true'>&times;</span>";
		toast += 			"</button>";
		toast += 		"</div>"; 
		toast += 	"	<div class='toast-body'>" + data + "</div>";
		toast += 	"</div>"; */

		$("#msgStack").append(toast); //msgStack에 div에 생성한 toast추가
		$(".toast").toast({
			"animation" : true,
			"autohide" : false
		});
		$('.toast').toast('show');
		// 알림 카운트 추가
		//$("#msgCntAll").text($("#msgCntAll").text() * 1 + 1);
	}
	
	
	
</script>
</head>

<body>

	<!-- 유저페이지의 메세지 Start Header Area -->
	<header class="header style2 navbar-area">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<div class="nav-inner">
						<nav class="navbar navbar-expand-lg">
							<a class="navbar-brand" href="/index.jsp"> <img
								src="/resources/assets/images/logo/로고2.png" alt="logo">
							</a>
							<button class="navbar-toggler mobile-menu-btn" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="toggler-icon"></span> <span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
							</button>
							<form class="d-flex search-form">
								<input class="form-control me-2" type="search"
									placeholder="동네 이름을 검색해보세요!" aria-label="Search">
								<button class="btn btn-outline-success" type="submit">
									<i class="lni lni-search-alt"></i>
								</button>
							</form>
							<div class="collapse navbar-collapse sub-menu-bar"
								id="navbarSupportedContent">
								<ul id="nav" class="navbar-nav ms-auto">
									<li class="nav-item" style="margin-right: 100px;"><a
										href="/homegym/hg_list.do"><h5>홈짐</h5></a></li>
									<li class="nav-item" style="margin-right: 120px;"><a
										href="/trainer/tr_list.do"><h5>트레이너</h5> </a></li>
									<li><a class="circle-image"
										href="../user/profile.do?memberId=admin"> <img
											src="https://via.placeholder.com/300x300" alt="logo">
									</a></li>
									<li class="nav-item"><a
										href="../user/profile.do?memberId=${memberId }"><h5>${memberId }님</h5>
									</a></li>
									<li id="msgCnt" class="nav-item dropdown no-arrow mx-1">
									<a href="#" onclick="openMsgPopup();"> 
									<i class="far fa-envelope envelope-icon"> 
											<!-- 알림받아오기 -->
											<span id="newNoticeCnt"	class="badge badge-danger badge-counter badge-red"></span>
										</i> 

									</a> 

								</ul>
							</div>
							<!-- navbar collapse -->
						</nav>
						<!-- navbar -->
						
					</div>
				</div>
			</div>
			<!-- row -->
		</div>
		<!-- container -->
	</header>
	
	<div id="msgStack"></div>
	<!-- End Header Area -->
	<!-- ========================= JS here ========================= -->
	<script src="/assets/js/bootstrap.min.js"></script>
	<script src="/assets/js/count-up.min.js"></script>
	<script src="/assets/js/wow.min.js"></script>
	<script src="/assets/js/tiny-slider.js"></script>
	<script src="/assets/js/glightbox.min.js"></script>
	<script src="/assets/js/main.js"></script>
</body>
</html>