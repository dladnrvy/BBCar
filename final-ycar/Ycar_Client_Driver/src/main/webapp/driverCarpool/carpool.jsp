<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>리스트 출력</title>

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <link rel="stylesheet" href="<c:url value='/staticD/css/open-iconic-bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/staticD/css/animate.css'/>">
<link rel="stylesheet" href="<c:url value='/staticD/css/owl.carousel.min.css'/>">
<link rel="stylesheet" href="<c:url value='/staticD/css/owl.theme.default.min.css'/>">
<link rel="stylesheet" href="<c:url value='/staticD/css/magnific-popup.css'/>">
<link rel="stylesheet" href="<c:url value='/staticD/css/aos.css'/>">
<link rel="stylesheet" href="<c:url value='/staticD/css/ionicons.min.css'/>">
<link rel="stylesheet" href="<c:url value='/staticD/css/flaticon.css'/>">
<link rel="stylesheet" href="<c:url value='/staticD/css/icomoon.css'/>">
<link rel="stylesheet" href="<c:url value='/staticD/css/style.css'/>">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!--<link rel="stylesheet" href="/resources/demos/style.css">-->

    <!-- 한글 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<style>
    #content {
        margin: 0 auto;
        /*max-width: 100%;*/
        text-align: center;
        /*height: auto;*/
        font-family: 'Noto Sans KR', sans-serif;
    }

    /*팝업창 css*/
    #popupDiv {
        top: 0px;
        position: fixed;
        background: white;
        width: 500px;
        height: 550px;
        display: none;
        padding-left: 10px;
    }

    /* 팝업 배경 css*/
    #popup_mask {
        position: fixed;
        width: 100%;
        height: 1000px;
        top: 0px;
        left: 0px;
        display: none;
        background-color: #000;
        -moz-opacity: 0.8;
        filter: alpha(opacity=80);
        opacity: 0.8;
    }

    #popCloseBtn {
        margin-left: 330px;
        margin-top: 10px;
        margin-bottom: 10px;
        width: 100px;
        height: 40px;
    }

    #year {
        text-align: center;
    }

    #listdiv {
        margin: 0 auto;
        width: 100%;
    }

    #list {
        display: inline-block;
        border: 1px solid #DDD;
        margin-top: 20px;
        overflow: scroll;
        overflow-x: hidden;
        width: 500px;
        height: 600px;
    }

    .pastDiv {
        text-align: left;
        border-radius: 10px;
        /*border: 1px solid #DDD;*/
        width: 400px;
        padding-left: 10px;
        line-height: 40px;
        display: inline-block;
        background-color: white;
        margin-bottom: 25px;


    }

    #footer {
        height: 100px;
    }

    /*부트시작*/
    body {
        background-color: #FFFEF4;
        height: 100%;
    }

    #ftco-nav {
        font-family: 'Noto Sans KR', sans-serif;
    }

    #past {
        width: 100px;
        height: 40px;
    }

    #today {
        width: 100px;
        height: 40px;

    }

    #future {
        width: 100px;
        height: 40px;
    }

    span {
        color: black;
        font-weight: bolder;
    }

    .CommuteSPAN {
        display: inline-block;
        font-weight: 100;
        background-color: #cd3184;
        color: white;
        width: 50px;
        height: 40px;
        text-align: center;
        line-height: 40px;
        border-radius: 5px;
        margin-top: 20px;
    }

    #pastmapBTN {
        width: 100px;
        height: 35px;
        line-height: 20px;

    }

    #home-section {
        margin-top: 170px;
    }

    #pastdelBTN {
        width: 300px;
        height: 40px;
        margin-left: 35px;
        margin-top: 10px;
    }

    .ftco-navbar-light.scrolled {
        background-color: #FFFEF4 !important;
    }

    .mb-4 {

        font-family: 'Noto Sans KR', sans-serif;
        padding-bottom: 20px;

        font-weight: bolder;
        font-size: 35px;
    }

    #todaymapBTN {
        width: 100px;
        height: 35px;
        line-height: 20px;

    }
     #futuremapBTN {
        width: 100px;
        height: 35px;
        line-height: 20px;

    }
    
    /*오늘 수락버튼*/
    #todayYbtn {
        width: 150px;
        height: 40px;
        margin-left: 33px;
        margin-top: 10px;
    }
    /*오늘 거절버튼*/
    #todayNbtn {
        width: 150px;
        height: 40px;
        margin-left: 15px;
        margin-top: 10px;
    }
     /*미래 수락버튼*/
    #futureYbtn {
        width: 150px;
        height: 40px;
        margin-left: 33px;
        margin-top: 10px;
    }
    /*미래 거절버튼*/
    #futureNbtn {
        width: 150px;
        height: 40px;
        margin-left: 15px;
        margin-top: 10px;
    }

   

    

</style>
<script src="<c:url value='/staticD/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/staticD/js/jquery-migrate-3.0.1.min.js'/>"></script>
    <script src="<c:url value='/staticD/js/popper.min.js'/>"></script>
	<script src="<c:url value='/staticD/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/staticD/js/jquery.easing.1.3.js'/>"></script>
	<script src="<c:url value='/staticD/js/jquery.waypoints.min.js'/>"></script>
	<script src="<c:url value='/staticD/js/jquery.stellar.min.js'/>"></script>
	<script src="<c:url value='/staticD/js/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/staticD/js/jquery.magnific-popup.min.js'/>"></script>
	<script src="<c:url value='/staticD/js/aos.js'/>"></script>
	<script src="<c:url value='/staticD/js/jquery.animateNumber.min.js'/>"></script>
	<script src="<c:url value='/staticD/js/scrollax.min.js'/>"></script>
	<script src="<c:url value='/staticD/js/main.js'/>"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=61f9f7ec-2010-4d26-97e1-806dc10dce63"></script>
<script>
    var count = 0;
    
            var d = new Date();

            var thisyear = d.getFullYear() + "년";

            //오늘
            var today = (d.getMonth() + 1) + "/" + d.getDate();

            //과거
            var past = "~" + (d.getMonth() + 1) + "/" + (d.getDate() - 1);

            //미래
            var future = (d.getMonth() + 1) + "/" + (d.getDate() + 1) + "~";

            var thisday = d.getFullYear() + "-" + "0" + (d.getMonth() + 1) + "-" + d.getDate();
    
            
    


    $(document).ready(function() {
        
            $('#thisyear').append(thisyear);
            $('#today').append(today);
            $('#future').append(future);
        
        list();


        //리스트 none
        /*$('#todayList').css('display','none');*/
        $('#futureList').css('display', 'none');
        
        //날짜 버튼 클릭시 디스플레이
        $('#past').click(function() {
            $('#pastList').css('display', 'inline');
            $('#todayList').css('display', 'none');
            $('#futureList').css('display', 'none');
            //버튼활성
            $('#pastbutton').css('display', 'block');
            $('#todaybutton').css('display', 'block');
            $('#futurebutton').css('display', 'block');

        });

        $('#today').click(function() {
            $('#todayList').css('display', 'inline');
            $('#pastList').css('display', 'none');
            $('#futureList').css('display', 'none');
            //버튼활성
            $('#pastbutton').css('display', 'block');
            $('#todaybutton').css('display', 'block');
            $('#futurebutton').css('display', 'block');
        });

        $('#future').click(function() {
            $('#futureList').css('display', 'inline');
            $('#pastList').css('display', 'none');
            $('#todayList').css('display', 'none');
            //버튼활성
            $('#pastbutton').css('display', 'block');
            $('#todaybutton').css('display', 'block');
            $('#futurebutton').css('display', 'block');
        });

         });


        function list(){


            $.ajax({
                url: 'http://localhost:8080/server/carpool/B/' + ${sessionScope.loginInfo.d_idx},
                type: 'GET',
                success: function(data) {

                    var todayhtml = '';
                    var futurehtml = '';



                    //과거
                    for (var i = 0; i < data.length; i++) {

                        var fee = data[i].d_fee.toString();

                        var feeCut = fee.substring(fee.length, fee.length - 3);

                        var split = fee.split(feeCut);

                        var feeSplit = split[0] + ',' + feeCut;




                        //오늘
                        if (data[i].d_date == thisday) {

                            todayhtml += '<div class="pastDiv">';
                            todayhtml += '<span class="CommuteSPAN">' + data[i].d_commute + '</span><br>\n';



                            todayhtml += '<span>탑승자 닉네임 : ' + data[i].nickname + '</span><br>\n';



                            todayhtml += '<span class="DateSPAN">날짜 : ' + '</span>' + data[i].d_date + '<br>\n';
                            todayhtml += '<span class="STimeSPAN">출발시간 : ' + '</span>' + data[i].d_startTime + ' <br>\n';
                            todayhtml += '<span class="ETimeSPAN">도착시간 : </span>' + data[i].d_endTime + '<br>\n';
                            todayhtml += '<span class="SpointSPAN">출발장소 : </span>' + data[i].d_startPoint + '<br>\n';
                            todayhtml += '<span class="EpointSPAN">도착장소 : </span>' + data[i].d_endPoint + '<br>\n';
                            todayhtml += '<button class="btn btn-primary" id="pastmapBTN" onclick="map(' + data[i].d_startlon + ', ' + data[i].d_startlat + ', ' + data[i].d_endlon + ', ' + data[i].d_endlat + ')">지도보기</button>' + '<br>\n';
                            todayhtml += '<span class="FeeSPAN">요금 : </span>' + feeSplit + '원<br>\n';
                            todayhtml += '<button class="btn btn-primary" id="todayYbtn" onclick="concent(' + data[i].r_idx + ')">수락</button>';
                            todayhtml += '<button class="btn btn-primary" id="todayNbtn" onclick="refuse(' + data[i].r_idx + ')">거절</button>' + '<br><br>\n';
                            todayhtml += '</div>';

                            //미래
                        } else if (data[i].d_date > thisday) {

                            futurehtml += '<div class="pastDiv">';
                            futurehtml += '<span class="CommuteSPAN">' + data[i].d_commute + '</span><br>\n';

                            futurehtml += '<span>탑승자 닉네임 : ' + data[i].nickname + '</span><br>\n';


                            futurehtml += '<span class="DateSPAN">날짜 : ' + '</span>' + data[i].d_date + '<br>\n';
                            futurehtml += '<span class="STimeSPAN">출발시간 : ' + '</span>' + data[i].d_startTime + ' <br>\n';
                            futurehtml += '<span class="ETimeSPAN">도착시간 : </span>' + data[i].d_endTime + '<br>\n';
                            futurehtml += '<span class="SpointSPAN">출발장소 : </span>' + data[i].d_startPoint + '<br>\n';
                            futurehtml += '<span class="EpointSPAN">도착장소 : </span>' + data[i].d_endPoint + '<br>\n';
                            futurehtml += '<button class="btn btn-primary" id="pastmapBTN" onclick="map(' + data[i].d_startlon + ', ' + data[i].d_startlat + ', ' + data[i].d_endlon + ', ' + data[i].d_endlat + ')">지도보기</button>' + '<br>\n';
                            futurehtml += '<span class="FeeSPAN">요금 : </span>' + feeSplit + '원<br>\n';
                            futurehtml += '<button class="btn btn-primary" id="futureYbtn" onclick="concent(' + data[i].r_idx + ')">수락</button>';
                            futurehtml += '<button class="btn btn-primary" id="futureNbtn" onclick="refuse(' + data[i].r_idx + ')">거절</button>' + '<br><br>\n';
                            futurehtml += '</div>';
                        }

                        $('#todayList').html(todayhtml);
                        $('#futureList').html(futurehtml);

                    }
                }




            });
            return false;
        };


   

    /*수락*/
    function concent(r_idx) {
        confirm('수락 하시겠습니까?');

        $.ajax({
            url: 'http://localhost:8080/server/carpool/Y/' + r_idx,
            type: 'PUT',
            success: function(data) {
                if (data != null) {
                    alert('수락 되었습니다.');
                    
                }
                list();

            }
        });
    };


    /*거절*/
    function refuse(r_idx) {
        confirm('거절 하시겠습니까?');

        $.ajax({
            url: 'http://localhost:8080/server/carpool/N/' + r_idx,
            type: 'DELETE',
            success: function(data) {
                if (data != null) {
                    alert('거절되었습니다.');
                    
                }
                list();
            }
        });
    }





    function pastMapClose(count) {


        if (count == 0) {
            var html = '<button id="closebutton" onclick="closebutton()">지도 닫기</button>';

            $('#pastMapClose').append(html);

        }
    };


    function closebutton() {


        /*alert('삭제'+count);*/

        $('#map_div').remove();
        $('#closebutton').css('display', 'none');
    };




    function map(d_startlon, d_startlat, d_endlon, d_endlat) {

        $("#popupDiv").css({
            "top": (($(window).height() - $("#popupDiv").outerHeight()) / 2 ) + "px",
            "left": (($(window).width() - $("#popupDiv").outerWidth()) / 2 ) + "px"
            //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정

        });

        $("#popup_mask").css("display", "block"); //팝업 뒷배경 display block
        $("#popupDiv").css("display", "block"); //팝업창 display block

        $("body").css("overflow", "hidden"); //body 스크롤바 없애기

        if (count == 1) {
            var html = '<div id="map_div"></div>';
            $('#popupDiv').append(html);
        }


        var map;



        // 페이지가 로딩이 된 후 호출하는 함수입니다.



        // map 생성
        // Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
        map = new Tmap.Map({
            div: 'map_div',
            width: '490px',
            height: '450px'
        });
        var tData = new Tmap.TData(); //REST API 에서 제공되는 경로, 교통정보, POI 데이터를 쉽게 처리할 수 있는 클래스입니다.

        var s_lonLat = new Tmap.LonLat(d_startlon, d_startlat); //시작 좌표입니다.   
        var e_lonLat = new Tmap.LonLat(d_endlon, d_endlat); //도착 좌표입니다.
        var optionObj = {
            reqCoordType: "WGS84GEO", //요청 좌표계 옵셥 설정입니다.
            resCoordType: "EPSG3857" //응답 좌표계 옵셥 설정입니다.
        }

        tData.getRoutePlan(s_lonLat, e_lonLat, optionObj); //경로 탐색 데이터를 콜백 함수를 통해 XML로 리턴합니다.

        tData.events.register("onComplete", tData, onComplete); //데이터 로드가 성공적으로 완료되었을 때 발생하는 이벤트를 등록합니다.
        tData.events.register("onPrnError", tData, onError); //데이터 로드가 실패했을 떄 발생하는 이벤트를 등록합니다.

        /*$('#map_div').append(map);*/




        //데이터 로드가 성공적으로 완료되었을 때 발생하는 이벤트 함수 입니다. 
        function onComplete() {
            console.log(this.responseXML); //xml로 데이터를 받은 정보들을 콘솔창에서 확인할 수 있습니다.

            var kmlForm = new Tmap.Format.KML({
                extractStyles: true
            }).read(this.responseXML);
            var vectorLayer = new Tmap.Layer.Vector("vectorLayerID");
            vectorLayer.addFeatures(kmlForm);
            map.addLayer(vectorLayer);
            //경로 그리기 후 해당영역으로 줌  
            map.zoomToExtent(vectorLayer.getDataExtent());
        }

        //데이터 로드시 에러가 발생시 발생하는 이벤트 함수입니다.
        function onError() {
            alert("오류가 발생했습니다. 죄송합니다.");
        }



        $("#popCloseBtn").click(function(event) {
            $("#popup_mask").css("display", "none"); //팝업창 뒷배경 display none
            $("#popupDiv").css("display", "none"); //팝업창 display none
            $("body").css("overflow", "auto"); //body 스크롤바 생성
            $('#map_div').remove();
            count = 1;
        });

    }


</script>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!--navbar 시작-->
	<%@ include file="../paymentAndReview/frame/driverNavbar.jsp"%>
	<!--navbar 끝 -->
	
    <section id="home-section" class="ftco-section ftco-no-pb ftco-no-pt">
        <div id="content">
            <div class="row justify-content-center pb-0 pb-mb-5 pt-5 pt-md-0">


                <h1 class="mb-4">카풀요청</h1>


            </div>


            <div id="year">

                <button id="today" class="btn btn-primary"></button>
                <button id="future" class="btn btn-primary"></button>
            </div>
            <div id="listdiv">
                <div id="list">
                    <br>


                    <div id="todayList"></div>
                    <div id="futureList"></div>



                </div>
            </div>

            <div id="popup_mask"></div> <!-- 팝업 배경 DIV -->

            <div id="popupDiv">
                <!-- 팝업창 -->
                <button id="popCloseBtn" class="btn btn-primary">닫기</button>
                <div id="map_div"></div>
            </div>

        </div>

    </section>
    <div id="footer"></div>

</body>

</html>
