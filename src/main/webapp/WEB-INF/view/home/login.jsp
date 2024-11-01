<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/view/common/css.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<style>
/* 페이지 전체를 중앙에 배치 */
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
	width: 100vw; /* 화면 너비에 맞춤 */
	height: 100vh; /* 화면 높이에 맞춤 */
	transform: translate(-50%, -50%); /* 비디오를 중앙에 위치시키기 */
	z-index: -1; /* 비디오를 뒤로 배치 */
	object-fit: cover; /* 화면에 맞추어 비디오 자르기 */
}

table {
	width: 300px;
	border-spacing: 5px; /* 각 항목 사이의 간격 조정 */
	text-align: center;
	background-color: rgba(255, 255, 255, 0.8); /* 반투명 흰색 배경 */
	padding: 20px;
	border-radius: 10px; /* 테두리를 둥글게 */
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 추가로 입체감 */
	z-index: 1; /* 로그인 폼을 앞에 배치 */
}

h1 {
	font-family: 'Nanum Gothic', sans-serif;
	font-style: italic;
	color: hotpink;
	font-size: 40px;
	margin-bottom: 5px;
	margin-top: 0;
}

a {
	color: hotpink; /* 기본 링크 색상 */
	text-decoration: none; /* 밑줄 제거 */
}

a:hover {
	color: hotpink; /* 마우스 오버 시 색상 유지 */
	text-decoration: none; /* 마우스 오버 시에도 밑줄 제거 */
}

h2 {
	font-family: Arial, sans-serif;
	font-size: 20px;
	margin-top: 0; /* 회원가입 위쪽 여백 제거 */
}

input.text {
	width: 90%;
	height: 32px;
	font-size: 15px;
	border: 1px solid #ddd;
	border-radius: 5px;
	padding-left: 10px;
	margin-bottom: 10px; /* 필드 사이 간격 조정 */
}

.btn {
	width: 100%;
	height: 40px;
	font-size: 16px;
	border: 0;
	border-radius: 20px;
	background-color: rgb(164, 199, 255);
	cursor: pointer;
	display: block; /* block 요소로 가운데 정렬 */
	margin-top: 10px;
}

.btn:active {
	background-color: rgb(61, 135, 255);
}

/* 아래 링크들 스타일 */
.links {
	font-size: 12px;
	color: gray;
	text-align: center;
	margin-top: 10px;
}

.links a {
	color: gray;
	text-decoration: none;
	margin: 0 3px; /* 링크들 간격 조정 */
}

.links a:hover {
	text-decoration: underline; /* 마우스 올렸을 때 밑줄 */
	color: rgb(61, 135, 255); /* 링크 색상 변경 */
}
</style>
</head>
<body>
	<!-- 배경 비디오 -->
	<video autoplay muted loop>
		<source src="../../../videos/login.mp4" type="video/mp4">
		<!-- 비디오가 재생되지 않을 때 대체 텍스트 -->
		Your browser does not support the video tag.
	</video>

	<!-- 로그인 폼 -->
	<form id="loginForm">
		<table>
			<tr>
				<td>
					<h1>
						<a href="home">vsCAR</a>
					</h1>
				</td>
			</tr>
			<tr>
				<td><h2>로그인</h2></td>
			</tr>
			<tr>
				<td><input type="text" id="id" class="text" placeholder="아이디"></td>
			</tr>
			<tr>
				<td><input type="password" id="password" class="text" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td><input type="submit" value="로그인" class="btn"></td>
			</tr>
			<!-- 비밀번호 찾기, ID 찾기, 회원가입 링크 -->
			<tr>
				<td class="links"><a href="memberFindPassword">비밀번호 찾기</a> | <a
					href="memberFindId">아이디 찾기</a> | <a href="memberCreate">회원 가입</a></td>
			</tr>
		</table>
	</form>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
// 로그인
$(document).ready(function() {
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
                    $("#password").val(""); // 비밀번호 입력 필드 초기화
                    $("#password").focus(); // 비밀번호 입력 필드에 포커스
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
