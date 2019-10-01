<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://localhost:3000/socket.io/socket.io.js"></script> 
</head>
<body>
	<div class="container">
		<div id="driving">
			<h1>YCAR</h1>
			<img src="images/logo_yeoncha.png" id="ycarLogo">
			<h5>운전자분, 카풀 운행이 시작되었습니다.</h5>
			<h5>탑승자분이 버튼을 누르면 운행이 종료됩니다!</h5><br>
		</div>
	</div>
	<!-- param : 1) ${loginInfo.d_idx}"  2) 현재  r_idx -->
	<script>
		$(document).ready(function(){
			var socket = io('http://localhost:3000');
		
			//이전 url 에서 r_idx 받아오기
			var params = document.location.search.substring('1');
			console.log('params 확인 : ', params);  
			var parameter = params.split('=');
			console.log('parameter 확인 : ', parameter[0]+ ' / 이글루 / '+ parameter[1]);  
			var r_idx = parameter[1];
			console.log('r_idx 확인 : ', r_idx);  

			socket.emit('join room', r_idx); 

			socket.on('redirect', function(r_idx){
				console.log('redirect 리슨 ', r_idx);
				setTimeout(function(){
					window.location.href="http://localhost:8080/parclient/payment/driverPaychk.jsp?r_idx="+r_idx;
				}, 3000);
			});
		});
	</script>
</body>
</html>