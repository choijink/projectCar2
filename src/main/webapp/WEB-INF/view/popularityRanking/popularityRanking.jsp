<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>vsCAR : VS Pick</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/view/common/css.jsp"%>

<style>
.container {
    max-width: 1400px;
}
.active {
	color: #28a745;
}

.search-btn {
	width: 80px;
	height: 30px;
	font-weight: 900;
	color: white;
	text-align: center;
	background: linear-gradient(to bottom, grey, black);
	border: solid 2px white;
	border-radius: 5px;
}

.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 20px 0;
}

.pagination a {
	text-decoration: none;
	padding: 10px 15px;
	margin: 0 5px;
	border: 1px solid #a38983;
	border-radius: 5px;
	color: #17202a;
	transition: background-color 0.3s, color 0.3s;
}

.pagination a:hover {
	background-color: #7f8c8d;
	color: white;
}

.pagination a.active {
	background-color: #7f8c8d;
	color: white;
	border: none;
}

.pagination a.prev, .pagination a.next {
	font-weight: bold;
}

.table {
    width: 100%;
    margin-top: 20px;
    margin-bottom: 1rem;
    color: #212529;
}

.table thead th {
    text-align: center;
    vertical-align: bottom;
    border-bottom: 2px solid #dee2e6;
}

.table tbody tr td {
    text-align: center;                          /* 텍스트 중앙 정렬 */
    vertical-align: middle;                      /* 수직 정렬 중앙 */
    padding: 30px 0;                            /* 상하 패딩 설정 */
    border-bottom: 1px solid rgba(0, 0, 0, 0.05) !important; /* 하단 경계선 설정 */
}

#btn-insert {
    text-decoration: none;
    padding: 0px 6px;
    margin: 0 5px;
    border: 1px solid #000000;
    border-radius: 5px;
    color: white; /* 글자색을 흰색으로 설정 */
    background-color: #495057d6; /* 기본 배경색을 채워진 색으로 설정 */
}

#btn-insert:hover {
    background-color: #a38983; /* 마우스 오버 시 배경색 변경하지 않음 */
    color: white; /* 글자색 유지 */
}

</style>

</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>

	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('images/bg_9.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>community <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">자유 게시판</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="board-container">
		<div class="container">
			<div class="board-header">
				<p>&nbsp;</p>
			</div>
			<form id="searchForm">
			    <span class="countSpan"></span>
			    <span class="right" style="margin-left: 770px;">
			        <select id="searchFuelType" onchange="selectFuelType()">
			            <option value="1">가솔린 / 디젤 / LPI</option>
			            <option value="2">전기</option>
			        </select>
			        <select id="searchViewMode" onchange="selectViewMode()">
			            <option value="연비">연비</option>
			            <option value="가격">가격</option>
			            <option value="최고 출력">최고 출력</option>
			            <option value="배기량">배기량</option>
			        </select>
			        <select id="searchOrderType" onchange="selectOrderType()">
			            <option value="1">내림차순</option>
			            <option value="2">오름차순</option>
			        </select>
			    </span>
			</form>

			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th style="width: 50px;">순위</th>
							<th style="width: 90px;">차량 이름</th>
							<th style="width: 90px;">등급</th>
							<th class="FuelType" style="width: 100px;">연료 종류</th>
							<th class="EngineType" style="width: 100px;">엔진 형식</th>
							<th style="width: 80px;">배기량</th>
							<th style="width: 50px;">연비</th>
							<th style="width: 100px;">최고 출력</th>
							<th style="width: 100px;">공차 중량</th>
							<th style="width: 50px;">트림</th>
							<th style="width: 100px;">가격</th>
						</tr>
					</thead>
					<tbody class="tbody"></tbody>
				</table>
			</div>

			<div class="under" style="display:grid; grid-template-columns:1fr 110px;">
				<div class="pagination" id="paginationContainer">
				    <!-- 페이지네이션 링크가 동적으로 추가될 곳 -->
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
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
    </svg>
	</div>

	<%@ include file="/WEB-INF/view/common/js.jsp"%>

</body>
<script type="text/javascript">
	var fuelType = 1;
	var viewMode = "연비";
    var orderCheck = 1;
    
	function selectFuelType(){
		fuelType = $("#searchFuelType").val();
		init();
		if(fuelType == 2){
			$(".FuelType").hide();
			$(".EngineType").hide();
		} else {
			$(".FuelType").show();
			$(".EngineType").show();
		}
	}
	
	function selectViewMode(){
		viewMode = $("#searchViewMode").val();
		init();
	}

	function selectOrderType(){
		orderCheck = $("#searchOrderType").val();
		init();
	}

	function init() {
		$.ajax({
			url : "popularityRankingAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"fuelType": fuelType,
				"viewMode": viewMode,
	            "orderCheck": orderCheck
			},
			success : function(response) {
				var html= [];
				$(".table-responsive .table .tbody").empty();
				console.log(response);
				for (var i = 0; i < response.popular.length; i++) {
					html.push('<tr>');
					html.push('	<td>' + (i+1) + '</td>');
					//html.push('	<td><a href="/carView?idx=' + response.popular[i].cIdx + '&grade=' + response.popular[i].grade + '&trim=' + response.popular[i].trim + '">' + response.popular[i].carName + '</a></td>');
					html.push('	<td>' + response.popular[i].carName + '</td>');
					html.push('	<td>' + response.popular[i].grade + '</td>');
					html.push('	<td>' + response.popular[i].fuelType + '</td>');
					if(fuelType == 1){
						html.push('	<td>' + response.popular[i].engineType + '</td>');
						html.push('	<td>' + response.popular[i].displacement + '</td>');
					}
					html.push('	<td>' + response.popular[i].fuelEfficiency + '</td>');
					html.push('	<td>' + response.popular[i].maxPower + '</td>');
					html.push('	<td>' + response.popular[i].curbWeight + '</td>');
					html.push('	<td>' + response.popular[i].trim + '</td>');
					html.push('	<td>' + response.popular[i].price + '</td>');
					html.push('</tr>');
					
				}
				$(".countSpan").empty();
				$(".countSpan").html("▷ 총 20개의 순위를 보여드립니다.");
				
				$(".table-responsive .table .tbody").append(html.join(''));
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
