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
.request-form.ftco-animate.bg-primary.fadeInUp.ftco-animated {
	width: 100%;
	margin-top: 150px;
}

.col-md-4 {
	flex: unset;
	max-width: unset;
}

.featured-top {
	margin-top: unset;
}

.bg-primary {
	background: rgb(0 123 255/ 38%) !important;
}

.btn.btn-secondary {
	background-color: #6c757d !important;
	border-color: #6c757d !important;
}

.ftco-section {
	padding: 2em 0;
}

.ftco-footer {
	height: 350px;
}
</style>
<body>


	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<!-- END nav -->

	<div class="hero-wrap ftco-degree-bg"
		style="background-image: url('../../../images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters">
				<div class="col-md-12   featured-top">
					<div class="row no-gutters">
						<div class="col-md-4 d-flex align-items-center">
							<form action="#" class="request-form ftco-animate bg-primary">
								<h2>조건 차량 검색</h2>
								<div class="form-group">
									<label for="" class="label">차량 브랜드</label> <input type="text"
										class="form-control" placeholder="현대, 기아, 벤츠 등등..">
								</div>
								<div class="form-group">
									<label for="" class="label">차량 크기</label> <input type="text"
										class="form-control" placeholder="중형, 준중형, 대형 등등..">
								</div>
								<div class="d-flex">
									<div class="form-group mr-2">
										<label for="" class="label">차량 종류</label> <input type="text"
											class="form-control" placeholder="세단, SUV 등등..">
									</div>
									<div class="form-group ml-2">
										<label for="" class="label">어쩌구 저쩌구</label> <input type="text"
											class="form-control" placeholder="어쩌구, 저쩌구 등등..">
									</div>
								</div>
								<div class="form-group">
									<label for="" class="label">차량 이름</label> <input type="text"
										class="form-control" placeholder="아반떼, 소나타, K5 등등..">
								</div>
								<div class="form-group">
									<input type="submit" value="해당 조건 차량 검색"
										class="btn btn-secondary py-3 px-4">
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
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
</html>