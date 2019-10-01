<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>YeonCar</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!--<link rel="stylesheet" href="/resources/demos/style.css">-->

    <!-- 한글 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<style>
    body {
        background-color: #FFFEF4;
        height: 100%;

    }

    .container {
        margin: 0 auto;
        /*padding-left: 150px;*/
    }

    #ftco-nav {
        font-family: 'Noto Sans KR', sans-serif;
    }

    .row {
        font-family: 'Noto Sans KR', sans-serif;
        /*padding-left: 150px;*/
        margin: 0 auto;
        width: 500px;
    }

    .form-field {
        width: 400px;
    }

    #tocommute {
        background-color: white;
    }

    .col-lg align-items-end {
        display: inline;
    }


    .mb-4 {
        margin-top: 100px;
        font-family: 'Noto Sans KR', sans-serif;
    }

    .check {
        display: none;
        color: red;
        margin-left: 10px;
        font-family: 'Noto Sans KR', sans-serif;
        margin-top: 5px;
    }


    #home-section {
        margin-top: 100px;
    }

    .ftco-navbar-light.scrolled {
        background-color: #FFFEF4 !important;
    }

    #footer {
        height: 100px;
    }

    .label {
        color: black;
        margin-bottom: 5px;
        font-weight: bolder;
    }

    .com {
        color: #757575;
        margin-bottom: 10px;
    }

    .text {
        border-radius: 5px;
        border: 1px solid #DDD;
        height: 40px;
        width: 300px;
        padding-left: 10px;
        margin-left: 5px;
        margin-right: 10px;
    }

    .texts {
        border-radius: 5px;
        border: 1px solid #DDD;
        height: 40px;
        width: 182px;
        padding-left: 10px;
        color: #757575;
    }

    .setext {
        border-radius: 5px;
        border: 1px solid #DDD;
        height: 40px;
        width: 300px;
        padding-left: 10px;
        color: #757575;
    }

    #tocommute {
        margin-right: 20px;
        margin-left: 5px;
    }

    #tocommutss {
        margin-right: 20px;
    }

    .toworktime {
        color: #757575;
    }

    .toworktimes {
        color: #757575;
    }

    #startCSS {
        margin-bottom: 10px;
    }

    #start {
        margin-left: 10px;
        margin-bottom: 10px;
    }

    #end {
        margin-left: 10px;
        margin-right: 10px;
    }

    #routesearch {
        width: 100px;

    }

    #submit {
        width: 400px;
        height: 60px;
    }

    #searchSP {
        width: 102px;
    }

    #searchEP {
        width: 102px;
    }

    .box-radio-input input[type="radio"] {
        display: none;
    }

    .box-radio-input input[type="radio"]+span {
        display: inline-block;
        background: none;
        border: 1px solid #dfdfdf;
        padding: 0px 10px;
        text-align: center;
        height: 35px;
        line-height: 33px;
        font-weight: 500;
        cursor: pointer;
        width: 102px;
        border-radius: 5px;
        margin-left: 5px;
    }

    .box-radio-input input[type="radio"]:checked+span {
        border-radius: 5px;
        width: 102px;
        border: 1px solid #6258a4;
        background: #6258a4;
        color: #fff;
        margin-bottom: 10px;
        
</style>



<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">


    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" href="index.html">YCAR</a>
            <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>

            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav nav ml-auto">
                    <li class="nav-item"><a href="#" class="nav-link"><span>카풀등록</span></a></li>
                    <li class="nav-item"><a href="carpool.jsp" class="nav-link"><span>카풀요청</span></a></li>
                    <li class="nav-item"><a href="carpoolList.jsp" class="nav-link"><span>나의카풀</span></a></li>
                    <li class="nav-item"><a href="#destination-section" class="nav-link"><span>결제</span></a></li>
                    <li class="nav-item"><a href="#hotel-section" class="nav-link"><span>후기</span></a></li>
                    <li class="nav-item"><a href="#restaurant-section" class="nav-link"><span>마이페이지</span></a></li>
                    <li class="nav-item"><a href="#blog-section" class="nav-link"><span>로그아웃</span></a></li>
                </ul>
            </div>
        </div>
    </nav>


    <!--class="form-control checkin_date"-->

    <section id="home-section" class="ftco-section ftco-no-pb ftco-no-pt">
        <div class="container">
            <div class="row justify-content-center pb-0 pb-mb-5 pt-5 pt-md-0">
                <div class="col-md-12 heading-section ftco-animate">

                    <h2 class="mb-4">카풀등록
                    </h2>

                </div>
            </div>
            <div class="row">
                <!--<div class="col-md-12">-->
                <!--<div class="search-wrap-1 ftco-animate p-4">-->
                <form id="rvForm">
                    <div id=""></div>
                    <div class="col-lg align-items-end">
                        <label for="#" class="label">출퇴근</label>
                        <br>
                        <label class="box-radio-input"><input type="radio" class="work" id="towork" name="work" value="출근" ><span>출근</span></label>
                        <label class="box-radio-input"><input type="radio" class="work" id="fromwork" name="work" value="퇴근"><span>퇴근</span></label>

                        <!--<input type="radio" id="towork" name="work" class="work" value="출근"><label class="com">출근</label>
                        <input type="radio" id="fromwork" name="work" class="work" value="퇴근"><label class="com">퇴근</label>-->

                        <span id="workCheck" class="check">출근 또는 퇴근을 선택해주세요.</span>


                        <div class="form-group">
                            <label for="#" class="label">Date</label>
                            <div class="form-field">

                                <input type="text" class="text" placeholder="날짜를 선택해주세요" id="datepicker" name="p_date">

                                <span id="dateCheck" class="check">날짜를 선택해주세요.</span>
                            </div>
                        </div>
                    </div>




                    <!--</div>-->
                    <div class="col-lg align-items-end">
                        <div class="form-group">
                            <label for="#" class="label">픽업가능시간</label>
                            <br>

                            <!--시간 value-->
                            <select name="commute" class="texts" id="tocommute">
                                <option class="toworktime" hidden>선택</option>
                                <option value="07:00" class="toworktime">07:00</option>
                                <option value="07:15" class="toworktime">07:15</option>
                                <option value="07:30" class="toworktime">07:30</option>
                                <option value="07:45" class="toworktime">07:45</option>
                                <option value="08:00" class="toworktime">08:00</option>
                                <option value="08:15" class="toworktime">08:15</option>
                                <option value="08:30" class="toworktime">08:30</option>
                                <option value="08:45" class="toworktime">08:45</option>
                                <option value="09:00" class="toworktime">09:00</option>

                                <option value="18:00" class="fromworktime">18:00</option>
                                <option value="18:15" class="fromworktime">18:15</option>
                                <option value="18:30" class="fromworktime">18:30</option>
                                <option value="18:45" class="fromworktime">18:45</option>
                                <option value="19:00" class="fromworktime">19:00</option>
                                <option value="19:15" class="fromworktime">19:15</option>
                                <option value="19:30" class="fromworktime">19:30</option>
                                <option value="19:30" class="fromworktime">19:45</option>
                                <option value="20:00" class="fromworktime">20:00</option>
                            </select>
                            <label id="tocommutss">-</label>

                            <!--시간 value-->
                            <select name="commute" class="texts" id="tocommutes">
                                <option class="toworktimes" hidden>선택</option>
                                <option value="07:15" class="toworktimes">07:15</option>
                                <option value="07:30" class="toworktimes">07:30</option>
                                <option value="07:45" class="toworktimes">07:45</option>
                                <option value="08:00" class="toworktimes">08:00</option>
                                <option value="08:15" class="toworktimes">08:15</option>
                                <option value="08:30" class="toworktimes">08:30</option>
                                <option value="08:45" class="toworktimes">08:45</option>
                                <option value="09:00" class="toworktimes">09:00</option>
                                <option value="09:15" class="toworktimes">09:15</option>
                                <option value="09:30" class="toworktimes">09:30</option>
                                <option value="09:45" class="toworktimes">09:45</option>
                                <option value="10:00" class="toworktimes">10:00</option>


                                <option value="18:15" class="fromworktimes">18:15</option>
                                <option value="18:30" class="fromworktimes">18:30</option>
                                <option value="18:45" class="fromworktimes">18:45</option>
                                <option value="19:00" class="fromworktimes">19:00</option>
                                <option value="19:15" class="fromworktimes">19:15</option>
                                <option value="19:30" class="fromworktimes">19:30</option>
                                <option value="19:45" class="fromworktimes">19:45</option>
                                <option value="20:00" class="fromworktimes">20:00</option>
                                <option value="20:15" class="fromworktimes">20:15</option>
                                <option value="20:30" class="fromworktimes">20:30</option>
                                <option value="20:45" class="fromworktimes">20:45</option>
                                <option value="21:00" class="fromworktimes">21:00</option>
                            </select>
                            <br>
                            <span id="timeCheck" class="check">시간을 선택해주세요.</span>


                        </div>

                        <div id="map">
                            <label for="#" class="label">경로선택</label><br>
                            <div id="routeCSS">
                                <div id="startCSS">
                                    <label for="#">출발지</label><br>
                                    <!--지도 div-->
                                    <input type="text" class="text" id="startPoint" placeholder="검색어를 입력해주세요" value="">
                                    <input type="button" class="btn btn-primary" id="searchSP" onclick="searchPOI(countS+1);" value="검색">
                                    <br>

                                </div>

                                <div id="endCSS">
                                    <label for="#">도착지</label><br>
                                    <input type="text" class="text" id="endPoint" placeholder="검색어를 입력해주세요" value="">
                                    <input type="button" class="btn btn-primary" id="searchEP" onclick="searchPOIs(countE+1);" value="검색">
                                    <br>




                                    <span id="routeCheck" class="check">출발지와 도착지를 검색해주세요.</span>


                                </div>
                            </div>
                            <br>








                            <div id="map_div">
                            </div>
                            <br>
                            <div id="mapDIV">
                                <input type="text" class="setext" id="start" placeholder="출발지" readonly><br>
                                <input type="text" class="setext" id="end" placeholder="도착지" readonly>
                                <input type="button" class="btn btn-primary" id="routesearch" onclick="route();" value="경로검색">

                                <span id="searchCheck" class="check">경로검색은 필수입니다.</span>
                                <br>
                            </div>

                            <input type="hidden" id="startlon" value="">
                            <input type="hidden" id="startlat" value="">
                            <input type="hidden" id="endlon" value="">
                            <input type="hidden" id="endlat" value="">

                            <input type="hidden" id="distance" value="">
                            <input type="hidden" id="time" value="">
                            <input type="hidden" id="fare" value="">
                            <input type="hidden" id="taxifare" value="">

                            <p id="result"></p>
                            <!--지도 div끝-->
                            <br>

                            <div class="col-lg align-self-end">
                                <div class="form-group">
                                    <div class="form-field">
                                        <input type="submit" value="등  록" id="submit" class="btn btn-primary">
                                        <div id="footer">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>


                </form>
            </div>
        </div>
        <!--</div>-->
        <!-- </div>-->

    </section>



    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-migrate-3.0.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.stellar.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/jquery.animateNumber.min.js"></script>
    <script src="js/scrollax.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=61f9f7ec-2010-4d26-97e1-806dc10dce63"></script>
    <!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8">-->
    <script>
        $(function() {
            $("#datepicker").datepicker({
                dateFormat: 'yy-mm-dd'
            });
        });




        //날짜 api


        //출퇴근에 따른 변화
        $('#towork').change(function() {
            if ($('#towork').prop('checked') == true) {
                $('.toworktime').css('display', 'block');
                $('.fromworktime').css('display', 'none');
                $('.toworktimes').css('display', 'block');
                $('.fromworktimes').css('display', 'none');
                $('#tocommute').val("선택");
                $('#tocommutes').val("선택");

            }
        });

        $('#fromwork').change(function() {
            if ($('#fromwork').prop('checked') == true) {
                $('.toworktime').css('display', 'none');
                $('.fromworktime').css('display', 'block');
                $('.toworktimes').css('display', 'none');
                $('.fromworktimes').css('display', 'block');
                $('#tocommute').val("선택");
                $('#tocommutes').val("선택");

            }
        });


        $(document).ready(function() {
            initTmap();
        });

        //운전자 idx 값
        var d_idx = 2;


        //--------지도 시작---------
        var map, markerLayer;
        var tdata;
        var markers;
        var marker;
        var countS = 0;
        var countE = 0;
        // map 생성
        // Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.                  
        function initTmap() {
            map = new Tmap.Map({
                div: "map_div", // map을 표시해줄 div
                width: "100%", // map의 width 설정
                height: "380px", // map의 height 설정
            });
            addMarkerLayer();


        }



        //레이어에 마커레이어를 추가해주는 함수입니다.
        function addMarkerLayer() {
            markerLayer = new Tmap.Layer.Markers("marker"); //마커레이어를 생성합니다.
            map.addLayer(markerLayer); //map에 마커레이어를 추가합니다.
        };

        // 출발지 검색
        function searchPOI(countS) {

            var startPoint = $('#startPoint').val();

            if (startPoint == "") {
                alert('검색하고자 하는 곳을 입력해주세요.');
                $('#startPoint').focus();
                return;
            }

            tdata = new Tmap.TData();
            tdata.getPOIDataFromSearch(encodeURIComponent(startPoint), {
                /*centerLon: center.lon,
                centerLat: center.lat,*/
                reqCoordType: "EPSG3857",
                resCoordType: "EPSG3857"
            });
            tdata.events.register("onComplete", tdata, onCompleteTData);

            console.log(countS);

            //재검색시 맵초기화
            if (countS > 0) {
                console.log(countS);
                $('#searchSP').click(function() {

                    map.events.clearMouseCache();
                    map.destroy();
                    initTmap();
                });
            }

        }

        //검색한값 정보
        function onCompleteTData(e) {
            if (jQuery(this.responseXML).find("searchPoiInfo pois poi").text() != '') {
                jQuery(this.responseXML).find("searchPoiInfo pois poi").each(function() { //결과를 each문으로 돌려 마커를 등록합니다.
                    //response 데이터중 원하는 값을 find 함수로 찾습니다.

                    var lon = jQuery(this).find("frontLon").text();
                    var lat = jQuery(this).find("frontLat").text();
                    var name = jQuery(this).find("name").text();
                    var id = jQuery(this).find("id").text();
                    var options = {
                        label: new Tmap.Label(name), //마커 라벨 text 설정
                        lonlat: new Tmap.LonLat(lon, lat) //마커 라벨 좌표 설정

                    };
                    addMarker(options); //마커를 추가하는 함수입니다.

                });
            } else {
                alert('검색값이 없습니다.');
            }
            map.zoomToExtent(markerLayer.getDataExtent()); //마커 레이어의 최대 익스텐트를 계산해 이에 맞게 지도를 줌합니다.
            tdata.events.unregister("onComplete", tdata, onCompleteTData); //onCompleteTData 이벤트 등록 해제
        }

        //마커 생성
        function addMarker(options) {
            var size = new Tmap.Size(24, 38); //아이콘 크기 설정
            var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
            var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png />', size, offset); //마커 아이콘 설정
            marker = new Tmap.Markers(options.lonlat, icon, options.label); //위에서 설정한 값을 통해 마커를 생성합니다.
            markerLayer.addMarker(marker); //마커 레이어에 마커 추가
            marker.events.register("mouseover", marker, onOverMouse); //mouseover 이벤트, 마커에 마우스 커서를 올리면 실행하는 이벤트를 등록합니다. 
            marker.events.register("mouseout", marker, onOutMouse); //mouseout 이벤트, 마우스 커서가 마커에서 벗어나면 실행하는 이벤트를 등록합니다.
            marker.events.register("click", marker, onClickMouse); //click 이벤트, 마커를 클릭하면 실행하는 이벤트를 등록합니다.


        }

        //mouseover 이벤트 함수
        function onOverMouse(e) {
            this.popup.show(); //팝업을 보여준다.

        }
        //mouseout 이벤트 함수
        function onOutMouse(e) {
            this.popup.hide(); //팝업을 숨긴다.
        }
        //click 이벤트 함수
        function onClickMouse(e) {

            console.log(this.lonlat);
            console.log(this.labelHtml);

            change(this.lonlat, this.labelHtml);

        }


        // 도착지 검색
        function searchPOIs(countE) {

            var endPoint = $('#endPoint').val();

            if (endPoint == "") {
                alert('검색하고자 하는 곳을 입력해주세요.');
                $('#endPoint').focus();
                return;
            }


            /*alert(endPoint);*/

            tdata = new Tmap.TData();
            tdata.getPOIDataFromSearch(encodeURIComponent(endPoint), {
                /*centerLon: center.lon,
                centerLat: center.lat,*/
                reqCoordType: "EPSG3857",
                resCoordType: "EPSG3857"
            });
            tdata.events.register("onComplete", tdata, onCompleteTDatas);

            //재검색시 맵초기화
            if (countE > 0) {
                $('#searchEP').click(function() {


                    map.events.clearMouseCache();
                    map.destroy();
                    initTmap();
                });
            }

        }

        //검색한값 정보
        function onCompleteTDatas(e) {
            if (jQuery(this.responseXML).find("searchPoiInfo pois poi").text() != '') {
                jQuery(this.responseXML).find("searchPoiInfo pois poi").each(function() { //결과를 each문으로 돌려 마커를 등록합니다.
                    //response 데이터중 원하는 값을 find 함수로 찾습니다.

                    var lon = jQuery(this).find("frontLon").text();
                    var lat = jQuery(this).find("frontLat").text();
                    var name = jQuery(this).find("name").text();
                    var id = jQuery(this).find("id").text();
                    var options = {
                        label: new Tmap.Label(name), //마커 라벨 text 설정
                        lonlat: new Tmap.LonLat(lon, lat) //마커 라벨 좌표 설정

                    };
                    addMarkers(options); //마커를 추가하는 함수입니다.

                });
            } else {
                alert('검색값이 없습니다.');
            }
            map.zoomToExtent(markerLayer.getDataExtent()); //마커 레이어의 최대 익스텐트를 계산해 이에 맞게 지도를 줌합니다.
            tdata.events.unregister("onComplete", tdata, onCompleteTDatas); //onCompleteTData 이벤트 등록 해제
        }

        //마커 생성
        function addMarkers(options) {

            var size = new Tmap.Size(24, 38); //아이콘 크기 설정
            var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
            var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png />', size, offset); //마커 아이콘 설정

            markers = new Tmap.Markers(options.lonlat, icon, options.label); //위에서 설정한 값을 통해 마커를 생성합니다.
            markerLayer.addMarker(markers); //마커 레이어에 마커 추가*/

            markers.events.register("mouseover", markers, onOverMouses); //mouseover 이벤트, 마커에 마우스 커서를 올리면 실행하는 이벤트를 등록합니다. 
            markers.events.register("mouseout", markers, onOutMouses); //mouseout 이벤트, 마우스 커서가 마커에서 벗어나면 실행하는 이벤트를 등록합니다.
            markers.events.register("click", markers, onClickMouses); //click 이벤트, 마커를 클릭하면 실행하는 이벤트를 등록합니다.


        }

        //mouseover 이벤트 함수
        function onOverMouses(e) {
            this.popup.show(); //팝업을 보여준다.
        }
        //mouseout 이벤트 함수
        function onOutMouses(e) {
            this.popup.hide(); //팝업을 숨긴다.
        }
        //click 이벤트 함수
        function onClickMouses(e) {

            console.log(this.lonlat);
            console.log(this.labelHtml);

            changes(this.lonlat, this.labelHtml);

        }




        //lonlat 변환 후, 변환 값 value에 저장
        function change(lonlat, labelHtml) {

            var pr_3857 = new Tmap.Projection("EPSG:3857");
            var pr_4326 = new Tmap.Projection("EPSG:4326");


            var lonlat = new Tmap.LonLat(lonlat.lon.toString(), lonlat.lat.toString()).transform(pr_3857, pr_4326);


            $('#start').val(labelHtml.toString());
            $('#startlon').val(lonlat.lon.toString());
            $('#startlat').val(lonlat.lat.toString());


            map.events.clearMouseCache();
            map.destroy();

            initTmap();

        }

        //lonlat 변환 후, 변환 값 value에 저장
        function changes(lonlat, labelHtml) {

            var pr_3857 = new Tmap.Projection("EPSG:3857");
            var pr_4326 = new Tmap.Projection("EPSG:4326");


            var lonlat = new Tmap.LonLat(lonlat.lon.toString(), lonlat.lat.toString()).transform(pr_3857, pr_4326);
            /*var lonlats = new Tmap.LonLat(lonlats.lon.toString(), lonlats.lat.toString()).transform(pr_3857, pr_4326);*/


            $('#end').val(labelHtml.toString());
            $('#endlon').val(lonlat.lon.toString());
            $('#endlat').val(lonlat.lat.toString());

            map.events.clearMouseCache();
            map.destroy();

            initTmap();
        }



        //경로 검색
        function route() {

            
            if ($('#start').val() == null || $('#end').val() == null) {
                alert("출발지와 도착지를 등록해주세요.");
                return false;
            }

            var headers = {};
            headers["appKey"] = '61f9f7ec-2010-4d26-97e1-806dc10dce63' //실행을 위한 키 입니다. 발급받으신 AppKey(서버키)를 입력하세요.
            $.ajax({
                method: "POST",
                headers: headers,
                url: "https://apis.openapi.sk.com/tmap/routes?version=1&format=xml", //자동차 경로안내 api 요청 url입니다.
                async: false,
                data: {

                    //출발지 위경도 좌표입니다.
                    startX: $('#startlon').val(),
                    startY: $('#startlat').val(),
                    //목적지 위경도 좌표입니다.
                    endX: $('#endlon').val(),
                    endY: $('#endlat').val(),
                    //출발지, 경유지, 목적지 좌표계 유형을 지정합니다.
                    reqCoordType: "WGS84GEO",
                    resCoordType: "EPSG3857",
                    //경로 탐색 옵션 입니다.
                    searchOption: 0,
                    //교통정보 포함 옵션입니다.
                    trafficInfo: "Y"

                },
                //데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
                success: function(response) {
                    prtcl = response;

                    // 결과 출력
                    var innerHtml = "";
                    var prtclString = new XMLSerializer().serializeToString(prtcl); //xml to String   
                    xmlDoc = $.parseXML(prtclString),
                        $xml = $(xmlDoc),
                        $intRate = $xml.find("Document");

                    console.log(xmlDoc);

                    var tDistance = /*" 총 거리 : " +*/ ($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue / 1000).toFixed(1); /*+ "km,"*/
                    var tTime = ($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue / 60).toFixed(0) /*+ "분"*/ ;
                    var tFare = /*" 톨 게이트 비용 : " +*/ $intRate[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue /*+ "원,"*/ ;
                    var taxiFare = /*" 예상 택시 요금 : " +*/ $intRate[0].getElementsByTagName("tmap:taxiFare")[0].childNodes[0].nodeValue /*+ "원"*/ ;



                    /*$("#result").text(tDistance + tTime + tFare + taxiFare);*/
                    $('#routeTime').text('약 ' + tTime + '분 정도 걸리는 거리입니다.');
                    $('#distance').val(parseInt(tDistance));
                    $('#time').val(parseInt(tTime));
                    $('#fare').val(parseInt(tFare));
                    //택시비의 60프로 저렴한 가격
                    $('#taxifare').val(parseInt(taxiFare) * 0.6);

                    /* routeLayer.removeAllFeatures(); //레이어의 모든 도형을 지웁니다.*/

                    var traffic = $intRate[0].getElementsByTagName("traffic")[0];
                    //교통정보가 포함되어 있으면 교통정보를 포함한 경로를 그려주고
                    //교통정보가 없다면  교통정보를 제외한 경로를 그려줍니다.
                    if (!traffic) {

                        var prtclLine = new Tmap.Format.KML({
                            extractStyles: true,
                            extractAttributes: true
                        }).read(prtcl); //데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.

                        //표준 데이터 포맷인 KML을 Read/Write 하는 클래스 입니다.
                        //벡터 도형(Feature)이 추가되기 직전에 이벤트가 발생합니다.
                        routeLayer.events.register("beforefeatureadded", routeLayer, onBeforeFeatureAdded);


                        function onBeforeFeatureAdded(e) {
                            var style = {};
                            switch (e.feature.attributes.styleUrl) {
                                case "#pointStyle":
                                    style.externalGraphic = "http://topopen.tmap.co.kr/imgs/point.png"; //렌더링 포인트에 사용될 외부 이미지 파일의 url입니다.
                                    style.graphicHeight = 16; //외부 이미지 파일의 크기 설정을 위한 픽셀 높이입니다.
                                    style.graphicOpacity = 1; //외부 이미지 파일의 투명도 (0-1)입니다.
                                    style.graphicWidth = 16; //외부 이미지 파일의 크기 설정을 위한 픽셀 폭입니다.
                                    break;
                                default:
                                    style.strokeColor = "#ff0000"; //stroke에 적용될 16진수 color
                                    style.strokeOpacity = "1"; //stroke의 투명도(0~1)
                                    style.strokeWidth = "5"; //stroke의 넓이(pixel 단위)
                            };
                            e.feature.style = style;
                        }

                        routeLayer.addFeatures(prtclLine); //레이어에 도형을 등록합니다.
                    } else {

                        //기존 출발,도착지 마커릉 지웁니다.
                        markerLayer.removeMarker(marker);
                        markerLayer.removeMarker(markers);
                        /* routeLayer.removeAllFeatures(); //레이어의 모든 도형을 지웁니다.*/

                        //-------------------------- 교통정보를 그려주는 부분입니다. -------------------------- 
                        var trafficColors = {
                            extractStyles: true,

                            /* 실제 교통정보가 표출되면 아래와 같은 Color로 Line이 생성됩니다. */
                            trafficDefaultColor: "#000000", //Default
                            trafficType1Color: "#009900", //원할
                            trafficType2Color: "#8E8111", //지체
                            trafficType3Color: "#FF0000" //정체

                        };

                        var kmlForm = new Tmap.Format.KML(trafficColors).readTraffic(prtcl);
                        routeLayer = new Tmap.Layer.Vector("vectorLayerID"); //백터 레이어 생성
                        routeLayer.addFeatures(kmlForm); //교통정보를 백터 레이어에 추가   

                        map.addLayer(routeLayer); // 지도에 백터 레이어 추가
                        //-------------------------- 교통정보를 그려주는 부분입니다. -------------------------- 


                    }

                    map.zoomToExtent(routeLayer.getDataExtent()); //map의 zoom을 routeLayer의 영역에 맞게 변경합니다.   
                },
                //요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
                error: function(request, status, error) {
                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }




            });


            console.log($('#datepicker').val());
            console.log($("input:radio[name='work']:checked").val());
            console.log($('#tocommute').val());
            console.log($('#tocommutes').val());
            console.log($('#start').val());
            console.log($('#end').val());
            console.log($('#taxifare').val());
            console.log($('#distance').val());


        }
        //--------지도 끝---------


        //insert
        $('#rvForm').submit(function() {

            $.ajax({
                url: 'http://localhost:8080/reservation/carpool/' + ${sessionScope.loginInfo.d_idx},
                type: 'POST',
                data: JSON.stringify({
                    d_date: $('#datepicker').val().toString(),
                    d_commute: $("input:radio[name='work']:checked").val().toString(),
                    d_startTime: $('#tocommute').val(),
                    d_endTime: $('#tocommutes').val(),
                    d_startPoint: $('#start').val().toString(),
                    d_endPoint: $('#end').val().toString(),
                    d_fee: $('#taxifare').val(),
                    d_distance: $('#distance').val(),
                    d_startlon: $('#startlon').val(),
                    d_startlat: $('#startlat').val(),
                    d_endlon: $('#endlon').val(),
                    d_endlat: $('#endlat').val()


                }),
                contentType: 'application/json; charset=utf-8',
                success: function(data) {
                    if (data == 'success') {
                        alert('정상적으로 등록되었습니다.');
                    } else {
                        alert('오류닷');
                    }
                }

            });

            return false;

        });


        $('#submit').click(function() {


            if ($(':radio[name="work"]:checked').length < 1) {
                $('#workCheck').css('display', 'block');
                return false;
            } else {
                $('#workCheck').css('display', 'none');
            }

            if ($('#datepicker').val() == "") {
                $('#dateCheck').css('display', 'block');
                return false;
            } else {
                $('#dateCheck').css('display', 'none');
            }

            if ($('#tocommute').val() == "선택" || $('#tocommutes').val() == "선택") {
                $('#timeCheck').css('display', 'block');
                return false;
            } else {
                $('#timeCheck').css('display', 'none');
            }


            if ($('#start').val() == "" || $('#end').val() == "") {
                $('#routeCheck').css('display', 'block');
                return false;
            } else {
                $('#routeCheck').css('display', 'none');
            }


            if ($('#taxifare').val() == "") {
                $('#searchCheck').css('display', 'block');
                return false;
            } else {
                $('#searchCheck').css('display', 'none');
            }





        });
    </script>
</body>
</html>