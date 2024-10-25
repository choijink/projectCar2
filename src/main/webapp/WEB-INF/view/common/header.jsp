<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>Carbook - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="../../../css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../../../css/animate.css">

<link rel="stylesheet" href="../../../css/owl.carousel.min.css">
<link rel="stylesheet" href="../../../css/owl.theme.default.min.css">
<link rel="stylesheet" href="../../../css/magnific-popup.css">

<link rel="stylesheet" href="../../../css/aos.css">

<link rel="stylesheet" href="../../../css/ionicons.min.css">

<link rel="stylesheet" href="../../../css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../../../css/jquery.timepicker.css">


<link rel="stylesheet" href="../../../css/flaticon.css">
<link rel="stylesheet" href="../../../css/icomoon.css">
<link rel="stylesheet" href="../../../css/style.css">
</head>

<script src="../../../js/jquery.min.js"></script>
<script src="../../../js/jquery-migrate-3.0.1.min.js"></script>
<script src="../../../js/popper.min.js"></script>
<script src="../../../js/bootstrap.min.js"></script>
<script src="../../../js/jquery.easing.1.3.js"></script>
<script src="../../../js/jquery.waypoints.min.js"></script>
<script src="../../../js/jquery.stellar.min.js"></script>
<script src="../../../js/owl.carousel.min.js"></script>
<script src="../../../js/jquery.magnific-popup.min.js"></script>
<script src="../../../js/aos.js"></script>
<script src="../../../js/jquery.animateNumber.min.js"></script>
<script src="../../../js/bootstrap-datepicker.js"></script>
<script src="../../../js/jquery.timepicker.min.js"></script>
<script src="../../../js/scrollax.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="../../../js/google-map.js"></script>
<script src="../../../js/main.js"></script>

<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="home">JingkaWingka</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>

		<!-- account 및 login 버튼 -->
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a href="carList" class="nav-link">차량
						목록</a></li>
				<li class="nav-item"><a href="services.html" class="nav-link">비교</a></li>
				<li class="nav-item"><a href="pricing.html" class="nav-link">인기순위</a></li>
				<li class="nav-item"><a href="car.html" class="nav-link">커뮤니티</a></li>
			</ul>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
					href="create-account.html">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link" href="login.html">로그인</a></li>
			</ul>
		</div>
	</div>
</nav>
<script>
$(document).ready(function() {
		// 현재 페이지의 URL을 가져옵니다.
		var currentUrl = window.location.href; // 예: 'http://localhost:8080/test'

		// URL에서 프로토콜과 호스트를 제거합니다.
		var baseUrl = currentUrl.split('/').slice(0, 3).join('/');

		// 기본 URL을 제거하고 나머지 부분을 가져옵니다.
		var path = currentUrl.replace(baseUrl, ''); // '/test'

		// 경로에서 앞의 '/'를 제거합니다.
		var result = path.substring(1); // 'test'

		// <a> 태그의 href와 비교하여 일치하는 경우 해당 <li>의 클래스를 변경합니다.
		var navItems = document.querySelectorAll('.navbar-nav .nav-item');

		navItems.forEach(function(item) {
			var link = item.querySelector('a');
			if (link && link.getAttribute('href') === result) {
				item.classList.add('active'); // 'active' 클래스 추가
			}
		});
	});
</script>

