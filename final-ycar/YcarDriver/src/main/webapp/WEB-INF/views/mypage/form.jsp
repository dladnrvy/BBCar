<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연차::회원가입</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<link rel="stylesheet" href="static/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="static/css/animate.css">

<link rel="stylesheet" href="static/css/owl.carousel.min.css">
<link rel="stylesheet" href="static/css/owl.theme.default.min.css">
<link rel="stylesheet" href="static/css/magnific-popup.css">

<link rel="stylesheet" href="static/css/aos.css">

<link rel="stylesheet" href="static/css/ionicons.min.css">

<link rel="stylesheet" href="static/css/flaticon.css">
<link rel="stylesheet" href="static/css/icomoon.css">
<link rel="stylesheet" href="static/css/style.css">
<link rel="stylesheet" href="static/mypage.css">
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">연차 &nbsp;ycar</a>
			<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
				type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav nav ml-auto" id="navbar">
					<li class="nav-item"><a href="" class="nav-link"><span>Home</span></a></li>
					<li class="nav-item"><a href="" class="nav-link"><span>LIST</span></a></li>
					<li class="nav-item"><a href="" class="nav-link"><span>PAY</span></a></li>
					<li class="nav-item"><a href="" class="nav-link"><span>REVIEW</span></a></li>
					<li class="nav-item"><a href="" class="nav-link"><span>MyPage</span></a></li>
					<li class="nav-item"><a href="" class="nav-link"><span>Logout</span></a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!--마이페이지-->
	<section class="hero-wrap"
		style="background-image: url('static/images/bg_6.jpg');" id="bgimage">
		<div class="overlay"></div>
		<div class="container">


			<div class="row pt-5">
				<div id="hiddenform" class="search-wrap-1 ftco-animate col-lg-4"></div>
				<!-- 운전자 기본정보 -->
				<div class="comment-form-wrap col-md-6 col-lg-4 pt-3"
					id="myInfoForm1">
					<form class="p-3 bg-light search-property-1">
						<div class="day-wrap">
							<h3 class="pl-5">MY INFO</h3>
						</div>
						<div class="form-group">
							<label for="id">ID</label> <span id="id" class="form-control"></span>
						</div>
						<div class="form-group">
							<label for="name">NAME</label> <span id="name"
								class="form-control"></span>
						</div>
						<div class="form-group">
							<label for="nickname">NICK NAME</label> <span id="nickname"
								class="form-control"></span>
						</div>
						<div class="form-group">
							<label for="email">개인 이메일주소</label> <span id="email"
								class="form-control"></span>
						</div>
						<div class="form-group">
							<label for="company">회사명</label> <span id="company"
								class="form-control"></span>
						</div>
						<div class="form-group">
							<label for="carnum">자동차번호</label> <span id="carnum"
								class="form-control"></span>
						</div>
						<div class="form-group">
							<label for="cartype">차종</label> <span id="cartype"
								class="form-control"></span>
						</div>

						<div class="form-group pt-3">
							<span class="btn py-3 px-4 btn-black" id="changeinfo1_1"
								onclick="setMyInfo()">내정보 변경</span> <span
								class="btn py-3 px-4 btn-primary" id="changeinfo1_2">비밀번호
								변경</span>
						</div>

					</form>
				</div>

				<!-- 운전자 선호루트 -->
				<div class="comment-form-wrap col-md-6 col-lg-4 pt-3"
					id="myInfoForm2">
					<form class="p-3 bg-light search-property-1">
						<div class="day-wrap">
							<h3 class="pl-5">MY Driving Route</h3>
						</div>

						<div class="form-group">
							<p id="routeNotice">운전할 때 즐겨찾는 장소를 등록 &amp; 관리해 보세요</p>
						</div>
						<div class="form-group">
							<label for="myHome">집</label> <span id="myHome"
								class="form-control">없어욧-! 등록해주세욧-!</span>
						</div>
						<div class="form-group">
							<label for="myCompany">회사</label> <span id="myCompany"
								class="form-control">없어욧-! 등록해주세욧-!</span>
						</div>
						<div class="form-group">
							<label for="MyEtc">기타</label> <span id="MyEtc"
								class="form-control">없어욧-! 등록해주세욧-!</span>
						</div>
						<div class="form-group pt-3">
							<span class="btn py-3 px-4 btn-black" id="changeinfo2">등록
								및 변경하기</span>
						</div>
					</form>
				</div>

				<!-- 운전자 선호운전환경 -->
				<div class="comment-form-wrap col-md-6 col-lg-4 pt-3"
					id="myInfoForm3">
					<form class="p-3 bg-light search-property-1">
						<div class="day-wrap">
							<h3 class="pl-5">MY DRIVING Option</h3>
						</div>
						<div class="form-group">
							<p id="optNotice">운전할 때 선호하는 옵션을 등록 &amp; 관리해 보세요</p>

							<div id="option_wrap"></div>
						</div>

						<div class="form-group pt-3">
							<span class="btn py-3 px-4 btn-black" id="changeinfo3"
								onclick="setMyd_option()">등록 및 변경하기</span>
						</div>
					</form>
				</div>


				<!-- 등록및변경:::: -->
				<div class="comment-form-wrap col-md-6 col-lg-4 pt-3">
					<!-- ::::운전자 개인정보 변경 ::::패스워드제외 -->
					<form class="p-3 bg-light search-property-1" id="myInfoForm4">
						<div class="day-wrap">
							<h3 class="pl-5">운전자 개인 정보 변경</h3>
						</div>
						<div class="form-group">
							<p id="optNotice">변경할 운전자님의 정보를 입력해 주세요</p>
							<label for="edit_email">개인 이메일주소</label> <input type="text"
								class="form-control" id="edit_email"> <span
								id="emailchkmsg"></span>
						</div>
						<div class="form-group">
							<label for="edit_carnum">자동차번호</label> <input type="text"
								class="form-control" id="edit_carnum"> <span
								id="carnumchkmsg"></span>
						</div>
						<div class="form-group">
							<label for="edit_cartype">차종류</label>
							<div class="form-field">
								<div class="select-wrap">
									<select name="edit_cartype" id="edit_cartype" class="form-control">
										<option id="edit_cartype_S" value="S">소형</option>
                                        <option id="edit_cartype_M" value="M">중형</option>
                                        <option id="edit_cartype_L" value="L">대형</option>
									</select>
								</div>
							</div>
							<span id="cartypechkmsg"></span>
						</div>


						<div class="form-group pt-3">
							<span class="btn py-3 px-4 btn-black" id="changeinfo3"
								onclick="edit_myinfo()">내 정보 변경하기</span>
						</div>
					</form>

					<!-- ::::운전자 선호운전환경 -->
					<form class="p-3 bg-light search-property-1" id="myInfoForm8">
						<div class="day-wrap">
							<h3 class="pl-5">MY DRIVING Option</h3>
						</div>
						<div class="form-group">
							<p id="optNotice">운전할 때 선호하는 옵션을 등록 &amp; 관리해 보세요</p>

							<div>
								<label for="drivetype1"><input type="checkbox"
									name="drivetype" id="drivetype1" value="a" class="drivechk"><span
									class="btn btn-black form-control">동성</span></label>
							</div>

							<div>
								<label for="drivetype2"><input type="checkbox"
									name="drivetype" id="drivetype2" value="b" class="drivechk"><span
									class="btn btn-black form-control">조용</span></label>
							</div>

							<div>
								<label for="drivetype3"><input type="checkbox"
									name="drivetype" id="drivetype3" value="c" class="drivechk"><span
									class="btn btn-black form-control">뒷자리가능</span></label>
							</div>

							<div>
								<label for="drivetype4"><input type="checkbox"
									name="drivetype" id="drivetype4" value="d" class="drivechk"><span
									class="btn btn-black form-control">금연</span></label>
							</div>

							<div>
								<label for="drivetype5"><input type="checkbox"
									name="drivetype" id="drivetype5" value="e" class="drivechk"><span
									class="btn btn-black form-control">천천히</span></label>
							</div>

							<div>
								<label for="drivetype6"><input type="checkbox"
									name="drivetype" id="drivetype6" value="f" class="drivechk"><span
									class="btn btn-black form-control">빠르게</span></label>
							</div>
						</div>

						<div class="form-group pt-3">
							<span class="btn py-3 px-4 btn-black" id="changeinfo3"
								onclick="edit_doption()">등록 및 변경하기</span>
						</div>
					</form>
				</div>
				<!--끝등록및변경:::: -->

			</div>
		</div>
	</section>
	<!--마이페이지-->

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


    <script src="static/js/jquery.min.js"></script>
    <script src="static/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="static/js/popper.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/jquery.easing.1.3.js"></script>
    <script src="static/js/jquery.waypoints.min.js"></script>
    <script src="static/js/jquery.stellar.min.js"></script>
    <script src="static/js/owl.carousel.min.js"></script>
    <script src="static/js/jquery.magnific-popup.min.js"></script>
    <script src="static/js/aos.js"></script>
    <script src="static/js/jquery.animateNumber.min.js"></script>
    <script src="static/js/scrollax.min.js"></script>

    <script src="static/js/main.js"></script>
    <script src="static/mypage.js"></script>

</body>
</html>