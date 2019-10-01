function reChoosePayMethod() {
	//url 로부터 token 값 가져오기  
	var params = document.location.href.split('?'); 
	console.log('kakao 결제 실패 후 전달받은 파라미터 r_idx 값 :: '+params[1]);
	
	//다시 결제 수단 선택 페이지로 이동처리
	window.location.href="http://localhost:8080/parclient/index.html?"+params;
}
