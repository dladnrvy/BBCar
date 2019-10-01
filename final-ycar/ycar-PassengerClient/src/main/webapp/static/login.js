      // KAKAO :: 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('b4d22862e49da7bced7dc7592288a369');

        var userType = sessionStorage.getItem("userType"); // 메인페이지에서 사용자가 선택한 사용자 타입

        $(document).ready(
            function() {

                if (userType == null) {
                    alert('사용자모드를 먼저 선택해주세요!');
                    location.href = "http://localhost:9090/pClient";
                }

                $('#form').css('display', 'block');

                $('#form')
                    .submit(
                        function() {
                            $.ajax({
                                url: 'http://localhost:9090/pClient/login/' +
                                    userType,
                                type: 'POST',
                                data: $('#form')
                                    .serialize(),
                                success: function(data) {
                                    if (data == '1') {
                                        alert('존재하지 않는 회원입니다, 다시 로그인해주세요.');
                                    }
                                    if (data == '2') {
                                        // 정상 로그인
                                        alert('정상적으로 로그인되었습니다.');
                                        $('#form').css(
                                            'display',
                                            'none');
                                        location.href = "http://localhost:9090/pClient/mypage";
                                    }
                                    if (data == '3') {
                                        alert('비밀번호 불일치, 다시 로그인해주세요.');
                                    }
                                    if (data == '4') {
                                        alert('개인정보 보호를 위해 임시 비밀번호를 변경해주세요.');
                                        // 마이페이지 -> 내 정보 수정
                                        // (비밀번호 변경에
                                        // cursor올리기)
                                        location.href = "http://localhost:9090/pClient/mypage?user=temp";
                                    }
                                }
                            });
                            return false;
                        });
            });

        // 카카오 로그인
        function loginWithKakao() {

            // 로그인 창을 띄웁니다.
            Kakao.Auth.login({
                success: function(authObj) {

                    // 정보 확인 -> session에 저장
                    Kakao.API.request({
                        url: '/v2/user/me',
                        success: function(res) {
                            var id = res.id;
                            $.ajax({
                                url: 'http://localhost:9090/pClient/login/kakao/' + id +
                                    '/' + userType,
                                type: 'GET',
                                success: function(data) {
                                    if (data == 'success') {
                                        alert('정상적으로 로그인되었습니다.');
                                        $('#form').css('display', 'none');
                                    }
                                }
                            });
                        },
                        fail: function(error) {
                            alert(JSON.stringify(error));
                        }
                    });
                },
                fail: function(err) {
                    alert(JSON.stringify(err));
                    alert('[카카오]로그인 실패');
                }
            });
        };

        // ID찾기
        function findId() {
            $('#id, #pw').val('');
            $('#form').css('display', 'none');
            $('#findPwForm').css('display', 'none');
            $('#findIdForm').css('display', 'block');
        };

        $('#findIdForm').submit(function() {
            $.ajax({
                url: 'http://localhost:9090/pClient/login/findId/' + userType,
                type: 'POST',
                data: $('#findIdForm').serialize(),
                success: function(data) {
                    if (data == 1) {
                        alert('해당 이메일 주소로 아이디 정보를 발송하였습니다');
                        $('#name, #email').val('');
                        $('#findIdForm').css('display', 'none');
                        $('#form').css('display', 'block');
                    }
                    if (data == 2) {
                        alert('없는 정보이거나 일치하지 않는 정보입니다, 다시 입력해주세요');
                    }
                }
            });
            return false;
        });

        // PW찾기
        function findPw() {
            $('#id, #pw').val('');
            $('#form').css('display', 'none');
            $('#findIdForm').css('display', 'none');
            $('#findPwForm').css('display', 'block');
        };

        $('#findPwForm').submit(function() {
            $.ajax({
                url: 'http://localhost:9090/pClient/login/findPw/' + userType,
                type: 'POST',
                data: $('#findPwForm').serialize(),
                success: function(data) {
                    if (data == 1) {
                        alert('해당 이메일 주소로 임시 비밀번호를 발송하였습니다');
                        $('#name, #email').val('');
                        $('#findPwForm').css('display', 'none');
                        $('#form').css('display', 'block');
                    }
                    if (data == 2) {
                        alert('없는 정보이거나 일치하지 않는 정보입니다, 다시 입력해주세요');
                    }
                }
            });
            return false;
        });

        // back 버튼 누르면 로그인 폼으로 돌아감
        function backBtn() {
            $('#name, #email').val('');
            $('form').css('display', 'none');
            $('#form').css('display', 'block');
        }

        // 회원가입으로 이동
        function join() {
            location.href = "http://localhost:9090/pClient/join";
        }