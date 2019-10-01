var socket = io('http://localhost:3000');
$(document).ready(function(){
    
	//url 로부터 token 값 가져오기  
	var tokenValue = document.location.href.split('?')[1]; 
	console.log('kakao 결제 성공 후 token 값 01: '+tokenValue);
	
	$.ajax({
		url : "http://localhost:8080/par/payment/kakao/success?"+tokenValue,
		success : function(data) {
			console.log('결제 승인08 까지 성공! '+data.paymethod);
			
			//1. 결제 DB에 저장 : 결제 내역이 성공적으로 나온 뒤에 처리 
			//2. 결제 내역 보여주기 위해 따로 매서드로 페이지 구성 처리 
			paymentDetail(data);
		}, 
		error : function(e) {
			console.log('결제 승인 실패함 ');
			window.location.href = "http://localhost:8080/parclient/kakao/fail.jsp?r_idx="+data.r_idx;
		}
	})
})

//1. 결제 DB에 저장 
//2. 결제 내역 보여주기 위해 따로 매서드로 페이지 구성 처리 
function paymentDetail(data){	
	console.log('결제 내역 시이작 01', data.r_idx);
	var r_idx = data.r_idx;
	
	//r_idx 방 조인 : 유니크 키인 r_idx 이용 
	socket.emit('join payroom', r_idx);
	
	//listener : payroom result
	socket.on('payroom result', function(msg){
		console.log(msg);
	});

	$.ajax({
		url : "http://localhost:8080/par/payment/passenger",
		type: 'post',
		data : JSON.stringify({
			r_idx : r_idx,
			paymethod : data.paymethod
		}),
		//contentType:'text/plain;charset=utf-8;',
		//다수의 데이터들을 jquery{} 객체로 보내면 서버단에 도착할때 미세한 시간차 발생. 
		//동시에 도착하지 않기 때문에 command 객체로 한꺼번에 받는데 400에러가 계속 발생함. 
		//json.stringify 이용하여 json 타입으로 한꺼번에 보내니 문제 없이 커맨드 객체에 binding 됨 
		contentType:'application/json;charset=UTF-8;',
		success : function(data) {
				console.log('결제내역08 ', data);
				
				/* 결제 완료 페이지에 필요한 내용  
				 * 1. 날짜 
				 * 2. 총 운행거리
				 * 3. 총 운행시간
				 * 4. 총 금액
				 * 5. 결제 수단 
				 * 6. 출발시간
				 * 7. 출발지
				 * 8. 도착시간
				 * 9. 도착지
				 * */
				
				//탑승자 - 결제 내역 화면 표시 
				$('#date').html(data.paydate);
				$('#commuteType').html(data.d_commute);
//				$('#distance').html(data.d_distance+'km / '+(data.d_endtime-data.d_starttime)+'분');
				$('#distance').html(data.d_distance+' km');
				$('#amount').html(data.d_fee+'원');
				$('#method').html(data.paymethod);
				$('#stime').html(data.d_starttime +'/ '+data.d_startpoint);
				$('#etime').html(data.d_endtime+'/ '+data.d_endpoint);

				

				//소켓서버 걸쳐 운전자 페이지로 데이터 전송
				socket.emit('send payinfo', 
					data.payidx,
					data.paydate,
					data.d_commute,
					data.d_distance,
					data.d_fee,
					data.paymethod,
					data.d_starttime,
					data.d_startpoint,
					data.d_endtime,
					data.d_endpoint
				);

				socket.on('receive pay result', function(
				payidx, paydate, d_commute, d_distance, d_fee, paymethod, 
        		d_starttime, d_startpoint, d_endtime, d_endpoint
				){
					console.log('운전자에게 결제 정보 전달완료', payidx);
					//탑승자 페이지 갱신 
					setTimeout(function(){
						//일정 시간 후 : 탑승자 후기 작성 페이지로 이동 
						window.location.href='http://localhost:8080/parclient/review/passengerWrite.jsp?payidx='+data.payidx;
					}, 10000);
				});
		}, 
		error : function(e) {
			console.log('결제내역07 '+e);
			window.location.href = "http://localhost:8080/parclient/kakao/fail.jsp?r_idx="+data.r_idx;
		}
	})	
}
