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
					<p>vsCAR : 국내/외 차량 비교 플랫폼 입니다. 차량 목록, 1:1 비교, 인기순위, 커뮤니티 등 을 운영중입니다.</p>
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
						<li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
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