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
<title>vsCAR : 로그인</title>
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

.links {
    font-size: 12px;
    color: gray;
    text-align: center;
    margin-top: 10px;
}

.links a {
    color: gray;
    text-decoration: none;
    margin: 0 3px;
}

.links a:hover {
    text-decoration: underline;
    color: rgb(61, 135, 255);
}
</style>
</head>
<body>
    <video autoplay muted loop>
        <source src="../../../videos/login.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>

    <form id="loginForm">
        <table class="loginClass">
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
    html.push('    <td><input type="text" id="id" class="text" placeholder="아이디"></td>');
    html.push('</tr>');
    html.push('<tr>');
    html.push('    <td><input type="password" id="password" class="text" placeholder="비밀번호"></td>');
    html.push('</tr>');
    html.push('<tr>');
    html.push('    <td><input type="submit" value="로그인" class="btn"></td>');
    html.push('</tr>');
    html.push('<tr>');
    html.push('    <td class="links">');
    html.push('        <a href="memberFindPassword">비밀번호 찾기</a> | ');
    html.push('        <a href="memberFindId">아이디 찾기</a> | ');
    html.push('        <a href="memberCreate">회원 가입</a>');
    html.push('    </td>');
    html.push('</tr>');
    
    $('.loginClass').append(html.join(''));
}

// 로그인
$(document).ready(function() {
    init(); // 페이지 로드 시 init 함수 실행
    
    $("#loginForm").on("submit", function(event) {
        event.preventDefault(); 

        var id = $("#id").val().trim();
        var password = $("#password").val().trim();

        // 입력값 검증
        if (!id || !password) {
            alert("아이디와 비밀번호를 입력해주세요.");
            return;
        }

        $.ajax({
            type: "POST",
            url: "memberLoginAjaxController",
            data: { id: id, password: password },
            dataType: "json",
            success: function(response) {
                if (response.status === "success") {
                    alert(response.message); 
                    window.location.href = "/home"; 
                } else {
                    alert(response.message);
                    $("#password").val("");
                    $("#password").focus();
                }
            },
            error: function() {
                alert("아이디 또는 비밀번호가 잘못 되었습니다. 다시입력해 주세요.");
            }
        });
    });
});
</script>
</html>