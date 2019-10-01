<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>연차::로그인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
    <link rel="stylesheet" href="static/css/open-iconic-bootstrap.min.css"  type="text/css">
    <link rel="stylesheet" href="static/css/animate.css" type="text/css">

    <link rel="stylesheet" href="static/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="static/css/owl.theme.default.min.css" type="text/css">
    <link rel="stylesheet" href="static/css/magnific-popup.css" type="text/css">

    <link rel="stylesheet" href="static/css/aos.css" type="text/css">

    <link rel="stylesheet" href="static/css/ionicons.min.css" type="text/css">

    <link rel="stylesheet" href="static/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="static/css/icomoon.css" type="text/css">
    <link rel="stylesheet" href="static/css/style.css" type="text/css">
    <link rel="stylesheet" href="static/ny/login.css" type="text/css">
    <%-- <link rel="stylesheet" href='<c:url value="/static/ny/login.css" />'> --%>
    
    
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" href="index.html">연차 &nbsp;ycar</a>
            <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>
        </div>
    </nav>

    <!--회원가입 1-->
    <section class="hero-wrap" style="background-image: url('static/images/bg_5.jpeg');" id="bgimage">
        <div class="overlay"></div>
        <div class="container">

            
                <div class="row pt-5">
                    <div id="hiddenform" class="search-wrap-1 ftco-animate col-lg-4"></div>
                       
                    <div class="comment-form-wrap col-md-6 col-lg-4 pt-3">
                        <form class="p-3 bg-light search-property-1" id="LoginForm">
                            <div class="day-wrap">
                                <h3 class="pl-5">ycar 로그인</h3>
                                <p id="login_msg"></p>
                            </div>
                            <div class="form-group">
                                <label for="id">ID *</label>
                                <input type="text" class="form-control inputbox" id="id" placeholder="아이디"><input type="checkbox" id="idchkbox">
                                <span id="idchkmsg"></span>
                            </div>
                            <div class="form-group">
                                <label for="pw">PW *</label>
                                <input type="password" class="form-control inputbox" id="pw" placeholder="비밀번호"><input type="checkbox" id="pwchkbox">
                                <span id="pwchkmsg"></span>
                            </div>
                            <div class="form-group">
                                <div><span class="btn btn-black form-control" id="jtype1" onclick="login()">로그인</span></div>
                            </div>

                            <div class="form-group pt-3">
                                <div><span class="btn btn-black form-control" id="jtype2" onclick="loginWithKakao()">카카오톡 아이디로 로그인</span></div>
                                <div><span class="btn btn-black form-control" id="jtype3" onclick="">네이버 아이디로 로그인</span></div>
                                <div><span class="btn btn-black form-control" id="jtype4" onclick="">구글 아이디로 로그인</span></div>
                            </div>
                            <div class="form-group pt-3">
                                <span class="py-3 px-4 textbox" id="prev1" onclick="show_findID()">아이디 찾기</span>
                                <span class="py-3 px-4 textbox" id="next1" onclick="show_findPW()">패스워드 찾기</span>
                                <div class="pt-3" id="textboxwrap"><a href="join"><p class="textbox" id="join">아직 회원이 아니신가요?</p></a></div>
                            </div>
                        </form>
                        
                        
                        <form class="p-3 bg-light search-property-1" id="LoginForm2">
                            <div class="day-wrap">
                                <h3 class="pl-5">아이디 찾기</h3>
                                <p id="fid_msg" class="warn_blue"></p>
                            </div>
                            <div class="form-group">
                                <label for="fid_name">이름 *</label>
                                <input type="text" class="form-control inputbox" id="fid_name" placeholder="성함">
                                <input type="checkbox" id="fid_name_chkbox">
                                <span id="fid_name_msg"></span>
                            </div>
                            <div class="form-group">
                                <label for="fid_email">이메일 *</label>
                                <input type="text" class="form-control inputbox" id="fid_email" placeholder="가입시 입력한 이메일">
                                <input type="checkbox" id="fid_email_chkbox">
                                <span id="fid_email_msg"></span>
                            </div>
                            
                            <div class="form-group pt-3">
                                <span class="btn btn-black form-control" id="findID" onclick="searchID()">아이디 찾기</span>
                                <span class="btn btn-black form-control btn_goto_login" onclick="loginForm()">로그인 하기</span>
                                <input type="checkbox" id="fid_chkbox">
                            </div>
                        </form>
                        
                        
                        <form class="p-3 bg-light search-property-1" id="LoginForm3">
                            <div class="day-wrap">
                                <h3 class="pl-5">패스워드 찾기</h3>
                                <p id="fpw_msg" class="warn_blue"></p>
                            </div>
                            <div class="form-group">
                                <label for="fpw_id">아이디 *</label>
                                <input type="text" class="form-control inputbox" id="fpw_id" placeholder="아이디">
                                <input type="checkbox" id="fpw_id_chkbox">
                                <span id="fpw_id_msg"></span>
                            </div>
                            <div class="form-group">
                                <label for="fpw_email">이메일 *</label>
                                <input type="text" class="form-control inputbox" id="fpw_email" placeholder="가입시 입력한 이메일">
                                <input type="checkbox" id="fpw_email_chkbox">
                                <span id="fpw_email_msg"></span>
                            </div>
                            
                            <div class="form-group pt-3">
                                <span class="btn btn-black form-control" id="findPW" onclick="searchPW()">패스워드 찾기</span>
                                <span class="btn btn-black form-control btn_goto_login" onclick="loginForm()">로그인 하기</span>
                                <input type="checkbox" id="fpw_chkbox">
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
    <script src="static/ny/login.js"></script>
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


</body></html>