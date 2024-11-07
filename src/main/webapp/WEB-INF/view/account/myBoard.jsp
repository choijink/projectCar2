<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>vsCAR : 내가 쓴 게시글</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/view/common/css.jsp"%>
<%@ include file="/WEB-INF/view/common/favicon.jsp" %>
</head>
<style>
.car-list {
	overflow-x: unset;
}

.table th, .table td {
	border-top: unset;
}

.carName {
	color: black;
}

.ftco-section.ftco-cart {
	display: grid;
	grid-template-columns: 300px 1fr;
}

.table .thead-primary tr th {
	color: black !important;
	text-align: center;
}

.table tbody tr td {
	text-align: center;
}

/* Google Fonts - Poppins */
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap")
	;

nav {
	position: fixed;
	top: 0;
	left: 0;
	height: 70px;
	width: 100%;
	display: flex;
	align-items: center;
	box-shadow: 0 0 1px rgba(0, 0, 0, 0.1);
}

nav .logo {
	display: flex;
	align-items: center;
	margin: 0 24px;
}

.logo .menu-icon {
	color: #333;
	font-size: 24px;
	margin-right: 14px;
	cursor: pointer;
}

.logo .logo-name {
	color: #333;
	font-size: 22px;
	font-weight: 500;
}

nav .sidebar {
	position: fixed;
	top: 0;
	left: -100%;
	height: 100%;
	width: 260px;
	padding: 20px 0;
	box-shadow: 0 5px 1px rgba(0, 0, 0, 0.1);
	transition: all 0.4s ease;
}

nav.open .sidebar {
	left: 0;
}

.sidebar .sidebar-content {
	display: flex;
	height: 100%;
	flex-direction: column;
	justify-content: space-between;
	padding: 30px 16px;
}

.sidebar-content .list {
	list-style: none;
}

.list .nav-link {
	display: flex;
	align-items: center;
	margin: 8px 0;
	padding: 14px 12px;
	border-radius: 8px;
	text-decoration: none;
}

.nav-link .icon {
	margin-right: 14px;
	font-size: 20px;
	color: #707070;
}

.nav-link .link {
	font-size: 16px;
	color: #707070;
	font-weight: 400;
}

.overlay {
	position: fixed;
	top: 0;
	left: -100%;
	height: 1000vh;
	width: 200%;
	opacity: 0;
	pointer-events: none;
	transition: all 0.4s ease;
}

nav.open ~ .overlay {
	opacity: 1;
	left: 260px;
	pointer-events: auto;
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
					<h1 class="mb-3 bread">회원 정보</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-cart">
		<div class="sidebar">
			<div class="logo">
				<i class="bx bx-menu menu-icon"></i> <span class="log`o-name">Mypage</span>
			</div>
			<div class="sidebar-content">
				<ul class="lists">
					<li class="list"><a href="/mypage" class="nav-link mypage">
							<i class="bx bx-home-alt icon"></i> <span class="link">회원
								정보</span>
					</a></li>
					<li class="list"><a href="/myFavoriteCar"
						class="nav-link FavoriteCar"> <i class="bx bx-home-alt icon"></i>
							<span class="link">찜 목록 차량</span>
					</a></li>
					<li class="list"><a href="/myboard"
						class="nav-link board"> <i class="bx bx-home-alt icon"></i> <span
							class="link">내가 쓴 게시글</span>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="container">
			<h2>내가 쓴 게시글</h2>
			<span class="countSpan"></span>
			<table class="table">
				<thead class="thead-primary">
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="board-info">
				</tbody>
			</table>
		</div>
	</section>
	<div class="under" style="display:grid; grid-template-columns:300px 1fr">
		<div></div>
		<div class="pagination" id="paginationContainer">
		    <!-- 페이지네이션 링크가 동적으로 추가될 곳 -->
		</div>
	</div>

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
	function init(pageNumber = 1, pageSize = 5) {
		$.ajax({
			url : "boardAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"mIdx" : midx,
				"pageNumber": pageNumber,
	            "pageSize": pageSize
			},
			success : function(response) {
				var html= [];
				$("#board-info").empty();
				console.log(response);
				for (var i = 0; i < response.boards.length; i++) {
					html.push('<tr>');
					html.push('	<td>' + (response.totalCount - (pageNumber - 1) * pageSize - i) + '</td>');
					html.push('	<td>' + response.boards[i].name + '</td>');
					html.push('	<td><a href="boDetail?bIdx=' + response.boards[i].bIdx + '" class="post-title">' + response.boards[i].title + '</a>');
					html.push('		<span class="badge bg-secondary"></span>');
					html.push('	</td>');
					html.push('	<td>' + response.boards[i].regdate + '</td>');
					html.push('	<td><button class="btn btn-sm btn-outline-danger" onclick="boDelete('+ response.boards[i].bIdx +')">삭제</button></td>');
					if (adminCheck == 2) {
						var html2 = [];
						$(".thead-primary tr").empty();
						html2.push('<th style="width: 8%">번호</th>');
						html2.push('<th style="width: 15%">작성자</th>');
						html2.push('<th style="width: 40%">제목</th>');
						html2.push('<th style="width: 15%">작성일</th>');
						html2.push('<th class="admin-management" style="width: 12%">관리</th>');
						$(".thead-primary tr").append(html2.join(''));
						
						html.push('	<td>');
						html.push('		<button class="btn btn-sm btn-outline-primary" onclick="boInsertUpdate('+ response.boards[i].bIdx +')">수정</button>');
						html.push('		<button class="btn btn-sm btn-outline-danger" onclick="boDelete('+ response.boards[i].bIdx +')">삭제</button>');
						html.push('	</td>');
					} 
					html.push('</tr>');
					
				}
				$(".countSpan").empty();
				$(".countSpan").html("▷ 총 " + response.totalCount + "개의 게시물이 있습니다.");
				var totalPages = Math.ceil(response.totalCount / pageSize); // totalCount는 서버에서 받아온 데이터 총 개수
	            renderPagination(totalPages, pageNumber);
				
				$("#board-info").append(html.join(''));
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
	        init(pageNumber, 5); // 10은 페이지 크기 예시
	    });
	}
	
	function boDelete(bIdx) {
	    if (confirm("정말로 이 게시물을 삭제하시겠습니까?")) {
	        $.ajax({
	            url: "boDelete", // 삭제 요청을 처리할 서블릿 경로
	            method: "GET",
	            data: { bIdx: bIdx }, // 삭제할 게시물의 ID
	            success: function(response) {
	                if (response.success) {
	                    alert("게시물이 삭제되었습니다.");
	                    init(); // 목록을 다시 불러와서 삭제된 게시물 반영
	                } else {
	                    alert("게시물 삭제에 실패했습니다.");
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error('요청 실패: ' + error);
	                alert("삭제 요청 중 오류가 발생했습니다.");
	            }
	        });
	    }
	}

	$(document).ready(function() {
		init(); // 초기 로드
	});
</script>
</html>
