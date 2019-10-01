<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://localhost:3000/socket.io/socket.io.js"></script>
<link rel="stylesheet" href="css/style.css">
<!-- tmap -->
<script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=5beda631-7db0-4be9-b0bd-b6b5a7f41945"></script>
<style>
   body {
      background-color: #FFFEF4;
      font-family: 'Noto Sans KR', sans-serif;
      text-align: center;
   }
   .container {
      margin-top: 100px;
      margin-bottom: 100px;
      min-width: 100px;
      width: 800px;
   }
   .rsbbtn {
      display: inline-block !important;
      width: 470px !important;
      height: 50px;
   }
   img{
      width:250px;
   }
   h1{
      font-weight:bolder;
   }
   #map_div{
        display: inline-block;
   }

</style>
</head>
<body>
   <div class="container">
      <div id="driving">
         <h1>YCAR</h1>
         <img src="image/logo_yeoncha.png" id="ycarLogo">
         <h5>탑승자분, 카풀 운행이 시작되었습니다.</h5>
         <h5>운행종료시 버튼을 눌러주세요!</h5><br>
         <div id="map_div"></div>
         <input type="hidden" id="startlon" value="">
        <input type="hidden" id="startlat" value="">
        <input type="hidden" id="endlon" value="">
        <input type="hidden" id="endlat" value="">
         <button id="arrBtn" class="btn btn-primary rsbbtn" href="#">운행종료</button>
      </div>
   </div>
   
   <script>
      
      // param : 1) ${loginInfo.p_idx}"  2) 현재 사용자의 r_idx
      $(document).ready(function(){
     	  var socket = io('http://localhost:3000');
    	  var r_idx = document.location.search.substring('1').split('=')[1];
         console.log('r_idx 확인 : ', r_idx);  
         socket.emit('join room', r_idx); 
         $('#arrBtn').on('click', function(){
            socket.emit('arrive', r_idx);
            console.log('arrive 이벤트 발생');
         })
   
         socket.on('redirect', function(r_idx){
            console.log('redirect 리슨 ', r_idx);
            setTimeout(function(){
               window.location.href="http://localhost:8080/parclient/index.jsp?r_idx="+r_idx;
            }, 2000);
         }); 
         
         //r_idx 넘기기
         lonlat(r_idx);
      });
      
      //위도 경도 가져오기
      function lonlat(r_idx) {

          $.ajax({
              url: 'http://localhost:8080/reservation/lonlat/' + r_idx,
              type: 'GET',
              success: function(data) {
                         
                     $('#startlon').val(data.d_startlon);
                      $('#startlat').val(data.d_startlat);
                      $('#endlon').val(data.d_endlon);
                      $('#endlat').val(data.d_endlat);
                      
                  
                      initTmap();
          
                  }
              
          })
      };

      var map, marker, markerLayer;
      
      //지도 실행
      function initTmap() {
          
           map = new Tmap.Map({
              div: "map_div", // map을 표시해줄 div
              width: "700px", // map의 width 설정
              height: "600px", // map의 height 설정
          });
          
          //현재 위치
          markerLayer = new Tmap.Layer.Markers();
          map.addLayer(markerLayer);

          var size = new Tmap.Size(60, 60);
          var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));
          var icon = new Tmap.Icon('images/bluecar.png', size, offset);

          if (navigator.geolocation) {
              // GeoLocation을 이용해서 접속 위치를 얻어옵니다
              navigator.geolocation.watchPosition(function(position) {

                  enableHighAccuracy: true

                  var lat = position.coords.latitude;
                  var lon = position.coords.longitude;
                  var PR_3857 = new Tmap.Projection("EPSG:3857"); // Google Mercator 좌표계인 EPSG:3857
                  var PR_4326 = new Tmap.Projection("EPSG:4326"); // WGS84 GEO 좌표계인 EPSG:4326        
                  var lonlat = new Tmap.LonLat(lon, lat).transform(PR_4326, PR_3857);


                  marker = new Tmap.Marker(lonlat, icon);
                  markerLayer.addMarker(marker);
                  
                  map.setCenter(new Tmap.LonLat(lon,lat).transform("EPSG:4326", "EPSG:3857"), 17);

              })
          } else {
              alert('당신의 기기는 현재위치가 지원이 되지않습니다.');
          }
          

           var headers = {};
          headers["appKey"] = '5beda631-7db0-4be9-b0bd-b6b5a7f41945' //실행을 위한 키 입니다. 발급받으신 AppKey(서버키)를 입력하세요.
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


      })
      };
      
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
         /*map.zoomToExtent(vectorLayer.getDataExtent());*/
      }


      //데이터 로드시 에러가 발생시 발생하는 이벤트 함수입니다.
      function onError() {
          alert("오류가 발생했습니다. 죄송합니다.");
      }
   </script>
</body>
</html>