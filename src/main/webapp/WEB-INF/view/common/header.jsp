<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
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
				<li class="nav-item"><a class="nav-link login"
					href="/memberLogin">로그인</a></li>
				<li class="nav-item"><a class="nav-link logout" href=""
					onclick="javascript:logout();">로그아웃</a></li>
			</ul>
		</div>
	</div>
</nav>
<script>
	var id = '<%=session.getAttribute("id") != null ? session.getAttribute("id") : ""%>';
	if (id == null || id == "") {
		$(".login").show();
		$(".logout").hide();
	} else {
		$(".login").hide();
		$(".logout").show();
	}
	function logout() {
		$.ajax({
			type : "POST",
			url : "memberLogoutAjaxController",
			dataType : "json",
			success : function(response) {
				if (response.status === "success") {
					// 로그인 성공 하면 세션 등록 홈으로 이동함~
					alert(response.message);
					window.location.href = "/home";
				} else {
					// 로그인 실패 시 에러 메시지 출력
					alert(response.message);
				}
			},
			error : function() {
				alert("서버 오류가 발생했습니다. 나중에 다시 시도해 주세요.");
			}
		});
	}
</script>

