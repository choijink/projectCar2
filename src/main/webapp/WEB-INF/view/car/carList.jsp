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
.d-block {
    width: 100%;
    justify-content: center;
    gap:10px;
}
.btn-danger{
	font-size: 0.8rem !important;
    border: 1px solid !important;
    border-width: 0px !important;
    line-height: 3.5;
    width:30% !important;
}
.mr-1{
	color: black !important;
    line-height: 2.5;
}
.car-wrap .text p.d-block a {
    width: 78%;
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
	</section>


	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="car-wrap rounded ftco-animate">
						<div class="img rounded d-flex align-items-end"
							style="background-image: url(images/car-1.jpg);"></div>
						<div class="text">
							<div class="d-flex align-items-center mb-3">
								<h2 class="mb-0">
									<a href="carView">S Class AMG63(모델명)</a>
								</h2>
							</div>
							<div class="d-flex mb-3">
								<p class="price ml-auto">
									Benz(브랜드명)
								</p>
							</div>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-light py-2 mr-1" style="color: black !important;">상세보기</a>
								 <a href="carView" class="btn btn-danger" style="font-size: 0.8rem !important; border: 1px solid !important; border-width: 1px !important;">관심등록</a>
								</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="car-wrap rounded ftco-animate">
						<div class="img rounded d-flex align-items-end"
							style="background-image: url(images/car-1.jpg);"></div>
						<div class="text">
							<div class="d-flex align-items-center mb-3">
								<h2 class="mb-0">
									<a href="carView">S Class AMG63(모델명)</a>
								</h2>
							</div>
							<div class="d-flex mb-3">
								<p class="price ml-auto">
									Benz(브랜드명)
								</p>
							</div>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-light py-2 mr-1" style="color: black !important;">상세보기</a>
								 <a href="carView" class="btn btn-danger" style="font-size: 0.8rem !important; border: 1px solid !important; border-width: 1px !important;">관심등록</a>
								</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="car-wrap rounded ftco-animate">
						<div class="img rounded d-flex align-items-end"
							style="background-image: url(images/car-1.jpg);"></div>
						<div class="text">
							<div class="d-flex align-items-center mb-3">
								<h2 class="mb-0">
									<a href="carView">S Class AMG63(모델명)</a>
								</h2>
							</div>
							<div class="d-flex mb-3">
								<p class="price ml-auto">
									Benz(브랜드명)
								</p>
							</div>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-light py-2 mr-1" style="color: black !important;">상세보기</a>
								 <a href="carView" class="btn btn-danger" style="font-size: 0.8rem !important; border: 1px solid !important; border-width: 1px !important;">관심등록</a>
								</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="car-wrap rounded ftco-animate">
						<div class="img rounded d-flex align-items-end"
							style="background-image: url(images/car-1.jpg);"></div>
						<div class="text">
							<div class="d-flex align-items-center mb-3">
								<h2 class="mb-0">
									<a href="carView">S Class AMG63(모델명)</a>
								</h2>
							</div>
							<div class="d-flex mb-3">
								<p class="price ml-auto">
									Benz(브랜드명)
								</p>
							</div>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-light py-2 mr-1" style="color: black !important;">상세보기</a>
								 <a href="carView" class="btn btn-danger" style="font-size: 0.8rem !important; border: 1px solid !important; border-width: 1px !important;">관심등록</a>
								</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="car-wrap rounded ftco-animate">
						<div class="img rounded d-flex align-items-end"
							style="background-image: url(images/car-1.jpg);"></div>
						<div class="text">
							<div class="d-flex align-items-center mb-3">
								<h2 class="mb-0">
									<a href="carView">S Class AMG63(모델명)</a>
								</h2>
							</div>
							<div class="d-flex mb-3">
								<p class="price ml-auto">
									Benz(브랜드명)
								</p>
							</div>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-light py-2 mr-1" style="color: black !important;">상세보기</a>
								 <a href="carView" class="btn btn-danger" style="font-size: 0.8rem !important; border: 1px solid !important; border-width: 1px !important;">관심등록</a>
								</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="car-wrap rounded ftco-animate">
						<div class="img rounded d-flex align-items-end"
							style="background-image: url(images/car-1.jpg);"></div>
						<div class="text">
							<div class="d-flex align-items-center mb-3">
								<h2 class="mb-0">
									<a href="carView">S Class AMG63(모델명)</a>
								</h2>
							</div>
							<div class="d-flex mb-3">
								<p class="price ml-auto">
									Benz(브랜드명)
								</p>
							</div>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-light py-2 mr-1" style="color: black !important;">상세보기</a>
								 <a href="carView" class="btn btn-danger" style="font-size: 0.8rem !important; border: 1px solid !important; border-width: 1px !important;">관심등록</a>
								</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="car-wrap rounded ftco-animate">
						<div class="img rounded d-flex align-items-end"
							style="background-image: url(images/car-1.jpg);"></div>
						<div class="text">
							<div class="d-flex align-items-center mb-3">
								<h2 class="mb-0">
									<a href="carView">S Class AMG63(모델명)</a>
								</h2>
							</div>
							<div class="d-flex mb-3">
								<p class="price ml-auto">
									Benz(브랜드명)
								</p>
							</div>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-light py-2 mr-1" style="color: black !important;">상세보기</a>
								 <a href="carView" class="btn btn-danger" style="font-size: 0.8rem !important; border: 1px solid !important; border-width: 1px !important;">관심등록</a>
								</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="car-wrap rounded ftco-animate">
						<div class="img rounded d-flex align-items-end"
							style="background-image: url(images/car-1.jpg);"></div>
						<div class="text">
							<div class="d-flex align-items-center mb-3">
								<h2 class="mb-0">
									<a href="carView">S Class AMG63(모델명)</a>
								</h2>
							</div>
							<div class="d-flex mb-3">
								<p class="price ml-auto">
									Benz(브랜드명)
								</p>
							</div>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-light py-2 mr-1" style="color: black !important;">상세보기</a>
								 <a href="carView" class="btn btn-danger" style="font-size: 0.8rem !important; border: 1px solid !important; border-width: 1px !important;">관심등록</a>
								</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="car-wrap rounded ftco-animate">
						<div class="img rounded d-flex align-items-end"
							style="background-image: url(images/car-1.jpg);"></div>
						<div class="text">
							<div class="d-flex align-items-center mb-3">
								<h2 class="mb-0">
									<a href="carView">S Class AMG63(모델명)</a>
								</h2>
							</div>
							<div class="d-flex mb-3">
								<p class="price ml-auto">
									Benz(브랜드명)
								</p>
							</div>
							<p class="d-flex mb-0 d-block">
								<a href="#" class="btn btn-light py-2 mr-1" style="color: black !important;">상세보기</a>
								 <a href="carView" class="btn btn-danger" style="font-size: 0.8rem !important; border: 1px solid !important; border-width: 1px !important;">관심등록</a>
								</p>
						</div>
					</div>
				</div>
				
				
						
			</div>
			<div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
						<ul>
							<li><a href="#">&lt;</a></li>
							<li class="active"><span>1</span></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&gt;</a></li>
						</ul>
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
</html>