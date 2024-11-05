<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/view/common/css.jsp"%>
<%@ include file="/WEB-INF/view/common/header.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>vsCAR : 회원정보수정</title>
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
#sample6_postcode {
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
    <form id="updateForm" onsubmit="return handleSubmit(event);">
        <table class="memberClass">
        </table>
    </form>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
<script>
function init(){
    var html = [];
    html.push('<tr>');
    html.push('<td><h1><a href="home">vsCAR</a></h1></td>');
    html.push('</tr>');
    html.push('<tr>');
    html.push('<td><h2>회원수정</h2></td>');
    html.push('</tr>');
    html.push('<tr>');
    html.push('<td>');
    html.push('<input type="text" id="id" name="id" class="text" readonly style="background-color: #f0f0f0;">');
    html.push('</td>');
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
    html.push('    <input type="submit" value="수정하기" class="btn">');
    html.push('</td>');
    html.push('</tr>');
    $('.memberClass').append(html.join(''));
    
    // 현재 회원 정보 로드
    loadMemberInfo();
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

function loadMemberInfo() {
    
    $.ajax({
        url: "memberAjaxController",
        method: "GET",
        data: { "idx": midx },
        success: function(response) {
        	console.log(response);
            // 폼에 현재 회원 정보 설정
            $("#id").val(response.id);
            $("#name").val(response.name);
            $('input[name="gender"][value="' + response.gender + '"]').prop("checked", true);
            $("#phone").val(response.phone);
            const currentDate = new Date();

	        // 현재 연도를 추출합니다.
	        const currentYear = currentDate.getFullYear();
	        var birthdate = currentYear - response.age + 1;
	        var day = response.residentNumber.toString().substring(2);
	        var birthday = birthdate + day;
            $("#birthdate").val(birthday);
            
            var addressStr = response.address.split(",");
            console.log(addressStr);
            $('input[name="postcode"]').val(addressStr[0]);
            $('input[name="address"]').val(addressStr[1]);
            $('input[name="detailAddress"]').val(addressStr[2]);
            
            var email = response.mail.split("@");
            $("#emailLocal").val(email[0]);
            
        },
        error: function(xhr, status, error) {
            console.error('회원 정보 로드 실패: ' + error);
        }
    });
}

function handleSubmit(event) {
    event.preventDefault();
    if(validCheck()) {
        updateMember();
    }
    return false;
}

function validCheck() {
  
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
    
    var fullAddress = postcode + ',' + address + ',' + detailAddress;

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

function updateMember() {
	
	// 주소 조합을 위한 변수들
    const postcode = document.getElementById("sample6_postcode").value;
    const baseAddress = document.getElementById("sample6_address").value;
    const detailAddress = document.getElementById("sample6_detailAddress").value;
    const fullAddress = postcode + ',' + baseAddress + ',' + detailAddress;
    
    // 폼 데이터 수집
    var formData = {
        mIdx: midx,
        name: document.getElementById("name").value,
        email: document.getElementById("emailLocal").value + "@" + 
               (document.getElementById("domainSelect").value === "direct" 
               ? document.getElementById("emailDomain").value 
               : document.getElementById("domainSelect").value),
        birthday: document.getElementById("birthdate").value,
        gender: document.querySelector('input[name="gender"]:checked').value,
        address: fullAddress,
        phone: document.getElementById("phone").value
        
    };

    $.ajax({
        url: "memberUpdateAjaxController",
        type: "POST",
        data: formData,
        dataType: "json",
        success: function(response) {
            if(response.status === "success") {
                alert('회원정보가 수정되었습니다.');
                // name 수정시 세션값 업데이트
                updateSessionName(formData.name);
                window.location.href = "mypage?midx=" + midx;
            } else {
                alert('회원정보 수정 실패: ' + response.message);
            }
        },
        error: function(xhr, status, error) {
            console.error("Error details:", xhr.responseText);
            alert('회원정보 수정 중 오류가 발생했습니다.');
        }
    });
    
}

function updateSessionName(newName) {
    $.ajax({
        url: "updateSessionNameController", // 서버에서 세션 이름을 업데이트할 URL
        type: "POST",
        data: { name: newName },
        dataType: "json",
        success: function(response) {
            if (response.status === "success") {
                console.log('세션 이름이 업데이트되었습니다.');
            } else {
                console.error('세션 이름 업데이트 실패: ' + response.message);
            }
        },
        error: function(xhr, status, error) {
            console.error("Error updating session name:", xhr.responseText);
        }
    });
}

$(document).ready(function() {
    init();
});
</script>
</html>
