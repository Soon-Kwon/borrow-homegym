<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String memberId = request.getParameter("memberId");
session.setAttribute("memberId", memberId);
String otherId = request.getParameter("otherId");
session.setAttribute("otherId", otherId);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chat</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--부트스트랩 설정-->
<link rel="stylesheet" href="/resources/ad_assets/css/chat.css">
<!--<script src="/resources/ad_assets/js/custom.js"></script> 지워도 될 듯 -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	type="text/css" rel="stylesheet">


<!-- --- -->
<style type="text/css">
/* 프로필 사진을 비율변화 없이 둥글게 */
/*1:1 문의하기버튼*/
.box {
	width: 30%;
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

	<!-- chat.jsp 시작 -->
	<div class="chat_window">
		<div class="top_menu">
			<div class="buttons">
				<div class="button close"></div>
				<div class="button minimize"></div>
				<div class="button maximize"></div>
			</div>
			<div class="title">Chat</div>
		</div>

		<ul class="messages">

		</ul>
		<div class="bottom_wrapper clearfix">
			<div class="message_input_wrapper">
				<input class="message_input" placeholder="Type your message here..." />
			</div>
			<div class="send_message" onclick="sendMessage()" type="button">
				<div class="icon"></div>
				<div class="text">Send</div>
			</div>
		</div>
	</div>
	<div id="messageTextArea">
		<li class="message">
			<div class="avatar"></div>
			<div class="text_wrapper">
				<div class="text"></div>
			</div>
		</li>
	</div>
	<!-- chat.jsp 끝 -->

	<!-- modal창 띄우기-->
	<div class="text-center center row">
		<div class="col-1"></div>
		<div class="col-10">
			<div class="box">
				<div class="messagesend-btn">
					<!-- 메세지 보내기 버튼 -->
					<button type="button" class="msg_send_btn_profile"
						data-bs-toggle="modal" data-bs-target="#exampleModal"
						onclick="javascript:MessageContentList('${otherId}')">
						<i class="fas fa-comments"></i>&nbsp;&nbsp; 1:1 문의하기
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
										<img src="/resources/assets/images/gym/re3.png" alt="상대방 프로필"
											class="avatar img_circle img-profile" alt="avatar">

									</div>
								</span>
								<h5 class="modal-title" id="exampleModalLabel">&nbsp; 글쓴사람
									Id${otherId }</h5>
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
													onclick="javascript:SendMessage('${otherId}')">
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


</body>
</html>
