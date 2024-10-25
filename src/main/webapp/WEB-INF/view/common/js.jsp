<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

