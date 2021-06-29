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
    <link rel="stylesheet" href="/resources/ad_assets/css/chat.css"> 
    <script src="/resources/ad_assets/js/custom.js"></script>

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

</body>
</html>
