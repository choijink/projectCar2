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
					<li class="list"><a href="/myFavoreteCar"
						class="nav-link FavoriteCar"> <i class="bx bx-home-alt icon"></i>
							<span class="link">찜 목록 차량</span>
					</a></li>
					<li class="list"><a href="/myFavoreteCar"
						class="nav-link board"> <i class="bx bx-home-alt icon"></i> <span
							class="link">내가 쓴 게시글</span>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="container">
			<h2>회원 정보</h2>
			<table class="table">
				<thead class="thead-primary">
					<tr>
						<th>이름</th>
						<th>성별</th>
						<th>전화번호</th>
						<th>나이</th>
						<th>이메일</th>
						<th>주민번호</th>
					</tr>
				</thead>
				<tbody id="member-info">
					<!-- 회원 정보가 여기에 동적으로 추가됩니다. -->
				</tbody>
			</table>
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
	$(".FavoriteCar").attr("href", "/myFavoriteCar?midx=" + mIdx);
	$(".mypage").attr("href", "/mypage?midx=" + mIdx);
	$(".board").attr("href", "/myboard?midx=" + mIdx);

	function init() {
		$.ajax({
			url : "memberAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"idx" : mIdx,
			},
			success : function(response) {
				console.log(response);
				$('#member-info').empty(); // 기존 데이터를 제거
				var html = [];
				html.push('<tr>');
				html.push('<td>' + response.name + '</td>');
				html.push('<td>' + response.gender + '</td>');
				html.push('<td>' + response.phone + '</td>');
				html.push('<td>' + response.age + '</td>');
				html.push('<td>' + response.mail + '</td>');
				html.push('<td>' + response.residentNumber + '</td>');
				html.push('</tr>');
				$('#member-info').append(html.join(''));

				// 페이지네이션을 위한 전체 페이지 수 확인
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
