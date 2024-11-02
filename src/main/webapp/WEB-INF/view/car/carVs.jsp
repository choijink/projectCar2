<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>carVs</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/view/common/css.jsp"%>
</head>
<style>
.choice1 {
	padding-left: 10px;
	flex-grow: 0.5;
}

.table-container {
	position: relative;
	max-width: 1100px;
	margin: 0 auto;
}

table {
	width: 100%;
	max-width: 1100px;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 12px;
	border: 1px solid #ddd;
	text-align: center;
}

th {
	background-color: #4CAF50;
	color: white;
}

.gridClass1 {
	display: grid;
	grid-template-columns: 7fr 200px 1fr 1fr;
	gap: 15px;
}

.gridButton1 {
	border-radius: 10px;
	background-color: rgb(76, 175, 80);
	color: white;
	border: 1px white solid;
}

.gridButton2 {
	border-radius: 10px;
	background-color: #dc3545;
	color: white;
	border: 1px white solid;
}

.th:nth-child(even), td:nth-child(even) {
	background-color: #f2f2f2;
}

.brandMark {
	width: 80px;
}

.recommend {
	display: grid;
}

.recommend-row {
	display: flex;
	flex-wrap: nowrap; /* 차량이 가로로 나란히 표시되도록 */
	gap: 20px; /* 추천 차량 간의 간격 설정 */
}

.progress-bar {
	width: 100%;
	height: 10px;
	background-color: #dedede;
	font-weight: 600;
	font-size: .8rem;
}

.progress-bar .progress1 {
	width: 100%;
	height: 10px;
	padding: 0;
	text-align: center;
	background-color: #f46c46;
	color: #111;
}

.progress-bar .progress2 {
	height: 10px;
	padding: 0;
	text-align: center;
	background-color: #83c4ff;
	color: #111;
}

.text-container {
    display: flex;
    justify-content: space-between;
    padding: 8px;   
    }
.car-details .img {
  height: 250px !important ;
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
					<h1 class="mb-3 bread">Car Compare</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section ftco-car-details">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-md-6 car1">
					<div class="car-details"></div>
					<div class="choice1">
						<div class="media block-3 services">
							<div class="media-body py-md-3">
								<div class="d-flex mb-3 align-items-center">
									<div class="text">
										<span class="col">차량 : </span> <select id="carNameSelectBox"
											onChange="gradeSelect()"></select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="choice1">
						<div class="media block-3 services">
							<div class="media-body py-md-3">
								<div class="d-flex mb-3 align-items-center">
									<div class="text">
										<span class="col">등급 : </span> <select id="gradeSelectBox"
											onChange="gradeSelect()"></select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="choice1">
						<div class="media block-3 services text-center">
							<div class="media-body py-md-3">
								<div class="d-flex mb-3 align-items-center">
									<div class="text">
										<span class="col">트림 : </span> <select id="trimSelectBox"
											onChange="trimSelect()"><option value="">선택</option></select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%-- 차량 비교 그래프 --%>
					<div class="container">
						<div class="text-container">
							<span>15.7</span>
							<span>연비</span>
						</div>
						<div class="row justify-content: space-evenly">
							<div class="progress-bar">
								<div class="progress1" style="background: linear-gradient(to left, #f46c46 20%, transparent 20%"></div>
							</div>
						</div>
						<div class="text-container">
							<span>180</span>
							<span>출력</span>
						</div>
						<div class="row justify-content: space-evenly">
							<div class="progress-bar">
								<div class="progress1" style="background: linear-gradient(to left, #f46c46 50%, transparent 50%"></div>
							</div>
						</div>
						<div class="text-container">
							<span>27</span>
							<span>토크</span>
						</div>
						<div class="row justify-content: space-evenly">
							<div class="progress-bar">
								<div class="progress1" style="background: linear-gradient(to left, #f46c46 55%, transparent 55%"></div>
							</div>
						</div>
						<div class="text-container">
							<span>1598</span>
							<span>배기</span>
						</div>
						<div class="row justify-content: space-evenly">
							<div class="progress-bar">
								<div class="progress1" style="background: linear-gradient(to left, #f46c46 30%, transparent 30%"></div>
							</div>
						</div>
						<div class="text-container">
							<span>5</span>
							<span>탑승</span>
						</div>
						<div class="row justify-content: space-evenly">
							<div class="progress-bar">
								<div class="progress1" style="background: linear-gradient(to left, #f46c46 80%, transparent 80%"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 car2">
					<div class="car-details"></div>
					<div class="choice1">
						<div class="media block-3 services">
							<div class="media-body py-md-3">
								<div class="d-flex mb-3 align-items-center">
									<div class="text">
										<span class="col">차량 : </span> <select id="carNameSelectBox"
											onChange="gradeSelect()"></select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="choice1">
						<div class="media block-3 services">
							<div class="media-body py-md-3">
								<div class="d-flex mb-3 align-items-center">
									<div class="text">
										<span class="col">등급 : </span> <select id="gradeSelectBox"
											onChange="gradeSelect()"></select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="choice1">
						<div class="media block-3 services text-center">
							<div class="media-body py-md-3">
								<div class="d-flex mb-3 align-items-center">
									<div class="text">
										<span class="col">트림 : </span> <select id="trimSelectBox"
											onChange="trimSelect()"><option value="">선택</option></select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%-- 차량 비교 그래프 --%>
					<div class="container">
						<div class="text-container">
							<span>km/L</span>
							<span>14.3</span>
						</div>
						<div class="row justify-content: space-evenly">
							<div class="progress-bar">
								<div class="progress2" style="width: 72%"></div>
							</div>
						</div>
						<div class="text-container">
							<span>km/L</span>
							<span>194</span>
						</div>
						<div class="row justify-content: space-evenly">
							<div class="progress-bar">
								<div class="progress2" style="width: 60%"></div>
							</div>
						</div>
						<div class="text-container">
							<span>km/L</span>
							<span>45</span>
						</div>
						<div class="row justify-content: space-evenly">
							<div class="progress-bar">
								<div class="progress2" style="width: 65%"></div>
							</div>
						</div>
						<div class="text-container">
							<span>km/L</span>
							<span>2151</span>
						</div>
						<div class="row justify-content: space-evenly">
							<div class="progress-bar">
								<div class="progress2" style="width: 80%"></div>
							</div>
						</div>
						<div class="text-container">
							<span>인원</span>
							<span>5</span>
						</div>
						<div class="row justify-content: space-evenly">
							<div class="progress-bar">
								<div class="progress2" style="width: 30%"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="table-container" style="margin: 60px auto">
			<div class="gridClass1">
				<h2>차량 제원</h2>
				<div></div>

				<%-- 	 
			<% if ("admin".equals(userRole)) { %>
                <button class="gridButton1">수정</button>
                <button class="gridButton2">삭제</button>
            <% } else { %>
                <button class="gridButton1">비교하기</button>
                <button class="gridButton2">관심등록</button>
            <% } %>
            --%>

			</div>
			<table>
				<tr>
					<td colspan="4">해당 등급/트림의 정보가 없습니다.</td>
				</tr>
			</table>
		</div>
	</section>

	<section class="ftco-section ftco-no-pt">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 heading-section text-center ftco-animate mb-5">
					<span class="subheading">차량 선택</span>
					<h2 class="mb-2">추천 차량</h2>
				</div>
			</div>

			<div class="recommend-row"></div>
		</div>
	</section>

	<%@ include file="/WEB-INF/view/common/footer.jsp"%>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<%@ include file="/WEB-INF/view/common/js.jsp"%>
</body>
<script>
	const params = new URLSearchParams(window.location.search);
	var cIdx = params.get('idx');
	var GradeMap = new Map();
	var TrimMap = new Map();
	var carData = [] ; // 전체 차량 데이터를 저장하는 전역 변수

	function init() {
		viewCompare();
	}
	function view() {
		$.ajax({
			url : "CarViewAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"idx" : cIdx
			},
			success : function(response) {
				carData = response;
				// 응답 데이터를 순회하여 중복 제거
				var FuelEfficiency = new Set();
				var FuelType = new Set();
				var Displacement = new Set();
				var MaxPower = new Set();
				var CurbWeight = new Set();
				var MaxTorque = new Set();
				var Grade = new Set();
				var Price = new Set();
				
				TrimMap.clear();

				for (var i = 0; i < response.length; i++) {
					FuelEfficiency.add(response[i].fuelEfficiency); // 브랜드 추가
					FuelType.add(response[i].fuelType); // 모델 이름 추가
					Displacement.add(response[i].displacement); // 모델 이름 추가
					MaxPower.add(response[i].maxPower); // 모델 이름 추가
					CurbWeight.add(response[i].curbWeight); // 모델 이름 추가
					MaxTorque.add(response[i].maxTorque); // 모델 이름 추가
					Grade.add(response[i].grade); // 모델 이름 추가
					Price.add(response[i].price); // 모델 이름 추가
					// grade별로 trim 추가
	                if (!TrimMap.has(response[i].grade)) {
	                    TrimMap.set(response[i].grade, []);
	                }
	                TrimMap.get(response[i].grade).push(response[i].trim);
				}
				var html = [];
				html.push('<option value="">선택</option>');
				var gradeArray = Array.from(Grade);
				for (var i = 0; i < gradeArray.length; i++) {
					console.log(gradeArray[i]);
					html.push('<option value="' + gradeArray[i] + '">'
							+ gradeArray[i] + '</option>');
				}
				$('#gradeSelectBox').append(html.join(''));
				
				var html = [];
				html.push('<div class="img rounded" style="background-image: url(../../../carImage/' + response[0].carImage + ');"></div>');
				html.push('<div class="text text-center">');
				html.push('	<span class="subheading"><img class="brandMark" src=../../../carImage/' + response[0].brandMark + '></span>');
				html.push('	<h2>' + response[0].brand + ' ' + response[0].carName + '</h2>');
				html.push('</div>');
				$('.car1 .car-details').append(html.join(''));

			},
			error : function(xhr, status, error) {
				console.error('요청 실패: ' + error); // 에러 출력
			}
		});
	}

	function viewCompare(){ // 비교하기 버튼 실행하는 코드 만들기
		$.ajax({
			url : "CarViewAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"idx" : cIdx
			},
			success : function(response) {
				var CarName = new Set();
				var Grade = new Set();
				
				GradeMap.clear();
				TrimMap.clear();
				
				for (var i = 0; i < response.length; i++) {
					CarName.add(response[i].carName); // 모델 이름 추가
					Grade.add(response[i].grade); // 모델 이름 추가
					// carName별로 Grade 추가
	                if (!GradeMap.has(response[i].carName)) {
	                	GradeMap.set(response[i].carName, []);
	                }
	                GradeMap.get(response[i].carName).push(response[i].grade);
	                
					if (!TrimMap.has(response[i].grade)) {
	                    TrimMap.set(response[i].grade, []);
	                }
	                TrimMap.get(response[i].grade).push(response[i].trim);
				}
				
				var html = [];
				html.push('<option value="">선택</option>');
				var carNameArray = Array.from(CarName);
				for (var i = 0 ; i < carNameArray.length; i++){
					console.log("carNameArray[i]");
					console.log(carNameArray[i]);
					html.push('<option value="' + carNameArray[i] +'">' + carNameArray[i] + '</option>');
				}
				$('#carNameSelectBox').append(html.join(''));
			}
		});
	}
	
	function carNameSelect(){
		$('#gradeSelectBox').empty();
		$('.table-container table').empty();
		$('.table-container table').append('<tr><td colspan="4">해당 차량/등급/트림의 정보가 없습니다.</td></tr>');
		
		var selectElement = document.getElementById("carNameSelectBox");
		var selectedValue = selectElement.value;
		
		console.log(TrimMap);
		// 선택한 carName에 맞는 grade 목록 가져오기
	    var gradeOptions = GradeMap.get(selectedValue) || [];
		
		 var html = [];
		    html.push('<option value="">선택</option>');
		    for (var i = 0; i < gradeOptions.length; i++) {
		        html.push('<option value="' + gradeOptions[i] + '">' + gradeOptions[i] + '</option>');
		    }
		    $('#gradeSelectBox').html(html.join(''));
	}
	
	function gradeSelect() {
		$('#trimSelectBox').empty();
		$('.table-container table').empty();
		$('.table-container table').append('<tr><td colspan="4">해당 등급/트림의 정보가 없습니다.</td></tr>');
		
		var selectCarName = document.getElementById("gradeSelectBox");
		var selectedValue = selectCarName.value;
		
		console.log(TrimMap);
		// 선택한 grade에 맞는 trim 목록 가져오기
	    var trimOptions = TrimMap.get(selectedValue) || [];
		
		 var html = [];
		    html.push('<option value="">선택</option>');
		    for (var i = 0; i < trimOptions.length; i++) {
		        html.push('<option value="' + trimOptions[i] + '">' + trimOptions[i] + '</option>');
		    }
		    $('#trimSelectBox').html(html.join(''));
	}
	
	function trimSelect(){
		// trim 선택에 따라서 테이블 업데이트
		var selectedGrade = $('#gradeSelectBox').val();
		var selectedTrim = $('#trimSelectBox').val();
		updateTable(selectedGrade, selectedTrim);
	}
	
	function updateTable(selectedGrade, selectedTrim){
		// 선택된 등급과 트림에 맞는 데이터를 carData 찾기
		var filteredData = carData.find(item => {
			return item.grade === selectedGrade && (!selectedTrim || item.trim === selectedTrim);
		})
		console.log(selectedGrade);
		console.log(selectedTrim);
		console.log(filteredData);
		
		if (filteredData){
			$('.table-container table').empty();
			var html = [];
			html.push('<thead>');
			html.push('<tr>');
			html.push('<th>세부 사항</th>');
			html.push('<th>항목</th>');
			html.push('<th>세부 사항</th>');
			html.push('</tr>');
			html.push('</thead>');
			html.push('<tbody>');
			html.push('<tr>');
			html.push('<td>' + filteredData.brand + '</td>');
			html.push('<td>제조사</td>');
			html.push('<td>' + "-" + '</td>');
			html.push('</tr>');
			html.push('<tr>');
			html.push('<td>' + filteredData.carName + '</td>');
			html.push('<td>모델</td>');
			html.push('<td>' + "-" + '</td>');
			html.push('</tr>');
			html.push('<tr>');
			html.push('<td>' + filteredData.fuelType + '</td>');
			html.push('<td>연료타입</td>');
			html.push('<td>' + "-" + '</td>');
			html.push('</tr>');
			html.push('<tr>');
			html.push('<td>' + filteredData.seatingCapacity + '</td>');
			html.push('<td>인승</td>');
			html.push('<td>' + "-" + '</td>');
			html.push('</tr>');
			html.push('<tr>');
			html.push('<td>' + filteredData.engineType + '</td>');
			html.push('<td>엔진형식</td>');
			html.push('<td>' + "-" + '</td>');
			html.push('</tr>');
			html.push('<tr>');
			html.push('<td>' + filteredData.driveType + '</td>');
			html.push('<td>구동방식</td>');
			html.push('<td>' + "-" + '</td>');
			html.push('</tr>');
			html.push('<tr>');
			html.push('<td>' + filteredData.maxPower + '</td>');
			html.push('<td>최고출력</td>');
			html.push('<td>' + "-" + '</td>');
			html.push('</tr>');
			html.push('<tr>');
			html.push('<td>' + filteredData.maxTorque + '</td>');
			html.push('<td>최대토크</td>');
			html.push('<td>' + "-" + '</td>');
			html.push('</tr>');
			html.push('<tr>');
			html.push('<td>' + filteredData.fuelEfficiency + '</td>');
			html.push('<td>연비</td>');
			html.push('<td>' + "-" + '</td>');
			html.push('</tr>');
			html.push('<tr>');
			html.push('<td>' + filteredData.displacement + '</td>')
			html.push('<td>배기량</td>');
			html.push('<td>' + "-" + '</td>')
			html.push('</tr>');
			html.push('<tr>');
			html.push('<td>' + filteredData.length + '</td>');
			html.push('<td>전장</td>');
			html.push('<td>' + "-" + '</td>');
			html.push('</tr>');
			html.push('<tr>');
			html.push('<td>' + filteredData.width + '</td>');
			html.push('<td>전폭</td>');
			html.push('<td>' + "-" + '</td>');
			html.push('</tr>');
			html.push('<tr>');
			html.push('<td>' + filteredData.height + '</td>');
			html.push('<td>전고</td>');
			html.push('<td>' + "-" + '</td>');
			html.push('</tr>');
			html.push('<tr>');
			html.push('<td>' + filteredData.wheelBase + '</td>');
			html.push('<td>축거</td>');
			html.push('<td>' + "-" + '</td>');
			html.push('</tr>');
			html.push('<tr>');
			html.push('<td>' + filteredData.curbWeight + '</td>');
			html.push('<td>공차중량</td>');
			html.push('<td>' + "-" + '</td>');
			html.push('</tr>');
			html.push('<tr>');
			html.push('<td>' + filteredData.price + '</td>');
			html.push('<td>가격</td>');
			html.push('<td>' + "-" + '</td>');
			html.push('</tr>');
			html.push('</tbody>');
		
			$('.table-container table').append(html.join(''));
			recommendList(filteredData);
		} else {
			$('.table-container table').append('<tr><td colspan="4">해당 등급/트림의 정보가 없습니다.</td></tr>');
			//recommendList(filteredData);
		}
	}
	
	/* function recommendView() {
		$.ajax({
			url : "CarViewAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"idx" : cIdx
			},
			success : function(response) {
				carData = response;
				// 응답 데이터를 순회하여 중복 제거
				var CarImage = new Set();
				var CarName = new Set();
				var BrandMark = new Set();
				var Price = new Set();
				
				for (var i = 0; i < response.length; i++) {
					CarImage.add(response[i].carImage);
					CarName.add(response[i].carName);
					BrandMark.add(response[i].brandMark);
					Price.add(response[i].price);
				}
			},
			error : function(xhr, status, error) {
				console.error('요청 실패: ' + error); // 에러 출력
			}
		});
	} */
	
	function carListController(callback) {
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
				console.log("response");
				console.log(response);
				callback(response);
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