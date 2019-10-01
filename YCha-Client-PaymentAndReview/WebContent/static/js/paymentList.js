$(document).ready(function(){
    
    //세션에서 현재 사용자의 p_idx 값 가져오기 
	var p_idx = $('#p_idx').val();
    console.log('결제리스트 시작 01 '+p_idx);
    
    //결제 리스트 출력 
    $.ajax({
    	url : 'http://localhost:8080/par/payment/passenger/'+p_idx,
    	type: 'GET',
    	success : function(data) {
    		console.log('결제리스트 시작 05 ', data);
    		
    		var output = '';
    		
    		for(var i=0; i<data.length; i++) {
    			output += '<div class="col-sm-6">';
    			output += '<div class="card">';
    			output += '<div class="card-body">';
    			output += '<h5 class="card-title">'+data[i].d_fee+'원</h5>';
    			output += '<div class="container">';
    			output += '<table class="table">';
    			output += '<thead>';
    			output += '<tr>';
    			output += '<th scope="col">항목</th>';
    			output += '<th scope="col">내용</th>';
    			output += '</tr>';
    			output += '</thead>';
    			output += '<tbody>';
    			output += '<tr><th scope="row">날짜</th><td>'+data[i].paydate+'</td></tr>';
    			output += '<tr><th scope="row">출근/퇴근</th><td id="commuteType">'+data[i].d_commute+'</td></tr>';
    			output += '<tr><th scope="row">결제 방법</th><td>'+data[i].paymethod+'</td></tr>';
//    			output += '<tr><th scope="row">총 운행거리/총 운행시간</th><td>'+data[i].d_distance+' km/ '+(data[i].d_endtime-data[i].d_starttime)+' 분</td></tr>';
    			output += '<tr><th scope="row">총 운행거리</th><td>'+data[i].d_distance+' km</td></tr>';
    			output += '<tr><th scope="row">출발시간/출발지</th><td id="stime">'+data[i].d_starttime+' / '+data[i].d_startpoint+'</td></tr>';
    			output += '<tr><th scope="row">도착시간/도착지</th><td id="etime">'+data[i].d_endtime+' / '+data[i].d_endpoint+'</td></tr>';
    			output += '</tbody></table></div><a href="'+'http://localhost:8080/parclient/review/passengerWrite.jsp?payidx='+data[i].payidx+'" class="btn btn-primary rvBtn">후기작성</a></div></div></div>';
    			
    			//후기 작성 안한 건수만 버튼 표시 
    			
    		}
    		$('#passengerPayList').html(output);
    	},
    	error : function(e) {
    		console.log('결제 리스트 로드 실패 ', e);
    	}
    })
    
});