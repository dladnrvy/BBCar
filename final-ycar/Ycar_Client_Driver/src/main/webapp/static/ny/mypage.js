/**
 * 
 */

// idx 정의
var idx = $('#hiddenIDX').val();

$(document).ready(function() {
	showMyInfo();
	console.log('idx?  \n ' + idx);
});



// mypage에 개인정보 불러오기
function showMyInfo() {
	
	displayForm(); // 폼 사라지게
	$('#myInfoForm1').css("display", "block");
	$('#myInfoForm2').css("display", "block");
	$('#myInfoForm3').css("display", "block");

	$.ajax({
//		url : 'http://13.209.40.5:8080/dClient/mypage/' + idx,
//		url : 'http://localhost:8080/dClient/mypage/' + idx,
		url : 'http://localhost:8080/driver/mypage/' + idx,
		type : 'GET',
		success : function(data) {

//			console.log("data체크체크 \n" + JSON.stringify(data));

			// map으로 받아옴.
			var myinfo = data.myinfo;
			var myroute = data.myroute; // List로 받아옴

			// route가 등록되어 있으면 각 타입에 따라 값 넣어줌
			if (myroute != null) {
				for (var i = 0; i < myroute.length; i++) {
					evalMyroute(myroute[i]);
				}
			}

			getMyinfo(myinfo);

		},
		error : function(err) {
			console.log('err:::' + err);
			console.log('err:::' + JSON.stringify(err));
		}
	});
}

// 드라이버 기본정보 가져오기
function getMyinfo(myinfo) {
	var cartype = evalCarType(myinfo.cartype); // 자동차종류 한글로 바꿔줌

	$('#id').html(myinfo.id);
	$('#name').html(myinfo.name);
	$('#nickname').html(myinfo.nickname);
	$('#email').html(myinfo.email);
	$('#company').html(myinfo.company);
	$('#carnum').html(myinfo.carnum);
	$('#cartype').html(cartype);

	getDoption(myinfo.d_option);
	
	//일반가입회원(간편가입)이 아니면 비밀번호변경버튼 안보이게 하기
	if(myinfo.type != 'S'){
		$('#changeinfo1_2').css('display', 'none');
	}
}

// 자동차 종류 다시 변경해주기
function evalCarType(cartype) {
	var type = '';
	if (cartype == 'L') {
		type = '대형';
	} else if (cartype == 'M') {
		type = '중형';
	} else if (cartype == 'S') {
		type = '소형';
	} 
	return type;
}

// myroute 값 판별하기
function evalMyroute(route) {

	if (route.type == 'H') {
		document.getElementById('myHome').innerHTML = route.place;

	} else if (route.type == 'C') {
		document.getElementById('myCompany').innerHTML = route.place;

	} else if (route.type == 'E') {
		document.getElementById('MyEtc').innerHTML = route.place;

	}
}

// drive option (운전시 선호옵션) array로 변경해주기
function getDoption(option) {
	var list = option.split(' ');
//	console.log('list :: ' + list);

	var msg = ''; // 옵션 값(동성 빠르게 천천히 등,,)
	var output = ''; // html에 넣어줄 값

	for (var i = 0; i < list.length; i++) {
		msg = evalMyDriveOption(list[i]);

		output += '<div>';
		output += '<span class="btn btn-black form-control">' + msg + '</span>';
		output += '</div>';

	}

	document.getElementById('option_wrap').innerHTML = output;
}

// 선호옵션 값 char -> String 변경해주기
function evalMyDriveOption(opt) {
	var msg = '';

	if (opt == 'a') {
		msg = '동성';
	} else if (opt == 'b') {
		msg = '조용';
	} else if (opt == 'c') {
		msg = '뒷자리가능';
	} else if (opt == 'd') {
		msg = '금연';
	} else if (opt == 'e') {
		msg = '천천히';
	} else if (opt == 'f') {
		msg = '빠르게';
	}
	return msg; // 다음 호출값에 넣어주거나.. 암튼,,
}

// -------------------변경 시작-------------------

// 모든 폼 사라지게 하기
function displayForm() {
	$('#myInfoForm1').css("display", "none");
	$('#myInfoForm2').css("display", "none");
	$('#myInfoForm3').css("display", "none");
	$('#myInfoForm4').css("display", "none");
	$('#myInfoForm5').css("display", "none");
	$('#myInfoForm6').css("display", "none");
	$('#myInfoForm7').css("display", "none");
	$('#myInfoForm8').css("display", "none");
	$('#hiddenform').css("display", "none");
}

// 폼 ::: 선호하는 운전옵션 등록및변경
function setMyd_option() {
	displayForm(); // 폼 사라지게
	$('#hiddenform').css("display", "block");
	$('#myInfoForm8').css("display", "block");
}

// 폼 ::: 개인 기본 정보 등록및변경
function setMyInfo() {

	displayForm();
	$('#hiddenform').css("display", "block");
	$('#myInfoForm4').css("display", "block");

	$('#edit_email').val($('#email').html());
	$('#edit_carnum').val($('#carnum').html());
    
	var cartype = $('#cartype').html();
//    console.log('cartype 체크 \n'+cartype);
    
    if(cartype == '대형'){
        $('#edit_cartype_L').prop('selected', true);
    } else if(cartype == '중형'){
        $('#edit_cartype_M').prop('selected', true);
    } else if(cartype == '소형'){
        $('#edit_cartype_S').prop('selected', true);
    }

}

// 선호하는 운전옵션 string 하나로 만들기
function getd_option() {
	var chk = $("input[name=drivetype]");
	var type = new Array(chk.length);

	for (var i = 0; i < chk.length; i++) {
		if (chk[i].checked == true) {
			type[i] = chk[i].value;
		}
	}

	var cleanArray = type.filter(function() {
		return true
	});
	var s = cleanArray.join(' ');

	return s;
}

// 선호하는 운전옵션 등록및변경
function edit_doption() {
	var option = getd_option();
	$.ajax({
		url : 'http://localhost:8080/driver/mypage/' ,
//		url : 'http://13.209.40.5:8080/dClient/mypage/' ,
//		url : 'http://localhost:8080/dClient/mypage/' ,
		type : 'PUT',
		data : JSON.stringify({
			d_idx : idx,
			d_option : option
		}),
		contentType : 'application/json; charset=utf-8',
		success : function(data) {
			alert('정상적으로 수정되었습니다');
			showMyInfo();
		},
		error : function(err) {
			consol.log('에러 \n' + JSON.stringify(err));
			setMyd_option();
		}
	});
}

// 개인 기본 정보 등록및변경
function edit_myinfo() {
	var email = $('#edit_email').val();
	var carnum = $('#edit_carnum').val();
	var cartype = $('#edit_cartype option:selected').val();

//	console.log('email' + email);
//	console.log('carnum' + carnum);
//	console.log('cartype' + cartype);
	$.ajax({
		url : 'http://localhost:8080/driver/mypage/' ,
//		url : 'http://13.209.40.5:8080/dClient/mypage/' ,
//		url : 'http://localhost:8080/dClient/mypage/' ,
		type : 'PUT',
		data : JSON.stringify({
			d_idx : idx,
			email : email,
			carnum : carnum,
			cartype : cartype

		}),
		contentType : 'application/json; charset=utf-8',
		success : function(data) {
			alert('정상적으로 수정되었습니다');
			showMyInfo();
		},
		error : function(err) {
			consol.log('에러 \n' + err);
			consol.log('에러 \n' + JSON.stringify(err));
			setMyInfo();
		}
	});
}

//비밀번호 변경 관련
function changeMyPW() {
	location.href="mypage/changePW";
}