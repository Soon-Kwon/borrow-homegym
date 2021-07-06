<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

   <%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- /End Preloader -->
	
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
								<h5> ${board.nickName}님의 홈짐 위치</h5>
								<br>
								
								<!-- 홈짐 위치 나오는 div -->
								<div id="map" style="width: 100%; height: 450px;"></div>
								<br>
								<!-- 집주인일 경우 나오는 수정/삭제버튼 
								목록으로 돌아갈 때나 글을 수정할 때 유저가 게시물을 클릭할 당시의 페이지 번호를 기억해서 그 곳으로 다시 돌아간다. -->
								<%-- <div id="manipulateBtn">
									<input type="button" value="수정 및 삭제하기" onclick="location.href='/homegym/homegymModifyView.do?hId=${board.HId }'"
									class="btn btn-time">
									<input type="button" value="목록으로 돌아가기" onclick="location.href='/homegym/homegymListView.do${cri.getListLink() }'"
									class="btn btn-time">
								</div>	 --%>
								
								<!-- 리뷰 -->
								<div class="post-comments">
									
									<div class="row">
										<div class="col-8">
										<h2>리뷰 <span id="score" style="font-size: 30px;"></span> </h2>	
										</div>
										<div class="col-4" style="text-align: right;">
										<button class="btn btn-time" id="addReviewBtn">리뷰쓰기</button>
										</div>
									</div>
									<hr>
									<br>
									<!-- 댓글 추가 공간 -->
									<ul class="comments-list">
									</ul>
								</div>								
							</div>
							<div style="text-align: center;">
							<button type="button" class="btn btn-outline-info" id="re_plus">더보기</button>
							</div>
						</div>
				</div>
				<aside class="col-lg-4 col-md-12 col-12">
					<div class="sidebar" id="sidebar">
						<!-- Single Widget -->
						<div class="widget popular-feeds" style="position: relative; top: 30px;">
							<div class="info">
								<h4 class="date">
									<i class="lni lni-apartment"></i> ${board.nickName }님의 홈짐
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
								<!-- 집주인일 경우 나오는 수정/삭제버튼 
								목록으로 돌아갈 때나 글을 수정할 때 유저가 게시물을 클릭할 당시의 페이지 번호를 기억해서 그 곳으로 다시 돌아간다. -->
								<c:choose>
									<c:when test="${board.memberId ne memberId }">
										<input type="button" id="reserveBtn" value="지금 예약하러 가기"
										 onclick="location.href='/details/reservationView.do${cri.getListLink()}&hId=${board.HId}'" class="btn">
										<br /> <br />
										
										<button id="showMsgContent" class="btn msg_send_btn_profile" style="margin-top:10px;" onclick="showMessageContent('${board.memberId}');">집주인에게 문의하기</button>
									</c:when>
									<c:when test="${board.memberId eq memberId}">
										<input type="button" id="updateBtn" value="수정 및 삭제하기" onclick="location.href='/homegym/homegymModifyView.do?hId=${board.HId }'"
										class="btn">
									</c:when>
								</c:choose>
								<input type="button" id="listBtn" value="목록으로 돌아가기" onclick="location.href='/homegym/homegymListView.do${cri.getListLink() }'"
										class="btn">
								
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
						<label>리뷰 남기기</label> 
							<textarea class="form-control" name="hrContent" placeholder="다른 유저에게 도움이 될 후기를 남겨주세요">
							</textarea>
					</div>
					<div class="form-group">
						<label>작성자</label> <input class="form-control" name="memberId"
							value="borrowerId" placeholder="<sec:authentication property="principal.nickname" />" readonly>
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
	<!-- 메세지 보내기 모달창 -->
		<!-- Modal -->
		<div class="modal fade" id="messageModal" tabindex="-1"
			aria-labelledby="messageModalLabel" aria-hidden="true">
			<div class="modal-dialog ">
				<div class="modal-content">
					<div class="modal-header">
						<span id="m_writer_profile">
							<div class="message-box">
								<!-- 상대방 프로필 경로잡아주기 -->
								<img src="/resources/assets/images/gym/re3.png" alt="상대방 프로필"
									class="avatar img_circle img-profile" alt="avatar">

							</div>
						</span>
						<h5 class="modal-title" id="messageModalLabel">&nbsp; ${board.nickName}</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
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
										<button class='msg_send_btn' type='button' onclick="sendMessage('${board.memberId}', '${memberId}');">
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
		<!-- '사용 가능한 시설' div에 아이콘 출력을 위한 js -->
		<script src="https://kit.fontawesome.com/a0fcc69da7.js" crossorigin="anonymous"></script>
		<!-- 제이쿼리 -->
		<script src="https://code.jquery.com/jquery-3.6.0.js"
			integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
		<!-- =========================리뷰 처리 js============================ -->
		<script src="/resources/assets/js/review.js"></script>
		
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
			
			// 리뷰평점을 보여주는 즉시 실행함수
			(function(){

				var hId = ${board.HId};
				reviewService.getScore(hId, function(result){
					console.log(result);
					$("#score").text("⭐" + result)
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
			
			// 리뷰 평점 불러오기 
			
			
			
			// 리뷰 목록 가져오기
			
			var hIdValue = '<c:out value="${board.HId}"/>';
			var memberId = '<c:out value="${board.memberId}"/>';
			var borrowerId = '<c:out value="${member_memberId}"/>';
			var reviewUL = $(".comments-list");
		
			var viewMoreReviewBtn = $("#re_plus"); // 더보기 버튼 
			var index = 1; // 더보기 1페이지
			var amount = 3; // 한번에 리뷰를 세개씩 로딩
			
			showList(1); // 리뷰 목록 호출
			
			function showList(page){
				
				// getList로부터 넘어오는 값은 리뷰 갯수(reviewCnt)와 리스트(list)로 데이터가 구성되어있다. 
				reviewService.getList({hId: hIdValue, page: page || 1}, function(reviewCnt, list){
					
					// 댓글 등록, 수정, 삭제시 1페이지를 리로딩하기 위한 함수..
					if(page == 99999){
						reviewUL.empty();
						index = 1;
						showList(1);
						return;
					}
					
					var str = '';
					
					if(list == null || list.length ==0){
						reviewUL.html("<div class='comment-desc'><div class ='desc-top'>" + 
								"<p>아직 등록된 리뷰가 없습니다!</p></div></div>")
						viewMoreReviewBtn.hide(); // 글이 없을시 더보기 버튼 숨기기
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
						// HTML data속성을 이용해 reviewid 값을 자바스크립트에서 쓸 수 있다.  
						str += "<a class='reply-link' data-reviewid='" + list[i].reviewId + "'><i class='lni lni-reply'></i>수정하기</a>";
						str += "</div><p>" + list[i].hrContent + "</p></div></li>";
					}
					
					$(str).appendTo($(".comments-list")).slideDown();
					
					if(reviewCnt <= amount * page){
						viewMoreReviewBtn.hide();
					}else{
						viewMoreReviewBtn.show();
					}
					
				});
			}
			
			// 더보기 버튼 눌렀을 때 작동
	
			viewMoreReviewBtn.on("click", function(e){
				index++
				showList(index);
			});
						
			// 모달창 제어
			var modal = $("#myModal")
			var modalInputReview = modal.find("textarea[name='hrContent']");
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
				
				//기존에 존재하던 값들은 지워준다
				modal.find("input[name != 'hrScore']").val("");
				modal.find("input:radio[name = 'hrScore']").prop('checked', false);
				modal.find("textarea[name ='hrContent']").val("");
				modal.find("button[id != 'modalCloseBtn']").hide();
				
				modalRegisterBtn.show();
				
				$("#myModal").modal("show");
			});
			
			// 닫기 버튼 누르면 동작
			$("#modalCloseBtn").on("click", function(e){
				$("#myModal").modal("hide");				
			});
			
			// 등록 버튼 누르면 동작
			modalRegisterBtn.on("click", function(e){
				var review ={
						hrContent: modalInputReview.val(),
						hrScore: $("input[name='hrScore']:checked").val(),
						hid: hIdValue,
						memberId: memberId,
						borrowerId: "${member_nickName}"
				};
				
				// 평점이 없을시 입력해달라는 요청메시지 보내기
				if(review.hrScore === undefined){
					alert("평점을 입력해주세요!");
					return $("#myModal").modal("show");
				}
				
				// 리뷰 등록하기
				reviewService.add(review, function(result){
					
					
					alert("리뷰가 등록되었습니다");
					
					// input의 값들을 모두 지운다.
					//modal.find("input").val(""); // 리뷰평점도 사라지게 돼서 주석처리 
					modal.modal("hide");
					
					// 리뷰 평점 비동기 업데이트
					var hId = ${board.HId};
					reviewService.getScore(hId, function(result){
						console.log(result);
						$("#score").text("⭐" + result)
					});
	
					showList(99999); // 새로 등록된 리뷰들을 불러낸다.
				});
			});
			
			// 댓글 수정 클릭 이벤트 처리
			$(".comments-list").on("click", ".reply-link", function(e){
				
				var reviewId = $(this).data("reviewid");
				
				reviewService.get(reviewId, function(review){
					
					//현재 .json으로 json데이터를 불러와야하는데
					//.do로 호출하기 때문에 그 값(review.xxx)을 못불러 온다. 
					//그래서 컨트롤러의 produces 값에서 xml을 빼고 json만 쓰면 json데이터만 반환되므로 .do를 사용해도 가능하다. 
					modalInputReview.val(review.hrContent);
					modalInputReviewer.val(review.borrowerId);
					modal.data("reviewid", review.reviewId);
					
					modal.find("button[id != 'modalCloseBtn']").hide();
					modalModBtn.show();
					modalRemoveBtn.show();
					
					$("#myModal").modal("show");
				});
			});
			
			// 댓글 수정 
			modalModBtn.on("click", function(e){
				
				var review = {reviewId: modal.data("reviewid")
							, hrContent: modalInputReview.val()
							, hrScore: $("input[name='hrScore']:checked").val()
							};
				
				if(review.hrScore === undefined){
					alert("평점을 입력해주세요!");
					return $("#myModal").modal("show");
				}
				
				reviewService.update(review, function(result){
					
					
					alert("수정되었습니다");
					
					modal.modal("hide");

					//리뷰 평점 비동기 업데이트
					var hId = ${board.HId};
					reviewService.getScore(hId, function(result){
						console.log(result);
						$("#score").text("⭐" + result)
					});
					
					showList(99999);
				});
			});
			
			// 댓글 삭제
			modalRemoveBtn.on("click", function(e){
				
				var reviewId = modal.data("reviewid");
				
				reviewService.remove(reviewId, function(result){
					
					alert("삭제되었습니다");
					modal.modal("hide");
					showList(99999);
				});
			});
			
			
			// 집주인에게 문의하기
			$("#showMsgContent").on("click", function(e){
				
				$("#messageModal").modal("show");
				console.log("showMessageContent보여주기");
				
				
				
			});
			
			// 1:1 문의할 때, 엔터로 메세지 보내기
			$('.write_msg').keydown(function(e){
				if(e.keyCode == 13){
					e.preventDefault();
					$('.msg_send_btn').trigger('click');
				} 
			});
			
			// 닫기 버튼 누르면 동작
			$("#showMsgContent").on("click", function(e){
				$("#messageModal").modal("hide");				
			});
			
		
		});
		
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
		
		
		
	</script>
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
	/* 	reviewService.get(9, function(data){
			console.log(data);
		}) */
		
	</script>
</body>

</html>