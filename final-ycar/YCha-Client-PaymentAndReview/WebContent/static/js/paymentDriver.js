//입금 내역 check : socket 이용해서 페이지 처리 
/*순서
 * 0. 빈 페이지 로딩 : 
 * 1. 사용자 페이지와 통신 - 입금 내역 데이터 받아오기 (json)
 * 2. 해당 내역 출력 
 * */
var socket = io('http://localhost:3000');

var r_idx = document.location.search.substring('1').split('=')[1];
console.log('r_idx 확인 : ', r_idx);  

//r_idx 방 조인 : 유니크 키인 r_idx 이용 
socket.emit('join payroom', r_idx);

$(document).ready(function(){

  //listener : payroom result
  socket.on('payroom result', function(msg){
    console.log(msg);
  });

  //listener : receive info 
  socket.on('receive pay result', 
    function(payidx, paydate, d_commute, d_distance, d_fee, paymethod, 
      d_starttime, d_startpoint, d_endtime, d_endpoint){ 
    console.log('driver 페이지야, 값들 들어오니?', d_startpoint);  
    
    var result = '';
    result += '<h1>입금 확인</h1><br>';
    result += '<table class="table">';
    result += '<thead><tr><th scope="col">항목</th><th scope="col">내용</th></tr></thead>';
    result += '<tbody>';
    result += '<tr><th scope="row">날짜</th><td id="d_date">'+paydate+'</td></tr>';
    result += '<tr><th scope="row">출근/퇴근</th><td id="commuteType">'+d_commute+'</td></tr>';
//    result += '<tr><th scope="row">총 운행거리/총 운행시간</th><td id="d_distance">'+d_distance+'</td></tr>';
    result += '<tr><th scope="row">총 운행거리</th><td id="d_distance">'+d_distance+'</td></tr>';
    result += '<tr><th scope="row">총 금액</th><td id="d_amount">'+d_fee+'</td></tr>';
    result += '<tr><th scope="row">결제수단</th><td id="d_method">'+paymethod+'</td></tr>';
    result += '<tr><th scope="row">출발시간/출발지</th><td id="d_stime">'+d_starttime+' / '+d_startpoint+'</td></tr>';
    result += '<tr><th scope="row">도착시간/도착지</th><td id="d_etime">'+d_endtime+' / '+d_endpoint+'</td></tr>';
    result += '</tbody>';
    result += '</table>';
    
    $('#pay-success-div').html(result);

    //운전자 페이지 갱신 
    setTimeout(function(){
      //일정 시간 후 : 탑승자 후기 작성 페이지로 이동 
      window.location.href='http://localhost:8080/parclient/review/driverWrite.jsp?payidx='+payidx;
    }, 10000);
  });
    
  
});