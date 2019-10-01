<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>연차 - 탑승자 후기리스트</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- bootstrap cdn 적용  -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<link rel="stylesheet" href="<c:url value='/css/open-iconic-bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/animate.css'/>">
<link rel="stylesheet" href="<c:url value='/css/owl.carousel.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/owl.theme.default.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/magnific-popup.css'/>">
<link rel="stylesheet" href="<c:url value='/css/aos.css'/>">
<link rel="stylesheet" href="<c:url value='/css/ionicons.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/flaticon.css'/>">
<link rel="stylesheet" href="<c:url value='/css/icomoon.css'/>">
<link rel="stylesheet" href="<c:url value='/css/style.css'/>">

<!-- 커스텀 css/js 파일-->
<link rel="stylesheet" href="<c:url value='/static/css/default.css'/>">
<link rel="stylesheet" href="<c:url value='/static/css/payment.css'/>">
<script src="<c:url value='/static/js/reviewListPassenger.js'/>"></script>

</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<!--navbar 시작-->
	<%@ include file="/frame/passengerNavbar.jsp"%>
	<!--navbar 끝 -->
	
	<!--  ${sessionScope.loginInfo.p_idx}  -->
	<input type="hidden" name="p_idx" id="p_idx" value="${login.idx}">		    		    
	
	<div class="container">
		<section id="reviewByDrivers" class="ftco-intro">
			<div class="container">
			<h2>운전자들이 작성한 리뷰 리스트</h2>
			<br>
				<div id="reviewListByDrivers" class="row">
					등록된 후기가 없습니다!
				</div>
			</div>
		</section>

		<section id="reviewByMe" class="ftco-intro">
			<div class="container">
			<h2>내가 작성한 후기 리스트</h2>
			<br>
				<div id="reviewWrittenByMe" class="row">
					등록된 후기가 없습니다!
				</div>
			</div>
		</section>
	</div>

	<!-- 리뷰 수정 폼 모달 -->
	<div class="modal fade" id="editReviewModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">운전자에 대한 리뷰 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<!-- 1. 별점 -->
						<select id="eStarRate">
							<option value="2">1</option>
							<option value="4">2</option>
							<option value="6">3</option>
							<option value="8">4</option>
							<option value="10">5</option>
						</select>
						<!-- 2. 리뷰번호 -->
						<input type="hidden" id="eRv_idx">
						<!-- 3. 작성자 닉네임-->
						<div class="form-group">
							<label for="nickname" class="col-form-label">작성자 : </label>
							<input type="text" class="form-control" id="eNickname" readonly>
						</div>
						<!-- 4. 내용 -->
						<div class="form-group">
							<label for="eContent" class="col-form-label">내용 : </label>
							<textarea class="form-control" id="eContent"></textarea>
						</div>
						<!-- 5. 탑승자 세션 번호 -->
						<input type="hidden" id="eP_idx">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button onclick="editReview()" type="button" class="btn btn-primary rvBtn">수정완료</button>
				</div>
			</div>
		</div>
	</div>


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script src="<c:url value='/js/popper.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/js/jquery.easing.1.3.js'/>"></script>
	<script src="<c:url value='/js/jquery.waypoints.min.js'/>"></script>
	<script src="<c:url value='/js/jquery.stellar.min.js'/>"></script>
	<script src="<c:url value='/js/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/js/jquery.magnific-popup.min.js'/>"></script>
	<script src="<c:url value='/js/aos.js'/>"></script>
	<script src="<c:url value='/js/jquery.animateNumber.min.js'/>"></script>
	<script src="<c:url value='/js/scrollax.min.js'/>"></script>
	<script src="<c:url value='/js/main.js'/>"></script>
</body>
</html>