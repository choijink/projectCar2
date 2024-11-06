<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer class="ftco-footer ftco-bg-dark ftco-section">
	<div class="container">
		<div class="row mb-5">
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">
						<a href="#" class="logo">vsCAR</a>
					</h2>
					<p>원하는 차량의 상세정보를 확인하고 비교하는 플랫폼입니다.
					국산/수입, 브랜드, 차종별로 차량을 검색하고 원하는 차량을 1:1로 비교할 수 있습니다. 
					또한 커뮤니티를 통해 차량에 대한 다양한 정보를 제공받을 수 있습니다. </p>
				</div>
			</div>
			<div class="col-md">
				<div class="ftco-footer-widget mb-4 ml-md-5">
					<h2 class="ftco-heading-2">중고차 판매 사이트</h2>
					<ul class="list-unstyled">
						<li><a href="http://www.kcar.com" class="py-2 d-block">K Car</a></li>
						<li><a href="http://www.encar.com/index.do" class="py-2 d-block">엔카</a></li>
						<li><a href="https://m.kbchachacha.com/" class="py-2 d-block">KB 차차차</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2"></h2>
					<ul class="list-unstyled">
						<li><a href="#" class="py-2 d-block"></a></li>
						<li><a href="#" class="py-2 d-block"></a></li>
						<li><a href="#" class="py-2 d-block"></a></li>
						<li><a href="#" class="py-2 d-block"></a></li>
						<li><a href="#" class="py-2 d-block"></a></li>
					</ul>
				</div>
			</div>
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">사업자 정보</h2>
					<div class="block-23 mb-3">
						<ul>
							<li><span class="icon icon-user"></span><span
								class="text">대표자 : 최진경</span></li>
							<li><span class="icon icon-user"></span><span
								class="text">개인정보보호 책임자 : 조승현</span></li>
							<li><span class="icon icon-map-marker"></span><span
								class="text">서울특별시 마포구 백범로 23</span></li>
							<li><a href="#"><span class="icon icon-phone"></span><span
									class="text">+02 123 4567</span></a></li>
							<li><a href="#"><span class="icon icon-envelope"></span><span
									class="text">team1_ict@email.com</span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
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