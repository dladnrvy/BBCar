<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>YCAR카풀</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="static/mypage.css">
	
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" style="overflow: scroll">
    <nav class=" navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" style="color: black">YCAR</a>
            </div>
            <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>

            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav nav ml-auto">
                    <li class="nav-item"><a href="index.html#home-section" class="nav-link"><span>카풀찾기</span></a></li>
                    <li class="nav-item"><a href="index.html#services-section" class="nav-link"><span>나의카풀</span></a></li>
                    <li class="nav-item"><a href="index.html#destination-section" class="nav-link"><span>결제</span></a></li>
                    <li class="nav-item"><a href="index.html#hotel-section" class="nav-link"><span>후기</span></a></li>
                    <li class="nav-item"><a href="index.html#restaurant-section" class="nav-link"><span>마이페이지</span></a></li>
                    <li class="nav-item"><a href="index.html#blog-section" class="nav-link"><span>로그아웃</span></a></li>
                </ul>
            </div>
    </nav>

    <section class="hero-wrap" data-stellar-background-ratio="0.5">

        <div class="container">

            <div class="rightDiv">
                <div class="comment-form-wrap pt-5">
                    <div class="sidebar-box ftco-animate">
                        <h2 class="heading-sidebar">내 정보</h2>
                        <ul class="categories">
                            <li><input type="hidden" id="sessionIdx" value="${login.idx}"><a>${login.name} (${login.id})</a></li>
                            <li><a>${login.email}</a></li>
                            <li><a>오늘의 닉네임 : ${login.nickname}</a></li>
                            <li><button class="btn py-3 px-4 btn-primary" style="float: right" id="modeBtn" onclick="editForm()">내 정보 수정</button></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- 팝업 배경 DIV -->
            <div id="popup_mask"></div>
            <div id="popupDiv">
                <!-- 팝업창 -->
                <table style="width: 100%">
                    <tr>
                        <td>이메일 주소</td>
                    </tr>
                    <tr>
                        <td><input type="hidden" value="${login.id}" name="id" id="id"><input class="form-control" type="email" id="email" value="${login.email}"></td>
                    </tr>
                    <tr>
                        <td>기존 비밀번호</td>
                    </tr>
                    <tr>
                        <td><input class="form-control" type="password" id="pw1" name="pw1" required></td>
                    </tr>
                    <tr>
                        <td>새로운 비밀번호</td>
                    </tr>
                    <tr>
                        <td><input class="form-control" type="password" id="pw2" name="pw2" required></td>
                    </tr>
                    <tr>
                        <td>비밀번호 다시입력</td>
                    </tr>
                    <tr>
                        <td><input class="form-control" type="password" id="pw3" required><span id="pwSpan"></span><input type="checkbox" id="pwCheck"></td>
                    </tr>
                    <tr>
                        <td><input type="button" class="btn py-3 px-4 btn-primary" id="edit" value="수정하기"></td>
                    </tr>
                    <tr>
                        <td><button class="btn py-3 px-4 btn-primary" id="popCloseBtn">취소</button></td>
                    </tr>
                </table>
            </div>
            <!--<div id="myInfoEdit" class="comment-form-wrap pt-5">

</div>-->

            <div class="rightDiv">
                <div class="comment-form-wrap pt-5">
                    <div class="sidebar-box ftco-animate">
                        <h2 class="heading-sidebar">즐겨찾는 장소</h2>
                        <ul class="categories" id="myPlace">
                            <li><span>즐겨찾는 장소를 설정해주세요 <a href="#" class="btn py-1 px-4 btn-primary">경로 추가</a></span></li>
                            <li><span>즐겨찾는 장소를 설정해주세요 <a href="#" class="btn py-1 px-4 btn btn-primary">경로 추가</a></span></li>
                            <li><span>즐겨찾는 장소를 설정해주세요 <a href="#" class="btn py-1 px-4 btn btn-primary">경로 추가</a></span></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="rightDiv">
                <div class="comment-form-wrap pt-5">
                    <div class="sidebar-box ftco-animate">
                        <h2 class="heading-sidebar">선호 탑승 환경</h2>
                        <ul id="myEnv" class="categories">
                        </ul>
                        <a href="#" class="btn py-1 px-4 btn btn-primary" style="float:right">수정</a>
                    </div>
                </div>
            </div>

        </div>
    </section>


    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg></div>


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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    <script src="static/js/google-map.js"></script>

    <script src="static/js/main.js"></script>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="static/mypage.js"></script>
	

</body></html>
