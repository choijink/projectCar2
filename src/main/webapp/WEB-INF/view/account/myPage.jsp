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
.car-list{
	overflow-x : unset;
}

.table th, .table td {
    border-top: unset;
}
.carName{
	color:black;
}
</style>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('images/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<h1 class="mb-3 bread">찜 목록 차량</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-cart">
		<div>
			<li><a>회원 정보 및 수정</a></li>
			<li><a>찜 한 차량 보기</a></li>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="car-list">
						<table class="table">
							<thead class="thead-primary">
								<tr class="text-center">
									<th>차량 이미지</th>
									<th>차량 이름</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
					<!-- 페이지네이션 링크를 위한 div 추가 -->
					<div class="pagination-links">
					    <ul class="pagination"></ul>
					</div>
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
	const params = new URLSearchParams(window.location.search);
	var mIdx = params.get('midx');
	
	function init(pageNumber = 1, pageSize = 3){
		$.ajax({
			url : "favoriteController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"mIdx" : mIdx,
				"pageNumber": pageNumber,
	            "pageSize": pageSize
			},
			success : function(response) {
				$('.car-list .table tbody').empty();
				var html = [];
				for(var i=0; i < response.favorites.length; i++){ // 서버에서 items를 배열로 받아와서 사용
					html.push('<tr class="favoriteClass">');
					html.push('	<td class="car-image"><div class="img" style="background-image: url(carImage/' + response.favorites[i].carImage + ');"></div></td>');
					html.push('	<td class="product-name">');
					html.push('		<a class="carName" href="/carView?idx=' + response.favorites[i].cIdx + '">' + response.favorites[i].carName + '</a>');
					html.push('	</td>');
					html.push(' <td><a href="javascript:deleteFavorite('+ response.favorites[i].cIdx +');">삭제</a></td>');
					html.push('</tr>');
				}
				$('.car-list .table tbody').append(html.join(''));
	
				// 페이지네이션을 위한 전체 페이지 수 확인
	            var totalPages = Math.ceil(response.totalCount / pageSize); // totalCount는 서버에서 받아온 데이터 총 개수
	            renderPagination(totalPages, pageNumber);
			},
			error : function(xhr, status, error) {
				console.error('요청 실패: ' + error); // 에러 출력
			}
		});
	}
	
	
	
	function renderPagination(totalPages, currentPage) {
	    var paginationHtml = '';
	    $('.pagination').empty();
	    for (var i = 1; i <= totalPages; i++) {
	        paginationHtml += '<li class="page-item' + (i === currentPage ? ' active' : '') + '">';
	        paginationHtml += '<a class="page-link pagination-link" href="#" data-page="' + i + '">' + i + '</a>';
	        paginationHtml += '</li>';
	    }
	    $('.pagination').html(paginationHtml);

	    // 페이지 링크 클릭 이벤트 핸들러 등록 (이벤트 위임 사용)
	    $('.pagination').on('click', '.pagination-link', function() {
	        var pageNumber = $(this).data('page');
	        init(pageNumber, 3); // 10은 페이지 크기 예시
	    });
	}

	
	function deleteFavorite(idx){
		$.ajax({
			url : "favoriteDeleteAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"cIdx" : idx,
				"mIdx" : mIdx
			},
			success : function(response) {
				if (response.status === "success") {
	                alert(response.message);
	                location.reload();
	            } else {
	                alert(response.message);
	            }
			},
			error : function(xhr, status, error) {
				console.error('요청 실패: ' + error); // 에러 출력
			}
		});
	}
	
	$(document).ready(function() {
		init(); // 초기 로드
	});
</script>
</html>
