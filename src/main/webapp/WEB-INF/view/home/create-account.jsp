<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/view/common/css.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
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
	border-spacing: 0px; /* 각 항목 사이의 간격 조정 */
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

input.text, .textA, .email, .domain {
	width: 90%;
	height: 32px;
	font-size: 15px;
	border: 1px solid #ddd;
	border-radius: 5px;
	padding-left: 10px;
	margin-bottom: 10px;
}

.btn {
	width: 100%;
	height: 40px;
	font-size: 16px;
	border: 0;
	border-radius: 20px;
	background-color: rgb(164, 199, 255);
	cursor: pointer;
	margin-top: 10px;
}

.btn:active {
	background-color: rgb(61, 135, 255);
}

.small-btn {
	width: 100px; /* 우편번호 찾기 버튼을 작게 */
	height: 28px;
	font-size: 14px;
	border: 0;
	border-radius: 15px;
	outline: none;
	background-color: rgb(165, 199, 171);
	cursor: pointer;
}

.small-btn:active {
	background-color: rgb(180, 180, 180);
}

.hidden-domain {
	display: none;
}

.email-container {
	display: flex;
	gap: 5px; /* 이메일 입력칸 간격 */
}

/* 이메일 필드가 한 줄에 보이도록 설정 */
.email-container input, .email-container select {
	width: calc(100% - 110px); /* 전체 길이를 맞추기 위한 조정 */
}

.email-container select {
	width: 120px; /* 도메인 선택 필드의 고정 크기 */
	height: 35px;
}

.gender-btn {
	width: 60px; /* 버튼 너비 */
	height: 30px; /* 버튼 높이 */
	border: 1px solid #ddd; /* 테두리 */
	border-radius: 5px; /* 둥글게 만들기 */
	display: flex; /* 가운데 정렬을 위해 */
	align-items: center; /* 수직 가운데 정렬 */
	justify-content: center; /* 수평 가운데 정렬 */
	background-color: white; /* 배경 색 */
	transition: background-color 0.3s; /* 배경 색 변화에 부드러움 추가 */
}

.gender-btn:hover {
	background-color: #f0f0f0; /* 마우스 오버 시 배경 색 변경 */
}

input[type="radio"]:checked+.gender-btn {
	background-color: rgb(164, 199, 255); /* 선택된 버튼의 배경 색 */
	border: 1px solid rgb(61, 135, 255); /* 선택된 버튼의 테두리 색 */
}
</style>
</head>
<body>
	<video autoplay muted loop>
		<source src="../../../videos/create-account.mp4" type="video/mp4">
		Your browser does not support the video tag.
	</video>
	<form action="javascript:memberCreate();" method="post"
		onsubmit="return validCheck();">
		<table class="memberClass">
		</table>
	</form>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
<script>
let isIdChecked = false;
let checkedId = "";
	function init(){
		var html = [];
		html.push('<tr>');
		html.push('<td><h1><a href="home">vsCAR</a></h1></td>');
		html.push('</tr>');
		html.push('<tr>');
		html.push('<td><h2>회원가입 </h2></td>');
		html.push('</tr>');
		html.push('<tr>');
		html.push('<td>');
		html.push('<input type="text" id="id" name="id" class="text" placeholder="아이디" required>');
		html.push('<input type="button" onclick="checkIdDuplicate()" value="아이디 확인" class="small-btn"><br>');
		html.push('</td>');
		html.push('</tr>');
		html.push('<tr>');
		html.push('<td><input type="password" id="password" name="password" class="text" placeholder="비밀번호" required></td>');
		html.push('</tr>');
		html.push('<tr>');
		html.push('<td><input type="password" id="passwordConfirm" class="text" placeholder="비밀번호 확인" required></td>');
		html.push('</tr>');
		html.push('<tr>');
		html.push('<td><input type="text" id="name" name="name" class="text" placeholder="이름" required></td>');
		html.push('</tr>');
		html.push('<tr>');
		html.push('<td>');
		html.push('<div style="display: flex; justify-content: center; gap: 10px;">');
		html.push('<input type="radio" id="male" name="gender" value="M" style="display: none;" required>'); 
		html.push('<label for="male" class="gender-btn">남자</label>'); 
		html.push('<input type="radio" id="female" name="gender" value="F" style="display: none;" required>'); 
		html.push('<label for="female" class="gender-btn">여자</label>');
		html.push('</div>');
		html.push('</td>');
		html.push('</tr>');
		html.push('<tr>');
		html.push('<td><input type="text" id="birthdate" name="birthdate" class="text" placeholder="생년월일(YYYYMMDD)" required></td>');
		html.push('</tr>');
		html.push('<tr>');
		html.push('<td><input type="text" id="phone" name="phone" class="text" placeholder="핸드폰 번호(-제외)" required></td>');
		html.push('</tr>');
		html.push('<tr>');
		html.push('<td>');
		html.push('<input type="text" name="postcode" id="sample6_postcode" class="textA" placeholder="우편번호">');
		html.push('<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="small-btn"><br>');
		html.push('<input type="text" name="address" id="sample6_address" class="textA" placeholder="주소">');
		html.push('<input type="text" name="detailAddress" id="sample6_detailAddress" class="textA" placeholder="상세주소">');
		html.push('<input type="text" class="textA" id="sample6_extraAddress" placeholder="참고항목">');
		html.push('<input type="hidden" name="fullAddress" id="fullAddress">');
		html.push('</td>');
		html.push('</tr>');
		html.push('<tr>');
		html.push('<td>');
		html.push('	<div class="email-container">');
		html.push('		<input type="text" name="emailLocal" class="email" id="emailLocal" placeholder="이메일" required>@');
		html.push('		<select name="emailDomain" id="domainSelect" class="select-domain" onchange="checkDomain()">');
		html.push('			<option value="naver.com">naver.com</option>');
		html.push('			<option value="gmail.com">gmail.com</option>');
		html.push('			<option value="daum.net">daum.net</option>');
		html.push('			<option value="nate.com">nate.com</option>');
		html.push('			<option value="direct">직접 입력</option>');
		html.push('		</select>');
		html.push('	</div>');
		html.push('	<input type="text" class="domain hidden-domain" id="emailDomain" placeholder="도메인 입력">');
		html.push('</td>');
		html.push('</tr>');
		html.push('<tr>');
		html.push('<td style="text-align: center;">');
		html.push('	<input type="submit" value="가입하기" class="btn">');
		html.push('</td>');
		html.push('</tr>');
		$('.memberClass').append(html.join(''));
		document.getElementById("id").addEventListener("input", function() {
	        isIdChecked = false;
	        checkedId = "";		
		});
	}

	function sample6_execDaumPostcode() {
		new daum.Postcode(
			{
				oncomplete : function(data) {
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수
	
					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}
	
					// 참고항목이 있을 경우, 이를 추가한다.
					if (data.bname !== '') {
						extraAddr += data.bname;
					}
					if (data.buildingName !== '') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 참고항목이 있을 경우, 해당 필드에 넣어준다 .
					document.getElementById("sample6_extraAddress").value = extraAddr;
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode; // 우편번호
					document.getElementById("sample6_address").value = addr; // 주소
				}
			}).open();
	}

	function checkDomain() {
		var domainSelect = document.getElementById("domainSelect");
		var emailDomain = document.getElementById("emailDomain");
		if (domainSelect.value === "direct") {
			emailDomain.classList.remove("hidden-domain");
			emailDomain.style.display = "inline"; // 직접 입력 필드를 한 줄에 보이도록 설정
		} else {
			emailDomain.classList.add("hidden-domain");
			emailDomain.style.display = "none"; // 직접 입력 필드를 숨김
			emailDomain.value = ""; // 이전 입력값 초기화
		}
	}

	function validCheck() {
		// 비밀번호 확인
		var password = document.getElementById("password").value;
		var passwordConfirm = document.getElementById("passwordConfirm").value;
		if (password !== passwordConfirm) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}

		// 생년월일 검사
		var birthdate = document.getElementById("birthdate").value;
		if (!/^\d{8}$/.test(birthdate)) {
			alert("생년월일은 8자리 숫자로 입력해주세요.");
			return false;
		}

		// 전화번호 검사
		var phone = document.getElementById("phone").value;
		if (!/^\d{10,11}$/.test(phone)) {
			alert("올바른 전화번호 형식이 아닙니다.");
			return false;
		}

		// 주소 조합
		var postcode = document.getElementById("sample6_postcode").value;
		var address = document.getElementById("sample6_address").value;
		var detailAddress = document
				.getElementById("sample6_detailAddress").value;

		// fullAddress 조합
		var fullAddress = `(${postcode}) ${address} ${detailAddress}`
				.trim();
		document.getElementById("fullAddress").value = fullAddress;

		// 이메일 도메인 처리
		if (document.getElementById("domainSelect").value === "direct") {
			var emailDomain = document.getElementById("emailDomain").value;
			if (!emailDomain) {
				alert("이메일 도메인을 입력해주세요.");
				return false;
			}
		}
		return true;
	}

	function checkIdDuplicate(){
		var id = document.getElementById("id").value;
		if(!id){
			alert("아이디를 입력해주세요.");
			return;
		}
		
		$.ajax({
			url : "checkIdDuplicateAjaxController",
			method : "GET",
			data: {"id" : id },
			dataType : "json",
			success : function(response){
				console.log("서버 응답 : ", response);
				if(response > 0){
					alert("이미 사용중인 아이디 입니다.");
					document.getElementById("id").value = "";
					isIdChecked = false;
					checkedId = "";
				}else{
					alert("사용 가능한 아이디 입니다.");
					isIdChecked = true;
					checkedId = id;
				}
			},
			error : function(xhr, status, error){
				console.error('아이디 중복 체크 실패 : ' + error);
				console.error('상태 : ' + status);
				console.error('응답 : ' + xhr.responseText);
			}
		});
	}
	
	function memberCreate() {
		// id 중복체크확인
		if(!isIdChecked || document.getElementById("id").value !== checkedId){
			alert("아이디 중복 체크를 해주세요.");
			return false;
		}
		var name = document.getElementById("name").value;
		var email = document.getElementById("emailLocal").value;
        var selectElement = document.getElementById("domainSelect");
		if(selectElement == "direct"){
			selectElement = document.getElementById("emailDomain");
		}
        var emailDomain = selectElement.value;
        
		var id = document.getElementById("id").value;
		var password = document.getElementById("password").value;
		var birthday = document.getElementById("birthdate").value;
		
		var genderElements = document.getElementsByName("gender");
		var gender = "";

		for (var i = 0; i < genderElements.length; i++) {
		    if (genderElements[i].checked) {
		        gender = genderElements[i].value;
		        break;
		    }
		}
		var address1 = document.getElementById("sample6_address").value;
		var address2 = document.getElementById("sample6_extraAddress").value;
		var address3 = document.getElementById("sample6_detailAddress").value;
		var address = address1 + " " + address2 + " " + address3;
		var phone = document.getElementById("phone").value;
		
		
		$.ajax({
			url : "memberCreateAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"name" : name,
				"email" : email,
				"emailDomain" : emailDomain,
				"id" : id,
				"password" : password,
				"birthday" : birthday,
				"gender" : gender,
				"address" : address,
				"phone" : phone,
			},
			success : function(response) {
				alert('회원가입 완료. 로그인 페이지로 이동합니다')
				window.location.href = "/memberLogin";
			},
			error : function(xhr, status, error) {
				console.error('요청 실패: ' + error); // 에러 출력
			}
		});

	}
	
	$(document).ready(function() {
		init();
	});
</script>
</html>