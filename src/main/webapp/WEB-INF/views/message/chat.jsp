<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="memberId"
	value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.memberId}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1대화</title>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	type="text/css" rel="stylesheet">


<!-- 웹소켓 설정 -->
<script	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<style>

/* 프로필 사진을 비율변화 없이 둥글게 */
/*1:1 문의하기버튼*/
.box {
	width: 100%;
	/*height: auto;*/
	/* border-radius: 70%; */
	overflow: hidden;
}

.messagesend-btn {
	margin-top: 15px;
}

.message-box {
	width: 40px;
	height: 40px;
	border-radius: 70%;
	overflow: hidden;
}

.img-profile, #messageProfileImage, #profileImage {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
/* 프로필 사진을 비율변화 없이 둥글게 끝 */
.msg_send_btn_profile {
	background: #fff none repeat scroll 0 0;
	border: 1px solid #0465ac;
	border-radius: 15px;
	/* color: #97df93; */
	cursor: pointer;
	font-size: 17px;
	height: 35px;
	/*position: absolute;*/
	right: 0;
	top: 11px;
	width: 100%;
}

.msg_send_btn_profile:hover {
	background: #0465ac none repeat scroll 0 0;
	color: #fff;
}

.msg_send_btn {
	background: #0465ac none repeat scroll 0 0;
	border: medium none;
	border-radius: 50%;
	color: #fff;
	cursor: pointer;
	font-size: 17px;
	height: 33px;
	position: absolute;
	right: 0;
	top: 11px;
	width: 33px;
}

.msg_send_btn:hover {
	background: #0465ac none repeat scroll 0 0;
}

</style>

</head>

<body>
	<jsp:include page="../include/navbar.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	

	<!-- 대화modal창 띄우기-->
	<div class="text-center center row">
		<div class="col-1"></div>
		<div class="col-10">
			<div class="box">
				<div class="messagesend-btn">
					<!-- 1:1문의버튼 -->
					<button type="button" class="msg_send_btn_profile" 
						data-bs-toggle="modal" data-bs-target="#exampleModal"
						onclick="javascript:showMessageContent('${memberId}')">
						<i class="fas fa-comments"></i>&nbsp;&nbsp; ${memberId }에게 1:1 문의하기
					</button>
				</div>
				<!-- 메세지 보내기 모달창 -->
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable">
						<div class="modal-content">
							<div class="modal-header">
								<span id="m_writer_profile">
									<div class="message-box">
										<!-- 상대방 프로필 경로잡아주기 -->
										<img src="/resources/assets/images/gym/re3.png" alt="상대방 프로필"
											class="avatar img_circle img-profile" alt="avatar">

									</div>
								</span>
								<h5 class="modal-title" id="exampleModalLabel">&nbsp; otherId세팅 ${memberId }</h5>
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
												<input type='text' class='write_msg form-control'
													placeholder='메세지를 입력해주세요' />
											</div>
											<div class='col-1'>
												<button class='msg_send_btn' type='button'
													onclick="javascript:sendMessage('${otherId}')">
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
			</div>
			<div class="col-1"></div>
		</div>
	</div>

	<script type="text/javascript">
	$(document).ready(function(){
		$('.msg_send_btn_profile').click(function(e){
			e.preventDefault();
			$('#exampleModal').modal("show");
		});
	})
	
	// 1:1문의를 하고자하는 상대방 id세팅
	// - 해당 홈짐글의 번호를 통해 그 글을 쓴 사람의 id를 가져와서 otherId에 넣기()
	// 
	let otherId = "${clist.otherId}";

	// 1:1문의할 떄, 메세지 내역 가져오기
	const showMessageContent = function(otherId){
		
		$.ajax({
			url:"msgContentByAsking.do",
			method:"GET",
			data:{
				otherId : otherId
			},
			success : function(data){
				console.log("1:1문의하기에서 메세지 내용 가져오기 성공 data : "+data);
				
				// 메세지 내용을 html에 넣기
				$('.msg_history').html(data);
				
				// 이 함수로 메세지 내용 가져온 후, 스크롤을 맨아래로
				$('.msg_history').scrollTop($('.msg_history')[0].scrollHeight);
			},
			error: function(){
				alert('showMessageContent() 에러');
			}
		});
	};
	
	// 1:1문의할 떄, 메세지 전송하기
	const sendMessage = function(otherId){
		let msgContent = $('.write_msg').val();
		console.log(msgContent);
		
		msgContent = msgContent.trim();
		
		if(msgContent ==""){
			alert('메세지를 입력해주세요');
		} else {
			$.ajax({
				url : "msgSendByAsking.do",
				method:"GET",
				data:{
					otherId : otherId,
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

</body>
</html>
