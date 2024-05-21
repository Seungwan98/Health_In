<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>회원가입 페이지</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <style>
            /* Add custom styles here */
            .signup-container {
                margin-top: 50px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-control {
                border-radius: 0;
            }

            .btn-control {
                
                border: solid 2px grey;
            }

            .id_input_re_1 {
                color: green;
                display: none;
            }

            /* 중복아이디 존재하는 경우 */
            .id_input_re_2 {
                color: red;
                display: none;
            }

            /* 비밀번호 확인 일치 유효성검사 */
            .pwck_input_re_1 {
                color: green;
                display: none;
            }

            .pwck_input_re_2 {
                color: red;
                display: none;
            }

            .correct {
                color: green;
            }

            .incorrect {
                color: red;
            }
            
        </style>
    </head>

    <body>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/main">Health 人</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> 로그인</a></li>
                    <li class="active"><a href="#"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
                </ul>
                <form class="navbar-form navbar-right" action="#">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="검색">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </nav>

        <div class="wrapper">
            <form id="join_form" method="post">
                <div class="col-md-4 col-md-offset-4 signup-container">

                    <div class="subjecet">
                        <h2>회원가입</h2>


                        <div class="form-group">
                            <label for="username">아이디</label>

                            <input type="text" class="form-control" name="memberId" id="id_input"
                                placeholder="아이디를 입력하세요">

                            <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
                            <span class="id_input_re_2">이미 존재하는 아이디입니다.</span>
                            <span class="final_id_ck"></span>
                        </div>

                        <div class="form-group">
                            <div class="pw_name">비밀번호</div>
                            <div class="pw_input_box">
                                <input class="form-control" name="memberPw" type="password" id="pw_input" placeholder="비밀번호를 입력해주세요.">
                            </div>
                            <span class="final_pw_ck"></span>
                        </div>

                        <div class="form-group">
                            <div class="pwck_name">비밀번호 확인</div>
                            <div class="pwck_input_box">
                                <input class="form-control" type="password" id="pwck_input" placeholder="비밀번호 확인을 입력해주세요.">
                            </div>
                            <span class="final_pwck_ck"></span>
                            <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                            <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
                        </div>

                        <div class="form-group">
                            <div class="user_name">이름</div>
                            <div class="user_input_box">
                                <input class="form-control" name="memberName" id="user_input" placeholder="이름을 입력해주세요.">
                            </div>
                            <span class="final_name_ck"></span>
                        </div>

                        <div class="form-group">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="form-control"  name="memberMail" id="mail_input" placeholder="이메일을 입력해주세요.">
				</div>
				<span class="final_mail_ck"></span>
				<span class="mail_input_box_warn"></span>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="form-control"  id="mail_check_input" disabled="disabled" placeholder="인증번호를 입력해주세요.">
					</div>
					<div >
						<button	type="button"   class="btn-control" id="mail_check_button" >인증번호 전송</button>
					</div>
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span>
				</div>
			</div>

                        <div class="form-group">
                            <div class="address_name">주소</div>
                            <div class="address_input_1_wrap">
                                <div class="address_input_1_box">
                                    <input class="form-control" name="memberAddr1" readonly="readonly"
                                        id="address_input_1">
                                </div>
                                <div >
                                    <button type="button" class="btn-control" onclick="daum_address()">주소 찾기</button>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="address_input_2_wrap">
                                <div class="address_input_2_box">
                                    <input class="form-control" name="memberAddr2" readonly="readonly"
                                        id="address_input_2">
                                </div>
                            </div>
                            <div class="address_input_3_wrap">
                                <div class="address_input_3_box">
                                    <input class="form-control" name="memberAddr3" readonly="readonly"
                                        id="address_input_3" placeholder="">
                                </div>
                            </div>
                            <span class="final_addr_ck"></span>
                        </div>
                    </div>
                    <div class="join_button_wrap"></div>
                    <button type="button" class="btn-control" id="join_button" >회원가입</button>

                    <p>이미 계정이 있으신가요? <a href="/member/login">로그인</a></p>
                </div>
            </form>
        </div>










        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

        <script>

            var code = ""; //이메일 전송 인증번호 저장위한 코드

            /* 유효성 검사 통과유무 변수 */
            var idCheck = false;
            var idckCheck = false;      //아이디 중복 검사
            var pwCheck = false;
            var pwckCheck = false;      //비번 확인
            var pwckorCheck = false;    //비번 확인 일치
            var nameCheck = false;
            var mailCheck = false;
            var mailnumCheck = false;   //이메일 인증번호 확인
            var addressCheck = false;


            $(document).ready(function () {
                //회원가입 버튼
                $("#join_button").click(function () {

                    /* 입력값 변수 */
                    var id = $('#id_input').val();
                    var pw = $('#pw_input').val();
                    var pwck = $('#pwck_input').val();
                    var name = $('#user_input').val();
                    var mail = $('#mail_input').val();
                    var addr = $('#address_input_3').val();

                    /* 아이디 유효성 검사 */
                    if (id == "") {
                        $('.final_id_ck').css('display', 'block');
                        idCheck = false;
                    } else {
                        $('.final_id_ck').css('display', 'none');
                        idCheck = true;
                    }

                    /* 비밀번호 유효성 검사 */
                    if (pw == "") {
                        $('.final_pw_ck').css('display', 'block');
                        pwCheck = false;
                    } else {
                        $('.final_pw_ck').css('display', 'none');
                        pwCheck = true;
                    }

                    /* 비밀번호 확인 유효성 검사 */
                    if (pwck == "") {
                        $('.final_pwck_ck').css('display', 'block');
                        pwckCheck = false;
                    } else {
                        $('.final_pwck_ck').css('display', 'none');
                        pwckCheck = true;
                    }

                    /* 이름 유효성 검사 */
                    if (name == "") {
                        $('.final_name_ck').css('display', 'block');
                        nameCheck = false;
                    } else {
                        $('.final_name_ck').css('display', 'none');
                        nameCheck = true;
                    }

                    /* 이메일 유효성 검사 */
                    if (mail == "") {
                        $('.final_mail_ck').css('display', 'block');
                        mailCheck = false;
                    } else {
                        $('.final_mail_ck').css('display', 'none');
                        mailCheck = true;
                    }

                    /* 주소 유효성 검사 */
                    if (addr == "") {
                        $('.final_addr_ck').css('display', 'block');
                        addressCheck = false;
                    } else {
                        $('.final_addr_ck').css('display', 'none');
                        addressCheck = true;
                    }

                    /* 최종 유효성 검사 */
                    if (idCheck && idckCheck && pwCheck && pwckCheck && pwckorCheck && nameCheck && mailCheck && mailnumCheck && addressCheck) {
                        $("#join_form").attr("action", "/member/join");
                        $("#join_form").submit();
                    }

                    return false;

                });
            });

            //아이디 중복 검사
            $('#id_input').on("propertychange change keyup paste input", function () {
                /* console.log("keyup 테스트"); */

                var memberId = $('#id_input').val(); //#id_input에 입력되는 값
                var data = { memberId: memberId }     //컨트롤러에 넘길 데이터 이름 : 데이터(#id_input에 입력되는 값)

                $.ajax({
                    type: "post",
                    url: "/member/memberIdChk",
                    data: data,
                    success: function (result) {
                        /* console.log("성공 여부" + result); */
                        if (result != 'fail') {
                            $('.id_input_re_1').css("display", "inline-block");
                            $('.id_input_re_2').css("display", "none");
                            idckCheck = true;
                        } else {
                            $('.id_input_re_2').css("display", "inline-block");
                            $('.id_input_re_1').css("display", "none");
                            idckCheck = false;
                        }
                    } //success 종료
                }); //ajax 종료

            }); //function 종료

            //인증번호 이메일 전송
            $("#mail_check_button").click(function () {

                var email = $("#mail_input").val(); //입력한 이메일
                var checkBox = $("#mail_check_input"); //인증번호 입력란
                var boxWarp = $(".mail_check_input_box"); //인증번호 입력란 박스
                var warnMsg = $(".mail_input_box_warn"); //이메일 입력 경고글

                /* 이메일 형식 유효성 검사 */
                if (mailFormCheck(email)) {
                    warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요!");
                    warnMsg.css("color","green");
                    warnMsg.css("display", "inline-block");
                } else {
                    warnMsg.html("올바르지 못한 이메일 형식입니다.");
                    warnMsg.css("color","red");
                    warnMsg.css("dislpay", "inline-block");
                    return false;
                }


                $.ajax({
                    type: "GET",
                    url: "mailCheck?email=" + email,
                    success: function (data) {
                        //console.log("data:"+data);
                        checkBox.attr("disabled", false);
                        boxWarp.attr("id", "mail_check_input_box_true");
                        code = data; //Controller부터 전달받은 인증번호를 code에 저장
                    }
                });

            });

            /* 인증번호 비교 */
            $("#mail_check_input").blur(function () { //blur는 포커스를 잃었을때 발생

                var inputCode = $("#mail_check_input").val(); //사용자가 입력한 코드
                var checkResult = $("#mail_check_input_box_warn"); //비교 결과

                if (inputCode == code) {
                    checkResult.html("인증번호가 일치합니다.");
                    checkResult.css("color","green");
                    checkResult.attr("class", "correct");
                    mailnumCheck = true;
                } else {
                    checkResult.html("인증번호가 일치하지 않습니다.");
                    checkResult.css("color","red");
                    checkResult.attr("class", "incorrect");
                    mailnumCheck = false;
                }

            });

            /* 다음 주소 연동 */
            function daum_address() {
                new daum.Postcode({
                    oncomplete: function (data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if (data.userSelectedType === 'R') {
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if (data.buildingName !== '' && data.apartment === 'Y') {
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if (extraAddr !== '') {
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            //주소변수 문자열과 참고항목 문자열 합치기
                            addr += extraAddr;

                        } else {
                            addr += ' ';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        $("#address_input_1").val(data.zonecode);
                        $("#address_input_2").val(addr);
                        // 커서를 상세주소 필드로 이동한다.
                        $("#address_input_3").attr("readonly", false);
                        $("#address_input_3").attr("placeholder","상세주소를 입력해주세요.");
                        $("#address_input_3").focus();

                    }
                }).open();
            }

            /* 비밀번호 확인 일치 유효성 검사 */

            $('#pwck_input').on("propertychange change keyup paste input", function () {

                var pw = $('#pw_input').val();
                var pwck = $('#pwck_input').val();
                $('.final_pwck_ck').css('display', 'none');

                if (pw == pwck) {
                    $('.pwck_input_re_1').css('display', 'block');
                    $('.pwck_input_re_2').css('display', 'none');
                    pwckorCheck = true;
                } else {
                    $('.pwck_input_re_1').css('display', 'none');
                    $('.pwck_input_re_2').css('display', 'block');
                    pwckorCheck = false;
                }

            });

            /* 입력 이메일 형식 유효성 검사 */
            function mailFormCheck(email) {
                var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
                return form.test(email);
            }



        </script>

    </body>

    </html>