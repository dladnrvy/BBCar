<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YCAR</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- tmap -->
<script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=5beda631-7db0-4be9-b0bd-b6b5a7f41945"></script>
<!-- bootstrap -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
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
	width: 500px;
}
.ftco-navbar-light.scrolled {
	background-color: #FFFEF4 !important;
}
.check {
	display: none;
	color: red;
}
.rsvform {
	display: inline-block !important;
	width: 230px !important;
	border: 1px solid #6258A4 !important;
	background: transparent !important;
}
.rsvbtn {
	display: inline-block !important;
	width: 230px !important;
	height: 50px;
}
.rsbbtn {
	display: inline-block !important;
	width: 470px !important;
	height: 50px;
}
.rsvsbtn {
	display: inline-block !important;
	width: 200px !important;
	height: 40px;
}
.modal-body {
	text-align: left;
}
.inputborder {
	border: 0px;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="index.html">YCAR</a>
		<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>
        <div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav nav ml-auto">
				<li class="nav-item"><a href="#" class="nav-link"><span>카풀찾기</span></a></li>
				<li class="nav-item"><a href="myCarpool.jsp" class="nav-link"><span>나의카풀</span></a></li>
				<li class="nav-item"><a href="#about-section" class="nav-link"><span>결제</span></a></li>
				<li class="nav-item"><a href="#destination-section" class="nav-link"><span>후기</span></a></li>
				<li class="nav-item"><a href="#hotel-section" class="nav-link"><span>마이페이지</span></a></li>
				<li class="nav-item"><a href="#contact-section" class="nav-link"><span>로그아웃</span></a></li>
			</ul>
		</div>
	</div>
</nav>



<div class="container">
	<div id="title">
		<h3 class="mb-4">카풀찾기</h3>
	</div>
	<!-- ------------------카풀검색폼------------------ -->
	<div id="search">
		<form id="searchForm" class="search-property-1">
			<div id="commute">
            	<input type="radio" id="towork" name="work" class="work" value="출근">출근
               	<input type="radio" id="fromwork" name="work" class="work" value="퇴근">퇴근<br>
                <span id="workCheck" class="check">출근 또는 퇴근을 선택해주세요.</span>
			</div><br>
			<div id="datetime">
	            <input type="text" class="checkin_date form-control rsvform datepicker" placeholder="날짜를 선택해주세요" id="date" name="date">		
                <select name="time" id="time" class="form-control rsvform">
                	<option hidden>카풀시간</option>
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
				<span id="timeCheck" class="check">시간을 선택해주세요.</span>
			</div><br>
			<div id="showroute">
				<div id="searchmap">
					<div>
						<input type="text" id="startPoint" name = "startPoint" placeholder="출발지찾기" class="form-control rsvform"> 
						<input type="button" id="searchSP" onclick="searchPOI(countS+1);" value="출발지찾기" class="btn btn-primary rsvbtn">
					</div>
					<div>
						<input type="text" id="endPoint" name = "endPoint" placeholder="도착지찾기" class="form-control rsvform"> 
						<input type="button" id="searchEP" onclick="searchPOIs(countE+1);" value="도착지찾기" class="btn btn-primary rsvbtn">
					</div>
					<br>
					<input type="text" id="p_startpoint" readonly class="form-control rsvform" placeholder="출발지">
					<input type="text" id="p_endpoint" readonly class="form-control rsvform" placeholder="도착지">
					<br><br>
					<input type="button" id="routesearch" onclick="route();" value="경로확인" class="btn btn-primary rsbbtn"><br><br>
					<div id="map_div" class="bg-white"></div>
					<input type="hidden" id="startlon" value=""> 
					<input type="hidden" id="startlat" value=""> 
					<input type="hidden" id="endlon" value=""> 
					<input type="hidden" id="endlat" value=""><br>
					<input type="button" id="searchcarpool" onclick="search()" value="카풀검색" class="btn btn-primary rsbbtn">
				</div>
			</div>
		</form>	
	</div>
	<!-- ------------------카풀검색폼------------------ -->
	<br><br>
	<div class="listed">
		<div id=searchCarpoolList></div>
	</div>

 	<div class="listed" style="display: none">
		<input type="button" onclick="carpool();" value="전체카풀보기">
		<div id="carpoolList"></div>
	</div>
</div>


<!-- 카풀 셀렉트 모달 --> 
<div class="modal fade" id="selectModal" tabindex="-1" role="dialog" aria-labelledby="selectModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="selectModalLabel">예약하시겠습니까?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form id="selectCp">
      <input type="hidden" id="p_idx" name="p_idx" value="${login.idx}"> <!-- 벨류값 빼야함!!!!!!!!!!!!!!!!!!! -->
      <input type="hidden" id="dr_idx" name="dr_idx">
      카풀날짜 <input type="text" id="d_date" name="d_date" class="inputborder" readonly><br>
      픽업시간 <input type="text" id="d_starttime" name="d_starttime" class="inputborder" readonly> - <input type="text" id="d_endtime" name="d_endtime" class="inputborder" readonly><br>
      출발지 <input type="text" id="d_startpoint" name="d_startpoint" class="inputborder" readonly><br>
      도착지 <input type="text" id="d_endpoint" name="d_startpoint" class="inputborder" readonly><br>
      카풀요금 <input type="text" id="d_fee" name="d_fee" class="inputborder" readonly>원<br>
      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary rsvsbtn" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary rsvsbtn" id="requestReserve" onclick="requestReserve();">예약</button>
      </div>
    </div>
  </div>
</div>

<script>
	
    //datepicker 설정
    $(function() {
  	  $( ".datepicker" ).datepicker({
  		  dateFormat: 'yy-mm-dd'
  		  });
  	  });
    
	$(document).ready(function() {
        initTmap(); //티맵 지도 보여주기
        carpoolList(); //전체 카풀 리스트
		searchCarpoolList(); //검색 조건에 맞는 카풀 리스트
		
		var p_idx = $('#p_idx').val();
		
		
	
		$('#selectModal').on('hide.bs.modal', function (e) {
		      $(this).find('.modal-body form')[0].reset(); 
		         //폼 초기화 : 이후 다시 열어도 폼이 비워져 있도록!
		   });
		
		
/* 		$('#exampleModal').on('shown.bs.modal', function (event) {
			  $('.modal-body').trigger('focus')
			}) */	
	});
	
	
	
	function search(p_idx){
		
		$.ajax({
			url : 'http://localhost:8080/reservation/searchcarpool',
			type : 'GET',
			data : $('#searchForm').serialize(), 
			success : function(data) {
				var html = '';
				for (var i = 0; i < data.length; i++) {							
					html += '<div>\n';
					html += '<input type="hidden" id="'+ data[i].dr_idx + '"><input type="hidden" id="'+ data[i].d_idx + '">';
					html +=  data[i].d_commute + '\t' + data[i].d_date + '<br>\n';
					html += '픽업가능시간 ::: ' + data[i].d_starttime + '\t -\t ' + data[i].d_endtime + '<br>\n';
					html += '출발 ::: ' + data[i].d_startpoint + '<br>\n';
					html += '도착 ::: ' + data[i].d_endpoint + '<br>\n';
					html += '요금 ::: '+ data[i].d_fee +'원 <br>\n';
					html += '<button id="select" onclick="selectCarpool(' + data[i].dr_idx + ')" class="btn btn-primary rsvsbtn" data-toggle="modal" data-target="#selectModal">예약하기</button>';
					html += '</div>'
				}
				$('#searchCarpoolList').html(html);
			}
		});
	}
	
	
	function selectCarpool(dr_idx){
    	  $.ajax({
    		  url : 'http://localhost:8080/reservation/carpool/' + dr_idx,
    		  type : 'GET',
    		  success : function(data){
    			  $('#p_idx').val(p_idx);
    			  $('#dr_idx').val(data.dr_idx);
    			  $('#d_date').val(data.d_date);
    			  $('#d_starttime').val(data.d_starttime);
    			  $('#d_endtime').val(data.d_endtime);
    			  $('#d_startpoint').val(data.d_startpoint);
    			  $('#d_endpoint').val(data.d_endpoint);
    			  $('#d_fee').val(data.d_fee);
    		  }
    	  });
      }
      
      function requestReserve(){
    	  $.ajax({
    		  url: 'http://localhost:8080/reservation/reserve/'+ p_idx,
    		  type : 'POST',
    		  data : $('#selectCp').serialize(),
    		  success : function(data) {
    			  $('#selectModal').modal('hide');
    			  alert('카풀 예약 요청이 운전자님께 전달되었습니다!\n운전자님의 예약 요청 수락/거절 여부는 이메일로 받으실 수 있습니다.');
    			  $('#searchCarpoolList').css('display', 'none');
				}
			});
      }
      
         
      
  	function carpool(){
		$.ajax({
				url : 'http://localhost:8080/reservation/carpool',
				type : 'GET',
				success : function(data) {
					var html = '';
					for (var i = 0; i < data.length; i++) {						
						
 						html += '<div>\n';
 						html += '<input type="hidden" id="'+ data[i].dr_idx + '"><input type="hidden" id="'+ data[i].d_idx + '">';
						html +=  data[i].d_commute + '\t' + data[i].d_date + '<br>\n';
						html += '픽업가능시간 ::: ' + data[i].d_starttime + '\t -\t ' + data[i].d_endtime + '<br>\n';
						html += '출발 ::: ' + data[i].d_startpoint + '<br>\n';
						html += '도착 ::: ' + data[i].d_endpoint + '<br>\n';
						html += '요금 ::: '+ data[i].d_fee +'원 <br>\n';
						html += '<button id="select" onclick="selectCarpool(' + data[i].dr_idx + ')" class="btn btn-primary rsvsbtn" data-toggle="modal" data-target="#selectModal">예약하기</button>';
						html += '</div>'
					}
					$('#carpoolList').html(html);
				}
			});
      }
      
          
          
          /* ----------------------------------------- Tmap ----------------------------------------- */
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
                  width: "100%",// map의 width 설정
                  height: "380px", // map의 height 설정
              });
              addMarkerLayer();
          }
          //레이어에 마커레이어를 추가해주는 함수입니다.
          function addMarkerLayer() {
              markerLayer = new Tmap.Layer.Markers("marker"); //마커레이어를 생성합니다.
              map.addLayer(markerLayer); //map에 마커레이어를 추가합니다.
          };
          // 시작
          function searchPOI(countS) {
              var startPoint = $('#startPoint').val();
              /* alert(startPoint); */
              tdata = new Tmap.TData();
              tdata.getPOIDataFromSearch(encodeURIComponent(startPoint), {
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
              /*var marker_s = new Tmap.Marker(new Tmap.LonLat(centerLon, centerLat).transform("EPSG:4326", "EPSG:3857"), icon); //설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.*/
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
              /* alert(endPoint); */
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
              // var markers = new Tmap.Marker(new Tmap.LonLat(option.lonlat, "37.403049076341794").transform("EPSG:4326", "EPSG:3857"), icon); //설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
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
              /*var lonlats = new Tmap.LonLat(lonlats.lon.toString(), lonlats.lat.toString()).transform(pr_3857, pr_4326);*/
              $('#p_startpoint').val(labelHtml.toString());
              $('#startlon').val(lonlat.lon);
              $('#startlat').val(lonlat.lat);
              map.events.clearMouseCache();
              map.destroy();
              /*$('#start').val("");*/
              initTmap();
          }
          function changes(lonlat, labelHtml) {
              var pr_3857 = new Tmap.Projection("EPSG:3857");
              var pr_4326 = new Tmap.Projection("EPSG:4326");
              var lonlat = new Tmap.LonLat(lonlat.lon.toString(), lonlat.lat.toString()).transform(pr_3857, pr_4326);
              /*var lonlats = new Tmap.LonLat(lonlats.lon.toString(), lonlats.lat.toString()).transform(pr_3857, pr_4326);*/
              $('#p_endpoint').val(labelHtml.toString());
              $('#endlon').val(lonlat.lon);
              $('#endlat').val(lonlat.lat);
              map.events.clearMouseCache();
              map.destroy();
              /*$('#start').val("");*/
              initTmap();
          }
          function route() {
              var headers = {};
              headers["appKey"] = '5beda631-7db0-4be9-b0bd-b6b5a7f41945' //실행을 위한 키 입니다. 발급받으신 AppKey(서버키)를 입력하세요.
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
</body>
</html>