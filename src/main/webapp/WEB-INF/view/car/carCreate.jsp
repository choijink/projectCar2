<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>챠량 등록하기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/view/common/css.jsp"%>
</head>
<style>
.choice1 {
	padding-left: 10px;
	flex-grow: 0.5; /* 유연한 크기 조정 */
}

.table-container {
	position: relative;
	max-width: 1100px;
	margin: 0 auto; /* 테이블 중앙 정렬 */
}

table {
	width: 100%; /* 테이블 너비 100% */
	max-width: 1100px;
	border-collapse: collapse; /* 테이블 경계 합치기 */
	margin-top: 20px; /* 테이블 위쪽 여백 */
}

th, td {
	padding: 12px;
	border: 1px solid #ddd; /* 경계 색상 */
	text-align: center; /* 텍스트 중앙 정렬 */
}

th {
	background-color: #4CAF50; /* 헤더 배경 색상 */
	color: white; /* 헤더 텍스트 색상 */
}

.gridClass1 {
	display: grid;
	grid-template-columns: 7fr 200px 1fr 1fr; /* 그리드 레이아웃 설정 */
	gap: 15px; /* 그리드 간격 */
}

.gridButton1 {
	border-radius: 10px; /* 버튼 둥글기 */
	background-color: rgb(76, 175, 80); /* 버튼 배경색 */
	color: white; /* 버튼 텍스트 색상 */
	border: 1px white solid; /* 버튼 경계 */
}

.gridButton2 {
	border-radius: 10px; /* 버튼 둥글기 */
	background-color: #dc3545; /* 버튼 배경색 */
	color: white; /* 버튼 텍스트 색상 */
	border: 1px white solid; /* 버튼 경계 */
}

.th:nth-child(odd), td:nth-child(odd) {
	background-color: #f2f2f2; /* 홀수번째 열 배경색 */
}

.brandMark {
	width: 80px; /* 브랜드 마크 너비 */
}

.recommend {
	display: grid; /* 추천 항목 그리드 레이아웃 */
}
.ftco-section {
    padding: 0em 0;
    position: relative;
}
.preview {
    margin-top: 5px;
    font-size: 0.9em;
    color: #555; /* 미리보기 텍스트 색상 */
}
</style>

<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('images/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<h1 class="mb-3 bread">차량 등록하기</h1>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div style="text-align: center; margin-top: 60px;">
			<!-- 업로드 버튼 역할을 할 이미지 -->
			<img id="uploadButton" src="../../../buttonImage/imageInsert.png" alt="차량 이미지 업로드 버튼"
				onclick="document.getElementById('imageUpload').click()"
				style="cursor: pointer; width: 500px; height: 400px;">

			<!-- 실제 파일 업로드 입력 필드 (숨겨져 있음) -->
			<input type="file" id="imageUpload" accept="image/*"
				style="display: none;" onchange="previewImage(event)">
		</div>
	</section>
	<section class="ftco-section ftco-car-details">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="car-details"></div>
				</div>
			</div>
			<div class="row justify-content-center gap-3">
				<!-- 등급 입력 -->
				<div class="choice1">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div class="icon d-flex align-items-center justify-content-center" style="margin-right: 10px; margin-left: 70px;">
									<span class="flaticon-dashboard"></span>
								</div>
								<div class="text">
									<span class="col">등급 : </span> <input type="text" id="gradeInput">
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 트림 입력 -->
				<div class="choice1">
					<div class="media block-6 services text-center">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div class="icon d-flex align-items-center justify-content-center" style="margin-right: 20px; margin-left: 70px;">
									<span class="flaticon-diesel"></span>
								</div>
								<div class="text">
									<span class="col">트림 : </span> <input type="text" id="trimInput">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="table-container">
			<div class="gridClass1">
				<h2>차량 제원 등록하기</h2>
				<div></div>
			</div>
			<table>
				 <thead> 
			 <tr> 
			 <th>항목</th> 
			 <th>세부 사항</th> 
			 <th>항목</th> 
			 <th>세부 사항</th> 
			 </tr> 
			 </thead> 
			 <tbody> 
			 <tr> 
			 <td>제조사</td> 
			 <td>
			 <input type="text" id="trimInput">
			 <div class="preview" id="brandPreview"></div>
			 </td>
			 <td>연비</td> 
			 <td><input type="text" id="trimInput"></td>
			 </tr> 
			 <tr> 
			 <td>모델</td>
			 <td><input type="text" id="trimInput"></td> 
			 <td>인승</td> 
			 <td><input type="text" id="trimInput"></td>
			 </tr> 
			 <tr> 
			 <td>연료타입</td>
			 <td><input type="text" id="trimInput"></td> 
			 <td>전장</td> 
			 <td><input type="text" id="trimInput"></td>
			 </tr> 
			 <tr> 
			 <td>배기량</td> 
			 <td><input type="text" id="trimInput"></td>
			 <td>전폭</td> 
			 <td><input type="text" id="trimInput"></td>
			 </tr> 
			 <tr> 
			 <td>엔진형식</td> 
			 <td><input type="text" id="trimInput"></td>
			 <td>전고</td> 
			 <td><input type="text" id="trimInput"></td>
			 </tr> 
			 <tr> 
			 <td>구동방식</td> 
			 <td><input type="text" id="trimInput"></td>
			 <td>축거</td> 
			 <td><input type="text" id="trimInput"></td>
			 </tr> 
			 <tr> 
			 <td>최고출력</td> 
			 <td><input type="text" id="trimInput"></td>
			 <td>공차중량</td> 
			 <td><input type="text" id="trimInput"></td>
			 </tr> 
			 <tr> 
			 <td>최대토크</td> 
			 <td><input type="text" id="trimInput"></td>
			 <td>가격</td>
			 <td><input type="text" id="trimInput"></td> 
			 </tr> 
			 </tbody> 
			</table>
		</div>
		<!-- 등록 완료 버튼 -->
		<div style="text-align: center; margin-top: 20px; margin-bottom: 20px;">
			<button class="gridButton1"  id="registerButton">등록 완료</button>
		</div>
	</section>

	<%@ include file="/WEB-INF/view/common/footer.jsp"%>

	<!-- 로더 -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
	</div>

	<%@ include file="/WEB-INF/view/common/js.jsp"%>
</body>
<script>
	const params = new URLSearchParams(window.location.search);
	var cIdx = params.get('idx'); // URL에서 인덱스 값 가져오기
	var TrimMap = new Map(); // 트림 정보를 저장할 Map
	var carData = []; // 전체 차량 데이터를 저장하는 전역 변수

	function init() {
	 // 초기화 함수 호출
	}
	
    function previewImage(event) {
        const file = event.target.files[0]; // 선택한 파일 가져오기
        const reader = new FileReader(); // FileReader 객체 생성
        
        reader.onload = function() {
            // 선택한 이미지로 업로드 버튼 이미지 변경
            const uploadButton = document.getElementById('uploadButton');
            uploadButton.src = reader.result; // 읽어온 데이터로 버튼 이미지 변경
        };
        
        if (file) {
            reader.readAsDataURL(file); // 파일을 Data URL로 읽기
        }
    }
	
	function updatePreview() {
		document.getElementById('brandPreview').textContent = document.getElementById('brandInput').value;
	}
	
	function updateTable(selectedGrade, selectedTrim){
	    // 선택된 등급과 트림에 맞는 데이터를 carData에서 찾기
	    var filteredData = carData.find(item => {
	        return item.grade === selectedGrade && (!selectedTrim || item.trim === selectedTrim);
	    });
	    
	    $('.table-container table').empty(); // 기존 테이블 내용 지우기

	    if (filteredData){
	        var html = [];
	        html.push('<thead>');
	        html.push('<tr>');
	        html.push('<th>항목</th>');
	        html.push('<th>입력 값 1</th>');
	        html.push('<th>항목</th>');
	        html.push('<th>입력 값 2</th>');
	        html.push('</tr>');
	        html.push('</thead>');
	        html.push('<tbody>');

	        // 필터링된 데이터의 정보를 입력 필드로 추가
	        html.push('<tr>');
	        html.push('<td>제조사</td>');
	        html.push('<td><input type="text" value="' + filteredData.brand + '"></td>');
	        html.push('<td>연비</td>');
	        html.push('<td><input type="text" value="' + filteredData.fuelEfficiency + '"></td>');
	        html.push('</tr>');
	        
	        html.push('<tr>');
	        html.push('<td>모델</td>');
	        html.push('<td><input type="text" value="' + filteredData.carName + '"></td>');
	        html.push('<td>인승</td>');
	        html.push('<td><input type="text" value="' + filteredData.seatingCapacity + '"></td>');
	        html.push('</tr>');
	        
	        // 모든 다른 필드에 대해 계속 추가

	        html.push('</tbody>');
	        
	        $('.table-container table').append(html.join('')); // 테이블에 새로운 내용 추가
	    } else {
	        $('.table-container table').append('<tr><td colspan="4">해당 등급/트림의 정보가 없습니다.</td></tr>');
	    }
	}

	// '등록 완료' 버튼 클릭 시의 동작
	document.getElementById('registerButton').addEventListener('click', function() {
	    // 입력 필드에서 값을 가져와서 처리하는 로직 추가
	    const grade = document.getElementById('gradeInput').value;
	    const trim = document.getElementById('trimInput').value;
	    // 차량 등록 로직 추가 (예: 서버에 POST 요청)

	    alert(`차량 등록 완료: 등급=${grade}, 트림=${trim}`);
	});

	$(document).ready(function() {
		init(); // 문서가 준비되면 초기화 함수
	});
</script>
</html>		