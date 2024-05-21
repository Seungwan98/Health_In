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

		<body>
			<div class="container">
				<div class="col-6">
					<label><b>채팅방</b></label>
				</div>
				<div>
					<div id="msgArea" class="col"></div>
					<div class="col-6">
						<div class="input-group mb-3">
							<input type="text" id="msg" class="form-control" aria-label="Recipient's username"
								aria-describedby="button-addon2">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-6"></div>
			</div>
		</body>
		<script type="text/javascript">
			//전송 버튼 누르는 이벤트
			$("#button-send").on("click", function (e) {
				sendMessage();
				$('#msg').val('')
			});
			
			document.onkeydown = function() { 

				// 새로고침 방지 ( Ctrl+R, Ctrl+N, F5 )
				if ( event.ctrlKey == true && ( event.keyCode == 78 || event.keyCode == 82 ) || event.keyCode == 116) {

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
				<%log("퇴장");%>
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


					var str = "<div class='col-6'>";
					str += "<div class='alert alert-secondary'>";
					str += "<b>" + sessionId + " : " + message + "</b>";
					str += "</div></div>";

					$("#msgArea").append(str);
				} else {

					var str = "<div class='col-6'>";
					str += "<div class='alert alert-warning'>";
					str += "<b>" + sessionId + " : " + message + "</b>";
					str += "</div></div>";

					$("#msgArea").append(str);
				}

			}
			//채팅창에서 나갔을 때
			


			//채팅창에 들어왔을 때
			function onOpen(evt) {

				<%log("입장");%>
				var user = '${member.memberId}';
				var str = user + "님이 입장하셨습니다.";
				sendHandler(str);

			}
		</script>

		</html>