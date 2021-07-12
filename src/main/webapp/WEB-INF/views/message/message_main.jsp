<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="memberId"  value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.memberId}"  />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Message</title>

<link rel="stylesheet" href="/resources/ad_assets/css/message.css">
<!--부트스트랩 설정-->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/a0fcc69da7.js" crossorigin="anonymous"></script>
<!-- ========================= CSS here ========================= -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/assets/css/LineIcons.2.0.css" />
<link rel="stylesheet" href="/resources/assets/css/animate.css" />
<link rel="stylesheet" href="/resources/assets/css/tiny-slider.css" />
<link rel="stylesheet" href="/resources/assets/css/glightbox.min.css" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />

<style type="text/css">
	/*버튼 클릭 후, 남은 효과 없애기*/
	#chatListBtn:focus,
	#send_msg_btn:focus{
		box-shadow: none; 
	}
</style>

</head>
<body>
	<div class="msg-container">
		<div class="messaging">
			<div class="inbox_msg">

				<!-- 메세지 목록(list) 영역 : message_list.jsp -->
				<div class="inbox_people">
					<!-- 메세지 리스트 상단바 recent, 검색아이콘-->
					<div class="headind_srch">
						<div class="recent_heading">
							<button type="button" id="chatListBtn" class="btn" style="padding:0px; width:70px;" onclick="FirstMessageList()"> <!-- 리스트로 돌아가게 만들기 -->
							<h4 style="width:70px">Chat List</h4>
							
							</button>
							
						</div>

						<!-- 메세지 검색 영역 : message_search.jsp-->
						<div class="srch_bar">
							<div class="stylish-input-group">
								<input id="findNickname" type="text" class="search-bar" placeholder="닉네임 검색하기">
								<span class="input-group-addon">
									<button class="searchBtn" type="button" onclick="findFunction();">
										<i class="fa fa-search" aria-hidden="true"></i>
									</button>
								</span>
							</div>
						</div>
					</div>

					<!-- 실제 대화한 메세지 목록 -->
					<div class="inbox_chat">
						
					</div>
					
				</div>

				<!-- 메세지 내용(content) 영역 : message_content.jsp -->
				<div class="mesgs">
					
					<!-- 실제 대화한 메세지 내용 목록(대화내용) -->
					<div class="msg_history" name="contentList"></div>

					<!-- 메세지 입력란이 올자리 -->
					<div class="send_message"></div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	var friendId = '';
	/*body위쪽 : nickname에 해당하는 멤버찾는 ajax*/
	$(document).ready(function(){
		// 찾을 아이디 입력 후, 엔터키 작동
		$('#findNickname').keydown(function(e){
			if(e.keyCode == 13){	
				e.preventDefault();
				$('.searchBtn').trigger('click');
			} 
		});	
		
		// Chat List버튼 클릭시 대화내용 없애기
		$('#chatListBtn').on('click', function(){
			$('.msg_history').html('');
			$('.send_message').html('');
			clearInterval(interval);
		})
	});
		
	// 친구찾기 함수
	function findFunction(){
		clearInterval(interval);
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		var findNickname = $('#findNickname').val();
		
		// ajax는 웬만하면 POST로!
		$.ajax({
			type:"POST",
			url:"searchUser.do",
			data:{
				findNickname : findNickname
			},
			/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
            },
			success: function(member){
				console.log(member);
				if(member != null && member != ''){
					console.log(member);
					// 찾은 id의 nickname존재하면, 그 nickname을 가진 member의 필요정보 가져오기
					getFriendList(member.memberId, member.nickname, member.imagePath);

					console.log("getFriendList()의 memberId, nickname, image : "+member.memberId, member.nickname, member.imagePath);
					if(member.memberId == '${memberId}'){
						alert("현재 로그인한 사용자입니다.");
						FirstMessageList();
						
					} 
				} else {
					// 친구찾기에 실패했을 때, 
					$('.inbox_chat').html('<h6 style="text-align:center; margin-top: 40px;">해당 닉네임을 찾을 수 없습니다😅<br> 다시 검색해주세요</h6>');
					
				}
			},
			error:function(e){
				console.log(e);
			}
			
		});
	}
	
	
	// 친구찾기에 성공했을 때, 한 명의 정보만 넘겨주기
	function getFriendList(searchId, searchNickname, searchImage){	
		console.log("getFriendList()의 searchId : "+searchId);
		
		// 기본이미지 세팅
		if(searchImage == null){
			searchImage = "/resources/assets/images/mypage/basicImg.png";
		}
		
		let userList = '';
		userList = '<div class="chat_list">';
		userList += '	<div class="chat_people">';
		userList += '		<div class="chat_img"> ';
		userList += '			<img src="'+searchImage+'" alt="searchImage넣기">';
		userList += '		</div>';
		userList += '   <div class="chat_ib">';
		userList += '		<h5>'+searchNickname+' <span class="chat_date"><button class="btn" id="send_msg_btn" onclick="searchRoomNo(\''+searchId+'\');"><i class="fa fa-paper-plane-o" aria-hidden="true" style="font-size:16px"></i></button></span></h5>';
		userList += '       <p>'+searchId+'</p>';
		userList += '	</div>';
		userList += '</div>';
		
		$('.inbox_chat').html(userList);
		$('#findNickname').val('');
		
	}
	
	
	var roomNo = 0;
	
	// ajax사용시, 함수에 담아서 사용하는 것이 좋음(1함수 1ajax)
	// 값들을 세팅한 후에 로직을 타는 것이 바람직
	// 현재 로그인한 Id와 찾을 Id를 세팅해서 msgRoomNo 조회
	function searchRoomNo(searchId) {
		console.log("searchRoomNo()를 호출");
		var memberId =  '${memberId}';
		$.ajax({
			type:"GET",
			url:"getRoomNo.do",
			data:{
				otherId : searchId,
				curId : memberId
			}, 
			success: function(roomNo){
				console.log("searchRoomNo()의 roomNo : "+roomNo);
				showMsgBySearch(searchId, roomNo);
			},
			error: function(e) {
				console.log(e);
			}
		});
	}
	
	// 찾은 리스트에서 메세지 버튼 클릭시, 대화내용 보여주기 - searchId를 통해 체크
	function showMsgBySearch(searchId, roomNo){ 
		
		console.log("showMsgBySearch()를 호출");
		console.log("showMsgBySearch()의 searchId : "+searchId);
		console.log("roomNo : " + roomNo);
		
		var memberId =  '${memberId}';
		console.log("memberId : " + memberId);
		
		// 메세지 입력/전송칸 
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
		$('.send_message').html(send_msg);
		
		
		 // 엔터키 눌러서 메세지 전송
		 $('.write_msg').keydown(function(){
			if(event.keyCode == 13){
				SendMessage(roomNo,searchId);
			} 
		});
		
		// 버튼 클릭해서 메세지 전송
		$('.msg_send_btn').on('click',function() {
				// 메세지 전송함수 호출(클릭한 채팅방 번호, 상대방 id)
				SendMessage(roomNo,searchId);
			});
		
		// 클릭한 채팅방 번호 넘겨주면 그 채팅방에 해당하는 메세지 보여주는 함수 호출()
		ShowMessageContent(roomNo);
	}
	</script>
	



	<!-- body아래쪽 : 채팅방 불러오는 ajax-->
	<script>
		var selectedMsgRoomNo = '';
		var interval;
		
		// 메세지 리스트 가져오기(처음)  
		const FirstMessageList = function() {
			console.log("FirstMessageList()호출");
			$('.chat_list_box').removeClass('active_chat');
			
			$.ajax({
					url : "msgList.do",
					method : "GET",
					success : function(data) {
						console.log("SUCCESS : FirstMessageList() data : " + data);
						
						$('.inbox_chat').html(data);
						
						

						// 메세지 리스트 중 한 개 클릭 - 채팅가능
						$('.chat_list').on('click',function() {
							
							// 그때의 메세지방, 상대방 id담음
							let msgRoomNo = $(this).attr('msgRoomNo');
							let otherId = $(this).attr('otherId');
							console.log("FirstMessageList msgRoomNo : " + msgRoomNo);

							// 클릭한 채팅방 빼고, 나머지 active효과 해제
							// .chat_list_box를 갖지 않는 .chat_list_box요소의 내용에 msgRoomNo더함
							/* $('.chat_list_box').not('.chat_list_box.chat_list_box'+ msgRoomNo)
									.removeClass('active_chat');
							// 선택한 채팅방만 active효과(active_chat)
							 */
							
							// 메세지 입력/전송칸 
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
							$('.send_message').html(send_msg);
							
							// 엔터키 누르면 메세지 전송
							$('.write_msg').keydown(function(){
								if(event.keyCode == 13){
									SendMessage(msgRoomNo,otherId);
								} 
							});
							
							// 버튼 클릭하면 메세지 전송
							$('.msg_send_btn').on('click',function() {
									// 메세지 전송함수 호출(클릭한 채팅방 번호, 상대방 id)
									SendMessage(msgRoomNo,otherId);
							});
							

							// 클릭한 채팅방 번호 넘겨주면 그 채팅방에 해당하는 메세지 보여주는 함수 호출()
							ShowMessageContent(msgRoomNo);
						});
					}, 
					error: function(){
						alert("FirstMessageList() 에러");
					}
				});
			
		};

		// 메세지 리스트 다시 가져오기 (처음X, FirstMessageList함수랑 비슷)
		const MessageList = function() {
			console.log("MessageList() 호출");
			$.ajax({
					url : "msgList.do",
					method : "get",
					data : {},
					success : function(data) {
						console.log("MessageList()");

						// 대화내용 보여주기
						$('.inbox_chat').html(data);

						// 메세지 리스트 중 한 개 클릭 - 채팅가능
						$('.chat_list').on('click',function() {
							
							// 그때의 메세지방, 상대방 id담음
							let msgRoomNo = $(this).attr('msgRoomNo');
							let otherId = $(this).attr('otherId');

							// 클릭한 채팅방 빼고, 나머지 active효과 해제
							$('.chat_list_box').not('.chat_list_box.chat_list_box'+ msgRoomNo)
									.removeClass('active_chat');
							// 선택한 채팅방만 active효과(active_chat)
							$('.chat_list_box'+ msgRoomNo).addClass('active_chat');

							// 메세지 입력/전송칸 
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
							$('.send_message').html(send_msg);
							
							// 엔터키 누르면 메세지 전송
							$('.write_msg').keydown(function(){
								if(event.keyCode == 13){
									SendMessage(msgRoomNo,otherId);
								} 
							});

							// 메세지 전송버튼 클릭
							$('.msg_send_btn').on('click',function() {

								// 메세지 전송함수 호출(클릭한 채팅방, 상대방 id)
								SendMessage(msgRoomNo, otherId);
							});

							// 클릭한 채팅방 번호 넘겨주면 그에 해당하는 메세지 보여주는 함수 호출()
							ShowMessageContent(msgRoomNo);

						});

						// 전송버튼 클릭시 현재 열린 메세지의 선택된 표시 사라지는 걸 막기위함
						$('.chat_list_box.chat_list_box'+ selectedMsgRoomNo).addClass('active_chat');
						
					}
				});
			
		};

		// 클릭한 메세지 내용 보여주고, 읽지 않은 메세지를 읽음처리하는 함수
		const ShowMessageContent = function(msgRoomNo) {
			console.log("ShowMessageContent() 호출")
			selectedMsgRoomNo = msgRoomNo;
			console.log("ShowMessageContent()의 msgRoomNo : " + msgRoomNo);
			console.log("ShowMessageContent()의 msgRoomNo의 typeof : " + typeof msgRoomNo);
			
			// 내용 호출
			$.ajax({
				url : "msgContent.do",
				method : "GET",
				data : {
					"msgRoomNo" : msgRoomNo
				},
				success : function(data) {
					console.log("해당하는 채팅방의 메시지 가져오기");
					console.log(" data : "+  data);
					// 채팅방이 존재할 때만 내용을 담음
					if(msgRoomNo != "" || msgRoomNo != 0){
						// alert('채팅방 존재 msgRoomNo' + msgRoomNo);
						// 메세지 내용을 html에 담음
						$('.msg_history').html(data);

						// 함수 호출할 떄마다 스크롤 맨 아래로 위치시킴
						$('.msg_history').scrollTop(
								$('.msg_history')[0].scrollHeight);
					} else {
						console.log("해당하는 채팅방 없음. roomNo이 아니고 max+1로 세팅해줘야지,,")
					}

					
				},
				error : function() {
					alert('ShowMessageContent()에러 발생');
				}
			})

			// 해당 채팅방의 메세지 내용을 읽었음으로 읽음처리 
			$('.unread' + msgRoomNo).empty();
		};

		// 메세지 전송 함수
		const SendMessage = function(msgRoomNo, otherId) {
			console.log("SendMessage()호출")
			console.log("msgRoomNo : "+ msgRoomNo, "otherId : "+otherId);
			
			// 입력한 메세지 담기
			let msgContent = $('.write_msg').val();

			// 공백지우기
			msgContent = msgContent.trim();

			if (msgContent == "") {
				alert("메세지를 입력해주세요");
			} else {
				$.ajax({
					url : "msgSend.do",
					method : "GET",
					data : {
						msgRoomNo : msgRoomNo,
						otherId : otherId,
						msgContent : msgContent
					},
					success : function(data) {
						console.log("SendMessage()메세지 전송 성공");
						console.log("SendMessage() success()의 data : "+data);

						// 메세지 입력칸 비우기
						$('.write_msg').val("");

						// 메세지 내용 리로드
						ShowMessageContent(msgRoomNo);

						// 메세지 리스트 리로드
						MessageList();
					},
					error : function() {
						alert('sendMessage() 에러');
					}
				});
			}
		};
		
		// message_list, message_content 실시간 업데이트할 함수
		function getInfiniteChat(){
			// 아이디 검색 후, interval멈춰서 검색한 Id 유지될 수 있게 하기 
			interval = setInterval(function(){
				MessageList();
				// 선택된 방이 있을때만 채팅방 번호 보내기
				if(selectedMsgRoomNo != null && selectedMsgRoomNo != '')
					ShowMessageContent(selectedMsgRoomNo);
				
				// #findNickname검색 버튼 누르지 않을 때만 리스트 보여주기 -   
			}, 3000);
		}
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		
		FirstMessageList();
		getInfiniteChat();
	});
	</script>

</body>
</html>