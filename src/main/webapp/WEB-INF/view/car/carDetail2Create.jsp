<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>vsCAR : 차량 등록하기</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/view/common/css.jsp"%>
<%@ include file="/WEB-INF/view/common/favicon.jsp" %>
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
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<h1 class="mb-3 bread">차량 등록하기</h1>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="carNameClass" style="text-align: center; margin-top: 60px;">
			<span class="col">차량 : </span> <select id="carNameSelect"
				onchange="carNameSelected()"></select>
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
				<div class="choice1">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div
									class="icon d-flex align-items-center justify-content-center"
									style="margin-right: 10px; margin-left: 70px;">
									<span class="flaticon-dashboard"></span>
								</div>
								<div class="text grade">
									<span class="col">등급 : </span> <select id="gradeSelectBox"></select>
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
								<div
									class="icon d-flex align-items-center justify-content-center"
									style="margin-right: 20px; margin-left: 70px;">
									<span class="flaticon-diesel"></span>
								</div>
								<div class="text trim">
									<span class="col">트림 : </span> <input type="text"
										id="trimInput">
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
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>가격</td>
						<td><input type="text" id="priceInput" class="centered-input"
							placeholder="9,590만원"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 등록 완료 버튼 -->
		<div class="buttonClass" style="text-align: center; margin-top: 20px; margin-bottom: 20px;">
			<button class="gridButton1" onclick="clickInsert()" id="insertButton">등록
				완료</button>
		</div>
	</section>

	<%@ include file="/WEB-INF/view/common/footer.jsp"%>

	<!-- 로더 -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
	</div>

	<%@ include file="/WEB-INF/view/common/js.jsp"%>
</body>
<script>
	const params = new URLSearchParams(window.location.search);
	var cIdx = params.get('idx'); // URL에서 인덱스 값 가져오기
	var TrimMap = new Map(); // 트림 정보를 저장할 Map
	var carData = []; // 전체 차량 데이터를 저장하는 전역 변수
	var TrimMap = new Map();
	var Grade = new Set();
	var cd1_idx = 0;
	var cd2_idx = 0;
	
	function init() {
		if (cIdx > 0) {
			carView(1);
			document.title = "vsCAR : 차량 수정하기";
			$(".mb-3.bread").html("차량 수정하기");
			$(".gridClass1 h2").html("차량 제원 수정하기");
			$(".text.grade").empty();

			$(".buttonClass").empty();
			var html = [];
			html.push('<button class="gridButton1" onclick="clickUpdate()" id="updateButton">수정 완료</button>');
			$(".buttonClass").append(html.join(''));

			var html = [];
			$(".text.grade").empty(html.join(''));
			html.push('<select id="gradeSelectBox" onchange="gradeSelect()">');
			html.push('	<option value="">선택해주세요</option>');
			var gradeArray = Array.from(Grade);
			for (var i = 0; i < gradeArray.length; i++) {
				html.push('<option value="' + gradeArray[i] + '">'+ gradeArray[i] + '</option>');
			}
			html.push('</select>');
			$(".text.grade").append(html.join(''));

			var html = [];
			$(".text.trim").empty(html.join(''));
			html.push('<select id="trimSelectBox" onchange="carView(2)">');
			html.push('	<option value="">선택해주세요</option>');
			html.push('</select>');
			$(".text.trim").append(html.join(''));
		} else {
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
					for (var i = 0; i < response.length; i++) {
						html.push('<option value="' + response[i].cIdx + '">'
								+ response[i].carName + '</option>');
					}
					$("#carNameSelect").append(html.join(''));
				},
				error : function(xhr, status, error) {
					console.error('요청 실패: ' + error); // 에러 출력
				}
			});
		}
	}
	
	function gradeSelect() {
		$('#trimSelectBox').empty();
		
		var selectElement = document.getElementById("gradeSelectBox");
		var selectedValue = selectElement.value;
		console.log("selectedValue : " + selectedValue);
		
		console.log(TrimMap);
		// 선택한 grade에 맞는 trim 목록 가져오기
	    var trimOptions = TrimMap.get(selectedValue) || [];
		
		 var html = [];
		    html.push('<option value="">선택</option>');
		    for (var i = 0; i < trimOptions.length; i++) {
		        html.push('<option value="' + trimOptions[i] + '">' + trimOptions[i] + '</option>');
		    }
		    $('#trimSelectBox').append(html.join(''));
	}

	function carNameSelected() {
		var Idx = document.getElementById('carNameSelect').value;
		$.ajax({
			url : "carGradeAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"idx" : Idx
			},
			success : function(response) {
				// 응답 데이터를 순회하여 중복 제거
				$('#gradeSelectBox').empty();
				var html = [];
				html.push('<option value="">선택</option>');
				for (var i = 0; i < response.length; i++) {
					html.push('<option value="' + response[i].cd1Idx + '">'
							+ response[i].grade + '</option>');
				}
				$('#gradeSelectBox').append(html.join(''));

			},
			error : function(xhr, status, error) {
				console.error('요청 실패: ' + error); // 에러 출력
			}
		});
	}

	function clickInsert() {

		// FormData 객체 생성
		const formData = new FormData();

		// 폼 데이터 추가
		formData.append('cd1Idx',document.getElementById('gradeSelectBox').value);
		formData.append('trim', document.getElementById('trimInput').value);
		formData.append('price', document.getElementById('priceInput').value);

		// AJAX 요청 (fetch API 사용)
		$.ajax({
			url : "carDetail2InsertAjaxController",
			type : "POST",
			data : formData,
			contentType : false, // 기본 content type을 사용하지 않음
			processData : false, // jQuery가 데이터를 처리하지 않도록 설정
			dataType : "json",
			success : function(response) {
				console.log("Success:", response);
				if (response.status === "success") {
					alert('carDetail2 등록 완료');
					window.location.href = "/carList";
				} else {
					alert('carDetail2 등록 실패 : ' + response.message);
				}
			},
			error : function(xhr, status, error) {
				console.error("Error details:", xhr.responseText);
				alert('차량등록 중 오류가 발생했습니다.');
			}
		});

	}

	function clickUpdate() {
		// FormData 객체 생성
		const formData = new FormData();

		// 폼 데이터 추가
		formData.append('cd2Idx',cd2_idx);
		formData.append('cd1Idx',document.getElementById('gradeSelectBox').value);
		formData.append('trim', document.getElementById('trimSelectBox').value);
		formData.append('price', document.getElementById('priceInput').value);

		// AJAX 요청 (fetch API 사용)
		$.ajax({
			url : "carDetail2UpdateAjaxController",
			type : "POST",
			data : formData,
			contentType : false, // 기본 content type을 사용하지 않음
			processData : false, // jQuery가 데이터를 처리하지 않도록 설정
			dataType : "json",
			success : function(response) {
				console.log("Success:", response);
				if (response.status === "success") {
					alert('carDetail2 수정 완료');
					window.location.href = "/carList";
				} else {
					alert('carDetail2 수정 실패 : ' + response.message);
				}
			},
			error : function(xhr, status, error) {
				console.error("Error details:", xhr.responseText);
				alert('차량등록 중 오류가 발생했습니다.');
			}
		});

	}
	
	function carView(num){
		$.ajax({
			url : "CarViewAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"idx" : cIdx
			},
			async : false,
			success : function(response) {
				if(num == 1){		
					$(".carNameClass").empty();
					var html=[];
					html.push('<span class="col">차량 : </span><a>' + response[0].carName + '</a>');
					$(".carNameClass").append(html.join(''));
					TrimMap.clear();
					for (var i = 0; i < response.length; i++) {
						Grade.add(response[i].grade);
						if (!TrimMap.has(response[i].grade)) {
		                    TrimMap.set(response[i].grade, []);
		                }
		                TrimMap.get(response[i].grade).push(response[i].trim);
					} 
					
				}
				if(num == 2){
					var trim = document.getElementById('trimSelectBox').value
					
					for(var i = 0; i < response.length; i++){
						if(response[i].trim == trim){
							cd2_idx = response[i].cd2Idx;
							$("#priceInput").val(response[i].price);
						}
					}
				}
				
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
