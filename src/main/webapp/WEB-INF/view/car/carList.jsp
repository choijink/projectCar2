<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Carbook - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/view/common/css.jsp"%>
</head>
<style>
.d-block {width: 100%;justify-content: center;gap: 10px;}
.btn-danger {font-size: 0.8rem !important;border: 1px solid !important;border-width: 0px !important;line-height: 3.5;width: 30% !important;}
.mr-1 {color: black !important; line-height: 2.5;}
.car-wrap .text p.d-block a {width: 78%;}
.request-form.ftco-animate.bg-primary.fadeInUp.ftco-animated {width: 100%;margin-top: 200px;}
.col-md-15 {flex: unset;max-width: unset;}
.featured-top {margin-top: unset;}
.bg-primary {background: rgb(0 123 255/ 38%) !important;}
.btn.btn-secondary {background-color: #6c757d !important;border-color: #6c757d !important; width: inherit !important;}
.ftco-section {padding: 2em 0;}
.ftco-footer {height: 350px;}
.form-group.main {display: grid;grid-template-columns: 80px 1fr 80px 1fr 80px 1fr 80px 1fr;gap: 15px;}
.form-group.search {justify-content: center;display: grid;margin-top: 2rem;gap: 10px;grid-template-columns: 1fr 1fr 1fr 1fr;}
.form-group.search .btn {width: unset;}
.request-form label.label {text-align: center;font-size: 15px;}
.mt-5, .my-5 {margin-top: unset !important;}
.btn-danger {
    font-size: 0.8rem !important;
    border: 2px solid !important;
    border-width: 0px !important;
    line-height: 3.5;
    width: 26% !important;
}
label {display: inline-block;margin-bottom: unset;}
</style>
<body>

	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('images/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="col-md-15 d-flex align-items-center">
				<form action="javascript:search();"
					class="request-form ftco-animate bg-primary">
					<h2>조건 차량 검색</h2>
					<div class="form-group main">
						<label for="" class="label domestic">국산 / 수입</label> <select
							id="domesticImportSelectBox" onchange="selectNum(1);">
							<option value="">국산 / 수입</option>
						</select> <label for="" class="label brand">차 브랜드</label> <select
							id="brandSelectBox" onchange="selectNum(2);">
							<option value="">차 브랜드</option>
						</select> <label for="" class="label model">차 종류</label> <select
							id="modelSelectBox" onchange="selectNum(3);">
							<option value="">차 종류</option>
						</select> <label for="" class="label name">차</label> <select
							id="nameSelectBox">
							<option value="">차</option>
						</select>
					</div>
					<div class="form-group search">
						<div></div>
							<input type="submit" value="해당 조건 차량 검색"
							class="btn btn-secondary py-3 px-4"> 
							<input type="cancel"
							onclick="javascript:reload();" value="검색 초기화"
							class="btn btn-secondary py-3 px-4">
							<!--관리자 차량 등록버  -->
							<input type="button" id="registerButton" value="차량등록"
							class="btn btn-secondary py-3 px-4" onclick="javascript:gotoCreate();" style="display: none;">
						<div></div>
					</div>
				</form>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row list"></div>
			<!-- "더보기" 버튼 -->
			<div class="row mt-5">
				<div class="col text-center">
					<button id="loadMoreBtn" class="btn btn-secondary"
						style="display: none;" onclick="loadMore();">더보기</button>
				</div>
			</div>
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
	
	var currentPage = 1 ;
	var pageSize = 9 ;
	
	// 페이지 로드 시 초기 데이터 로드
	$(document).ready(function() {
		search(); // 첫 번째 페이지 데이터 로드
	});
	
	
	

	const params = new URLSearchParams(window.location.search);
	var domesticParam = params.get('domestic');
	var brandParam = params.get('brand');
	var modelParam = params.get('model');
	var nameParam = params.get('name');
	
	// 등록하기 버튼 보기 권한
	//const userRole = 'admin';
	/* if (userRole == 'admin'){
		document.getElementById('reisterButton').style.display = 'inline-block;'
	} */
	
	$(document).ready(function() {
		search();
		$("#loadMoreBtn").show();
	})
	
	
	if (domesticParam != null)
		domestic = domesticParam;
	if (brandParam != null)
		brand = brandParam;
	if (modelParam != null)
		model = modelParam;
	if (nameParam != null)
		name = nameParam;

	function init(domestic, brand, model, name, checkNum) {
		var check = 0;
		if (domesticParam != null) {
			domestic = domesticParam;
			check = 1;
		}
		if (brandParam != null) {
			brand = brandParam;
			check = 1;
		}
		if (modelParam != null) {
			model = modelParam;
			check = 1;
		}
		if (nameParam != null) {
			name = nameParam;
			check = 1;
		}
		ajaxController(domestic, brand, model, name, null, null, function(
				response) {
			// 중복을 제거할 Set 생성
			const domesticImports = new Set();
			const brands = new Set();
			const carModels = new Set();
			const vehicleSizes = new Set();
			const carNames = new Set();

			// 응답 데이터를 순회하여 중복 제거
			for (var i = 0; i < response.length; i++) {
				domesticImports.add(response[i].domesticImport); // 브랜드 추가
				brands.add(response[i].brand); // 브랜드 추가
				carModels.add(response[i].carModel); // 차종 추가
				vehicleSizes.add(response[i].vehicleSize); // 사이즈 추가
				carNames.add(response[i].carName); // 모델 이름 추가
				
			}

			// 국산/수입
			if (domestic != "") {
				$('#domesticImportSelectBox').empty();
			}
			var html = [];
			var domesticImportsArray = Array.from(domesticImports); // Set을 배열로 변환
			for (var i = 0; i < domesticImportsArray.length; i++) {
				// 각 브랜드에 대한 HTML 요소 추가
				html.push('<option value="' + domesticImportsArray[i] + '">'
						+ domesticImportsArray[i] + '</option>');
			}
			$('#domesticImportSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가

			// 브랜드
			var html = [];
			$('#brandSelectBox').empty();
			if (brand == "") {
				html.push('<option value="">브랜드</option>');
			}
			var brandArray = Array.from(brands); // Set을 배열로 변환
			for (var i = 0; i < brandArray.length; i++) {
				// 각 브랜드에 대한 HTML 요소 추가
				html.push('<option value="' + brandArray[i] + '">'
						+ brandArray[i] + '</option>');
			}
			$('#brandSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가

			// 차량 종류
			var html = [];
			$('#modelSelectBox').empty();
			if (model == "") {
				html.push('<option value="">차량 종류</option>');
			}
			var modelArray = Array.from(carModels); // Set을 배열로 변환
			for (var i = 0; i < modelArray.length; i++) {
				html.push('<option value="' + modelArray[i] + '">'
						+ modelArray[i] + '</option>');
			}
			$('#modelSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가

			// 차 이름
			var html = [];
			$('#nameSelectBox').empty();
			if (name == "") {
				html.push('<option value="">차</option>');
			}
			var nameArray = Array.from(carNames); // Set을 배열로 변환
			nameArray.sort();
			for (var i = 0; i < nameArray.length; i++) {
				html.push('<option value="' + nameArray[i] + '">'
						+ nameArray[i] + '</option>');
			}
			$('#nameSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가

			if (check == 1)
				search();
			if (checkNum == 2)
				search();
		});
	}

	function selectNum(i) {
		if (i == 1) {
			$('#brandSelectBox').show();
			$('.label.brand').show();
			var selectElement = document
					.getElementById("domesticImportSelectBox");
			var selectedValue = selectElement.value;
			console.log(selectedValue);
			select1 = selectedValue;
			ajaxController(select1, "", "", "", "", "", function(response) {
				// 중복을 제거할 Set 생성
				const brands = new Set();
				const carModels = new Set();
				const carNames = new Set();

				// 응답 데이터를 순회하여 중복 제거
				for (var i = 0; i < response.length; i++) {
					brands.add(response[i].brand); // 브랜드 추가
					carModels.add(response[i].carModel); // 차종 추가
					carNames.add(response[i].carName); // 모델 이름 추가
				}

				// 브랜드
				var html = [];
				$('#brandSelectBox').empty();
				html.push('<option value="">차 브랜드</option>');
				var brandArray = Array.from(brands); // Set을 배열로 변환
				for (var i = 0; i < brandArray.length; i++) {
					// 각 브랜드에 대한 HTML 요소 추가
					html.push('<option value="' + brandArray[i] + '">'
							+ brandArray[i] + '</option>');
				}
				$('#brandSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가

				// 차량 종류
				var html = [];
				$('#modelSelectBox').empty();
				html.push('<option value="">차 종류</option>');
				var modelArray = Array.from(carModels); // Set을 배열로 변환
				for (var i = 0; i < modelArray.length; i++) {
					html.push('<option value="' + modelArray[i] + '">'
							+ modelArray[i] + '</option>');
				}
				$('#modelSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가

				// 차 이름
				var html = [];
				$('#nameSelectBox').empty();
				html.push('<option value="">차</option>');
				var nameArray = Array.from(carNames); // Set을 배열로 변환
				nameArray.sort();
				for (var i = 0; i < nameArray.length; i++) {
					html.push('<option value="' + nameArray[i] + '">'
							+ nameArray[i] + '</option>');
				}
				$('#nameSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가
			});

		}
		if (i == 2) {
			$('#modelSelectBox').show();
			$('.label.model').show();
			var selectElement = document.getElementById("brandSelectBox");
			var selectedValue = selectElement.value;
			select2 = selectedValue;
			ajaxController("", select2, "", "", "", "", function(response) {
				// 중복을 제거할 Set 생성
				const carModels = new Set();
				const carNames = new Set();

				// 응답 데이터를 순회하여 중복 제거
				for (var i = 0; i < response.length; i++) {
					carModels.add(response[i].carModel); // 차종 추가
					carNames.add(response[i].carName); // 모델 이름 추가
				}

				// 차량 종류
				var html = [];
				$('#modelSelectBox').empty();
				html.push('<option value="">차 종류</option>');
				var modelArray = Array.from(carModels); // Set을 배열로 변환
				for (var i = 0; i < modelArray.length; i++) {
					html.push('<option value="' + modelArray[i] + '">'
							+ modelArray[i] + '</option>');
				}
				$('#modelSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가

				// 차 이름
				var html = [];
				$('#nameSelectBox').empty();
				html.push('<option value="">차</option>');
				var nameArray = Array.from(carNames); // Set을 배열로 변환
				nameArray.sort();
				for (var i = 0; i < nameArray.length; i++) {
					html.push('<option value="' + nameArray[i] + '">'
							+ nameArray[i] + '</option>');
				}
				$('#nameSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가
			});
		}
		if (i == 3) {
			$('#nameSelectBox').show();
			$('.label.name').show();
			var selectElement = document.getElementById("modelSelectBox");
			var selectedValue = selectElement.value;
			select3 = selectedValue;
			ajaxController("", select2, select3, "", "", "",
					function(response) {
						// 중복을 제거할 Set 생성
						const carNames = new Set();

						// 응답 데이터를 순회하여 중복 제거
						for (var i = 0; i < response.length; i++) {
							carNames.add(response[i].carName); // 모델 이름 추가
						}
						// 차 이름
						var html = [];
						$('#nameSelectBox').empty();
						html.push('<option value="">차</option>');
						var nameArray = Array.from(carNames); // Set을 배열로 변환
						nameArray.sort();
						for (var i = 0; i < nameArray.length; i++) {
							html.push('<option value="' + nameArray[i] + '">'
									+ nameArray[i] + '</option>');
						}
						$('#nameSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가
					});
		}
	}

	function search() {
		currentPage = 1;
		$(".ftco-section.bg-light .container .row.list").empty(); // 기존 리스트 초기
		
		var domestic = document.getElementById("domesticImportSelectBox").value;
		var brand = document.getElementById("brandSelectBox").value;
		var model = document.getElementById("modelSelectBox").value;
		var name = document.getElementById("nameSelectBox").value;
		

		var url = window.location.origin + "/carList";
		var params = [];

		if (domestic)
			params.push("domestic=" + encodeURIComponent(domestic));
		if (brand)
			params.push("brand=" + encodeURIComponent(brand));
		if (model)
			params.push("model=" + encodeURIComponent(model));
		if (name)
			params.push("name=" + encodeURIComponent(name));

		if (params.length > 0) {
			url += "?" + params.join("&");
		}

		ajaxController(
				domestic,
				brand,
				model,
				name,
			    currentPage,
				pageSize,
				function(response) {
					var html = [];
					$(".ftco-section.bg-light .container .row.list").empty();
					for (var i = 0; i < response.length; i++) {
						html.push('<div class="col-md-4">');
						html.push('	<div class="car-wrap rounded ftco-animate fadeInUp ftco-animated">');
						html.push('		<div class="img rounded d-flex align-items-end"');
						html.push('			style="background-image: url(carImage/'+ response[i].carImage + ');"></div>');
						html.push('		<div class="text">');
						html.push('			<div class="d-flex align-items-center mb-3">');
						html.push('				<h2 class="mb-0">');
						html.push('					<a href="carView?idx=' + response[i].cIdx + '">'+ response[i].carName + '</a>');
						html.push('				</h2>');
						html.push('			</div>');
						html.push('			<div class="d-flex mb-3">');
						html.push('				<p class="price ml-auto">'+ response[i].brand + '</p>');
						html.push('			</div>');
						html.push('			<p class="d-flex mb-0 d-block">');
						html.push('				<a href="carView?idx=' + response[i].cIdx + '" class="btn btn-light py-2 mr-1"');
						html.push('					style="color: black !important;">상세보기</a> <a href="carView"');
						html.push('					class="btn btn-danger"');
						html.push('					style="font-size: 0.8rem !important; border: 1px solid !important; border-width: 1px !important;">관심등록</a>');
						html.push('			</p>');
						html.push('		</div>');
						html.push('	</div>');
						html.push('</div>');
					}
					$(".ftco-section.bg-light .container .row.list").append(
							html.join(''));
				
			
					if (response.length < pageSize) {
						$("#loadMoreBtn").hide();
					} else {
						$("#loadMoreBtn").show();
					}
				});
					
		

	}


	function ajaxController(domestic, brand, model, name, page, pageSize, callback) {
		$.ajax({
			url : "ajaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"domestic" : domestic,
				"brand" : brand,
				"model" : model,
				"name" : name,
				"page" : page,
				"pageSize" : pageSize
			},
			success : function(response) {
				callback(response);
			},
			error : function(xhr, status, error) {
				console.error('요청 실패: ' + error); // 에러 출력
			}
		});
	}
	
	function gotoCreate() {
		
		window.location.href = window.location.origin + "/carCreate";
	}
	
	function reload() {
		window.location.href = window.location.origin + "/carList";
	}

	function loadMore() {
		// 다음 페이지 요청
		currentPage++;
		var domestic = document.getElementById("domesticImportSelectBox").value;
		var brand = document.getElementById("brandSelectBox").value;
		var model = document.getElementById("modelSelectBox").value;
		var name = document.getElementById("nameSelectBox").value;

		// 추가 페이지 데이터 요청
		ajaxController(domestic, brand, model, name, currentPage, pageSize, function(response) {
			displayCars(response);
			if (response.length < pageSize) {
				$("#loadMoreBtn").hide(); // 더 이상 로드할 데이터가 없을 때 버튼 숨김
			}
		});
	}
	
	function displayCars(response) {
		// 차량 정보를 HTML로 추가
		var html = [];
		for (var i = 0; i < response.length; i++) {
			html.push('<div class="col-md-4">');
			html.push('	<div class="car-wrap rounded ftco-animate fadeInUp ftco-animated">');
			html.push('		<div class="img rounded d-flex align-items-end" style="background-image: url(carImage/'+ response[i].carImage + ');"></div>');
			html.push('		<div class="text">');
			html.push('			<div class="d-flex align-items-center mb-3">');
			html.push('				<h2 class="mb-0"><a href="carView?idx=' + response[i].cIdx + '">'+ response[i].carName + '</a></h2>');
			html.push('			</div>');
			html.push('			<div class="d-flex mb-3">');
			html.push('				<p class="price ml-auto">'+ response[i].brand + '</p>');
			html.push('			</div>');
			html.push('			<p class="d-flex mb-0 d-block">');
			html.push('				<a href="carView?idx=' + response[i].cIdx + '" class="btn btn-light py-2 mr-1" style="color: black !important;">상세보기</a> <a href="carView" class="btn btn-danger" style="font-size: 0.8rem !important; border: 1px solid !important; border-width: 1px !important;">관심등록</a>');
			html.push('			</p>');
			html.push('		</div>');
			html.push('	</div>');
			html.push('</div>');
		}
		$(".ftco-section.bg-light .container .row.list").append(html.join('')); // 기존 목록 아래에 추가
	}
	
	$(document).ready(function() {
		init("", "", "", "", 2);
		
	});
	
	
</script>
</html>