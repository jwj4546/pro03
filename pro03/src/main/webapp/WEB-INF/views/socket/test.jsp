<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>채팅 테스트</title>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
	$(function() {
		var ws = new WebSocket("ws://localhost:8092/vt/socket.do");
		
		ws.onopen = function(e) {			//연결 시 실행
			console.log("info : connection opened.")			//연결 메시지 출력
		}
		
		ws.onmessage = function(e) {			//서버로부터 메시지를 받았을 때 실행
			console.log(e.data);						//전달받은 메시지 출력 = e.data
			$("#msg").append("<p>"+e.data+"</p>");
		}
		
		ws.onclose = function(e) {			//연결 종료 시 실행
			console.log("info : connection closed");
		}
		
		ws.onerror = function(e) {
			console.log("error");
		}
		$("#btn").click(function(e) {
			e.proventDefault();
			if(ws.readyState === WebSocket.OPEN) {
				ws.send($("#testInput").val());
			} else {
				console.log("WebSocket is not open: readyState=" + ws.readyState);
			}
		});
	});
	</script>					
</head>
<body>
	<div class="wrap">
		<h2>Socket Test Page</h2>
		<hr>
		<input type="text" id="testInput" >
		<button type="button" id="btn">전송</button>
		<div id="msg">
	</div>
</div>
</body>
</html>