<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--부트스트랩 설정-->
    <link rel="stylesheet" href="../../../resources/ad_assets/css/chat.css"> 
    <script src="../../../resources/ad_assets/js/custom.js"></script>

</head>

<body>
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
            <div class="message_input_wrapper"><input class="message_input" placeholder="Type your message here..." />
            </div>
            <div class="send_message" onclick="sendMessage()" type="button">
                <div class="icon"></div>
                <div class="text">Send</div>
            </div>
        </div>
    </div>
    <div id="messageTextArea">
        <li class="message">
            <div class="avatar">
            
            </div>
            <div class="text_wrapper">
                <div class="text">
                </div>
            </div>
        </li>
    </div>
    
    <script type="text/javascript">
        // WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
        var webSocket = new WebSocket("ws://localhost:8090/chat.do");
        // 콘솔 텍스트 에리어 오브젝트
        var messageTextArea = document.getElementById("messageTextArea");
        // WebSocket 서버와 접속이 되면 호출되는 함수
        webSocket.onopen = function(message) {
            // 콘솔 텍스트에 메시지를 출력한다.
            messageTextArea.value += "Server connect...\n";
        };
        
        
        // WebSocket 서버와 접속이 끊기면 호출되는 함수
        webSocket.onclose = function(message) {
            // 콘솔 텍스트에 메시지를 출력한다.
            messageTextArea.value += "Server Disconnect...\n";
        };
        // WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
        webSocket.onerror = function(message) {
            // 콘솔 텍스트에 메시지를 출력한다.
            messageTextArea.value += "error...\n";
        };
        /// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
        webSocket.onmessage = function(message) {
            // 콘솔 텍스트에 메시지를 출력한다.
            messageTextArea.value += message.data + "\n";
        };
        
        
        // Send 버튼을 누르면 호출되는 함수
        function sendMessage() {
            // 유저명 텍스트 박스 오브젝트를 취득
            var user = document.getElementById("user");
            // 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득
            var message = document.getElementById("textMessage");
            // 콘솔 텍스트에 메시지를 출력한다.
            messageTextArea.value += user.value + "(me) => " + message.value
                    + "\n";
            // WebSocket 서버에 메시지를 전송(형식 「{{유저명}}메시지」)
            webSocket.send("{{" + user.value + "}}" + message.value);
            // 송신 메시지를 작성한 텍스트 박스를 초기화한다.
            message.value = "";
        }
        
        
        // Disconnect 버튼을 누르면 호출되는 함수
        function disconnect() {
            // WebSocket 접속 해제
            webSocket.close();
        }
    </script>

</body>
</html>
