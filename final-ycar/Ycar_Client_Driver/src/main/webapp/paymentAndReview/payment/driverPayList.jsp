<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>연차 - 운전자 입금내역</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- bootstrap cdn 적용  -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/static/css/open-iconic-bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/static/css/animate.css'/>">
<link rel="stylesheet" href="<c:url value='/static/css/owl.carousel.min.css'/>">
<link rel="stylesheet" href="<c:url value='/static/css/owl.theme.default.min.css'/>">
<link rel="stylesheet" href="<c:url value='/static/css/magnific-popup.css'/>">
<link rel="stylesheet" href="<c:url value='/static/css/aos.css'/>">
<link rel="stylesheet" href="<c:url value='/static/css/ionicons.min.css'/>">
<link rel="stylesheet" href="<c:url value='/static/css/flaticon.css'/>">
<link rel="stylesheet" href="<c:url value='/static/css/icomoon.css'/>">
<link rel="stylesheet" href="<c:url value='/static/css/style.css'/>">

<!-- 커스텀 css/js 파일-->
<link rel="stylesheet" href="<c:url value='/static/css/default.css'/>">
<link rel="stylesheet" href="<c:url value='/static/css/payment.css'/>">
<script src="<c:url value='/static/js/paymentListDriver.js'/>"></script>

</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<!--navbar 시작-->
	<%@ include file="../frame/driverNavbar.jsp"%>
	<!--navbar 끝 -->
	
	<!-- session에서 현재 운전자의 d_idx 넣어주기 -->
	<input type="hidden" name="d_idx" id="d_idx" value="${loginInfo.d_idx}">		    		    

	<section class="ftco-intro">
		<div class="container">
		<h2>입금 리스트</h2>
		<br>
		    <div id="driverDepositList" class="row">
              <!-- 입금 리스트 출력  -->
            </div>
		</div>
	</section>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script src="<c:url value='/static/js/popper.min.js'/>"></script>
	<script src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/static/js/jquery.easing.1.3.js'/>"></script>
	<script src="<c:url value='/static/js/jquery.waypoints.min.js'/>"></script>
	<script src="<c:url value='/static/js/jquery.stellar.min.js'/>"></script>
	<script src="<c:url value='/static/js/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/static/js/jquery.magnific-popup.min.js'/>"></script>
	<script src="<c:url value='/static/js/aos.js'/>"></script>
	<script src="<c:url value='/static/js/jquery.animateNumber.min.js'/>"></script>
	<script src="<c:url value='/static/js/scrollax.min.js'/>"></script>
	<script src="<c:url value='/static/js/main.js'/>"></script>

</body>
</html>