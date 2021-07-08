<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="memberId"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.memberId}" />
<c:set var="imagePath"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.imagePath}" />

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>빌려줘! 홈짐</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/assets/images/logo/logo.png" />
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
    <link rel="stylesheet" href="/resources/assets/css/homegym.css" />
    <link rel="stylesheet" href="/resources/assets/css/seok.css" />
    <link rel="stylesheet" href="/resources/assets/css/chat.css" />
    
    <!-- ========================JQuery Timepicker =================== -->
    <link rel="stylesheet" href="/resources/assets/css/jquery.timepicker.css" />
    
    <!-- message, 알림 관련 -->
    <script src="/resources/assets/js/message.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/a0fcc69da7.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    
    <script type="text/javascript">
    	var socket = null;
    	
    	// comma
    	function pointToNumFormat(num){
    		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	}
    	
    	$(document).ready(function(){
    		// 웹소켓 연결
    		sock = new SockJS("<c:url value="/notice-ws.do"/>");
    		socket = sock;
    		
    		console.log(sock);
    		
    		// 데이터 전달 받았을 떄
    		sock.onmessage = onMessage; // toast생성
    		
    	});
    	
    	// 실시간 알림 받았을 시
    	function onMessage(evt){
    		var data = evt.data
    		
    		// toast
    		let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
    	    toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
    	    toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
    	    toast += "<span aria-hidden='true'>&times;</span></button>";
    	    toast += "</div> <div class='toast-body'>" + data + "</div></div>";
    	    $("#msgStack").append(toast);
    	    $(".toast").toast({"adnimation":true, "autohide":false});
    	    $(".toast").toast('show');
    	    $("#newNoticeCnt").text($("#newNoticeCnt").text()*1+1);
    	}
    	
    </script>
    
	
</head>
<body>
<script type="text/javascript">

<!-- ========================= CSS here ========================= -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/assets/css/LineIcons.2.0.css" />
<link rel="stylesheet" href="/resources/assets/css/animate.css" />
<link rel="stylesheet" href="/resources/assets/css/tiny-slider.css" />
<link rel="stylesheet" href="/resources/assets/css/glightbox.min.css" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/homegym.css" />
<link rel="stylesheet" href="/resources/assets/css/seok.css" />
<link rel="stylesheet" href="/resources/assets/css/chat.css" />

<!-- message, 알림 관련 -->
<script src="/resources/assets/js/message.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/a0fcc69da7.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script type="text/javascript">
	var socket = null;

	// comma
	function pointToNumFormat(num) {
		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	$(document).ready(function() {
		// 웹소켓 연결
		sock = new SockJS("<c:url value="/notice-ws.do"/>");
		socket = sock;

		console.log(sock);

		// 데이터 전달 받았을 떄
		sock.onmessage = onMessage; // toast생성

	});

	// 실시간 알림 받았을 시
	function onMessage(evt) {
		var data = evt.data

		// toast
		let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
		toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
		toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
		toast += "<span aria-hidden='true'>&times;</span></button>";
		toast += "</div> <div class='toast-body'>" + data + "</div></div>";
		$("#msgStack").append(toast);
		$(".toast").toast({
			"adnimation" : true,
			"autohide" : false
		});
		$(".toast").toast('show');
		$("#newNoticeCnt").text($("#newNoticeCnt").text() * 1 + 1);
	}
</script>


</head>
<body>
	<script type="text/javascript">
		/*
		// 안읽은 메세지 카운트 가져오기
		/* function getUnread(){
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$.ajax({
					type:"POST",
					async:"true",
					dataType:"text",
					data:{
						memberId : '${memberId}' // data로 넘겨주기
					},
					url: "${contextPath}/message/getNewNoticeCnt.do",
					/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		/*beforeSend : function(xhr){

			xhr.setRequestHeader(header, token);
		},
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
		} */

		// 서버에서 일정주기마다 읽지 않은 메세지 갯수 가져옴 
		/* function getInfiniteUnread(){
			setInterval(function(){
				getUnread();
			}, 4000); // 4초마다 요청
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
		
		$(document).ready(function() {
			// navbar의 안읽은 메세지 가져오기
			getInfiniteUnread();

		}); */
	</script>

	<!-- Start Header Area -->
	<header class="header style2 navbar-area" style="height:100px;">
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
							<form class="d-flex search-form"
								action="/homegym/homegymListView.do" method="get">
								<input class="form-control me-2" type="search" name="keyword"
									placeholder="동네 이름을 검색해보세요!" aria-label="Search">
								<button id="search-hg" class="btn btn-outline-success"
									type="submit">
									<i class="lni lni-search-alt"></i>
								</button>
							</form>

							<div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
								<ul id="nav" class="navbar-nav ms-auto">

									<sec:authorize access="isAnonymous()">
										<!-- <a class="circle-image" href="user/mp_main.do">
                                    <img src="https://via.placeholder.com/500x500" alt="logo">
                                </a>  -->
										<li class="nav-item"><a
											href='<c:url value="../user/loginpage"/>'
											style="text-size: 50px">로그인</a></li>
										<li class="nav-item"><a>|</a></li>
										<li class="nav-item"><a href="/user/registration.do">회원가입</a></li>

									</sec:authorize>
									<sec:authorize access="hasRole('ROLE_MEMBER')">
										<li class="nav-item" style="margin-right: 100px;"><a
											href="/homegym/homegymListView.do?pageNum=1&amount=4&keyword=">홈짐</a></li>
										<li class="nav-item" style="margin-right: 120px;"><a
											href="/trainer/tbList">트레이너</a></li>

										<c:if test="${empty member.imagePath}">
											<a class="circle-image" href="/user/mypage/profile.do"> <img
												src="${pageContext.request.contextPath }/resources/assets/images/mypage/basicImg.png"
												style="height: 50px; width: 50px;"></a>
										</c:if>
										<c:if test="${not empty member.imagePath}">
											<a class="circle-image" href="/user/mypage/profile.do"> <img
												src="${member.imagePath}" style="height: 50px; width: 50px;"></a>
										</c:if>

										<li class="nav-item"><a
											class="page-scroll dd-menu collapsed"
											href="javascript:void(0)" data-bs-toggle="collapse"
											data-bs-target="#submenu-1-4"
											aria-controls="navbarSupportedContent" aria-expanded="false"
											aria-label="Toggle navigation"><sec:authentication
													property="principal.nickname" var="member_nickName" />${member_nickName }님</a>
											<sec:authentication property="principal.memberId"
												var="member_memberId" /> <sec:authentication
												property="principal.password" var="member_password" /> <sec:authentication
												property="principal.name" var="member_name" /> <sec:authentication
												property="principal.phone" var="member_phone" /> <sec:authentication
												property="principal.zipCode" var="member_zipCode" /> <sec:authentication
												property="principal.address" var="member_address" /> <sec:authentication
												property="principal.image" var="member_image" /> <sec:authentication
												property="principal.birth" var="member_birth" /> <sec:authentication
												property="principal.gender" var="member_gender" /> <sec:authentication
												property="principal.auth" var="member_auth" />

											<ul class="sub-menu collapse" id="submenu-1-4"
												style="width: 150px;">
												<li class="nav-item"><a href="/user/mypage/profile.do"><b>마이페이지</b></a></li>
												<li class="nav-item"><a
													href="/user/mypage/profile_update">&nbsp &nbsp &nbsp 내
														정보 수정</a></li>
												<li class="nav-item"><a
													href="/user/mypage/homegymCheck.do?selectedBtnId=overview-tab">&nbsp
														&nbsp &nbsp 활동 내역</a></li>
												<li class="nav-item"><a href="/user/mypage/mywrite">&nbsp
														&nbsp &nbsp 글 관리</a></li>
												<li class="nav-item"><a href="#"
													onclick="document.getElementById('logout').submit();"><b>로그아웃</b></a></li>
											</ul></li>
										<li class="nav-item"><a href="#"
											onclick="openMsgPopup();"> <i
												class="far fa-envelope envelope-icon"
												style="font-size: 30px;"> <!-- 알림받아오기 --> <span
													id="newNoticeCnt" class="badge bg-danger"
													style="font-size: 13px; position: absolute; bottom: 24px; right: -16px;"></span>
											</i>

										</a></li>
										<form id="logout" action="/logout" method="POST">
											<input name="${_csrf.parameterName}" type="hidden"
												value="${_csrf.token}" />
										</form>
									</sec:authorize>

									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<li class="nav-item" style="margin-right: 100px;"><a
											href="/homegym/homegymListView.do?pageNum=1&amount=4&keyword=">홈짐</a></li>
										<li class="nav-item" style="margin-right: 120px;"><a
											href="/trainer/tbList">트레이너</a></li>
										<a class="circle-image" href="/user/mypage/profile.do"> <img
											src="https://via.placeholder.com/300x300" alt="logo"></a>
										<li class="nav-item"><a
											class="page-scroll dd-menu collapsed"
											href="javascript:void(0)" data-bs-toggle="collapse"
											data-bs-target="#submenu-1-4"
											aria-controls="navbarSupportedContent" aria-expanded="false"
											aria-label="Toggle navigation">관리자님</a>
											<ul class="sub-menu collapse" id="submenu-1-4">
												<li class="nav-item"><a href="/admin/adIndex.do"><b>관리자페이지</b></a></li>
												<li class="nav-item"><a href="/admin/adMembers.do">&nbsp
														&nbsp &nbsp 회원 관리</a></li>
												<li class="nav-item"><a href="/admin/adContents.do">&nbsp
														&nbsp &nbsp 게시글 관리</a></li>
												<li class="nav-item"><a href="/admin/adFacilities.do">&nbsp
														&nbsp &nbsp 홈짐 관리</a></li>
												<li class="nav-item"><a href="/admin/adAlerts.do">&nbsp
														&nbsp &nbsp 문의 관리</a></li>
												<li class="nav-item"><a href="#"
													onclick="document.getElementById('logout').submit();"><b>로그아웃</b></a></li>
											</ul></li>
										<li class="nav-item"><a href="#"
											onclick="openMsgPopup();"> <i
												class="far fa-envelope envelope-icon"
												style="font-size: 30px;"> <!-- 알림받아오기 --> <span
													id="newNoticeCnt" class="badge bg-danger"
													style="font-size: 13px; position: absolute; bottom: 24px; right: -16px;"></span>
											</i>

										</a></li>
										<form id="logout" action="/logout" method="POST">
											<input name="${_csrf.parameterName}" type="hidden"
												value="${_csrf.token}" />
										</form>
									</sec:authorize>
								</ul>
							</div>
						</nav>
						<!-- navbar -->
					</div>
					<!-- navbar inner -->
				</div>
				<!-- navbar collapse -->
			</div>
			<!-- col-lg-12  -->
		</div>
		<!-- row -->
		</div>
		<!-- container -->
	</header>

	<!-- 알림받는 영역 -->
	<div id="msgStack"></div>