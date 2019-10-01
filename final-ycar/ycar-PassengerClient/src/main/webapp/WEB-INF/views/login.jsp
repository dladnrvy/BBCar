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
    
    <link rel="stylesheet" href="static/login.css">

</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" style="color: white">YCAR</a>
        </div>
    </nav>

    <section class="hero-wrap" style="background-image: url('static/images/car.jpg'); " data-stellar-background-ratio="0.5">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-start">

                <div class="comment-form-wrap pt-5">
                    <!--<h3 class="mb-3 bread">Login</h3>-->

                    <!--로그인 폼-->
                    <form id="form" class="p-5 bg-light">
                        <div class="form-group">
                            <label for="name">ID</label>
                            <input class="form-control" type="text" id="id" name="id" required>
                        </div>
                        <div class="form-group">
                            <label for="email">PW</label>
                            <input class="form-control" type="password" id="pw" name="pw" required>
                        </div>
                        <div class="form-group">
                            <input style="width: 100%" type="submit" value="LOGIN" class="btn py-3 px-4 btn-primary" id="modeBtn">
                        </div>
                        <div id="loginBtn" class="form-group">
                            <a id="custom-login-btn" href="javascript:loginWithKakao()">
                                <img src="static/images/kakao_account_login_btn_medium_narrow.png" />
                                <!--<img src="images/kakaolink_btn_medium.png" />-->
                            </a>
                            <a href="#">
                                <img src="static/images/btn_naver.PNG" />
                                <!--<img src="images/naverBtn.png" />-->
                            </a>
                            <a href="#">
                                <img src="static/images/btn_google_signin_light_normal_web@2x.png" />
                                <!--<img src="images/btn_google_light_normal_ios@2x.png" />-->
                            </a>
                        </div>
                        <div style="overflow: hidden" class="form-group">
                            <a style="float: left" href="javascript:findId()" class="subBtn">아이디 찾기</a>
                            <a style="float: right" href="javascript:findPw()" class="subBtn">비밀번호 찾기</a>
                        </div>
                        <div style="text-align: center" class="form-group">
                            <a href="javascript:join()" class="subBtn">아직 회원이 아니신가요?</a>
                        </div>
                    </form>

                    <!--아이디찾기 폼-->
                    <form id="findIdForm" class="p-5 bg-light">
                        <label for="name">ID 찾기</label>
                        <div class="form-group">
                            <input class="form-control" type="text" id="name" name="name" placeholder="이름(실명)" required>
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="email" id="email" name="email" placeholder="이메일" required>
                        </div>
                        <div class="form-group">
                            <input style="width: 100%" type="submit" value="입력 완료" class="btn py-3 px-4 btn-primary" id="modeBtn">
                        </div>
                        <div style="text-align: center" class="form-group">
                            <a href="javascript:findPw()" class="subBtn">비밀번호 찾기</a>
                        </div>
                        <div style="text-align: center" class="form-group">
                            <a href="javascript:join()" class="subBtn">아직 회원이 아니신가요?</a>
                        </div>
                        <span><a class="ion-ios-arrow-back" href="javascript:backBtn()"> BACK</a></span>
                    </form>

                    <!--비밀번호찾기 폼-->
                    <form id="findPwForm" class="p-5 bg-light">
                        <label for="name">PW 찾기</label>
                        <div class="form-group">
                            <input class="form-control" type="text" id="name" name="name" placeholder="이름(실명)" required>
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="email" id="email" name="email" placeholder="이메일" required>
                        </div>
                        <div class="form-group">
                            <input style="width: 100%" type="submit" value="입력 완료" class="btn py-3 px-4 btn-primary" id="modeBtn">
                        </div>
                        <div style="text-align: center" class="form-group">
                            <a href="javascript:findId()" class="subBtn">아이디 찾기</a>
                        </div>
                        <div style="text-align: center" class="form-group">
                            <a href="javascript:join()" class="subBtn">아직 회원이 아니신가요?</a>
                        </div>
                        <span><a class="ion-ios-arrow-back" href="javascript:backBtn()"> BACK</a></span>
                    </form>
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
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="static/login.js"></script>


</body></html>
