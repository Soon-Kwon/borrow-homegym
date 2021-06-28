<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>

<html class="no-js" lang="zxx">

<head>
	<meta charset="utf-8" />
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>빌려줘! 홈짐</title>
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

	<!--========================= 캐러셀 ================================ -->
	<link rel="stylesheet" href="/resources/assets/css/carousel.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!-- ======================== 달력 ================================== -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://kit.fontawesome.com/a0fcc69da7.js" crossorigin="anonymous"></script>
	
	<!-- =========================리뷰 처리 js============================ -->
	<script src="/resources/assets/js/review.js"></script>
	
	<style>
		p {
			font-size: 17px;
			line-height: 1.6;
			letter-spacing: -0.6px;
			margin: 16px 0;
			word-break: break-all;
		}

		.popular-feed-loop {
			width: 150px;
			height: 150px;
			border-radius: 70%;
			overflow: hidden
		}

		.trainner {
			width: 100%;
			height: 100%;
			object-fit: cover;
		}

		#re_plus {
			background-color: #9ea9d8;
			width: 150px;
			height: 50px;
			font-size: 20px;
			color: white;
			font-weight: bold;
			position: relative;
			left: 300px;
			top: 20px;
		}

		.sidebar {
			position: sticky;
			top: 30px;
		}

		.btn-time {
			border-radius: 2rem;
			background-color: #9ea9d8;
			margin: 10px 0px;
		}
		
		.image-container{
			text-align: center;
		}
		
		.ic-child{
			width: 100%;
			padding-bottom: 20px;
			text-align: center;
		}
		
		.icon-tag{
			text-align: center;
			background-color: ffffff;
			color: black;
		}
		
		.icon-tag .fas{
			font-size: 40px;
		}
		
		#manipulateBtn{
			text-align: right;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function () {

			// 첨부파일 데이터를 가져오는 즉시실행함수
			(function(){
			
				var hId = '<c:out value="${board.HId}"/>';
			
				$.getJSON("/homegym/getAttachList.do", {hId: hId}, function(arr){
					
					console.log(arr);

					var str ="";
					
					$(arr).each(function(i, attach){
						
						var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid
								+ "_" + attach.fileName);
						
				
							str += "<div class='ic-child'><img style='width:100%;' src='/display.do?fileName=" + fileCallPath  
								+ "'></div>";   
							
					});					
						$(".image-container").html(str);
				});
				
			})();			
			
			// 해쉬태그 분리 
			var hashtag = '<c:out value='${board.HHashtag}'/>';
			var afterSplit = hashtag.split(', ');
			
			str = "";
			
			for(var i = 0 ; i < afterSplit.length ; i++){
				switch(afterSplit[i]){
				case "주차가능":
				$(".icon-tag").append('<div class="col-lg-2 col-2"><i class="fas fa-parking"></i><br>주차가능</div>');
				break;
				case "와이파이가능":
				$(".icon-tag").append('<div class="col-lg-2 col-2"><i class="fas fa-wifi"></i><br>와이파이</div>');
				break;
				case "정수기보유":
				$(".icon-tag").append('<div class="col-lg-2 col-2"><i class="fas fa-tint"></i><br>정수기</div>');
				break;
				case "에어컨보유":
				$(".icon-tag").append('<div class="col-lg-2 col-2"><i class="fas fa-fan"></i><br>에어컨</div>');
				break;
				case "샤워가능":
				$(".icon-tag").append('<div class="col-lg-2 col-2"><i class="fas fa-shower"></i><br>샤워</div>');	
				break;
				default:
				
				}
			}	
			
			// 리뷰 목록 가져오기
			
			var hIdValue = '<c:out value="${board.HId}"/>';
			var memberId = '<c:out value="${board.memberId}"/>';
			var borrowerId = "임시: 로그인 된 유저";
			var reviewUL = $(".comments-list");
			
			showList(1);
			
			function showList(page){
				
				reviewService.getList({hId: hIdValue, page: page || 1}, function(list){
					
					var str = '';
					
					if(list == null || list.length ==0){
						reviewUL.html("<div class='comment-desc'><div class ='desc-top'>" + 
								"<p>아직 등록된 리뷰가 없습니다!</p></div></div>")
						return;
					}
					
					for(var i = 0, len = list.length || 0; i < len; i++){
						str += "<li><div class='comment-img><img src='https://via.placeholder.com/100x100'"
						+ "alt='img' style='width: 100px;'></div>";
						str += "<div class='comment-desc'><div class='desc-top'><h5>" + list[i].borrowerId + "</h5>";
						if(list[i].hrScore == 1) {str += "<span>⭐️</span>";
						}else if(list[i].hrScore == 2){str += "<span>⭐⭐</span>";
						}else if(list[i].hrScore == 3){str += "<span>⭐️⭐⭐</span>";
						}else if(list[i].hrScore == 4){str += "<span>⭐️⭐⭐⭐</span>";
						}else if(list[i].hrScore == 5){str += "<span>⭐️⭐⭐⭐⭐</span>";}

						str += "<span class='date'>" + reviewService.displayTime(list[i].hrUpdatedate) + "</span>";
						str += "<a class='reply-link' data-reviewid='" + list[i].reviewId + "'><i class='lni lni-reply'></i>수정하기</a>";
						str += "</div><p>" + list[i].hrContent + "</p></div></li>";
					}
					
					reviewUL.html(str);
				});
			}
			
			// 모달창 제어
			var modal = $(".modal")
			var modalInputReview = modal.find("input[name='hrContent']");
			var modalInputReviewer = modal.find("input[name='memberId']");
		//  var modalInputScore = $("input[name='hrScore']:checked");
		// 이렇게하면 undefined 오류가 생기는데 modalInputScore 변수의 값은
		// 라디오버튼 값이 체크가 되어있지 않을 때 체크된 값이있는 input 태그를 탐색한다. 
		// 때문에 undefined가 된다.
			
			var modalModBtn = $("#modalModBtn");
			var modalRemoveBtn = $("#modalRemoveBtn");
			var modalRegisterBtn = $("#modalRegisterBtn");
			
			// 리뷰쓰기 버튼 누르면 동작
			$("#addReviewBtn").on("click", function(e){
				
				//modal.find("input").val("");
				modal.find("button[id != 'modalCloseBtn']").hide();
				
				modalRegisterBtn.show();
				
				$(".modal").modal("show");
			});
			
			// 닫기 버튼 누르면 동작
			$("#modalCloseBtn").on("click", function(e){
				$(".modal").modal("hide");				
			});
			
			// 등록 버튼 누르면 동작
			modalRegisterBtn.on("click", function(e){
				var review ={
						hrContent: modalInputReview.val(),
						hrScore: $("input[name='hrScore']:checked").val(),
						hid: hIdValue,
						memberId: memberId,
						borrowerId: borrowerId
				};
			
				reviewService.add(review, function(result){
					
					alert("리뷰가 등록되었습니다");
					
					// input의 값들을 모두 지운다.
					//modal.find("input").val(""); 
					modal.modal("hide");
					
					showList(1); // 새로 등록된 리뷰들을 불러낸다.
				});
			});
			
			// 댓글 수정 이벤트 처리
			$(".comments-list").on("click", ".reply-link", function(e){
				
				var reviewId = $(this).data("reviewid");
				
				reviewService.get(reviewId, function(review){
					
					//현재 .do로 호출하기 때문에 값을 못불러오는듯 하다. 
					//그래서 컨트롤러의 produces 값에서 xml을 빼고 json만 쓰니까 된다. 
					modalInputReview.val(review.hrContent);
					modalInputReviewer.val(review.borrowerId);
					modal.data("reviewid", review.reviewId);
					
					modal.find("button[id != 'modalCloseBtn']").hide();
					modalModBtn.show();
					modalRemoveBtn.show();
					
					$(".modal").modal("show");
				});
			});
			
			// 댓글 수정 
			modalModBtn.on("click", function(e){
				
				var review = {reviewId: modal.data("reviewid")
							, hrContent: modalInputReview.val()
							, hrScore: $("input[name='hrScore']:checked").val() };
				
				reviewService.update(review, function(result){
					
					alert("수정되었습니다");
					modal.modal("hide");
					showList(1);
				});
			});
			
			// 댓글 삭제
			modalRemoveBtn.on("click", function(e){
				
				var reviewId = modal.data("reviewid");
				
				reviewService.remove(reviewId, function(result){
					
					alert("삭제되었습니다");
					modal.modal("hide");
					showList(1);
				});
			});
		});
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
				<span></span> <span></span>
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
								<img src="/resources/assets/images/logo/로고2.png" alt="logo">
							</a>
							<button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
								aria-expanded="false" aria-label="Toggle navigation">
								<span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
							</button>
							<form class="d-flex search-form">
								<input class="form-control me-2" type="search" placeholder="동네 이름을 검색해보세요!"
									aria-label="Search">
								<button class="btn btn-outline-success" type="submit"><i
										class="lni lni-search-alt"></i></button>
							</form>
							<div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
								<ul id="nav" class="navbar-nav ms-auto">
									<li class="nav-item" style="margin-right: 100px;"><a href="/homegym/homegymListView.do?pageNum=${cri.pageNum }&amount=${cri.amount}&keyword=">
											<h5>홈짐</h5>
										</a></li>
									<li class="nav-item" style="margin-right: 120px;"><a href="community.html">
											<h5>커뮤니티</h5>
										</a></li>
									<a class="circle-image" href="mypage_main.html">
										<img src="https://via.placeholder.com/300x300" alt="logo">
									</a>
									<li class="nav-item"><a href="mypage_main.html">
											<h5>아이유님</h5>
										</a></li>

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
					<div class="single-inner">
						<div class="image-container">
						
						</div>
							<div class="detail-inner">
								<!-- post meta -->
								<h2 class="post-title">
									<p style="font-size: 25px;">${board.HTitle }</p>
								</h2>
								<p>${board.HContent }</p>
								<br>
								<h5> 이용 가능한 시설들</h5>
								<br>
								
								<div class="icon-tag row">
									
								</div>
								<br><br>

								<!-- <h3>
									<span></span> 
									<span></span> 
									<span><i class="fas fa-tint"></i>정수기</span>
									<span></span>
									<span></span>
								</h3> -->
								<h5> ${board.MId}님의 홈짐 위치</h5>
								<br>
								
								<!-- 홈짐 위치 나오는 div -->
								<div id="map" style="width: 100%; height: 450px;"></div>
								<br>
								<!-- 집주인일 경우 나오는 수정/삭제버튼 
								목록으로 돌아갈 때나 글을 수정할 때 유저가 게시물을 클릭할 당시의 페이지 번호를 기억해서 그 곳으로 다시 돌아간다. -->
								<div id="manipulateBtn">
									<input type="button" value="수정 및 삭제하기" onclick="location.href='/homegym/homegymModifyView.do?hId=${board.HId }'"
									class="btn btn-time">
									<input type="button" value="목록으로 돌아가기" onclick="location.href='/homegym/homegymListView.do${cri.getListLink() }'"
									class="btn btn-time">
								</div>	
								
								<!-- 리뷰 -->
								<div class="post-comments">
									
									<div class="row">
										<div class="col-8">
										<h2>리뷰 💌</h2>										
										</div>
										<div class="col-4" style="text-align: right;">
										<button class="btn btn-time" id="addReviewBtn">리뷰쓰기</button>
										</div>
									</div>
									<hr>
									<br>
									<ul class="comments-list">
								<!-- 	<li>
											<div class="comment-img">
												<img src="https://via.placeholder.com/100x100" alt="img"
													style="width: 100px;">
											</div>
											<div class="comment-desc">
												<div class="desc-top">
													<h6>혜선짱</h6>
													<span class="date">2021/05/25</span> <a href="javascript:void(0)"
														class="reply-link"><i class="lni lni-reply"></i>답글 달기</a>
												</div>
												<p>깨끗하고 좋아요</p>
											</div>
										</li>
										<li class="children">
											<div class="comment-img">
												<img class="trainner" src="https://via.placeholder.com/100x100"
													width="100px" alt="img">
											</div>
											<div class="comment-desc">
												<div class="desc-top">
													<h6>
														권지용<span class="saved"><i class="lni lni-bookmark"></i></span>
													</h6>
													<span class="date">15th May 2023</span> <a href="javascript:void(0)"
														class="reply-link"><i class="lni lni-reply"></i>Reply</a>
												</div>
												<p>감사합니다 ! 다음에도 방문해주세요.</p>
											</div>
										</li> -->
									</ul>
								</div>								
							</div>
							<button type="button" class="btn btn-outline-info" id="re_plus">더보기</button>
						</div>
				</div>
				<aside class="col-lg-4 col-md-12 col-12">
					<div class="sidebar" id="sidebar">
						<!-- Single Widget -->
						<div class="widget popular-feeds" style="position: relative; top: 30px;">
							<div class="info">
								<h4 class="date">
									<i class="lni lni-apartment"></i> ${board.MId }님의 홈짐
								</h4>
								<br>
								<h6 class="title">${board.HAddr}에 위치한 김하우스입니다</h6>
								<br>
							</div>
								<h6>1시간당 가격</h6>
								<br>
								<div style="text-align: right; color: black;">${board.HPrice } 원</div>
								<br>
								<div class="row">
								<input type="button" value="지금 예약하러 가기" onclick="location.href='/homegym/reservationView.do'"
									class="btn btn-time">
								<br /> <br />
									<input type="button" value="집주인에게 문의하기" class="btn btn-time">
								</div>
						</div>
						<!--/ End Single Widget -->
					</div>
				</aside>
			</div>
		</div>
	</section>
	<!-- End Blog Singel Area -->

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">리뷰 등록</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>리뷰내용</label> <input class="form-control" name="hrContent"
							value="" placeholder="리뷰를 남겨주세요">
					</div>
					<div class="form-group">
						<label>작성자</label> <input class="form-control" name="memberId"
							value="임시: 로그인한 유저" placeholder="임시: 로그인한 유저" readonly>
					</div>
						<label>평점주기</label>
						<div>
						<input type="radio" name="hrScore" value="1"> ⭐️
						<input type="radio" name="hrScore" value="2"> ⭐⭐
						<input type="radio" name="hrScore" value="3"> ⭐⭐⭐
						<input type="radio" name="hrScore" value="4"> ⭐⭐⭐⭐									
						<input type="radio" name="hrScore" value="5"> ⭐⭐⭐⭐⭐
						</div>		
					<div class="modal-footer">
						<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
						<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
						<button id='modalRegisterBtn' type="button"
							class="btn btn-default" data-dismiss="modal">등록</button>
						<button id='modalCloseBtn' type="button" class="btn btn-default"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</div>
	<!-- /.modal -->

		<!-- Start Footer Area -->
		<footer class="footer style2">
			<!-- Start Footer Bottom -->
			<div class="footer-bottom">
				<div class="container">
					<div class="inner">
						<div class="row">
							<div class="col-md-6" style="text-align: start;">
								<div class="logo">
									<br>
									<br> <a href="main_index.html"><img
										src="/resources/assets/images/logo/로고1.png" alt="Logo"></a>
								</div>
							</div>
							<div class="col-md-6" style="text-align: end;">
								<p>
									<br> <a href="faq.html"> 자주묻는 질문</a> <br> 서울특별시 서초구
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
		<a href="#" class="scroll-top btn-hover"> <i
			class="lni lni-chevron-up"></i>
		</a>

		<!-- ========================= JS here ========================= -->
		<script src="/resources/assets/js/bootstrap.min.js"></script>
		<script src="/resources/assets/js/count-up.min.js"></script>
		<script src="/resources/assets/js/wow.min.js"></script>
		<script src="/resources/assets/js/tiny-slider.js"></script>
		<script src="/resources/assets/js/glightbox.min.js"></script>
		<script src="/resources/assets/js/main.js"></script>
		<!-- ========================= 카카오 지도 ========================= -->

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9acd85a01adaa0b260e4eb08bf997e9"></script>
		<script>
		var container = document.getElementById('map');
		
		var options = {
			center: new kakao.maps.LatLng(${board.HLocateY}, ${board.HLocateX}),
			level: 3
		};
		// 맵 생성
		var map = new kakao.maps.Map(container, options);

		var imageSrc = '/resources/assets/images/logo/logo.png' // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(54, 69), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(${board.HLocateY}, ${board.HLocateX}); // 마커가 표시될 위치입니다
	
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition, 
		    image: markerImage // 마커이미지 설정 
		});
	
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);  
	</script>
		<script>
		
	// 리뷰테스트 코드
		var hIdValue = '<c:out value="${board.HId}"/>';
/* 		
		reviewService.add(
				{memberId: "아메리카노", borrowerId: "라떼", hrScore: 3, 
					hrContent: "깨끗해요", hid: hIdValue}
				, function(result){
					alert("결과: " + result);
				}); */
		
		console.log("리뷰목록 보여주기 테스트");
		// url의 hId와 매핑을 하는 것이기 때문에 hId로 적는다. vo객체랑 매핑시키려면 hid로 적어야한다. 
		reviewService.getList(
				{hId: hIdValue, page:1}, function(list){
					
					for(var i = 0, len = list.length || 0; i < len; i++){
						console.log(list[i]);
					}
				});
		/* reviewService.remove(8,function(count){
			
			console.log(count);
			
			if(count==="success" ){
				alert("제거");
			}
		},
		function(err){
			alert("에러");
		}) */
		
		/* reviewService.update(
				{reviewId: 9, hid: 378, hrContent: "수정하는 내용"}
				, function(result){
					alert("수정완료");
				}); */
		reviewService.get(9, function(data){
			console.log(data);
		})
		
	</script>
</body>

</html>