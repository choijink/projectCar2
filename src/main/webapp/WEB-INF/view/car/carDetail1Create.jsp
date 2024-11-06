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
.centered-input {
        text-align: center;
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
			<span class="col">차량 : </span> <select id="carNameSelect"></select>
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
			 <td>연료타입</td>
			 <td><input type="text" id="fuelTypeInput" class="centered-input" placeholder="가솔린"></td> 
			 <td>배기량</td> 
			 <td><input type="text" id="displacementInput" class="centered-input" placeholder="1,598cc"></td>
			 </tr> 
			 <tr> 
			 <td>구동방식</td> 
			 <td><input type="text" id="driveTypeInput" class="centered-input" placeholder="전륜"></td>
			 <td>연비</td> 
			 <td><input type="text" id="fuelEfficiencyInput" class="centered-input" placeholder="14.8km/L(kWh)"></td>
			 </tr> 
			 <tr> 
			 <td>인승</td> 
			 <td><input type="text" id="seatingCapacityInput" class="centered-input" placeholder="5"></td>
			 <td>전폭</td> 
			 <td><input type="text" id="widthInput" class="centered-input" placeholder="1,825mm"></td>
			 </tr> 
			 <tr> 
			 <td>엔진형식</td> 
			 <td><input type="text" id="engineTypeInput" class="centered-input small-font" placeholder="I4"></td>
			 <td>전고</td> 
			 <td><input type="text" id="heightInput" class="centered-input" placeholder="1,420mm"></td>
			 </tr> 
			 <tr> 
			 <td>전장</td> 
			 <td><input type="text" id="lengthInput" class="centered-input" placeholder="4,710mm"></td>
			 <td>축거</td> 
			 <td><input type="text" id="wheelBaseInput" class="centered-input" placeholder="2,720mm"></td>
			 </tr> 
			 <tr> 
			 <td>최고출력</td> 
			 <td><input type="text" id="maxPowerInput" class="centered-input" placeholder="123hp / 385kW"></td>
			 <td>공차중량</td> 
			 <td><input type="text" id="curbWeightInput" class="centered-input" placeholder="1,260kg"></td>
			 </tr> 
			 <tr> 
			 <td>최대토크</td> 
			 <td><input type="text" id="maxTorqueInput" class="centered-input" placeholder="15.7kg.m / 765Nm"></td>
			 <td></td> 
			 <td></td>
			 </tr> 
			 </tbody> 
			</table>
		</div>
		<!-- 등록 완료 버튼 -->
		<div style="text-align: center; margin-top: 20px; margin-bottom: 20px;">
			<button class="gridButton1" onclick="clickInsert()" id="insertButton">등록 완료</button>
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
		$.ajax({
			url : "ajaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"domestic" : "",
				"brand" : "",
				"model" : "",
				"name" : "",
				"page" : "",
				"pageSize" : ""
			},
			success : function(response) {
				var html = [];
				html.push('<option value="">선택하세요</option>');
				for(var i =0; i < response.length; i++){
					html.push('<option value="' + response[i].cIdx + '">' + response[i].carName + '</option>');
				}
				$("#carNameSelect").append(html.join(''));
			},
			error : function(xhr, status, error) {
				console.error('요청 실패: ' + error); // 에러 출력
			}
		});
	}
	
    function previewCar(event) {
        const file = event.target.files[0]; // 선택한 파일 가져오기
        const reader = new FileReader(); // FileReader 객체 생성
        
        reader.onload = function() {
            // 선택한 이미지로 업로드 버튼 이미지 변경
            const uploadButton1 = document.getElementById('uploadButton1');
            uploadButton1.src = reader.result; // 읽어온 데이터로 버튼 이미지 변경
        };
        
        if (file) {
            reader.readAsDataURL(file); // 파일을 Data URL로 읽기
        }
    }
    
    function previewMark(event) {
        const file = event.target.files[0]; // 선택한 파일 가져오기
        const reader = new FileReader(); // FileReader 객체 생성
        
        reader.onload = function() {
            // 선택한 이미지로 업로드 버튼 이미지 변경
            const uploadButton2 = document.getElementById('uploadButton2');
            uploadButton2.src = reader.result; // 읽어온 데이터로 버튼 이미지 변경
        };
        
        if (file) {
            reader.readAsDataURL(file); // 파일을 Data URL로 읽기
        }
    }
	
	function clickInsert() {
		
		 // FormData 객체 생성
	    const formData = new FormData();
	    
	    // 폼 데이터 추가
	    
	    formData.append('cIdx', document.getElementById('carNameSelect').value)
	    formData.append('fuelType', document.getElementById('fuelTypeInput').value);
	    formData.append('displacement', document.getElementById('displacementInput').value);
	    formData.append('fuelEfficiency', document.getElementById('fuelEfficiencyInput').value);
	    formData.append('seatingCapacity', document.getElementById('seatingCapacityInput').value);
	    formData.append('engineType', document.getElementById('engineTypeInput').value);
	    formData.append('driveType', document.getElementById('driveTypeInput').value);
	    formData.append('maxPower', document.getElementById('maxPowerInput').value);
	    formData.append('maxTorque', document.getElementById('maxTorqueInput').value);
	    formData.append('length', document.getElementById('lengthInput').value);
	    formData.append('width', document.getElementById('widthInput').value);
	    formData.append('height', document.getElementById('heightInput').value);
	    formData.append('wheelBase', document.getElementById('wheelBaseInput').value);
	    formData.append('curbWeight', document.getElementById('curbWeightInput').value);
	    formData.append('grade', document.getElementById('gradeInput').value);
	    
	    // AJAX 요청 (fetch API 사용)
	    $.ajax({
	        url: "carDetail1InsertAjaxController",
	        type: "POST",
	        data: formData,
	        contentType: false, // 기본 content type을 사용하지 않음
	        processData: false, // jQuery가 데이터를 처리하지 않도록 설정
	        dataType: "json",
	        success: function(response) {
	            console.log("Success:", response);
	            if(response.status === "success") {
	                alert('carDetail1 등록 완료');
	                window.location.href = "/carList";
	            } else {
	                alert('carDetail1 등록 실패 : ' + response.message);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("Error details:", xhr.responseText);
	            alert('차량등록 중 오류가 발생했습니다.');
	        }
	    });
		
	}
	
	   

	$(document).ready(function() {
		init(); 
	});
</script>
</html>		
	