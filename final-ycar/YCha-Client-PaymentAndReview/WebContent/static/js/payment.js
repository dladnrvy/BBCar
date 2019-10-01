//카카오 결제 요청 
function kakaoPayProcess() {
	
	//운행 중 화면으로부터 넘어올 때 r_idx 받아오기
	//url 처음부터 ?까지 삭제 
	var r_idx = document.location.search.substring('1').split('=')[1]; 	
	console.log('kakaopay 요청 01  '+r_idx);
	
	$.ajax({
		url : "http://localhost:8080/par/payment/kakao/r_idx/"+r_idx,
        type: 'POST',
		dataType : "text",
		success : function(data) {
			console.log('kakao 결제 성공  - 성공페이지로 이동', data);
			window.location.href = data; //성공할 경우 클라이언트 성공 페이지로 이동 
			//ajax 로 요청했는데 controller 단에서 redirect 할 경우, cors origin 에러가 발생하게 된다. 
			//요청하는 위치가 달라지기 때문 : client  vs  server 
			//따라서 client 단으로 다시 돌아와서 원하는 페이지로 redirect 하도록 처리함 
		},
		error : function(data) {
			console.log('kakao 결제 실패 - 실패 페이지 이동 ');
			window.location.href = "http://localhost:8080/parclient/kakao/fail.jsp?r_idx="+r_idx;
		}
	})
}

//토스 결제요청
function tossPayProcess() {
	
	//운행 중 화면으로부터 넘어올 때 r_idx 받아오기
	//url 처음부터 ?까지 삭제 
	var r_idx = document.location.search.substring('1').split('=')[1]; 	
	console.log('tosspay 요청 01  '+r_idx);
	
	$.ajax({
		url : 'http://localhost:8090/parboot/payment/toss/r_idx/'+r_idx,
		type : 'POST',
		dataType : 'json',
		success : function(data) {
			console.log('toss pay success' + data);
			console.log('toss pay success  ' + data.checkoutPage);
			
			//결제 요청 성공 페이지로 이동됨
			location.replace(data.checkoutPage);
			
			//window.location.href='\''+data.checkoutPage+'\''; 
			//console.log('\'' + data.checkoutPage + '\'');
			//href를 쓰니까 context path 가 붙는 상황 발생 
			//따라서 replace 로 고쳐서 url 아예 바꿔줌 
		},
		error : function(e) {
			console.log('결제 요청 실패 ' + e);
			window.location.replace = "http://localhost:8080/parclient/kakao/fail.jsp?r_idx="+r_idx;
		}
	})
}

//페이코 결제요청 
/*function paycoProcess() {
	
}*/

//아임포트 결제요청 - KG 이니시스  
function importProcess() {
	//운행 중 화면으로부터 넘어올 때 r_idx 받아오기
	//url 처음부터 ?까지 삭제 
	var r_idx = document.location.search.substring('1').split('=')[1]; 	
	console.log('kg inisis로 결제 요청 01  '+r_idx);
	
	//1. ajax 로 결제 정보 받아오기 from reservation 
	//2. 받아온 정보 import request에 넣어주기 
	//- 금액
	//- passenger email 
	//- passenger name 
	//3. import 응답 데이터 결제 성공 페이지: 파라미터로 넘겨주기 
	
	$.ajax({
		url : 'http://localhost:8090/parboot/payment/import/r_idx/'+r_idx,
		type : 'GET',
		dataType : 'json',
		success : function(data) {
			console.log('결제를 위해 필요한 정보 get 완료 ', data);
			console.log('결제를 위해 필요한 정보 get 완료01 ', data.email);
			//아임포트 
			var IMP = window.IMP; // 생략해도 괜찮습니다.
			IMP.init("imp61079881"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

			// IMP.request_pay(param, callback) 호출
			IMP.request_pay({ // param
				pg : 'html5_inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '연차 카풀 서비스',
				amount : data.d_fee,
				buyer_email : data.email,
				buyer_name : data.name,
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456',
			}, function(rsp) { // callback
				if (rsp.success) {
					console.log('성공!', rsp);
					// 결제 성공 시 로직,
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					
					console.log(msg);
					var url = 'http://localhost:8080/parclient/import/success.jsp?paid_amount='+rsp.paid_amount+'&apply_num='+rsp.apply_num+'&r_idx='+r_idx;
					location.replace(url); //결제 성공 페이지로 이동
				} else {
					// 결제 실패 시 로직,
					alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					
					console.log(msg);
					window.location.replace = "http://localhost:8080/parclient/kakao/fail.jsp?r_idx="+r_idx; //결제 실패 페이지로 이동
				}
			});
		}, 
		error : function(e) {
			console.log('아임포트 결제요청 에러발생', e);
			window.location.replace = "http://localhost:8080/parclient/kakao/fail.jsp?r_idx="+r_idx; //결제 실패 페이지로 이동
		}
	});
}