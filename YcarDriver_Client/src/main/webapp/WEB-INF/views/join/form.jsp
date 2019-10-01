<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>연차::회원가입</title>
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
    <link rel="stylesheet" href="static/ny/join.css">
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" href="index.html">연차 &nbsp;ycar</a>
            <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>

            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav nav ml-auto">
                    <li class="nav-item"><a href="" class="nav-link"><span>Home</span></a></li>
                    <li class="nav-item"><a href="login" class="nav-link"><span>Login</span></a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!--회원가입 1-->
    <section class="hero-wrap" style="background-image: url('static/images/destination-single.jpg');" id="bgimage">
        <div class="overlay"></div>
        <div class="container">

            
                <div class="row pt-5">
                    <div id="hiddenform" class="search-wrap-1 ftco-animate col-lg-4"></div>
                    <div class="comment-form-wrap col-md-6 col-lg-4 pt-3">
                       
                        <form class="p-3 bg-light search-property-1" id="signUpSelect">
                            <div class="day-wrap"><h3 class="pl-5">How to Join ycar</h3></div>
                            <div class="form-group">
                                <div><span class="btn btn-black form-control" id="jtype1" onclick="step1('S')">간편 가입하기</span></div>
                                <div><span class="btn btn-black form-control" id="jtype2" onclick="jumpToStep2('K')">카카오톡 아이디로 가입하기</span></div>
                                <div><span class="btn btn-black form-control" id="jtype3" onclick="jumpToStep2('N')">네이버 아이디로 가입하기</span></div>
                                <div><span class="btn btn-black form-control" id="jtype4" onclick="jumpToStep2('G')">구글 아이디로 가입하기</span></div>
                            </div>
                        </form>
                        <form class="p-3 bg-light search-property-1" id="signUpForm">
                            <div class="day-wrap"><h3 class="pl-5">Join ycar</h3></div>
                            <div class="form-group">
                                <label for="id">ID *</label>
                                <input type="text" class="form-control" id="id">
                                <input type="checkbox" id="idchkbox">
                                <span id="idchkmsg"></span>
                            </div>
                            <div class="form-group">
                                <label for="pw">PW *</label>
                                <input type="password" class="form-control" id="pw">
                                <input type="checkbox" id="pwchkbox">
                                <span id="pwchkmsg"></span>
                            </div>
                            <div class="form-group">
                                <label for="pw2">PW Check *</label>
                                <input type="password" class="form-control" id="pw2">
                                <input type="checkbox" id="pw2chkbox">
                                <span id="pw2chkmsg"></span>
                            </div>
                            <div class="form-group">
                                <label for="email">EMAIL *</label>
                                <input type="text" class="form-control" id="email">
                                <input type="checkbox" id="emailchkbox">
                                <span id="emailchkmsg"></span>
                            </div>
                            
                            <div class="form-group pt-3">
                                <input type="button" value="prev" class="btn py-3 px-4 btn-black" id="prev1">
                                <input type="button" value="next" class="btn py-3 px-4 btn-primary" id="next1" onclick="step2()">
                            </div>

                        </form>
                        
                        
                        <form class="p-3 bg-light search-property-1" id="signUpForm2">
                            <div class="day-wrap">
                            	<h3 class="pl-5">Join ycar :: 직장인증</h3>
                            </div>
                            
                            <div class="form-group">
                                <input type="button" value="회사이메일" class="btn py-3 px-4 btn-primary" id="valEmail" onclick="displayValEmail()">
                                <input type="checkbox" id="echkbox" checked>
                                <input type="button" value="재직증명서" class="btn py-3 px-4 btn-black" id="valPaper" onclick="displayValPaper()">
                                <input type="checkbox" id="pchkbox">
                            </div>
                            <div class="form-group">
                                <p id="cnameNotice">3인 이상 법인 사업장에 소속된 직장인만 가능합니다.</p>
                                <label for="company">회사명</label>
                                <input type="text" class="form-control" id="company">
                                <span id="comchkmsg"></span>
                            </div>
                            <!--이메일인증-->
                            <div id="form_email">
	                            <div class="form-group">
	                                <label for="cemail">회사이메일</label>
	                                <div>
		                                <input type="text" class="form-control col-8" id="cemail">
		                                <span class="btn btn-black" id="sendCode" onclick="verifyEmail()">메일인증</span>
	                                </div>
	                                <input type="checkbox" id="cmchkbox">
                                    <span id="cmchkmsg"></span>
	                            </div>
	                            <div class="form-group" id="joinCode">
	                            </div>
                            </div>
                            <!--재직증명서인증-->
                            <div id="form_paper">
	                            <div class="form-group">
	                                <label for="cnum">사업자번호</label>
	                                <input type="text" class="form-control" id="cnum">
	                                <span id="numchkmsg"></span>
	                            </div>
	                            <div class="form-group">
	                                <input type="button" value="인증하기" class="btn btn-primary form-control" id="chkNum" onclick="chkCnum()">
	                                <span id=""></span>
	                            </div>    
                            </div>
                            <div class="form-group pt-3">
                                <p id="verifyNotice"></p>
                                <input type="button" value="prev" class="btn py-3 px-4 btn-black" id="prev2">
                                <input type="button" value="next" class="btn py-3 px-4 btn-primary" id="next2" onclick="step3()">
                                <input type="checkbox" id="comchkbox">
                            </div>
                        </form>
                        
                        
                        <form class="p-3 bg-light search-property-1" id="signUpForm3">
                            <div class="day-wrap"><h3 class="pl-5">Join ycar::운전자 인증</h3></div>
                            <div class="form-group">
                                <label for="lscnum">운전면허번호</label>
                                <input type="text" class="form-control" id="lscnum">
                                <span id="lscnumchkmsg"></span>
                            </div>
                            
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" id="name">
                                <span id="namechkmsg"></span>
                            </div>
                            
                            <div class="form-group">
                                <label for="idnum1">주민등록번호 앞 6자리</label>
                                <input type="text" class="form-control" id="idnum1">
                                <span id="idnum1chkmsg"></span>
                            </div>
                            <div class="form-group">
                                <label for="idnum2">주민등록번호 뒤 1자리</label>
                                <input type="text" class="form-control" id="idnum2">
                                <span id="idnum2chkmsg"></span>
                            </div>
                            <div class="form-group">
                                <label for="lsctype">면허 종류</label>
                                <div class="form-field">
                                    <div class="select-wrap">
                                        <select name="lsctype" id="lsctype" class="form-control">
                                            <option value="A">1종 보통</option>        
                                            <option value="B">2종 보통</option>        
                                        </select>
                                    </div>
                                </div>
                                <span id="lsctypechkmsg"></span>
                            </div>
                            <div class="form-group">
                                <label for="sdate">허가일자</label>
                                <input type="text" class="form-control" id="sdate">
                                <span id="sdatechkmsg"></span>
                            </div>
                            <div class="form-group">
                                <label for="police">경찰청</label>
                                <input type="text" class="form-control" id="police">
                                <span id="policechkmsg"></span>
                            </div>
                            <div class="form-group pt-3">
                                <input type="button" value="prev" class="btn py-3 px-4 btn-black" id="prev3"><input type="button" value="next" class="btn py-3 px-4 btn-primary" id="next3" onclick="step4()">
                            </div>

                        </form>
                        <form class="p-3 bg-light search-property-1" id="signUpForm4">
                            <div class="day-wrap"><h3 class="pl-5">Join ycar::자동차등록</h3></div>
                            <div class="form-group">
                                <label for="carnum">자동차번호</label>
                                <input type="text" class="form-control" id="carnum">
                                <span id="carnumchkmsg"></span>
                            </div>
                            <div class="form-group">
                                <label for="cartype">차종류</label>
                                <div class="form-field">
                                    <div class="select-wrap">
                                        <select name="cartype" id="cartype" class="form-control">
                                            <option value="S">소형</option>
                                            <option value="M">중형</option>
                                            <option value="L">대형</option>
                                        </select>
                                    </div>
                                </div>
                                <span id="cartypechkmsg"></span>
                            </div>
                            <div class="form-group pt-3">
                                <input type="button" value="prev" class="btn py-3 px-4 btn-black" id="prev4"><input type="button" value="next" class="btn py-3 px-4 btn-primary" id="next4" onclick="step5()">
                            </div>
                        </form>
                        <form class="p-3 bg-light search-property-1" id="signUpForm5">
                            <div class="day-wrap"><h3 class="pl-5">Join ycar</h3></div>
                            <div class="form-group">
                                선호하는 운전환경을 선택해 주세요
                                <p>복수선택 가능</p>
                                
                                <div>
	                                <label for ="drivetype1"><input type="checkbox" name="drivetype" id="drivetype1" value="a" class="drivechk">
	                                	<span class="btn btn-black form-control" >동성</span>
	                                </label>
                                </div>
                                
                                <div>
	                                <label for ="drivetype2"><input type="checkbox" name="drivetype" id="drivetype2" value="b" class="drivechk">
	                                	<span class="btn btn-black form-control" >조용</span>
	                                </label>
                                </div>
                            
                                <div>
	                                <label for ="drivetype3"><input type="checkbox" name="drivetype" id="drivetype3" value="c" class="drivechk">
	                                	<span class="btn btn-black form-control" >뒷자리가능</span>
	                                </label>
                                </div>
                            
                                <div>
	                                <label for ="drivetype4"><input type="checkbox" name="drivetype" id="drivetype4" value="d" class="drivechk">
	                                	<span class="btn btn-black form-control" >금연</span>
	                                </label>
                                </div>
                            
                                <div>
	                                <label for ="drivetype5"><input type="checkbox" name="drivetype" id="drivetype5" value="e" class="drivechk">
	                                	<span class="btn btn-black form-control" >천천히</span>
	                                </label>
                                </div>
                            
                                <div>
	                                <label for ="drivetype6"><input type="checkbox" name="drivetype" id="drivetype6" value="f" class="drivechk">
	                                	<span class="btn btn-black form-control" >빠르게</span>
	                                </label>
                                </div>
                            </div>
                            
                            <div class="form-group pt-3">
                                <input type="button" value="prev" class="btn py-3 px-4 btn-black" id="prev5">
                                <input type="button" value="join" class="btn py-3 px-4 btn-primary" id="next5" onclick="join()">
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
    <script src="static/ny/join.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</body></html>