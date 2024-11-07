<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/view/common/css.jsp"%>
<%@ include file="/WEB-INF/view/common/header.jsp"%>
<%@ include file="/WEB-INF/view/common/favicon.jsp" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>vsCAR : 비밀번호 찾기</title>
<style>
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
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
	font-size: 50px;
	margin-bottom: 5px;
	margin-top: 0;
}

a {
	color: #4169E1; /* 기본 링크 색상 */
	text-decoration: none; /* 밑줄 제거 */
	
}

a:hover {
	color: hotpink; /* 마우스 오버 시 색상 유지 */
	text-decoration: none; /* 마우스 오버 시에도 밑줄 제거 */
	transition: transform 0.4s ease;

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

.spinner-container {
  display: none;
  justify-content: center;
  align-items: center;
  position: fixed;
  top: 0;
  left: 0;
  right: 0; /* 오른쪽 끝까지 덮음 */
  bottom: 0; /* 아래쪽 끝까지 덮음 */
  width: 100vw;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 1;
}

.spinner {
  border: 7px solid #f3f3f3;
  border-top: 4px solid #3498db;
  border-radius: 50%;
  width: 70px;
  height: 70px;
  animation: spin 2s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}


/* 숨겨진 요소 */
.hidden {
	display: none;
}
</style>
</head>
<body>
	<div class="spinner-container" id="spinner-container">
   		 <div class="spinner"></div>
	</div>
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
    html.push('    <td><button type="button" id="sendVerificationBtn" class="btn" onclick="initEventHandlers()">인증번호 전송</button></td>');
    html.push('</tr>');
    html.push('<tr id="verificationRow" class="hidden">');
    html.push('    <td><input type="text" id="verificationInput" class="text" placeholder="인증번호 6자리" maxlength="6"></td>');
    html.push('</tr>');
    html.push('<tr id="verifyBtnRow" class="hidden">');
    html.push('    <td><button type="button" id="verifyCodeBtn" class="btn" onclick="verifyCheck()">인증확인</button></td>');
    html.push('</tr>');
    html.push('<tr id="newPasswordRow" class="hidden">');
    html.push('    <td><input type="password" id="newPassword" class="text" placeholder="새 비밀번호"></td>');
    html.push('</tr>');
    html.push('<tr id="confirmPasswordRow" class="hidden">');
    html.push('    <td><input type="password" id="confirmPassword" class="text" placeholder="새 비밀번호 확인"></td>');
    html.push('</tr>');
    html.push('<tr id="submitBtnRow" class="hidden">');
    html.push('    <td><button type="button" id="changePasswordBtn" class="btn" onclick="changePassword()">비밀번호 변경</button></td>');
    html.push('</tr>');
    
    $('.findPasswordClass').append(html.join(''));
    
}

	//스피너 열고닫기 
	function showSpinner() {
		  document.getElementById("spinner-container").style.display = "flex";
		}
	
	function hideSpinner() {
		  document.getElementById("spinner-container").style.display = "none";
		}

	function initEventHandlers() {
		// 인증번호 전송 버튼 클릭 이벤트
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
	    showSpinner();
	    
	    // 서버로 인증번호 전송 요청
	    $.ajax({
	        type: "POST",
	        url: "sendVerificationCodeAjaxController",
	        traditional: true,
	        data: { 
	        	type: "password",
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
	            hideSpinner();
	        },
	        error: function(xhr, status, error) {
	            console.log('AJAX 에러:', error);
	            console.log('상태:', xhr.status);
	            console.log('응답:', xhr.responseText);
	            alert('인증번호 전송에 실패했습니다. 다시 시도해주세요.');
	            hideSpinner();
	        }
	    });
	}


    // 인증확인 버튼 클릭 이벤트
    
    
    function verifyCheck() {
    	
    	var code = document.getElementById("verificationInput").value;
    	
    	if (!code) {
	        alert("인증번호를 입력해주세요.");
	        return;
	    }
    	showSpinner();
    	$.ajax({
	        url: "verifyEmailCodeAjaxController",
	        type: "POST",
	        data: { 
	            "code": code,
	            "userEmail": $('#userEmail').val()
	        },
	        success: function(response) {
	            if(response.status === "success") {
	            	alert('인증이 완료되었습니다.');
	            	isVerified = true;
	                $('#newPasswordRow, #confirmPasswordRow, #submitBtnRow').removeClass('hidden');
	                $('#userId, #userEmail, #verificationInput, #sendVerificationBtn, #verifyCodeBtn').prop('disabled', true);
	            } else {
	                alert('인증번호가 일치하지 않습니다.');
	                $('#verificationInput').val('').focus();
	            }
	            hideSpinner();
	        },
	        error: function(xhr, status, error) {
	            alert('인증 확인 중 오류가 발생했습니다.');
	            hideSpinner();
	        }
	    });
	}
    	

    function changePassword() {
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