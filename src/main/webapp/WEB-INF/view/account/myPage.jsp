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
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>Pricing <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">Pricing</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-cart">
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="car-list">
						<table class="table">
							<thead class="thead-primary">
								<tr class="text-center">
									<th>&nbsp;</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
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
var mIdx = params.get('mIdx');
function init(){
	$.ajax({
		url : "favoriteController", // 서버 서블릿 경로
		method : "GET", // 요청 방식
		data : {
			"mIdx" : mIdx
		},
		success : function(response) {
			$('.car-list .table tbody').empty();
			var html = [];
			console.log(response);
			for(var i=0; i < response.length; i++){
				html.push('<tr class="favoriteClass">');
				html.push('	<td class="car-image"><div class="img" style="background-image: url(carImage/' + response[i].carImage + ');"></div></td>');
				html.push('	<td class="product-name">');
				html.push('		<h3>' + response[i].carName + '</h3>');
				/* html.push('		<p class="mb-0 rated">');
				html.push('			<span>rated:</span> <span class="ion-ios-star"></span>');
				html.push('			<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>');
				html.push('			<span class="ion-ios-star"></span> <span clas	s="ion-ios-star"></span>');
				html.push('		</p>'); */
				html.push('	</td>');
				html.push('</tr>');
			}
			$('.car-list .table tbody').append(html.join(''));
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