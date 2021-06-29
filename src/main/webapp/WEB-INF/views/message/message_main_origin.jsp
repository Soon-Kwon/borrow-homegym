<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- -->
<link rel="stylesheet"
	href="../../../resources/ad_assets/css/message.css">

</head>
<body>
	<jsp:include page="../include/navbar.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%-- ad_navbar는 br없애기 
	<jsp:include page="../include/ad_navbar.jsp"></jsp:include>
	 --%>
	<div class="msg-container">
		<div class="messaging">
			<div class="inbox_msg">

				<!-- 메세지 목록 영역 -->
				<div class="inbox_people">
					<!-- 메세지 리스트 상단바 -->
					<div class="headind_srch">
						<div class="recent_heading">
							<h4>Recent</h4>
						</div>

						<!-- 메세지 검색 -->
						<div class="srch_bar">
							<div class="stylish-input-group">
								<input type="text" class="search-bar" placeholder="Search">
								<span class="input-group-addon">
									<button type="button">
										<i class="fa fa-search" aria-hidden="true"></i>
									</button>
								</span>
							</div>
						</div>
					</div>

					<!-- 메세지 리스트 -->
					<div class="inbox_chat scroll">

						<div class="chat_list active_chat">
							<div class="chat_people">
								<div class="chat_img">
									<img src="https://ptetutorials.com/images/user-profile.png"
										alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>
										Sunil Rajput <span class="chat_date">Dec 25</span>
									</h5>
									<p>Test, which is a new approach to have all solutions
										astrology under one roof.</p>
								</div>
							</div>
						</div>
						<div class="chat_list">
							<div class="chat_people">
								<div class="chat_img">
									<img src="https://ptetutorials.com/images/user-profile.png"
										alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>
										Sunil Rajput <span class="chat_date">Dec 25</span>
									</h5>
									<p>Test, which is a new approach to have all solutions
										astrology under one roof.</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 메세지 내용 영역 -->
				<div class="mesgs">

					<!-- 메세지 내용 목록 -->
					<div class="msg_history" name="contentList">

						<!-- 목록에 대한 메세지 내용이 올 자리 -->
						<div class="incoming_msg">
							<div class="incoming_msg_img">
								<img src="https://ptetutorials.com/images/user-profile.png"
									alt="sunil">
							</div>
							<div class="received_msg">
								<div class="received_withd_msg">
									<p>받는 메시지received_msg</p>
									<span class="time_date"> 11:01 AM | June 9</span>
								</div>
							</div>
						</div>
						<div class="outgoing_msg">
							<div class="sent_msg">
								<p>보내는 메시지는 이미지가 없어요</p>
								<span class="time_date"> 11:01 AM | June 9</span>
							</div>
						</div>
						<div class="incoming_msg">
							<div class="incoming_msg_img">
								<img src="https://ptetutorials.com/images/user-profile.png"
									alt="sunil">
							</div>
							<div class="received_msg">
								<div class="received_withd_msg">
									<p>받는 메시지 received_msg</p>
									<span class="time_date"> 11:01 AM | Yesterday</span>
								</div>
							</div>
						</div>
						<div class="outgoing_msg">
							<div class="sent_msg">
								<p>다시 보냄</p>
								<span class="time_date"> 11:01 AM | Today</span>
							</div>
						</div>
					</div>

					<!-- 메세지 입렫란이 올자리 -->
					<div class='type_msg'>
						<div class='input_msg_write row'>
							<div class='col-11'>
								<input type='text' class='write_msg form-control'
									placeholder='메세지를 입력해주세요' />
							</div>
							<div class='col-1'>
								<button class='msg_send_btn' type='button'>
									<i class='fa fa-paper-plane' aria-hidden='true'></i>
								</button>
							</div>
						</div>
					</div>

					<!-- <div class="type_msg">
						<div class="input_msg_write">
							<input type="text" class="write_msg" placeholder="메세지를 입력해주세요" />
							<button class="msg_send_btn" type="button">
								<i class="fa fa-paper-plane" aria-hidden="true"></i>
							</button>
						</div>
					</div> -->
				</div>
			</div>
		</div>
	</div>



	<!-- <script>
		// 메세지 리스트 가져오기(처음)
		const FirstMessageList = function(){
			$.ajax({
				url:"msgMain.do",
				method:"get",
				data:{},
				success:function(data){
					console.log("ajax이용해 메세지 리스트 리로드 성공");
					
					$('.inbox_chat').html(data);
					
					// 메세지 리스트 중 한 개 클릭 - 채팅가능
					$('.chat_list').on('click', function(){
						
						// 그때의 메세지방, 상대방 id담음
						let msgRoomNo = $(this).attr('msgRoomNo');
						let otherID = $(this).attr('otherId');
						
						// 클릭한 채팅방 빼고, 나머지 active효과 해제
						$('.chat_list_box').not('.chat_list_box.chat_list_box'+msgRoomNo).removeClass('active_chat');
						// 선택한 채팅방만 active효과(active_chat)
						$('.chat_list_box').addClass('active_chat');
						
						/* // 메세지 입력/전송칸 
						let send_msg = "";
						send_msg += "<div class='type_msg'>";
						send_msg += "	<div class='input_msg_write row'>";
						send_msg += "		<div class='col-11'>";
						send_msg += "			<input type='text' class='write_msg form-control' placeholder='메세지를 입력해주세요' />";
						send_msg += "		</div>";
						send_msg += "		<div class='col-1'>";
						send_msg += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
						send_msg += "		</div>";
						send_msg += "	</div>";
						send_msg += "</div>";

						// 메세지 입력/전송 칸 보이기
						$(.'send_message').html(send_msg); */
						
						// 메세지 전송버튼 클릭
						$('.msg_send_btn').on('click', function(){
							
							// 메세지 전송함수 호출(클릭한 채팅방, 상대방 id)
							SendMessage(msgRoomNo, otherId);
						});
						
						// 클릭한 채팅방 번호 넘겨주면 그에 해당하는 메세지 보여주는 함수 호출()
						MessageContent(msgRommNo);
						
					});
				}
			})
		};
		
		// 메세지 리스트 다시 가져오기 (처음X, FirstMessageList함수랑 비슷)
		const MessageList = function(){
			$.ajax({
				url:"/message/msgMain.do",
				method:"get",
				data:{},
				success:function(data){
					console.log("ajax이용해 메세지 리스트 리로드 성공");
					
					$('.inbox_chat').html(data);
					
					// 메세지 리스트 중 한 개 클릭 - 채팅가능
					$('.chat_list').on('click', function(){
						
						// 그때의 메세지방, 상대방 id담음
						let msgRoomNo = $(this).attr('msgRoomNo');
						let otherID = $(this).attr('otherId');
						
						// 클릭한 채팅방 빼고, 나머지 active효과 해제
						$('.chat_list_box').not('.chat_list_box.chat_list_box'+msgRoomNo).removeClass('active_chat');
						// 선택한 채팅방만 active효과(active_chat)
						$('.chat_list_box').addClass('active_chat');
						
						// 메세지 전송버튼 클릭
						$('.msg_send_btn').on('click', function(){
							
							// 메세지 전송함수 호출(클릭한 채팅방, 상대방 id)
							SendMessage(msgRoomNo, otherId);
						});
						
						// 클릭한 채팅방 번호 넘겨주면 그에 해당하는 메세지 보여주는 함수 호출()
						MessageContent(msgRommNo);
						
					});
				
					// 전송버튼 클릭시 현재 열린 메세지의 선택된 표시 사라는 걸 막기위함
				$('.chat_list_box:first').addClass('active_chat');
			}
			})
		};
		
		// 클릭한 메세지 내용 보여주고, 읽지 않은 메세지를 읽음처리하는 함수
		const MessageContent = function(msgRoomNo){
			$.ajax({
				url:"msgContent.do",
				method:"GET",
				data:{
					msgRoomNo : msgRoomNo
				},
				success:function(data){
					console.log("메시지 가져오기");
					
					// 메세지 내용을 html에 담음
					$('.msg_histroy').html(data);
					
					// 함수 호출할 떄마다 스크롤 맨 아래로 위치시킴
					$('.msg_histroy').scrollTop($('.msg_histroy')[0].scrollHeight);
				},
				error:function(){
					alert('에러 발생');
				}
			})
			
			// 해당 채팅방의 메세지 내용을 읽었음으로 읽음처리 
			$('.unread'+msgRoomNo).empty();
		};
		
		// 메세지 전송 함수
		const SendMessage = function(msgRoomNo, otherId){
			
			// 입력한 메세지 담기
			let content = $('.write_msg').val();
			
			// 공백지우기
			content = content.trim();
			
			if(content == ""){
				alert("메세지를 입력해주세요");
			} else {
				$.ajax({
					url: "msgSend.do",
					method:"GET",
					data:{
						msgRoomNo : msgRoomNo,
						otherId : otherId,
						content : content
					},
					success:function(data){
						console.log("메세지 전송 성공");
						
						// 메세지 입력칸 비우기
						$('.write_msg').val("");
						
						// 메세지 내용 리로드
						MessageContent(msgRoomNo);
						
						// 메세지 리스트 리로드
						MessageList();
					},
					error:function(){
						alert('서버 에러');
					}
				});
			}
		};
		
		$(document).ready(function(){
			// 메세지 리스트 리로드
			FirstMessageList();
		});
		
	</script> -->

</body>
</html>