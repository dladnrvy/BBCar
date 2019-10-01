        $(document).ready(function() {

            // 임시비밀번호 발급 회원 로그인 --> 마이페이지에서 비밀번호 수정페이지 띄우기
             getParams();
            
            // 즐겨찾는 장소 출력
             getPlace();
            
            // 선호 탑승 환경 출력
             getEnv();
             
            // 내 예약 목록
             getRsv();

            $('#edit').click(function() {

                // 공백인 상태에서 수정버튼 눌렀을 시 못가게 막음
                var pw1 = $('#pw1').val();
                var pw2 = $('#pw2').val();
                var pw3 = $('#pw3').val();

                if (pw1.length < 1 || pw2.length < 1 || pw3.length < 1) {
                    alert('비밀번호를 입력해주세요!');
                    return false;
                }

                if (!$('#pwCheck').prop('checked')) {
                    alert('[비말번호 불일치] 다시 확인해주세요!');
                    return false;
                }

                $.ajax({
                    url: 'http://localhost:9090/passenger/members/mypage',
                    type: 'PUT',
                    data: JSON.stringify({
                        id: $('#id').val(),
                        pw1: $('#pw1').val(),
                        pw2: $('#pw2').val()
                    }),
                    contentType: 'application/json; charset=utf-8',
                    success: function(data) {
                        if (data == 0) {
                            alert('잘못된 비밀번호');
                        }
                        if (data == 1) {
                            alert('내 정보 수정 성공!');
                            // 임시 비밀번호 수정한 경우를 위해 마이페이지 다시 로딩
                            location.href = "http://localhost:9090/pClient/mypage";
                        }
                        if (data == 2) {
                            alert('*수정오류');
                        }
                    },
                });
                return false;
            });

            // 새로운 비밀번호 일치하는지 확인
            $('#pw3, #pw2').focusout(function() {
                if ($('#pw2').val() == $('#pw3').val() || $('#pw3').val() == $('#pw2').val()) {
                    $('#pwSpan').html('비밀번호 일치');
                    $('#pwSpan').css('color', 'green');
                    $('#pwCheck').prop('checked', true);
                } else {
                    $('#pwSpan').html('비밀번호 불일치');
                    $('#pwSpan').css('color', 'red');
                    $('#pwCheck').prop('checked', false);
                }
            });
        });

        /* 내정보 수정 팝업창 */
        function editForm() {
            $("#popupDiv").css({
                "top": (($(window).height() - $("#popupDiv").outerHeight()) / 2 + $(window).scrollTop()) + "px",
                "left": (($(window).width() - $("#popupDiv").outerWidth()) / 2 + $(window).scrollLeft()) + "px"
                //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
            });

            $("#popup_mask").css("display", "block"); //팝업 뒷배경 display block
            $("#popupDiv").css("display", "block"); //팝업창 display block

            //$("body").css("overflow", "hidden"); //body 스크롤바 없애기
            $(".rightDiv").hide();

            $("#popCloseBtn").click(function(event) {
                $('#pw1').val('');
                $('#pw2').val('');
                $('#pw3').val('');
                $("#popup_mask").css("display", "none"); //팝업창 뒷배경 display none
                $("#popupDiv").css("display", "none"); //팝업창 display none
                $(".rightDiv").show();
                //$("body").css("overflow", "auto"); //body 스크롤바 생성 
            });


        }

        function getParams() {
            // 현재 페이지의 url
            var url = decodeURIComponent(location.href);
            // url이 encodeURIComponent로 인코딩 되었을 때 다시 디코딩
            url = decodeURIComponent(url);

            var params;
            // url에서 '?' 문자 이후의 파라미터 문자열까지 자르기
            params = url.substring(url.indexOf('?') + 1, url.length);
            // 파라미터 구분자("&")로 분리
            params = params.split("&");
            //alert('params: ' + params);
            // ("=")로 분리해서 값 받아오기
            var user = params[0].split("=")[1];

            console.log('[임시비밀번호로 로그인 = temp, 일반 로그인 = undefined] 지금 당신은 ==> ' + user);

            if (user == 'temp') {
                // 정보수정 폼 띄우기
                alert('비밀번호를 수정해주세요!');
                $('#myInfo').css('display', 'none');
                editForm();
            }
        }
        
        function getPlace(){
        	
        	var idx = $('#sessionIdx').val();
        	
        	$.ajax({
                url: 'http://localhost:8080/findRoute/' + idx,
                type: 'GET',
                success: function(data) {
                	
                	for(var i=0; i<data.length; i++){
                		var html = data[i].place+" <a href=\"#\" class=\"btn py-1 px-4 btn-primary\">경로 수정</a>";
                		console.log("(1) 경로 확인:::"+data[i].place);
                		console.log("(1) html내용:::"+html);
                		$("#myPlace>li>span:first").replaceWith(html);
                	}
                },
            });
        }
        
        function getEnv(){
        	
        	var idx = $('#sessionIdx').val();
        	
        	$.ajax({
                url: 'http://localhost:8080/findEnv/' + idx,
                type: 'GET',
                success: function(data) {
                	
	                	console.log("(2) 환경 확인:::"+data.p_option);
	                	var option = data.p_option;
	                	
	                	if(option.includes('a')){
	                		$('#myEnv').append("<li><span id=\"a\">a</span></li>");
	                	}
	                	if(option.includes('b')){
	                		$('#myEnv').append("<li><span id=\"b\">b</span></li>");
	                	}
	                	if(option.includes('c')){
	                		$('#myEnv').append("<li><span id=\"c\">c</span></li>");
	                	}
	                	if(option.includes('d')){
	                		$('#myEnv').append("<li><span id=\"d\">d</span></li>");
	                	}
	                	if(option.includes('e')){
	                		$('#myEnv').append("<li><span id=\"e\">e</span></li>");
	                	}
                	}
           	 });
        }
        
        function getRsv(){
        	
        	var idx = $('#sessionIdx').val();
        	
        	$.ajax({
                url: 'http://localhost:8080/rsvList/' + idx,
                type: 'GET',
                success: function(data) {
                	
	                	console.log("리스트 확인:::"+data);
	                	
                	}
           	 });
        	
        }