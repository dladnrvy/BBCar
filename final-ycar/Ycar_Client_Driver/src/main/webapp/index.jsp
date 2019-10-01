<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>MainPage</title>
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

    <style>
        .owl-carousel.home-slider .slider-item .slider-text h1 {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 30px;
            font-weight: bold;
        }

        #modeBtn {
            background-color: #6258A4;
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: bold;
            color: #FFF;
            border: 0 !important;
            outline: 0 !important;
        }

        #modeBtn:hover {
            background-color: #413A6D;
        }

        .hero div.vr span:after {
            background-color: #413A6D;
        }

    </style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" href="index.html">YCAR</a>
        </div>
    </nav>

    <section id="home-section" class="hero">
        <img src="static/images/blob-shape-3.svg" class="svg-blob" alt="Colorlib Free Template">
        <div class="home-slider owl-carousel">
            <div class="slider-item">
                <div class="overlay"></div>
                <div class="container-fluid p-0">
                    <div class="row d-md-flex no-gutters slider-text align-items-center justify-content-end" data-scrollax-parent="true">
                        <div class="one-third order-md-last">
                            <div class="img" style="background-image:url(static/images/car.jpg);">
                                <div class="overlay"></div>
                            </div>
                            <div class="bg-primary">
                                <div class="vr"><span class="pl-3 py-4" style="background-color: white">YCAR</span></div>
                            </div>
                        </div>
                        <div class="one-forth d-flex align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                            <div class="text">
                                <!--<span class="subheading pl-5">YCAR carpooling service</span>-->
                                <h1 class="mb-4 mt-3">사용자 모드를 선택해주세요</h1>

                                <p><a href="http://localhost:9090/passenger/login" class="btn btn-primary px-5 py-3 mt-3" id="modeBtn">탑승자모드 <span class="ion-ios-arrow-forward"></span></a></p>
                                <p><a href="http://localhost:8080/driver/login" class="btn btn-primary px-5 py-3 mt-3" id="modeBtn">운전자모드 <span class="ion-ios-arrow-forward"></span></a></p>
                            </div>
                        </div>
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
    <script>
        /* function userType(num) {
            sessionStorage.setItem("userType", num);
            location.href = "http://localhost:9090/pClient/login";
        } */

    </script>

</body>

</html>
    