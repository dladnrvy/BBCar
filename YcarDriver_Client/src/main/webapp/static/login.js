/**
 * 
 */

// 폼:: ID 아이디 찾기
function show_findID() {

	$('#LoginForm').css("display", "none");
	$('#LoginForm2').css("display", "block");
}
// 폼:: PW 비밀번호 찾기
function show_findPW() {

	$('#LoginForm').css("display", "none");
	$('#LoginForm3').css("display", "block");
}

// 로그인 유효성검사 pattern:::: ID PW EMAIL
var patternId = /^[a-z0-9]{5,12}$/;
var patternPw = /(?=.*[0-9])(?=.*[~`!@#$%^&*])([a-zA-Z0-9~`!@#$%^&*]).{5,12}/;
var patternEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

// css설정: 유효성검사 경고문구
function warnMsg(elementName, msg) {
	var element = document.getElementById(elementName);
	$(element).css('display', 'block');
	$(element).addClass('warn_red');
	$(element).html(msg);
}


// 로그인 유효성검사:::: id
$('#id').focusout(function() {
	var id = $('#id').val(); // 입력한 id값

	var chk = patternId.test(id);

	$('#idchkmsg').css('display', 'none');
	$('#idchkbox').prop('checked', false);

	if (id == '') {
		warnMsg('idchkmsg', 'ID를 입력해 주세요');
	} else if (id.indexOf(" ") >= 0) {
		warnMsg('idchkmsg', '아이디에 공백은 사용할 수 없습니다');
	} else {
		$('#idchkbox').prop('checked', true);
		$('#idchkmsg').removeClass('warn_red');
		$('#idchkmsg').css('display', 'none');
	}
});

// 로그인 유효성검사:::: pw
$('#pw').focusout(function() {
	var pw = $('#pw').val();
	var chk = patternPw.test(pw);

	$('#pwchkmsg').css('display', 'none');
	$('#pwchkbox').prop('checked', false);

	if (pw == '') {
		warnMsg('pwchkmsg', 'PW를 입력해 주세요');
	} else if (pw.indexOf(" ") >= 0) {
		warnMsg('pwchkmsg', '공백은 사용할 수 없습니다');
	} else {
		$('#pwchkbox').prop('checked', true);
		$('#pwchkmsg').removeClass('warn_red');
		$('#pwchkmsg').css('display', 'none');
	}
});


// 로그인
function login() {
	var box_id = $('#idchkbox').prop('checked');
	var box_pw = $('#pwchkbox').prop('checked');

	if (box_id && box_pw) {
		$.ajax({
			url : 'http://localhost:8080/dClient/login',
			type : 'POST',
			data : JSON.stringify({
				id : $('#id').val(),
				pw : $('#pw').val()
			}),
			contentType : 'application/json;charset=utf-8',
			success : function(data) {
				console.log('성공 ㅎㅎ' + data);
				if(data == '4'){
					location.href="http://localhost:8080/dClient/mypage";
				} else if (data == '3'){
					location.href="mypage/changePW";
				} else if( data == '2' || data == '1'){
					warnMsg('login_msg', '탈퇴한 회원이거나 아이디 혹은 비밀번호가 일치하지 않습니다');
				}
				
			},
			error : function(err) {
				console.log('님 실패여 ㅎㅎ' + JSON.stringify(err));
			}
		});
	} else {
		warnMsg('idchkmsg', 'ID를 입력해 주세요');
		warnMsg('pwchkmsg', 'PW를 입력해 주세요');
	}
}

// 아이디찾기버튼누를때
function searchID() {
	var name = $('#fid_name').val();
	var email = $('#fid_email').val();
	
	$.ajax({
		url : 'http://localhost:8080/dClient/login/findID',
		type : 'POST',
		data : JSON.stringify({
			name : name,
			email : email
		}),
		contentType : 'application/json;charset=utf-8',
		dataType: 'text',
		success : function(data) {
			console.log('성공 ㅎㅎ ::  ' + data);
//			console.log(typeof(data));
			
			html = '';
			if(data !=  ''){
				html += name + '님의 아이디는 ';
				html += data + ' 입니다';
			} else {
				html += '이름과 이메일을 정확하게 입력해 주세요';
			}
			$('#fid_msg').html(html);
		},
		error : function(err) {
			console.log('님 실패여 ㅎㅎ' + JSON.stringify(err));
		}
	});
}

function searchPW() {
	var id = $('#fpw_id').val();
	var email = $('#fpw_email').val();
	
	$.ajax({
		url : 'http://localhost:8080/dClient/login/findPW',
		type : 'POST',
		data : JSON.stringify({
			id : id,
			email : email
		}),
		contentType : 'application/json;charset=utf-8',
		dataType: 'text',
		success : function(data) {
			console.log('성공 ㅎㅎ ::  ' + data);
//			console.log(typeof(data));
			
			html = '';
			if(data ==  'success'){
				html += '임시 비밀번호가 '+email + ' 로 발송되었습니다';
			} else {
				html += '아이디와 이메일을 정확하게 입력해 주세요';
			}
			$('#fpw_msg').html(html);
		},
		error : function(err) {
			console.log('님 실패여 ㅎㅎ' + JSON.stringify(err));
		}
	});
}

// step1 유효성검사:::: email
$('#email').focusout(function() {
	var email = $('#email').val();
	var chk = patternEmail.test(email);

	$('#emailchkmsg').css('display', 'none');
	$('#emailchkbox').prop('checked', false);

	if (email == '') {
		warnMsg('emailchkmsg', 'EMAIL을 입력해 주세요');
	} else if (email.indexOf(" ") >= 0) {
		warnMsg('emailchkmsg', '공백은 사용할 수 없습니다');
	} else if (!chk) {
		warnMsg('emailchkmsg', '올바른 이메일 형식으로 입력해주세요');
	} else if (chk) {
		$('#emailchkbox').prop('checked', true);
		$('#emailchkmsg').removeClass('warn_red');
		$('#emailchkmsg').css('display', 'none');
	}
});

// 이메일 인증하기
function verifyEmail() {
	var cemail = $('#cemail').val();
	console.log('메일보내기전:: ' + cemail);

	var chkbox = $('#cmchkbox').prop('checked');

	if (chkbox) {
		$
				.ajax({
					url : 'http://localhost:8080/driver/join/mailAuth',
					type : 'GET',
					data : {
						cemail : cemail
					},
					success : function(code) {
						var html = '';
						html += '<label for="code">인증번호</label>';
						html += '<div><input type="text" class="form-control col-8" id="code">';
						html += '<span class="btn btn-primary" id="chkCode" onclick="verifyCode(\''
								+ code + '\')">인증하기</span></div>';
						html += '<span id="codechkmsg"></span>';

						$('#joinCode').html(html);
						countdown('codechkmsg', 3, code);

						console.log('메일보냄::::' + code);
					},
					error : function(err) {
						console.log('에러::::' + err);
						console.log('에러::::' + JSON.stringify(err));

					}
				});
	} else {
		alert('정확하게 입력하셔야 인증번호가 발송됩니다');
	}
}

// 메일로받은 인증번호와 입력한 인증번호가 맞는지 체크
function verifyCode(code) {
	var inputcode = $('#code').val(); // 사용자가 입력한 코드
	if (inputcode == code) {
		$('#comchkbox').prop('checked', true);
		return true;

	} else if (inputcode != code) {
		/* $('#verifyNotice').html('정확한 인증번호를 눌러주세요'); */
		return false;
	}
}