<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
			<script type="text/javascript"
				src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
			<meta charset="UTF-8">
			<title>chat</title>
		</head>
		<style>
			::-webkit-scrollbar {
				width: 4px;
			}

			::-webkit-scrollbar-thumb {
				background-color: #4c4c6a;
				border-radius: 2px;
			}

			.chatbox {
				width: 300px;
				height: 400px;
				max-height: 400px;
				display: none;
				flex-direction: column;
				overflow: hidden;
				box-shadow: 0 0 4px rgba(0, 0, 0, .14), 0 4px 8px rgba(0, 0, 0, .28);
			}

			.chat-window {
				flex: auto;
				max-height: calc(100% - 60px);
				background: #2f323b;
				overflow: auto;
			}

			.chat-input {
				flex: 0 0 auto;
				height: 60px;
				background: #40434e;
				border-top: 1px solid #2671ff;
				box-shadow: 0 0 4px rgba(0, 0, 0, .14), 0 4px 8px rgba(0, 0, 0, .28);
			}

			.chat-input input {
				height: 59px;
				line-height: 60px;
				outline: 0 none;
				border: none;
				width: calc(100% - 60px);
				color: white;
				text-indent: 10px;
				font-size: 12pt;
				padding: 0;
				background: #40434e;
			}

			.chat-input button {
				float: right;
				outline: 0 none;
				border: none;
				background: rgba(255, 255, 255, .25);
				height: 40px;
				width: 40px;
				border-radius: 50%;
				padding: 2px 0 0 0;
				margin: 10px;
				transition: all 0.15s ease-in-out;
			}

			.chat-input input[good]+button {
				box-shadow: 0 0 2px rgba(0, 0, 0, .12), 0 2px 4px rgba(0, 0, 0, .24);
				background: #2671ff;
			}

			.chat-input input[good]+button:hover {
				box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			}

			.chat-input input[good]+button path {
				fill: white;
			}

			.msg-container {
				position: relative;
				display: inline-block;
				width: 100%;
				margin: 0 0 10px 0;
				padding: 0;
			}

			.msg-box {
				display: flex;
				background: #5b5e6c;
				padding: 10px 10px 0 10px;
				border-radius: 0 6px 6px 0;
				max-width: 80%;
				width: auto;
				float: left;
				box-shadow: 0 0 2px rgba(0, 0, 0, .12), 0 2px 4px rgba(0, 0, 0, .24);
			}

			.user-img {
				display: inline-block;
				border-radius: 50%;
				height: 40px;
				width: 40px;
				background: #2671ff;
				margin: 0 10px 10px 0;
			}

			.flr {
				flex: 1 0 auto;
				display: flex;
				flex-direction: column;
				width: calc(100% - 50px);
			}

			.messages {
				flex: 1 0 auto;
			}

			.msg {
				display: inline-block;
				font-size: 11pt;
				line-height: 13pt;
				color: rgba(255, 255, 255, .7);
				margin: 0 0 4px 0;
			}

			.msg:first-of-type {
				margin-top: 8px;
			}

			.timestamp {
				color: rgba(0, 0, 0, .38);
				font-size: 8pt;
				margin-bottom: 10px;
			}

			.username {
				margin-right: 3px;
			}

			.posttime {
				margin-left: 3px;
			}

			.msg-self .msg-box {
				border-radius: 6px 0 0 6px;
				background: #2671ff;
				float: right;
			}

			.msg-self .user-img {
				margin: 0 0 10px 10px;
			}

			.msg-self .msg {
				text-align: right;
			}

			.msg-self .timestamp {
				text-align: right;
			}

			.chat-box-toggle {
				float: right;
				margin-right: 15px;
				cursor: pointer;
			}

			.chat-box-header {
				background: #5A5EB9;

				border-top-left-radius: 5px;
				border-top-right-radius: 5px;
				color: white;

			}

			#chat-circle {
				position: fixed;
				bottom: 50px;
				right: 50px;
				background: #5A5EB9;
				width: 80px;
				height: 80px;
				border-radius: 50%;
				color: white;
				padding: 28px;
				cursor: pointer;
				box-shadow: 0px 3px 16px 0px rgba(0, 0, 0, 0.6), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
			}
		</style>

		<body>
			<div id="chat-circle" class="btn btn-raised">
				<div id="chat-overlay"></div>
				<i class="material-icons">x</i>
			</div>
			<div class="chatbox">

				<div class="chat-box-header">

					<span class="chat-box-toggle"><i class="material-icons">X</i></span>
				</div>
				<div class="chat-window">

				</div>
				<form class="chat-input" onsubmit="return false;">
					<input type="text" autocomplete="on" placeholder="Type a message" id="msg" />
					<button id="button-send">
						<svg style="width: 24px; height: 24px" viewBox="0 0 24 24">
							<path fill="rgba(0,0,0,.38)"
								d="M17,12L12,17V14H8V10H12V7L17,12M21,16.5C21,16.88 20.79,17.21 20.47,17.38L12.57,21.82C12.41,21.94 12.21,22 12,22C11.79,22 11.59,21.94 11.43,21.82L3.53,17.38C3.21,17.21 3,16.88 3,16.5V7.5C3,7.12 3.21,6.79 3.53,6.62L11.43,2.18C11.59,2.06 11.79,2 12,2C12.21,2 12.41,2.06 12.57,2.18L20.47,6.62C20.79,6.79 21,7.12 21,7.5V16.5M12,4.15L5,8.09V15.91L12,19.85L19,15.91V8.09L12,4.15Z" />
						</svg>
					</button>
				</form>


			</div>


		</body>


		<script type="text/javascript">

			$("#chat-circle").click(function () {
				$("#chat-circle").toggle('scale');

				$(".chatbox").toggle('scale');
				$(".chatbox").css("display", "flex");
			})

			$(".chat-box-toggle").click(function () {
				$("#chat-circle").toggle('scale');
				$(".chatbox").toggle('scale');

			})
			$('.chat-input input').keyup(function (e) {
				if ($(this).val() == '')
					$(this).removeAttr('good');
				else
					$(this).attr('good', '');
			});



			//전송 버튼 누르는 이벤트
			$("#button-send").on("click", function (e) {
				sendMessage();
				$('#msg').val('')
			});

			document.onkeydown = function () {

				// 새로고침 방지 ( Ctrl+R, Ctrl+N, F5 )
				if (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82) || event.keyCode == 116) {

					event.keyCode = 0;
					event.cancelBubble = true;
					event.returnValue = false;

				}

				// 윈도우 창이 닫힐 경우
				if (event.keyCode == 505) {
					onClose();
				}


			}

			var sock = new SockJS('http://localhost:8085/chat/chatting');
			sock.onmessage = onMessage;
			sock.onclose = function onClose() {

				var user = '${member.memberId}';
				var str = user + " 님이 퇴장하셨습니다.";
				console.log("퇴장")
				sendHandler(str);


			}
			sock.onopen = onOpen;

			function sendMessage() {
				sock.send($("#msg").val());
			}

			function sendHandler(str) {
				sock.send(str);
			}
			//서버에서 메시지를 받았을 때
			function onMessage(msg) {

				var data = msg.data;

				console.log("test");
				console.log(msg);
				var sessionId = null; //데이터를 보낸 사람
				var message = null;

				var arr = data.split(":");

				for (var i = 0; i < arr.length; i++) {
					console.log('arr[' + i + ']: ' + arr[i]);
				}

				var cur_session = '${userid}'; //현재 세션에 로그인 한 사람
				console.log("cur_session : " + cur_session);

				sessionId = arr[0];
				message = arr[1];








				//로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
				if (sessionId == cur_session) {


					var str = "<article class='msg-container msg-self' id='msg-0'>"
						+ "<div class='msg-box'>"
						+ "<div class='flr'>"
						+ "<div class='messages'>"
						+ "<p class='msg' id='msg-1'>"
						+ message + "</p></div><span class='timestamp'><span class='username'>" + sessionId + "</span></span></div></div>"
						+ "</article>"


					$(".chat-window").append(str);
				} else {

					var str = "<article class='msg-container msg-remote' id='msg-0'>"
						+ "<div class='msg-box'>"
						+ "<div class='flr'>"
						+ "<div class='messages'>"
						+ "<p class='msg' id='msg-1'>"
						+ message + "</p></div><span class='timestamp'><span class='username'>" + sessionId + "</span></span></div></div>"
						+ "</article>"

					$(".chat-window").append(str);
				}

			}
			//채팅창에서 나갔을 때



			//채팅창에 들어왔을 때
			function onOpen(evt) {


				var user = '${member.memberId}';
				var str = user + "님이 입장하셨습니다.";
				sendHandler(str);

			}
		</script>

		</html>