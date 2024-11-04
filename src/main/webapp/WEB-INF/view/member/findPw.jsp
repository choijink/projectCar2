<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/view/common/css.jsp"%>
<%@ include file="/WEB-INF/view/common/header.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
<style>
/* 기본 스타일 - 로그인 페이지와 동일 */
body, html {
    height: 100%;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
}

video {
    position: fixed;
    top: 50%;
    left: 50%;
    width: 100vw;
    height: 100vh;
    transform: translate(-50%, -50%);
    z-index: -1;
    object-fit: cover;
}

table {
    width: 250px;
    border-spacing: 5px;
    text-align: center;
    background-color: rgba(255, 255, 255, 0.8);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    z-index: 1;
}

h1 {
	font-weight: bold;
    font-family: 'Nanum Gothic', sans-serif;
    font-style: italic;
    color: hotpink;
    font-size: 40px;
    margin-bottom: 5px;
    margin-top: 0;
}

a {
    color: hotpink;
    text-decoration: none;
}

a:hover {
    color: hotpink;
    text-decoration: none;
}

h2 {
    font-family: Arial, sans-serif;
    font-size: 20px;
    margin-top: 0;
}

/* 입력 필드 스타일 */
input.text {
    width: 90%;
    height: 32px;
    font-size: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding-left: 10px;
    margin-bottom: 10px;
}

/* 버튼 스타일 */
.btn {
	width: 60%;
	height: 40px;
	font-size: 16px;
	font-weight: bold;
	border: 0;
	border-radius: 20px;
	background-color: rgb(164, 199, 255);
	cursor: pointer;
	margin-top: 0px;
	margin-bottom: 10px;
}

.btn:active {
    background-color: rgb(61, 135, 255);
}

.small-btn {
    width: 90px;
    height: 32px;
    font-size: 14px;
    border: 0;
    border-radius: 15px;
    background-color: rgb(165, 199, 171);
    cursor: pointer;
    margin-bottom: 5px;
}

.small-btn:active {
    background-color: rgb(180, 180, 180);
}

/* 이메일 입력 컨테이너 */
.email-container {
    display: flex;
    align-items: center;
    gap: 5px;
    margin-bottom: 10px;
}

/* 숨겨진 요소 */
.hidden {
    display: none;
}

</style>
</head>
<body>
    <video autoplay muted loop>
        <source src="../../../videos/login.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>

    <form id="findPasswordForm">
        <table class="findPasswordClass">
        </table>
    </form>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
let verificationCode = ""; // 서버에서 받은 인증코드 저장
let isVerified = false; // 인증 완료 여부

function init() {
    var html = [];
    html.push('<tr>');
    html.push('    <td>');
    html.push('        <h1><a href="home">vsCAR</a></h1>');
    html.push('    </td>');
    html.push('</tr>');
    html.push('<tr>');
    html.push('    <td><h2>비밀번호 찾기</h2></td>');
    html.push('</tr>');
    html.push('<tr>');
    html.push('    <td><input type="text" id="userId" class="text" placeholder="아이디"></td>');
    html.push('</tr>');
    html.push('<tr>');
    html.push('    <td><input type="email" id="userEmail" class="text" placeholder="이메일"></td>');
    html.push('</tr>');
    html.push('<tr>');
    html.push('    <td><button type="button" id="sendVerificationBtn" class="btn">인증번호 전송</button></td>');
    html.push('</tr>');
    html.push('<tr id="verificationRow" class="hidden">');
    html.push('    <td><input type="text" id="verificationInput" class="text" placeholder="인증번호 6자리" maxlength="6"></td>');
    html.push('</tr>');
    html.push('<tr id="verifyBtnRow" class="hidden">');
    html.push('    <td><button type="button" id="verifyCodeBtn" class="btn">인증확인</button></td>');
    html.push('</tr>');
    html.push('<tr id="newPasswordRow" class="hidden">');
    html.push('    <td><input type="password" id="newPassword" class="text" placeholder="새 비밀번호"></td>');
    html.push('</tr>');
    html.push('<tr id="confirmPasswordRow" class="hidden">');
    html.push('    <td><input type="password" id="confirmPassword" class="text" placeholder="새 비밀번호 확인"></td>');
    html.push('</tr>');
    html.push('<tr id="submitBtnRow" class="hidden">');
    html.push('    <td><button type="button" id="changePasswordBtn" class="btn">비밀번호 변경</button></td>');
    html.push('</tr>');
    
    $('.findPasswordClass').append(html.join(''));
    
    // 이벤트 핸들러 등록
    initEventHandlers();
}

function initEventHandlers() {
	// 인증번호 전송 버튼 클릭 이벤트
	$('#sendVerificationBtn').click(function() {
	    const userId = $('#userId').val().trim();
	    const userEmail = $('#userEmail').val().trim();
	    
	    console.log('전송하는 데이터:', {
	        userId: userId,
	        userEmail: userEmail
	    });
	    
	    if (!userId || !userEmail) {
	        alert('아이디와 이메일을 모두 입력해주세요.');
	        return;
	    }
	    
	    // 서버로 인증번호 전송 요청
	    $.ajax({
	        type: "POST",
	        url: "sendVerificationCodeAjaxController",
	        traditional: true,
	        data: { 
	            userId: userId,
	            userEmail: userEmail 
	        },
	        dataType: "json",
	        success: function(response) {
	            console.log('서버 응답:', response);
	            if (response.status === "success") {
	                alert('인증번호가 이메일로 전송되었습니다.');
	                verificationCode = response.verificationCode;
	                $('#verificationRow, #verifyBtnRow').removeClass('hidden');
	            } else {
	                alert(response.message);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.log('AJAX 에러:', error);
	            console.log('상태:', xhr.status);
	            console.log('응답:', xhr.responseText);
	            alert('인증번호 전송에 실패했습니다. 다시 시도해주세요.');
	        }
	    });
	});

    // 인증확인 버튼 클릭 이벤트
    $('#verifyCodeBtn').click(function() {
        const inputCode = $('#verificationInput').val().trim();
        
        if (inputCode === verificationCode) {
            alert('인증이 완료되었습니다.');
            isVerified = true;
            // 비밀번호 변경 필드들 표시
            $('#newPasswordRow, #confirmPasswordRow, #submitBtnRow').removeClass('hidden');
            // 인증 관련 필드들 비활성화
            $('#userId, #userEmail, #verificationInput, #sendVerificationBtn, #verifyCodeBtn').prop('disabled', true);
        } else {
            alert('인증번호가 일치하지 않습니다.');
            $('#verificationInput').val('').focus();
        }
    });

    // 비밀번호 변경 버튼 클릭 이벤트
    $('#changePasswordBtn').click(function() {
        if (!isVerified) {
            alert('먼저 이메일 인증을 완료해주세요.');
            return;
        }

        const newPassword = $('#newPassword').val();
        const confirmPassword = $('#confirmPassword').val();

        // 비밀번호 유효성 검사
        if (!validatePassword(newPassword)) {
            alert('비밀번호는 8자리 이상이며, 영문자와 특수문자를 포함해야 합니다.');
            return;
        }

        if (newPassword !== confirmPassword) {
            alert('새 비밀번호가 일치하지 않습니다.');
            return;
        }

        // 서버로 비밀번호 변경 요청
        $.ajax({
            type: "POST",
            url: "changePasswordAjaxController",
            data: {
                userId: $('#userId').val(),
                newPassword: newPassword
            },
            dataType: "json",
            success: function(response) {
                if (response.status === "success") {
                    alert('비밀번호가 성공적으로 변경되었습니다.');
                    window.location.href = "memberLogin"; // 로그인 페이지로 이동
                } else {
                    alert(response.message);
                }
            },
            error: function() {
                alert('비밀번호 변경에 실패했습니다. 다시 시도해주세요.');
            }
        });
    });
}

function validatePassword(password) {
    const passwordRegex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]).{8,}$/;
    return passwordRegex.test(password);
}

$(document).ready(function() {
    init();
});
</script>
</html>