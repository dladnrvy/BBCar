<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=61f9f7ec-2010-4d26-97e1-806dc10dce63"></script>
<head>
<title>Insert title here</title>
</head>

<script>
    $(document).ready(function() {
        initTmap();
    });

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

    var routeLayer = new Tmap.Layer.Vector("route"); //벡터 레이어 생성
    map.addLayer(routeLayer); //map에 벡터 레이어 추가



    //레이어에 마커레이어를 추가해주는 함수입니다.
    function addMarkerLayer() {
        markerLayer = new Tmap.Layer.Markers("marker"); //마커레이어를 생성합니다.
        map.addLayer(markerLayer); //map에 마커레이어를 추가합니다.
    };

    // 시작

    function searchPOI(countS) {

        var startPoint = $('#startPoint').val();


        alert(startPoint);

        tdata = new Tmap.TData();
        tdata.getPOIDataFromSearch(encodeURIComponent(startPoint), {
            /*centerLon: center.lon,
            centerLat: center.lat,*/
            reqCoordType: "EPSG3857",
            resCoordType: "EPSG3857"
        });
        tdata.events.register("onComplete", tdata, onCompleteTData);

        console.log(countS);

        if (countS > 0) {
            console.log(countS);
            $('#searchSP').click(function() {
                console.log('첫번쨰로들어옴1');
                map.events.clearMouseCache();
                map.destroy();
                initTmap();
            });
        }

    }

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
            alert('검색결과가 없습니다.');
        }
        map.zoomToExtent(markerLayer.getDataExtent()); //마커 레이어의 최대 익스텐트를 계산해 이에 맞게 지도를 줌합니다.
        tdata.events.unregister("onComplete", tdata, onCompleteTData); //onCompleteTData 이벤트 등록 해제
    }

    function addMarker(options) {
        var size = new Tmap.Size(24, 38); //아이콘 크기 설정
        var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
        var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset); //마커 아이콘 설정
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


    // 도착




    function searchPOIs(countE) {

        var endPoint = $('#endPoint').val();


        alert(endPoint);

        tdata = new Tmap.TData();
        tdata.getPOIDataFromSearch(encodeURIComponent(endPoint), {
            /*centerLon: center.lon,
            centerLat: center.lat,*/
            reqCoordType: "EPSG3857",
            resCoordType: "EPSG3857"
        });
        tdata.events.register("onComplete", tdata, onCompleteTDatas);

        if (countE > 0) {
            $('#searchEP').click(function() {
                console.log('첫번쨰로들어옴2');
                map.events.clearMouseCache();
                map.destroy();
                initTmap();
            });
        }

    }

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
            alert('검색결과가 없습니다.');
        }
        map.zoomToExtent(markerLayer.getDataExtent()); //마커 레이어의 최대 익스텐트를 계산해 이에 맞게 지도를 줌합니다.
        tdata.events.unregister("onComplete", tdata, onCompleteTDatas); //onCompleteTData 이벤트 등록 해제
    }

    function addMarkers(options) {

        var size = new Tmap.Size(24, 38); //아이콘 크기 설정
        var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점 설정
        var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png />', size, offset); //마커 아이콘 설정

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




    function change(lonlat, labelHtml) {

        var pr_3857 = new Tmap.Projection("EPSG:3857");
        var pr_4326 = new Tmap.Projection("EPSG:4326");


        var lonlat = new Tmap.LonLat(lonlat.lon.toString(), lonlat.lat.toString()).transform(pr_3857, pr_4326);


        $('#start').val(labelHtml.toString());
        $('#startlon').val(lonlat.lon);
        $('#startlat').val(lonlat.lat);

        map.events.clearMouseCache();
        map.destroy();

        initTmap();

    }

    function changes(lonlat, labelHtml) {

        var pr_3857 = new Tmap.Projection("EPSG:3857");
        var pr_4326 = new Tmap.Projection("EPSG:4326");


        var lonlat = new Tmap.LonLat(lonlat.lon.toString(), lonlat.lat.toString()).transform(pr_3857, pr_4326);
        /*var lonlats = new Tmap.LonLat(lonlats.lon.toString(), lonlats.lat.toString()).transform(pr_3857, pr_4326);*/


        $('#end').val(labelHtml.toString());
        $('#endlon').val(lonlat.lon);
        $('#endlat').val(lonlat.lat);

        map.events.clearMouseCache();
        map.destroy();

        initTmap();
    }



    function route() {
        var headers = {};
        headers["appKey"] = '61f9f7ec-2010-4d26-97e1-806dc10dce63' //실행을 위한 키 입니다. 발급받으신 AppKey(서버키)를 입력하세요.
        $.ajax({
            method: "POST",
            headers: headers,
            url: "https://apis.openapi.sk.com/tmap/routes?version=1&format=xml", //자동차 경로안내 api 요청 url입니다.
            async: false,
            data: {

                //출발지 위경도 좌표입니다.
                startX: $('#startlon').val().toString(),
                startY: $('#startlat').val().toString(),
                //목적지 위경도 좌표입니다.
                endX: $('#endlon').val().toString(),
                endY: $('#endlat').val().toString(),
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

                var tDistance = " 총 거리 : " + ($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue / 1000).toFixed(1) + "km,";
                var tTime = " 총 시간 : " + ($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue / 60).toFixed(0) + "분,";
                var tFare = " 총 요금 : " + $intRate[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue + "원,";
                var taxiFare = " 예상 택시 요금 : " + $intRate[0].getElementsByTagName("tmap:taxiFare")[0].childNodes[0].nodeValue + "원";

                $("#result").text(tDistance + tTime + tFare + taxiFare);

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

        $('#searchEP').click(function() {
            map.events.clearMouseCache();
            map.destroy();
            initTmap();
        });

        $('#searchSP').click(function() {
            map.events.clearMouseCache();
            map.destroy();
            initTmap();
        });



    }

</script>
<body>
<div id="conten">
    <div>
        <input type="text" id="startPoint" placeholder="검색어를 입력해주세요" value="종각역">
        <input type="button" id="searchSP" onclick="searchPOI(countS+1);" value="지도검색">

    </div>
    <br>
    <div>
        <input type="text" id="endPoint" placeholder="검색어를 입력해주세요" value="종로3가역">
        <input type="button" id="searchEP" onclick="searchPOIs(countE+1);" value="지도검색">
    </div>
    <br>
    출발지 : <input type="text" id="start" readonly><br>
    도착지 : <input type="text" id="end" readonly>
    <br><br>
    <input type="button" id="routesearch" onclick="route();" value="경로검색">
    <br><br>

    <div id="map_div">
    </div>
    <input type="hidden" id="startlon" value="">
    <input type="hidden" id="startlat" value="">
    <input type="hidden" id="endlon" value="">
    <input type="hidden" id="endlat" value="">

    <p id="result"></p>
   </div>
</body>
</html>