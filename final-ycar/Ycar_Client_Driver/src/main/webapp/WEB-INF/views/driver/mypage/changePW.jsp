<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>연차::비밀번호 변경</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
    <link rel="stylesheet" href="../static/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../static/css/animate.css">

    <link rel="stylesheet" href="../static/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../static/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../static/css/magnific-popup.css">

    <link rel="stylesheet" href="../static/css/aos.css">

    <link rel="stylesheet" href="../static/css/ionicons.min.css">

    <link rel="stylesheet" href="../static/css/flaticon.css">
    <link rel="stylesheet" href="../static/css/icomoon.css">
    <link rel="stylesheet" href="../static/css/style.css">
    <link rel="stylesheet" href="../static/ny/login.css">
    <style>
    	#hiddenform {
    		display: block;
    	}
    </style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    <!-- <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" href="index.html">연차 &nbsp;ycar</a>
            <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>

            <div class="collapse navbar-collapse" id="ftco-nav">
               <ul class="navbar-nav nav ml-auto" id="navbar">
                    <li class="nav-item"><a href="" class="nav-link"><span>Home</span></a></li>
					<li class="nav-item"><a href="" class="nav-link"><span>LIST</span></a></li>
					<li class="nav-item"><a href="" class="nav-link"><span>PAY</span></a></li>
					<li class="nav-item"><a href="" class="nav-link"><span>REVIEW</span></a></li>
					<li class="nav-item"><a href="mypage" class="nav-link"><span>MyPage</span></a></li>
					<li class="nav-item"><a href="" class="nav-link"><span>Logout</span></a></li>
                </ul>
            </div>
        </div>
    </nav> -->
    <!--navbar 시작-->
	<%@ include file="/paymentAndReview/frame/driverNavbar.jsp"%>
	<!--navbar 끝 -->

    <!--회원가입 1-->
    <section class="hero-wrap" style="background-image: url('../static/images/bg_5.jpeg');" id="bgimage">
        <div class="overlay"></div>
        <div class="container">

            
                <div class="row pt-5">
                    <div id="hiddenform" class="search-wrap-1 ftco-animate col-lg-4"></div>
                       
                    <div class="comment-form-wrap col-md-6 col-lg-4 pt-3">
                        <form class="p-3 bg-light search-property-1" id="LoginForm">
                            <div class="day-wrap">
                                <h3 class="pl-5">ycar 비밀번호변경</h3>
                                <input type="hidden" value="${loginInfo.d_idx}" id="hiddenIDX">
                                <p id="chkPW_msg"></p>
                            </div>
                            <div class="form-group">
                                <label for="curPW">현재 비밀번호를 입력해 주세요</label>
                                <input type="password" class="form-control inputbox" id="curPW" placeholder="현재 비밀번호">
                                <input type="checkbox" id="curPW_chkbox">
                                <span id="curPW_msg"></span>
                            </div>
                            <div class="form-group">
                                <div><span class="btn btn-black form-control" id="jtype1" onclick="checkMyCurPW()">확 인</span></div>
                            </div>

                        </form>
                        <!-- checkMyCurPW -->
                        
                        <form class="p-3 bg-light search-property-1" id="LoginForm2">
                            <div class="day-wrap">
                                <h3 class="pl-5">ycar 비밀번호변경</h3>
                            </div>
                            <div class="form-group">
                                <label for="pw">변경할 비밀번호 *</label>
                                <input type="password" class="form-control inputbox" id="pw" placeholder="새로운 비밀번호를 입력해 주세요">
                                <input type="checkbox" id="pw_chkbox">
                                <span id="pw_msg"></span>
                            </div>
                            <div class="form-group">
                                <label for="pw2">비밀번호 확인 *</label>
                                <input type="password" class="form-control inputbox" id="pw2" placeholder="비밀번호 확인">
                                <input type="checkbox" id="pw2_chkbox">
                                <span id="pw2_msg"></span>
                            </div>
                            
                            <div class="form-group pt-3">
                                <span class="btn btn-black form-control" id="findID" onclick="updatePW()">변 경</span>
                                <input type="checkbox" id="fid_chkbox">
                            </div>
                        </form>
                        
                    </div>

                </div>
            </div>
    </section>
    <!--회원가입 1-->


    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg></div>


    <script src="../static/js/jquery.min.js"></script>
    <script src="../static/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="../static/js/popper.min.js"></script>
    <script src="../static/js/bootstrap.min.js"></script>
    <script src="../static/js/jquery.easing.1.3.js"></script>
    <script src="../static/js/jquery.waypoints.min.js"></script>
    <script src="../static/js/jquery.stellar.min.js"></script>
    <script src="../static/js/owl.carousel.min.js"></script>
    <script src="../static/js/jquery.magnific-popup.min.js"></script>
    <script src="../static/js/aos.js"></script>
    <script src="../static/js/jquery.animateNumber.min.js"></script>
    <script src="../static/js/scrollax.min.js"></script>

    <script src="../static/js/main.js"></script>
    <script src="../static/ny/changePW.js"></script>

</body></html>