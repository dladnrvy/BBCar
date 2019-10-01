/**
 * 
 */
//idx 정의
var idx = $('#hiddenIDX').val();

//비밀번호 변경 눌렀을 때
function changeMyPW() {
	location.href="http://localhost:8080/driver/mypage/changePW";
//	location.href="http://13.209.40.5:8080/dClient/mypage/changePW";
//	location.href="http://localhost:8080/dClient/mypage/changePW";
}

// 비밀번호변경시
var patternPw = /(?=.*[0-9])(?=.*[~`!@#$%^&*])([a-zA-Z0-9~`!@#$%^&*]).{5,12}/;

//css설정: 유효성검사 경고문구
function warnMsg(elementName, msg) {
	var element = document.getElementById(elementName);
	$(element).css('display', 'block');
	$(element).addClass('warn_red');
	$(element).html(msg);
}

//비밀번호변경전 현재비밀번호 유효성검사:::: pw    
$('#curPW').focusout(function(){
	var pw = $('#curPW').val();
	
	$('#curPW_msg').css('display','none');
	$('#curPW_chkbox').prop('checked',false);
	
	if(pw == ''){
		warnMsg('curPW_msg','PW를 입력해 주세요');
	} else if (pw.indexOf(" ") >= 0){
		warnMsg('curPW_msg', '공백은 사용할 수 없습니다');
	} else {
		$('#curPW_chkbox').prop('checked',true);
		$('#curPW_msg').removeClass('warn_red');
		$('#curPW_msg').css('display','none');
	}
});


//현재 비밀번호 체크
function checkMyCurPW() {
	var pw = $('#curPW').val();
	var chk1 = $('#curPW_chkbox').prop('checked');
	if(chk1){
		console.log('pw?\n'+ pw);
		$.ajax({
			url : 'http://localhost:8080/driver/mypage/chkpw' ,
//			url : 'http://13.209.40.5:8080/dClient/mypage/chkpw' ,
//			url : 'http://localhost:8080/dClient/mypage/chkpw' ,
			type : 'POST',
			data : JSON.stringify({
				d_idx : idx,
				pw : pw
			}),
			contentType : 'application/json; charset=utf-8',
			success : function(data) {
				
				console.log('data?? \n ' + data);
				
				if(data == 1){
					alert('현재 비밀번호 확인완료');
	
					$('#LoginForm').css('display', 'none');
					$('#LoginForm2').css('display', 'block');
				} else {
					warnMsg('chkPW_msg', '비밀번호가 일치하지 않습니다 확인 부탁드립니다');
				}
			},
			error : function(err) {
				consol.log('에러 \n' + err);
			}
		});
	}else {
		warnMsg('chkPW_msg', '정확하게 입력 부탁드립니다');
	}
}


//비밀번호 변경
function updatePW() {
	var pw = $('#pw').val();
	var chk1 = $('#pw_chkbox').val();
	var chk2 = $('#pw2_chkbox').val();
	
	//둘다 ok 되었을 때 전송가능하게 함.
	if(chk1 && chk2){
		$.ajax({
			url : 'http://localhost:8080/driver/mypage/chkpw' ,
//			url : 'http://13.209.40.5:8080/dClient/mypage/chkpw' ,
//			url : 'http://localhost:8080/dClient/mypage/chkpw' ,
			type : 'PUT',
			data : JSON.stringify({
				d_idx : idx,
				pw : pw
			}),
			contentType : 'application/json; charset=utf-8',
			success : function(data) {
				
				console.log('data?? \n' + data);
				
				if(data == 1){
					alert('비밀번호 변경완료');
					location.href = "http://localhost:8080/driver/mypage";
//					location.href = "http://13.209.40.5:8080/dClient/mypage";
//					location.href = "http://localhost:8080/dClient/mypage";
	
				} else {
					alert('비밀번호 변경 오류, 다시 입력해 주세요');
					$('#LoginForm2').css('display', 'none');
					$('#LoginForm1').css('display', 'block');
				}
			},
			error : function(err) {
				consol.log('에러 \n' + err);
			}
		});
	} else {
		alert('다시 한번 확인 해 주세요');
	}
	
}


//비밀번호변경 유효성검사:::: pw    
$('#pw').focusout(function(){
	var pw = $('#pw').val();
	var chk = patternPw.test(pw);
    
	$('#pw_msg').css('display','none');
	$('#pw_chkbox').prop('checked',false);

	if(pw == ''){
	    warnMsg('pw_msg','PW를 입력해 주세요');
	} else if (pw.length < 6 || pw.length > 12){
	    warnMsg('pw_msg','영문 대소문자, 숫자 및 특수문자 포함 6에서 12사이로 입력해주세요');
	} else if (pw.indexOf(" ") >= 0){
	    warnMsg('pw_msg', '공백은 사용할 수 없습니다');
	} else if (!chk){
	    warnMsg('pw_msg', '6~12자의 영문 대소문자와 숫자, 특수문자(~`!@#$%^&*) 최소 1개씩 입력해주세요');
	} else if(chk){
	    $('#pw_chkbox').prop('checked',true);
	    $('#pw_msg').removeClass('warn_red');
	    $('#pw_msg').css('display','none');
	}
});
//비밀번호변경 유효성검사:::: pw2
$('#pw2').focusout(function() {
	var pw = $('#pw').val();
	var pwChk = $('#pw2').val();
	var chk = pw == pwChk ? true : false;

	$('#pw2_msg').css('display', 'none');
	$('#pw2_chkbox').prop('checked', false);

	if (pwChk == '') {
		warnMsg('pw2_msg', 'PW를 입력해 주세요');
	} else if (pwChk.length < 6 || pwChk.length > 12) {
		warnMsg('pw2_msg', '영문 대소문자, 숫자 및 특수문자 포함 6에서 12사이로 입력해주세요');
	} else if (pwChk.indexOf(" ") >= 0) {
		warnMsg('pw2_msg', '공백은 사용할 수 없습니다');
	} else if (!chk) {
		warnMsg('pw2_msg', '비밀번호가 다릅니다');
	} else if (chk) {
		$('#pw2_chkbox').prop('checked', true);
		$('#pw2_msg').removeClass('warn_red');
		$('#pw2_msg').css('display', 'none');
	}
});