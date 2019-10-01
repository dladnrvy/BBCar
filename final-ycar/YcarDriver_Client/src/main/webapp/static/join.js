/**
 * 
 */

function step1(type) {
	sessionStorage.setItem("jointype", type);

	$('#signUpSelect').css("display", "none");
	$('#signUpForm').css("display", "block");
}

function jumpToStep2(type) {
	sessionStorage.setItem("jointype", type);

	$('#signUpSelect').css("display", "none");
	$('#signUpForm2').css("display", "block");
}

function step2() {
	//필수입력란 다 썼는지 검사
    var box_id = $('#idchkbox').prop('checked');
    var box_pw = $('#pwchkbox').prop('checked');
    var box_pw2 = $('#pw2chkbox').prop('checked');
    var box_email = $('#emailchkbox').prop('checked');
    
    if( box_id && box_pw && box_pw2 && box_email) {
        
        var step1 = {
            id : $('#id').val(),
            pw : $('#pw').val(),
            email : $('#email').val()
        }
        sessionStorage.setItem("step1", JSON.stringify(step1));
        /* 풀려면 var orderDetail = JSON.parse(sessionStorage.getItem("step1")) */

        $('#signUpForm').css("display", "none");
        $('#signUpForm2').css("display", "block");
    } else {
        alert('필수입력입니다. \n정확하게 입력하셔야 다음 단계로 넘어갑니다');
    }
}

/* 인증버튼 누른 후에 chkbox true 된 상태에서만 다음스텝가능 */
function step3() {
	var valid = $('#comchkbox').prop('checked');
	var chk = $('#echkbox').prop('checked');

	if (valid) {
		var step2;
		if (chk) {
			step2 = {
				ctype : "E",
				company : $('#company').val(),
				cemail : $('#cemail').val()
			}
		} else {
			step2 = {
				ctype : "P",
				company : $('#company').val(),
				cnum : $('#cnum').val()
			}
		}

		sessionStorage.setItem("step2", JSON.stringify(step2));
		$('#signUpForm2').css("display", "none");
		$('#signUpForm3').css("display", "block");
	} else {
		alert('인증 후에 다음 단계로 진행됩니다.');
	}
}

function step4() {
	var step3 = {
		lscnum : $('#lscnum').val(),
		name : $('#name').val(),
		idnum1 : $('#idnum1').val(),
		idnum2 : $('#idnum2').val(),
		lsctype : $('#lsctype option:selected').val(),
		sdate : $('#sdate').val(),
		police : $('#police').val()
	}
	sessionStorage.setItem("step3", JSON.stringify(step3));
	/* 풀려면 var orderDetail = JSON.parse(sessionStorage.getItem("step1")) */

	$('#signUpForm3').css("display", "none");
	$('#signUpForm4').css("display", "block");
}

function step5() {
	var step4 = {
		carnum : $('#carnum').val(),
		cartype : $('#cartype option:selected').val()
	}
	sessionStorage.setItem("step4", JSON.stringify(step4));

	$('#signUpForm4').css("display", "none");
	$('#signUpForm5').css("display", "block");
}

function join() {
	var option = getType(); // 배열로 들어감.

	var all2 = JSON.parse(sessionStorage.getItem("step2"));
	var all3 = JSON.parse(sessionStorage.getItem("step3"));
	var all4 = JSON.parse(sessionStorage.getItem("step4"));

	var ctype = all2.ctype;

	var all = {
		type : sessionStorage.getItem("jointype"), // 가입타입

		ctype : all2.ctype, // 회사인증타입
		company : all2.company, // 회사명

		lscnum : all3.lscnum, // 운전면허증번호
		name : all3.name,
		idnum1 : all3.idnum1, // 주민번호앞6자리
		idnum2 : all3.idnum2, // 주민번호뒤1자리
		lsctype : all3.lsctype, // 면허종류
		police : all3.police, // 허가경찰청장
		sdate : all3.sdate, // 허가일

		carnum : all4.carnum,
		cartype : all4.cartype,

		d_option : option

	};

	// 분기처리 가입타입type이 간편가입일 경우
	if (sessionStorage.getItem("jointype") == "S") {
		var all1 = JSON.parse(sessionStorage.getItem("step1"));

		all.id = all1.id; // 아이디
		all.pw = all1.pw; // 비밀번호
		all.email = all1.email;
	}

	// 분기처리 ctype에 따라
	if (ctype == "E") {
		all.cemail = all2.cemail;
	} else if (ctype == "P") {
		all.cnum = all2.cnum;
	}
	// 분기처리 성별
	if (all3.idnum2 == "1" || all3.idnum2 == "3") {
		all.gender = "M";

	} else if (all3.idnum2 == "2" || all3.idnum2 == "4") {
		all.gender = "F";
	}
	console.log(all);
	console.log(JSON.stringify(all));

	$.ajax({
		url : 'http://localhost:8080/dClient/join',
		type : 'post',
		data : JSON.stringify(all),
		contentType : 'application/json;charset=utf-8',

		success : function(data) {
			if (data > 0) {
				console.log('success성공');
				//TODO LOGIN 으로 넘겨야함
			} else {
				console.log('success:실패')
			}
		},
		error : function(data) {
			console.log('에러' + data);
			console.log('에러' + JSON.stringify(data));
		}

	});

	sessionStorage.removeItem("jointype");
	sessionStorage.removeItem("step1");
	sessionStorage.removeItem("step2");
	sessionStorage.removeItem("step3");
	sessionStorage.removeItem("step4");
}

function getType() {
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

//step1 유효성검사 pattern:::: ID PW EMAIL     
var patternId = /^[a-z0-9]{5,12}$/;
var patternPw = /(?=.*[0-9])(?=.*[~`!@#$%^&*])([a-zA-Z0-9~`!@#$%^&*]).{5,12}/;  
var patternEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
  
  
//css설정: 유효성검사 경고문구
function warnMsg(elementName, msg){
  var element = document.getElementById(elementName);
  $(element).css('display','block');
  $(element).addClass('warn_red');   
  $(element).html(msg);
}


//step1 유효성검사:::: id
$('#id').focusout(function(){
  var id = $('#id').val(); //입력한 id값
  
  var chk = patternId.test(id);

  $('#idchkmsg').css('display','none');
  $('#idchkbox').prop('checked',false);
  
      
  if(id == ''){
      warnMsg('idchkmsg','ID를 입력해 주세요');
  } else if (id.length < 5 || id.length > 12){
      warnMsg('idchkmsg','ID는 영문, 숫자 포함 5에서 12사이로 입력해 주세요');
  } else if (id.indexOf(" ")>= 0){
      warnMsg('idchkmsg','아이디에 공백은 사용할 수 없습니다');
  } else if (!chk){
      warnMsg('idchkmsg','5~12자의 영문 소문자와 숫자만 사용 가능합니다');
  
  } else if(chk){
      
      $.ajax({
          url:'http://localhost:8080/driver/join/idcheck',
          type: 'GET',
          data: {
              id: id
          },
          success: function(data){
              if(data == 'Y' && chk){
                  $('#idchkbox').prop('checked',true);
                  $('#idchkmsg').removeClass('warn_red');
                  $('#idchkmsg').css('display','none');

              }else if (data == 'N'){
                  warnMsg('idchkmsg','이미 사용중인 아이디 입니다');
              }
          },
          error: function(err){
              console.log('error'+err)   ;
          }
      });
  }
});

//step1 유효성검사:::: pw    
$('#pw').focusout(function(){
  var pw = $('#pw').val();
  var chk = patternPw.test(pw);
      
  $('#pwchkmsg').css('display','none');
  $('#pwchkbox').prop('checked',false);
  
  if(pw == ''){
      warnMsg('pwchkmsg','PW를 입력해 주세요');
  } else if (pw.length < 6 || pw.length > 12){
      warnMsg('pwchkmsg','영문 대소문자, 숫자 및 특수문자 포함 6에서 12사이로 입력해주세요');
  } else if (pw.indexOf(" ") >= 0){
      warnMsg('pwchkmsg', '공백은 사용할 수 없습니다');
  } else if (!chk){
      warnMsg('pwchkmsg', '6~12자의 영문 대소문자와 숫자, 특수문자(~`!@#$%^&*) 최소 1개씩 입력해주세요');
  } else if(chk){
      $('#pwchkbox').prop('checked',true);
      $('#pwchkmsg').removeClass('warn_red');
      $('#pwchkmsg').css('display','none');
  }
});
  
  
//step1 유효성검사:::: pw2    
$('#pw2').focusout(function(){
  var pw = $('#pw').val();
  var pwChk = $('#pw2').val();
  var chk = pw==pwChk?true:false;
      
  $('#pw2chkmsg').css('display','none');
  $('#pw2chkbox').prop('checked',false);
  
  if(pwChk == ''){
      warnMsg('pw2chkmsg','PW를 입력해 주세요');
  } else if (pwChk.length < 6 || pwChk.length > 12){
      warnMsg('pw2chkmsg','영문 대소문자, 숫자 및 특수문자 포함 6에서 12사이로 입력해주세요');
  } else if (pwChk.indexOf(" ") >= 0){
      warnMsg('pw2chkmsg', '공백은 사용할 수 없습니다');
  } else if (!chk){
      warnMsg('pw2chkmsg', '비밀번호가 다릅니다');
  } else if(chk){
      $('#pw2chkbox').prop('checked',true);
      $('#pw2chkmsg').removeClass('warn_red');
      $('#pw2chkmsg').css('display','none');
  }
});   
  
  
//step1 유효성검사:::: email    
$('#email').focusout(function(){
  var email = $('#email').val();
  var chk = patternEmail.test(email);
      
  $('#emailchkmsg').css('display','none');
  $('#emailchkbox').prop('checked',false);
  
  if(email == ''){
      warnMsg('emailchkmsg','EMAIL을 입력해 주세요');
  } else if (email.indexOf(" ") >= 0){
      warnMsg('emailchkmsg', '공백은 사용할 수 없습니다');
  } else if (!chk){
      warnMsg('emailchkmsg', '올바른 이메일 형식으로 입력해주세요');
  } else if(chk){
      $('#emailchkbox').prop('checked',true);
      $('#emailchkmsg').removeClass('warn_red');
      $('#emailchkmsg').css('display','none');
  }
});       
  
  
//step2 유효성검사:::: cemail
$('#cemail').focusout(function(){
  var email = $('#cemail').val();
  var chk = patternEmail.test(email);
      
  $('#cmchkmsg').css('display','none');
  $('#cmchkbox').prop('checked',false);
  
  if(email == ''){
      warnMsg('cmchkmsg','EMAIL을 입력해 주세요');
  } else if (email.indexOf(" ") >= 0){
      warnMsg('cmchkmsg', '공백은 사용할 수 없습니다');
  } else if (!chk){
      warnMsg('cmchkmsg', '올바른 이메일 형식으로 입력해주세요');
  } else if(chk){
      $('#cmchkbox').prop('checked',true);
      $('#cmchkmsg').removeClass('warn_red');
      $('#cmchkmsg').css('display','none');
  }
});    
  
  
//회사이메일 인증하기
function verifyEmail(){
  var cemail = $('#cemail').val();
  console.log('메일보내기전:: '+cemail);
  
  var chkbox = $('#cmchkbox').prop('checked');
  
  if(chkbox){
      $.ajax({
          url:'http://localhost:8080/driver/join/mailAuth',
          type: 'GET',
          data: {
             cemail: cemail
          },
          success: function(code){
              var html = '';
              html += '<label for="code">인증번호</label>';
              html += '<div><input type="text" class="form-control col-8" id="code">';
              html += '<span class="btn btn-primary" id="chkCode" onclick="verifyCode(\''+code+'\')">인증하기</span></div>';
              html += '<span id="codechkmsg"></span>';

              $('#joinCode').html(html);
              countdown('codechkmsg', 3, code);

              console.log('메일보냄::::' + code);
          },
          error: function(err){
              console.log('에러::::' + err);
              console.log('에러::::' + JSON.stringify(err));

          }
      });
  } else {
      alert('정확하게 입력하셔야 인증번호가 발송됩니다');
  }
}    

//인증시간 카운트다운 3분    
function countdown( elementName, minutes, code ) {
  var element, endTime, mins, msLeft, time;

  function twoDigits( n ) {
      return (n < 10 ? "0" + n : n);
  }

  function updateTimer()
  {
      msLeft = endTime - (+new Date);
      if ( msLeft < 1000 ) {
          element.innerHTML = "인증시간 초과 인증번호를 다시 받아주세요";
      } else if (verifyCode(code)) {
          $('#verifyNotice').html('인증되었습니다. NEXT 버튼을 눌러주세요.');
//          $('#comchkbox').prop('checked', true);
      }else {
          time = new Date( msLeft );
          mins = time.getUTCMinutes();
          element.innerHTML = twoDigits( mins )  + ':' + twoDigits( time.getUTCSeconds() );
          setTimeout( updateTimer, time.getUTCMilliseconds() + 500 );
          /*$('#verifyNotice').html('정확한 인증번호를 눌러주세요');*/
      }
  }

  element = document.getElementById( elementName );
  endTime = (+new Date) + 1000 * (60*minutes) + 500;
  updateTimer();
}    
  
//메일로받은 인증번호와 입력한 인증번호가 맞는지 체크
function verifyCode(code){
  var inputcode = $('#code').val(); //사용자가 입력한 코드
  if(inputcode == code){
      $('#comchkbox').prop('checked', true);
      return true;
      
  } else if(inputcode != code) {
      /*$('#verifyNotice').html('정확한 인증번호를 눌러주세요');*/
      return false;
  }
}
// 사업장 있는지 확인
//function chkCnum() {
//	var company = $('#company').val();
//	var cnum = $('#cnum').val();
//
//	$.ajax({
//				url : 'http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getBassInfoSearch?wkpl_nm='
//						+ company
//						+ '&bzowr_rgst_no='
//						+ cnum
//						+ '&pageNo=1&startPage=1&numOfRows=1&pageSize=1&serviceKey=QAJekZ746A67XoW4BzNPxQQ6vEzVBNW7duHXxEKHN%2BTcMk5RN8CFMRzRdwZqz%2BTYFTcGrxW%2BgMoc4iuAuvaV2Q%3D%3D',
//				type : 'GET',
//				dataType : 'xml',
//				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
//				error : function(request, status, error) {
//					console.log("code : " + request.status + "\r\nmessage : "
//							+ request.reponseText + " \r\n status : " + status);
//				},
//
//				success : function(res) {
//					var myXML = res.responseText;
//					var JSONConvertedXML = $.xml2json(myXML);
//					var data = JSONConvertedXML;
//					var htmlSrc = new Array();
//
//					if (data.cmmMsgHeader.returnReasonCode != '00') {
//						htmlSrc.push("<tr><td colspan='2'>");
//						htmlSrc.push(data.cmmMsgHeader.errMsg);
//						htmlSrc.push("</td></tr> ");
//
//					} else if (data.header.resultCode == '00') {
//
//						var size = data.items.length;
//
//						if (size == null)
//							size = 1;
//
//						if (size == 1) {
//
//							var target = data.items;
//							htmlSrc.push("<tr>");
//							htmlSrc.push("<td>" + target.wkplNm + "</td>");
//							htmlSrc.push("<td>" + target.dataCrtYm + "</td>");
//							htmlSrc.push("<td>" + target.bzowrRgstNo + "</td>");
//							htmlSrc.push("</tr>");
//
//						} else if (size > 1) {
//							for (var i = 0; i < size; i++) {
//								var target = data.items[i];
//								htmlSrc.push("<tr>");
//								htmlSrc.push("<td>" + target.wkplNm + "</td>");
//								htmlSrc.push("<td>" + target.dataCrtYm
//										+ "</td>");
//								htmlSrc.push("<td>" + target.bzowrRgstNo
//										+ "</td>");
//								htmlSrc.push("</tr>");
//
//							}
//
//						}
//					}
//				}
//
//			});
//}

function displayValPaper(){
    var chk = $('#pchkbox').prop('checked');
    if(!chk){
        displayTabPaper();
    }
}
function displayValEmail(){
    var chk = $('#echkbox').prop('checked');
    if(!chk){
        displayTabEmail();
    }
}    
    
function displayTabEmail(){
    $('#pchkbox').prop('checked', false);
    $('#echkbox').prop('checked', true);
    $('#valPaper').removeClass('btn-primary');
    $('#valPaper').addClass('btn-black');
    $('#valEmail').addClass('btn-primary');
    $('#valEmail').removeClass('btn-black');
    
    $('#form_email').css('display','block');
    $('#form_paper').css('display','none');
}    
function displayTabPaper(){
    $('#pchkbox').prop('checked', true);
    $('#echkbox').prop('checked', false);
    $('#valPaper').removeClass('btn-black');
    $('#valPaper').addClass('btn-primary');
    $('#valEmail').addClass('btn-black');
    $('#valEmail').removeClass('btn-primary');
    
    $('#form_paper').css('display','block');
    $('#form_email').css('display','none');
}