<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/view/common/css.jsp"%>
<%@ include file="/WEB-INF/view/common/header.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>vsCAR : 아이디 찾기</title>
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

input.text {
    width: 90%;
    height: 32px;
    font-size: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding-left: 10px;
    margin-bottom: 10px;
}

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

.hidden {
    display: none;
}

#foundId {
    font-size: 18px;
    font-weight: bold;
    color: #333;
    margin: 15px 0;
}
</style>
</head>
<body>
    <video autoplay muted loop>
        <source src="../../../videos/login.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>

    <form id="findIdForm">
        <table class="findIdClass">
        </table>
    </form>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function init() {
    var html = [];
    html.push('<tr>');
    html.push('    <td>');
    html.push('        <h1><a href="home">vsCAR</a></h1>');
    html.push('    </td>');
    html.push('</tr>');
    html.push('<tr>');
    html.push('    <td><h2>아이디 찾기</h2></td>');
    html.push('</tr>');
    html.push('<tr>');
    html.push('    <td><input type="text" id="userName" class="text" placeholder="이름"></td>');
    html.push('</tr>');
    html.push('<tr>');
    html.push('    <td><input type="text" id="birthDate" class="text" placeholder="생년월일 6자리" maxlength="6"></td>');
    html.push('</tr>');
    html.push('<tr>');
    html.push('    <td><button type="button" id="findIdBtn" class="btn">확인</button></td>');
    html.push('</tr>');
    html.push('<tr id="resultRow" class="hidden">');
    html.push('    <td><div id="foundId"></div></td>');
    html.push('</tr>');
    html.push('<tr id="loginBtnRow" class="hidden">');
    html.push('    <td><button type="button" id="goToLoginBtn" class="btn">로그인하러 가기</button></td>');
    html.push('</tr>');
    
    $('.findIdClass').append(html.join(''));
    
    initEventHandlers();
}

function initEventHandlers() {
    $('#findIdBtn').click(function() {
        const userName = $('#userName').val().trim();
        const birthDate = $('#birthDate').val().trim();
        
        if (!userName || !birthDate) {
            alert('이름과 생년월일을 모두 입력해주세요.');
            return;
        }
        
        if (birthDate.length !== 6 || isNaN(birthDate)) {
            alert('생년월일은 6자리 숫자로 입력해주세요.');
            return;
        }
        
        // 서버로 아이디 찾기 요청
        $.ajax({
            type: "POST",
            url: "findIdAjaxController",
            data: {
                userName: userName,
                birthDate: birthDate
            },
            dataType: "json",
            success: function(response) {
                if (response.status === "success") {
                    $('#foundId').text(userName + '님의 아이디: ' + response.userId);
                    $('#resultRow, #loginBtnRow').removeClass('hidden');
                    $('#userName, #birthDate, #findIdBtn').prop('disabled', true);
                } else {
                    alert('일치하는 회원 정보가 없습니다.');
                }
            },
            error: function() {
                alert('아이디 찾기에 실패했습니다. 다시 시도해주세요.');
            }
        });
    });

    // 로그인 페이지로 이동
    $('#goToLoginBtn').click(function() {
        window.location.href = "memberLogin";
    });
}

$(document).ready(function() {
    init();
});
</script>
</html>