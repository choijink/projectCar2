<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>vsCAR : Home</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/view/common/css.jsp"%>
</head>
<style>
.request-form.ftco-animate.bg-primary.fadeInUp.ftco-animated {
	width: 100%;
	margin-top: 150px;
}

.col-md-4 {
	flex: unset;
	max-width: unset;
}

.featured-top {
	margin-top: unset;
}

.bg-primary {
	background: rgb(0 123 255/ 38%) !important;
}

.btn.btn-secondary {
	background-color: #6c757d !important;
	border-color: #6c757d !important;
}

.ftco-section {
	padding: 2em 0;
}

.ftco-footer {
	height: 350px;
}

.form-group.main {
	display: grid;
	grid-template-columns: 80px 1fr 80px 1fr 80px 1fr 80px 1fr;
	gap: 15px;
}

.form-group.search {
	justify-content: center;
	display: grid;
	margin-top: 2rem;
	gap: 10px;
	grid-template-columns: 1fr 1fr 1fr 1fr;
}

.form-group.search .btn {
	width: unset;
}

.request-form label.label {
	text-align: center;
	font-size: 15px;
}

label {
	display: inline-block;
	margin-bottom: unset;
}
</style>
<body>


	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<!-- END nav -->

	<div class="hero-wrap ftco-degree-bg"
		style="background-image: url('../../../images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters">
				<div class="col-md-12   featured-top">
					<div class="row no-gutters">
						<div class="col-md-4 d-flex align-items-center">
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
										class="btn btn-secondary py-3 px-4"> <input
										type="cancel" onclick="location.reload();" value="검색 초기화"
										class="btn btn-secondary py-3 px-4">
									<div></div>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/common/footer.jsp"%>


	<!-- loader -->
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
	var id = '<%= session.getAttribute("id") != null ? session.getAttribute("id") : "" %>';
	console.log("id : " + id);

	var select1 = "";
	var select2 = "";
	var select3 = "";
	var select4 = "";
	
	function init(){
		ajaxController("", "", "", "", function(response){
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

			// 국산 / 수입
			var html = [];
			$('#domesticImportSelectBox').empty();
			var html = [];
			html.push('<option value="">국산 / 수입</option>');
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
			html.push('<option value="">차 브랜드</option>');
			var brandArray = Array.from(brands); // Set을 배열로 변환
			for (var i = 0; i < brandArray.length; i++) {
				// 각 브랜드에 대한 HTML 요소 추가
				html.push('<option value="' + brandArray[i] + '">' + brandArray[i] + '</option>');
			}
			$('#brandSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가
			
			// 차량 종류
			var html = [];
			$('#modelSelectBox').empty();
			html.push('<option value="">차 종류</option>');
			var modelArray = Array.from(carModels); // Set을 배열로 변환
			for (var i = 0; i < modelArray.length; i++) {
				html.push('<option value="' + modelArray[i] + '">' + modelArray[i] + '</option>');
			}
			$('#modelSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가
			
			// 차 이름
			var html = [];
			$('#nameSelectBox').empty();
			html.push('<option value="">차</option>');
			var nameArray = Array.from(carNames); // Set을 배열로 변환
			nameArray.sort();
			for (var i = 0; i < nameArray.length; i++) {
				html.push('<option value="' + nameArray[i] + '">' + nameArray[i] + '</option>');
			}
			$('#nameSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가
		});
	}
	
	function ajaxController(domestic, brand, model, name, callback) {
		$.ajax({
			url : "ajaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"domestic" : domestic,
				"brand" : brand,
				"model" : model,
				"name" : name,
				"page" : "",
				"pageSize" : ""
			},
			success : function(response) {
				callback(response);
			},
			error : function(xhr, status, error) {
				console.error('요청 실패: ' + error); // 에러 출력
			}
		});
	}

	function selectNum(i) {
		if (i == 1) {
			$('#brandSelectBox').show();
			$('.label.brand').show();
			var selectElement = document.getElementById("domesticImportSelectBox");
			var selectedValue = selectElement.value;
			console.log(selectedValue);
			select1 = selectedValue;
			ajaxController(select1, "", "", "", function(response){
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
					html.push('<option value="' + brandArray[i] + '">' + brandArray[i] + '</option>');
				}
				$('#brandSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가
				
				// 차량 종류
				var html = [];
				$('#modelSelectBox').empty();
				html.push('<option value="">차 종류</option>');
				var modelArray = Array.from(carModels); // Set을 배열로 변환
				for (var i = 0; i < modelArray.length; i++) {
					html.push('<option value="' + modelArray[i] + '">' + modelArray[i] + '</option>');
				}
				$('#modelSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가
				
				// 차 이름
				var html = [];
				$('#nameSelectBox').empty();
				html.push('<option value="">차</option>');
				var nameArray = Array.from(carNames); // Set을 배열로 변환
				nameArray.sort();
				for (var i = 0; i < nameArray.length; i++) {
					html.push('<option value="' + nameArray[i] + '">' + nameArray[i] + '</option>');
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
			ajaxController("", select2, "", "", function(response){
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
					html.push('<option value="' + modelArray[i] + '">' + modelArray[i] + '</option>');
				}
				$('#modelSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가
				
				// 차 이름
				var html = [];
				$('#nameSelectBox').empty();
				html.push('<option value="">차</option>');
				var nameArray = Array.from(carNames); // Set을 배열로 변환
				nameArray.sort();
				for (var i = 0; i < nameArray.length; i++) {
					html.push('<option value="' + nameArray[i] + '">' + nameArray[i] + '</option>');
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
			ajaxController("", select2, select3, "", function(response){
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
					html.push('<option value="' + nameArray[i] + '">' + nameArray[i] + '</option>');
				}
				$('#nameSelectBox').append(html.join('')); // jQuery를 사용하여 특정 요소에 추가
			});
		}
	}

	function search() {
		var domestic = document.getElementById("domesticImportSelectBox").value;
		var brand = document.getElementById("brandSelectBox").value;
		var model = document.getElementById("modelSelectBox").value;
		var name = document.getElementById("nameSelectBox").value;
		
		var url = window.location.origin + "/carList";
		var params = [];

		if (domestic) params.push("domestic=" + encodeURIComponent(domestic));
		if (brand) params.push("brand=" + encodeURIComponent(brand));
		if (model) params.push("model=" + encodeURIComponent(model));
		if (name) params.push("name=" + encodeURIComponent(name));

		if (params.length > 0) {
		    url += "?" + params.join("&");
		}

		window.location.href = url;
	}

	$(document).ready(function() {
		init();
	});
</script>
</html>