<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String memberId = request.getParameter("memberId");
session.setAttribute("memberId", memberId); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- -->
<link rel="stylesheet"
	href="/resources/ad_assets/css/message.css">
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

<!-- Custom styles for this template-->
<link href="/resources/ad_assets/css/sb-admin-2.min.css"
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
<style>
	.envelope-icon{
		font-size:25px;
	}
	.badge-red{
	    position: absolute;
	    bottom: 24px;
	    right: -16px;
	    font-size: .45em;
	}
</style>
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
									<li class="nav-item">
										<a href="../user/profile.do?memberId=${memberId }"><h5>${memberId }님</h5>
										</a>
									</li>
									<li class="nav-item dropdown no-arrow mx-1">
									<a href="../message/msgMain.do?memberId=${memberId }">
									<i class="far fa-envelope envelope-icon">
										<span id = "msgCntAll" class="badge badge-danger badge-counter badge-red">${msgCnt}</span>
									</i> <!-- Counter - Alerts -->
											
									</a>
									<!-- 메세지 -->
									<%-- <a
										class="nav-link dropdown-toggle"
										href="../message/msgMain.do?memberId=${memberId}" id="alertsDropdown"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> 
											<i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
											<span class="badge badge-danger badge-counter">5+</span>
									</a> <!-- Dropdown - Alerts --> --%></li>

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
	<!-- End Header Area -->
	<!-- ========================= JS here ========================= -->
	<script src="/assets/js/bootstrap.min.js"></script>
	<script src="/assets/js/count-up.min.js"></script>
	<script src="/assets/js/wow.min.js"></script>
	<script src="/assets/js/tiny-slider.js"></script>
	<script src="/assets/js/glightbox.min.js"></script>
	<script src="/assets/js/main.js"></script>
	
	<!-- 메세지 갯수 업데이트 -->
	<script type="text/javascript">
	
	var wsUri = "ws://localhost:8090/msgCntAll";
	
	function send_message(){
		websocket = new WebSocket(wsUri);
		websocket.onopen = function(evt){
			onOpen(evt);
		};
		
		websocket.onmessage = function(evt){
			onMessage(evt);
		};
		
		websocket.onerror = function(evt){
			onError(evt);'
		};
	}
	
	function onOpen(evt){
		websocket.send("${memberId}");
	}
	
	function onMessage(evt){
		$('#msgCntAll').append(evt.data)
	}
	
	function onError(evt){
		
	}
	
		$(document).reday(function(){
			send_message();
		})
	</script>
</body>
</html>