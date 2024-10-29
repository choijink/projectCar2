<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>CarDetail</title>
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

.th:nth-child(odd), td:nth-child(odd) {
	background-color: #f2f2f2;
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
					<h1 class="mb-3 bread">Car Details</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section ftco-car-details">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="car-details">
						<div class="img rounded"
							style="background-image: url(../../../carImage/k9.png);"></div>
						<div class="text text-center">
							<span class="subheading">회사로고</span>
							<h2>회사 이름, 차량 이름 넣는 파라미터 불러오기</h2>
						</div>
					</div>
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
								<div class="text">
									<span class="col">등급 : </span> <select id="gradeSelectBox"
										onChange="gradeSelect()"></select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="choice1">
					<div class="media block-6 services text-center">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div
									class="icon d-flex align-items-center justify-content-center"
									style="margin-right: 10px; margin-left: 70px;">
									<span class="flaticon-diesel"></span>
								</div>
								<div class="text">
									<span class="col">트림 : </span>
									 <select id="trimSelectBox"><option value="">선택</option></select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="table-container">
			<div class="gridClass1">
				<h2>차량 제원</h2>
				<div></div>
				<button class="gridButton1">비교하기</button>
				<button class="gridButton2">찜하기</button>
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
						<td>회사이름넣기</td>
						<td>연비</td>
						<td>14.3km</td>
					</tr>
					<tr>
						<td>모델</td>
						<td>차 이름 넣기</td>
						<td>인승</td>
						<td>8</td>
					</tr>
					<tr>
						<td>연료타입</td>
						<td>연료타입넣기</td>
						<td>전장</td>
						<td>4,815mm</td>
					</tr>
					<tr>
						<td>배기량</td>
						<td>1999cc</td>
						<td>전폭</td>
						<td>4,815mm</td>
					</tr>
					<tr>
						<td>엔진형식</td>
						<td>I4</td>
						<td>전고</td>
						<td>4,815mm</td>
					</tr>
					<tr>
						<td>구동방식</td>
						<td>전륜</td>
						<td>축거</td>
						<td>4,815mm</td>
					</tr>
					<tr>
						<td>최고출력</td>
						<td>203 hp</td>
						<td>공차중량</td>
						<td>2,000kg</td>
					</tr>
					<tr>
						<td>최대토크</td>
						<td>45kg.m</td>
						<td>가격</td>
						<td>4,064만원</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>

	<section class="ftco-section ftco-no-pt">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 heading-section text-center ftco-animate mb-5">
					<span class="subheading">자동차 선택</span>
					<h2 class="mb-2">추천 차량</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="car-wrap rounded ftco-animate">
						<div class="img rounded d-flex align-items-end"
							style="background-image: url(../../../carImage/k5.png);"></div>
						<div class="text">
							<h2 class="mb-0">
								<a href="car-single.html">Mercedes Grand Sedan</a>
							</h2>
							<div class="d-flex mb-3">
								<span class="cat">Cheverolet</span>
								<p class="price ml-auto">
									$500 <span>/day</span>
								</p>
							</div>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-primary py-2 mr-1">Book now</a> <a
									href="car-single.html" class="btn btn-secondary py-2 ml-1">Details</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="car-wrap rounded ftco-animate">
						<div class="img rounded d-flex align-items-end"
							style="background-image: url(../../../carImage/k9.png);"></div>
						<div class="text">
							<h2 class="mb-0">
								<a href="car-single.html">Range Rover</a>
							</h2>
							<div class="d-flex mb-3">
								<span class="cat">Subaru</span>
								<p class="price ml-auto">
									$500 <span>/day</span>
								</p>
							</div>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-primary py-2 mr-1">Book now</a> <a
									href="car-single.html" class="btn btn-secondary py-2 ml-1">Details</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="car-wrap rounded ftco-animate">
						<div class="img rounded d-flex align-items-end"
							style="background-image: url(../../../carImage/k8.png);"></div>
						<div class="text">
							<h2 class="mb-0">
								<a href="car-single.html">Mercedes Grand Sedan</a>
							</h2>
							<div class="d-flex mb-3">
								<span class="cat">Cheverolet</span>
								<p class="price ml-auto">
									$500 <span>/day</span>
								</p>
							</div>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-primary py-2 mr-1">Book now</a> <a
									href="car-single.html" class="btn btn-secondary py-2 ml-1">Details</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">
							<a href="#" class="logo">Car<span>book</span></a>
						</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Information</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Services</a></li>
							<li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
							<li><a href="#" class="py-2 d-block">Best Price
									Guarantee</a></li>
							<li><a href="#" class="py-2 d-block">Privacy &amp;
									Cookies Policy</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Customer Support</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">FAQ</a></li>
							<li><a href="#" class="py-2 d-block">Payment Option</a></li>
							<li><a href="#" class="py-2 d-block">Booking Tips</a></li>
							<li><a href="#" class="py-2 d-block">How it works</a></li>
							<li><a href="#" class="py-2 d-block">Contact Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



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
	var TrimMap = new Map();

	function init() {
		view();
	}
	function view() {
		$.ajax({
			url : "CarViewAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"idx" : cIdx
			},
			success : function(response) {
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

			},
			error : function(xhr, status, error) {
				console.error('요청 실패: ' + error); // 에러 출력
			}
		});
	}

	function gradeSelect() {
		$('#trimSelectBox').empty();
		var selectElement = document.getElementById("gradeSelectBox");
		var selectedValue = selectElement.value;
		
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

	$(document).ready(function() {
		init();
	});
</script>
</html>