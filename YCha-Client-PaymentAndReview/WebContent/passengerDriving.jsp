<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://localhost:3000/socket.io/socket.io.js"></script> 
<style>
	body {
		background-color: #FFFEF4;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
	}
	.container {
		margin-top: 100px;
		margin-bottom: 100px;
		min-width: 100px;
		width: 500px;
	}
	.rsbbtn {
		display: inline-block !important;
		width: 470px !important;
		height: 50px;
	}
	img{
		width:250px;
	}
	h1{
		font-weight:bolder;
	}
</style>
</head>
<body>
	<div class="container">
		<div id="driving">
			<h1>YCAR</h1>
			<img src="image/logo_yeoncha.png" id="ycarLogo">
			<h5>탑승자분, 카풀 운행이 시작되었습니다.</h5>
			<h5>운행종료시 버튼을 눌러주세요!</h5><br>
			<button id="arrBtn" class="btn btn-primary rsbbtn" href="#">운행종료</button>
		</div>
	</div>
	
	<script>
		var socket = io('http://localhost:3000');
		
		// param : 1) ${loginInfo.p_idx}"  2) 현재 사용자의 r_idx
		$(document).ready(function(){
			var r_idx = document.location.search.substring('1').split('=')[1];
			console.log('r_idx 확인 : ', r_idx);  

			socket.emit('join room', r_idx); 

			$('#arrBtn').on('click', function(){
				socket.emit('arrive', r_idx);
				console.log('arrive 이벤트 발생');
			})
	
			socket.on('redirect', function(r_idx){
				console.log('redirect 리슨 ', r_idx);
				setTimeout(function(){
					window.location.href="http://localhost:8080/parclient/index.jsp?r_idx="+r_idx;
				}, 2000);
			});

		});
	</script>
</body>
</html>