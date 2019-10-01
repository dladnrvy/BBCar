<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>연차 - 탑승자 후기</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- bootstrap cdn 적용  -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<!-- 별점 기능 구현을 위해 3.x 버전으로 처리  -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

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
<link rel="stylesheet" href="<c:url value='/static/css/review.css'/>">
<script src="<c:url value='/static/js/reviewPassenger.js'/>"></script>


<!-- 별표 기능을 위한 템플릿 설정 -->
<!-- bar-rating -->
<!-- <script src="https://code.jquery.com/jquery-3.4.1.js"></script> -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value='/css/fontawesome-stars.css'/>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.barrating.min.js'/>"></script>

</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	
   <!--navbar 시작-->
	<%@ include file="/frame/passengerNavbar.jsp"%>
	<!--navbar 끝 -->

	<section class="ftco-intro">
		
		<div class="container">
		<div class="container">
		<h1 class="text-center">운전자와의 여정, 어떠셨나요?</h1>

		<form id="reviewForm" method="post">
			<!-- 별점 시작  -->
			<select id="starRate">
				<option value="2">1</option>
				<option value="4">2</option>
				<option value="6">3</option>
				<option value="8">4</option>
				<option value="10" selected>5</option>
			</select>

			<script type="text/javascript">
				$(function() {
					$('#starRate').barrating({
						theme : 'fontawesome-stars'
					});
				});
				$('#starRate').barrating({
					theme : 'fontawesome-stars',
					initialRating : 10
				});
			</script>
			<!-- 별점 끝-->

			<!-- 후기 : 익명의 사용자 닉네임, 후기내용   -->
			<div class="form-group">
			    <label for="nickname">작성자</label> <!-- 현재 세션에서 p_idx, nickname 값 구해서 input 에 넣어주기  -->
			    <input type="text" class="form-control" id="nickname" value="${login.nickname}" aria-describedby="emailHelp" readonly> 
			    <small id="textHelp" class="form-text text-muted">솔직한 후기를 위해 작성자의 이름은 임의의 닉네임으로 표시 됩니다.</small>
		    </div>
		    <div class="form-group">
			    <label for="comment">내용</label>
			    <input type="text" class="form-control" id="comment" aria-describedby="emailHelp" placeholder="후기 내용을 작성해주세요." value=" ">
		    </div>
		    <input type="hidden" name="payidx" id="payidx" value="">
		    <input type="hidden" name="p_idx" id="p_idx" value="${login.idx}">	<!--  ${sessionScope.loginInfo.p_idx}  -->	    		    
		</form>
		<!-- 2019.09.14 : submit 버튼을 form 내부에 넣으니 form 전송이 제대로 되지 않는 현상이 발생했다.
		post 요청하여 DB까지도 정상적으로 저장되었고 rscnt 도 정상적으로 return 했으나 success function() 내부에 접근하지 못했음. 
		 -->
		<button onclick="reviewSubmit()" class="btn btn-primary btn-block text-center btn-submit">후기등록</button>
		
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

	<!-- 별점 플러그인과 충돌로 인해 주석처리 -->
	<!-- <script src="../js/jquery.min.js"></script> -->
	<!-- <script src="../js/jquery-migrate-3.0.1.min.js"></script> -->
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