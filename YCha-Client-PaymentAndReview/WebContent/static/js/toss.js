var socket = io('http://localhost:3000');
$(document).ready(function(){

	//url 처음부터 ?까지 삭제 
	var paramUrl = document.location.search.substring('1'); 
	var params = paramUrl.split('&');  //&을 기준으로 분리 
	
	//r_idx
	var paramArray0 = params[0].split('=');
	console.log('toss 결제 성공 후 token 값 02: '+paramArray0[0]+' / '+paramArray0[1]);

	//status
	var paramArray1 = params[1].split('=');
	console.log('toss 결제 성공 후 token 값 03: '+paramArray1[0]+' / '+paramArray1[1]);

	//orderNo
	var paramArray2 = params[2].split('=');
	console.log('toss 결제 성공 후 token 값 04: '+paramArray2[0]+' / '+paramArray2[1]);
	
	//payMethod
	var paramArray3 = params[3].split('=');
	console.log('toss 결제 성공 후 token 값 04: '+paramArray3[0]+' / '+paramArray3[1]);
	
	//만약 status가 pay_complete이라면, 결제 완료 처리 진행
	if(paramArray1[1]=='PAY_COMPLETE') {
		var r_idx = paramArray0[1];
		console.log('toss pay success 처리 시작', r_idx);
		
		//r_idx 방 조인 : 유니크 키인 r_idx 이용 
		socket.emit('join payroom', r_idx);
		
		//listener : payroom result
		socket.on('payroom result', function(msg){
			console.log(msg);
		});
		 
		//1. 결제 DB에 저장 
		//2. 결제 내역 보여주기 위해 따로 매서드로 페이지 구성 처리 
		$.ajax({
			url : "http://localhost:8090/parboot/payment/toss",
			type: 'post',
			data : JSON.stringify({
				r_idx : r_idx,
				paymethod : paramArray3[1]
			}),
			contentType:'application/json;charset=UTF-8;',
			success : function(data) {
					console.log('결제내역08 '+data);
					//탑승자 - 결제 내역 화면 표시 
					$('#date').html(data.paydate);
					$('#commuteType').html(data.d_commute);
//					$('#distance').html(data.d_distance+'km / '+(data.d_endtime-data.d_starttime)+'분');
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
}) 