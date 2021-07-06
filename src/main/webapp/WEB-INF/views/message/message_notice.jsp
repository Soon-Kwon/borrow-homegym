<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="memberId"  value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.memberId}"  />

<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>


<title>알림전송</title>
</head>
<body>
<jsp:include page="../includes/header.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<!-- 알림전송 버튼 -->
	<!-- <div class="form-group button">
		<button id="notifySendBtn" class="btn" type="button">알림전송</button>
	</div> -->

	<div class="ml-auto">
		<button id="notifyModalBtn" type="button" class="btn btn-secondary"
			data-toggle="modal" data-target="#notifyModal">알림전송</button>
		<button class="btn btn-danger">회원삭제</button>
	</div>
	<!-- Notify Modal START -->
	<div class="modal fade" id="notifyModal" tabindex="-1"
		aria-labelledby="notifyModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="pointModalLabel">알림전송</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<input type="hidden" class="form-control" id="notifyId">
							<label for="message-text" class="col-form-label">내용</label>
							<textarea class="form-control" id="message-text"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button id="notifySendBtn" type="button" class="btn btn-primary">알림전송</button>
				</div>
			</div>
		</div>
	</div>
	<!-- NOtify Modal END -->

</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#notifyModalBtn').click(function(e) {
			  var modal = $('.modal');
			  modal.find('.modal-body #notifyId').val($('td.id').text());
		});
		
		$('#notifySendBtn').click(function(e){
		    let modal = $('.modal-content').has(e.target);
		    let type = '알림';
		    let target = modal.find('.modal-body input').val();
		    let content = modal.find('.modal-body textarea').val();
		    let url = '${contextPath}/notice-ws.do';
		    console.log(type, target, content, url);
		    // 전송한 정보를 db에 저장	
		    $.ajax({
		        type: 'post',
		        url: '${contextPath}/message/saveNotice.do',
		        dataType: 'text',
		        data: {
		            target: target,
		            content: content,
		            type: type,
		            url: url
		        },
		        success: function(){    // db전송 성공시 실시간 알림 전송
		            // 소켓에 전달되는 메시지
		            // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
		            socket.send("관리자,"+target+","+content+","+url);
		            console.log(type, target, content, url);
		        },
		        error:function(){
		        	console.log("ws에러..")
		        }
		        
		    });
		    console.log(type, target, content, url);
		    modal.find('.modal-body textarea').val('');	// textarea 초기화
		});
	});

	/* //메세지 보내기
	var uid = "${sessionScope.id}";
	$("#txtMessage").on('keydown', function(e) {
		if (e.keyCode == 13 && !e.shiftKey) {
			e.preventDefault();
			var message = $(this).val();
			if (message == "") {
				alert("내용을 입력하세요!");
				return;
			}
			$("#txtMessage").val("");
			// 메시지 전송
			sock.send(uid + "|" + message);
			$("#txtMessage").clear();
		}
	});
	
	//웹소켓 정의
	var sock = new SockJS("http://localhost:8090/notice-ws.do");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	//서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var items = msg.data.split("|");
		var sender = items[0];
		var message = items[1];
		var date = items[2];
		var data = {
			"sender" : sender,
			"message" : message,
			"date" : date
		};
		var template = Handlebars.compile($("#temp").html());
		$("#chat").append(template(data));
		//스크롤바 아래 고정
		window.scrollTo(0, $('#chat').prop('scrollHeight'));
	}
	//서버와 연결을 끊었을 때
	function onClose(evt) {
		console.log("연결이 끊김");
	} */
</script>
</html>