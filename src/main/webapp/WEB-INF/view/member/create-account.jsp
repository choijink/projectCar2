<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/view/common/css.jsp"%>
<%@ include file="/WEB-INF/view/common/header.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>vsCAR : 회원가입</title>
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
	font-weight: bold;
	color: hotpink;
	font-size: 50px;
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
	font-weight: bold;
}

input.text, .textA, .email, .domain {
	width: 90%;
	height: 32px;
	font-size: 13px;
	border: 1px solid #ddd;
	border-radius: 5px;
	padding-left: 10px;
	margin-bottom: 10px;
}

/* flex container를 위한 스타일 수정 */
div[style*="display: flex"] {
    width: 90%;  /* 컨테이너 너비 제한 */
    margin: 0 auto;  /* 중앙 정렬 */
}
/* 아이디 입력창과 우편번호 입력창 너비 조정 */
#id, #sample6_postcode {
    width: 70%;  /* 버튼을 위한 공간 확보 */
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

.small-btn {
	width: 90px; 
	height: 32px;
	font-size: 14px;
	border: 0;
	border-radius: 15px;
	outline: none;
	background-color: rgb(165, 199, 171);
	cursor: pointer;
	margin-bottom: 5px;
	white-space: nowrap; /* 줄바꿈 안되게 */
}

.small-btn:active {
	background-color: rgb(180, 180, 180);
}

.hidden-domain {
	display: none;
}

.email-container {
	display: flex;
	gap: 0px; /* 이메일 입력칸 간격 */
	
}

/* 이메일 필드가 한 줄에 보이도록 설정 */
.email-container input, .email-container select {
	width: calc(80% - 100px); /* 전체 길이를 맞추기 위한 조정 */
	align-items: center; /* 수직 가운데 정렬 */
	margin-left: 15px; /* 원하는 만큼의 공백 설정 (예: 10px) */
}

.email-container select {
	width: 110px; /* 도메인 선택 필드의 고정 크기 */
	height: 30px;
	font-size: 15px;
	margin-left: 5px; /* 원하는 만큼의 공백 설정 (예: 10px) */
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
	<form id="signupForm" onsubmit="return handleSubmit(event);">
		<table class="memberClass">
		</table>
	</form>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
<script>
let isIdChecked = false;
let checkedId = "";
let userEmailLocal = "";
let userEmailDomain = "";
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
		html.push('<div style="display: flex; align-items: center; gap: 5px;">');  // flex container 추가
		html.push('<input type="text" id="id" name="id" class="text" placeholder="아이디(4~16글자)" required>');
		html.push('<input type="button" onclick="checkIdDuplicate()" value="아이디 확인" class="small-btn"><br>');
		html.push('</div>');
		html.push('</td>');
		html.push('</tr>');
		html.push('<tr>');
		html.push('<td><input type="password" id="password" name="password" class="text" placeholder="비밀번호(8글자 이상, 영문/특수문자 포함)" required></td>');
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
		html.push('<div style="display: flex; align-items: center; gap: 5px;">');
		html.push('<input type="text" name="postcode" id="sample6_postcode" class="textA" placeholder="우편번호">');
		html.push('<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기" class="small-btn"><br>');
		html.push('</div>');
		html.push('<input type="text" name="address" id="sample6_address" class="textA" placeholder="주소">');
		html.push('<input type="text" name="detailAddress" id="sample6_detailAddress" class="textA" placeholder="상세주소">');
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
		new daum.Postcode({
				oncomplete : function(data) {
					var addr = ''; // 주소 변수
					var zonecode = ''; // 우편번호
	
					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}
	
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode; // 우편번호
					document.getElementById("sample6_address").value = addr; // 주소
					
					// fullAddress에 전체 주소를 저장
		            var fullAddress = `(${data.zonecode}) ${addr}`;
		            document.getElementById("fullAddress").value = fullAddress;
		            
		            // 상세주소 필드를 비우고 포커스 이동
		            document.getElementById("sample6_detailAddress").value = "";
		            document.getElementById("sample6_detailAddress").focus();
		            
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
	    
	    // 최소 8자 이상, 특수문자, 영문자, 포함 여부 검사
	    var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]).{8,}$/;

	    if (!passwordRegex.test(password)) {
	        alert("비밀번호는 8자리 이상이며, 영문자, 특수문자(!@#$%^*+=-)를 모두 포함해야 합니다.");
	        return false;
	    }
	    
	    if (password !== passwordConfirm) {
	        alert("비밀번호가 일치하지 않습니다.");
	        return false;
	    }

	    // 생년월일 검사(년월일 양식은 LocaDate로 변환함)
	    var birthdate = document.getElementById("birthdate").value;
	    if (!/^\d{8}$/.test(birthdate)) {
	        alert("생년월일은 8자리 숫자로 입력해주세요.");
	        return false;
	    }

	    // 전화번호 검사(앞 3자리 010 이면서 총 11자리)
	    var phone = document.getElementById("phone").value;
	    if (!/^010\d{8}$/.test(phone)) {
	        alert("올바른 전화번호 형식이 아닙니다.");
	        return false;
	    }

	    // 주소 조합
	    var postcode = document.getElementById("sample6_postcode").value;
	    var address = document.getElementById("sample6_address").value;
	    var detailAddress = document.getElementById("sample6_detailAddress").value;

	    // 주소 필수 입력 확인
	    if (!postcode || !address) {
	        alert("주소를 입력해주세요.");
	        return false;
	    }
	    
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
			alert("아이디를 입력해주세요.(4~16글자)");
			return;
		}
		if (!/^(?=.*[a-zA-Z0-9])[a-zA-Z0-9]{4,16}$/.test(id)) {
	        alert("아이디는 4~16글자로 입력해주세요.");
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
	
	function handleSubmit(event) {
	    event.preventDefault();
	    if (!isIdChecked || document.getElementById("id").value !== checkedId) {
	        alert("아이디 중복 확인을 해주세요.");
	        return false;
	    }
	    
	    if(validCheck()) {
	    	
	    	var postcode = document.getElementById("sample6_postcode").value;
		    var address = document.getElementById("sample6_address").value;
		    var detailAddress = document.getElementById("sample6_detailAddress").value;
		    
		    var fullAddress = postcode + ',' + address + ',' + detailAddress;
	    	
	        // 폼 데이터 저장
	        window.tempFormData = {
	        		name: document.getElementById("name").value,
	    	        emailLocal: document.getElementById("emailLocal").value,
	    	        emailDomain: document.getElementById("domainSelect").value === "direct" 
	    	            ? document.getElementById("emailDomain").value 
	    	            : document.getElementById("domainSelect").value,
	    	        id: document.getElementById("id").value,
	    	        password: document.getElementById("password").value,
	    	        birthday: document.getElementById("birthdate").value,
	    	        gender: document.querySelector('input[name="gender"]:checked').value,
	    	        address: fullAddress,
	    	        phone: document.getElementById("phone").value
	    	    };
	        
	        // 이메일 인증 프로세스 시작
	        sendVerificationEmail();
	    }
	    return false;
	}
	    

	function sendVerificationEmail() {
		 // 이메일 로컬 부분과 도메인 부분 가져오기
	    const emailLocal = document.getElementById("emailLocal").value;
	    const emailDomain = document.getElementById("domainSelect").value === "direct" 
	        ? document.getElementById("emailDomain").value 
	        : document.getElementById("domainSelect").value;
	    
	    // 값이 비어있는지 확인
	    if (!emailLocal || !emailDomain) {
	        alert("이메일을 올바르게 입력해주세요.");
	        return;
	    }

	    // 전체 이메일 주소 조합
	    const email = emailLocal + "@" + emailDomain;
	    
	    console.log("전송할 이메일:", email); // 디버깅용 로그
	    
	    $.ajax({
	        url: "sendVerificationCodeAjaxController",
	        type: "POST",
	        data: { 
	            type: "signup",
	            email: email
	        },
	        success: function(response) {
	            console.log("서버 응답:", response); // 디버깅용 로그
	            if(response.status === "success") {
	            	alert('이메일로 인증번호를 전송하였습니다.')
	                // 전역 변수에 이메일 정보 저장
	                userEmailLocal = emailLocal;
	                userEmailDomain = emailDomain;
	                showVerificationForm();
	            } else {
	                alert('이미 존재하는 이메일입니다.');
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("에러 상세:", xhr.responseText);
	            alert('이메일 발송 중 오류가 발생했습니다.');
	        }
	    });
	}


	function showVerificationForm() {
	    var table = document.querySelector('.memberClass');
	    table.innerHTML = ''; // 기존 내용 삭제
	    
	    var html = [
	        '<tr>',
	        '<td><h1><a href="home">vsCAR</a></h1></td>',
	        '</tr>',
	        '<tr>',
	        '<td><h2>이메일 인증</h2></td>',
	        '</tr>',
	        '<tr>',
	        '<td><p>입력하신 이메일로 인증번호가 전송되었습니다.</p></td>',
	        '</tr>',
	        '<tr>',
	        '<td><input type="text" id="verificationCode" class="text" placeholder="인증번호 입력" required></td>',
	        '</tr>',
	        '<tr>',
	        '<td><input type="button" value="인증확인" onclick="verifyCode()" class="btn"></td>',
	        '</tr>'
	    ];
	    
	    html.forEach(row => {
	        var tr = document.createElement('tr');
	        tr.innerHTML = row;
	        table.appendChild(tr);
	    });
	}

	function verifyCode() {
		
		const emailLocal = document.getElementById("emailLocal").value;
	    const emailDomain = document.getElementById("domainSelect").value === "direct" 
	        ? document.getElementById("emailDomain").value 
	        : document.getElementById("domainSelect").value;
	        
		const email = emailLocal + "@" + emailDomain;
	    var code = document.getElementById("verificationCode").value;
	    if (!code) {
	        alert("인증번호를 입력해주세요.");
	        return;
	    }
	    
	    $.ajax({
	    	url: "sendVerificationCodeAjaxController",
	        type: "POST",
	        data: { 
	            type: "signup",
	            code: code,
	            email: email
	        },
	        success: function(response) {
	            if(response.status === "success") {
	                memberCreate();
	            } else {
	                alert('인증번호가 일치하지 않습니다.');
	            }
	        },
	        error: function(xhr, status, error) {
	            alert('인증 확인 중 오류가 발생했습니다.');
	        }
	    });
	}

	function memberCreate() {
	    if (!window.tempFormData) {
	        alert('회원 정보가 유실되었습니다. 다시 시도해주세요.');
	        return;
	    }

	    $.ajax({
	        url: "memberCreateAjaxController",
	        type: "POST",
	        data: window.tempFormData,
	        dataType: "json",
	        success: function(response) {
	            if(response.status === "success") {
	                alert('회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.');
	                window.location.href = "memberLogin";
	            } else {
	                alert('회원가입 실패: ' + (response.message || '알 수 없는 오류가 발생했습니다.'));
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("Error details:", xhr.responseText);
	            alert('회원가입 처리 중 오류가 발생했습니다.');
	        }
	    });
	}
	
	$(document).ready(function() {
		init();
	});
</script>
</html>