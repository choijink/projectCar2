<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Community</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/view/common/css.jsp"%>

<style>
.active {
	color: #28a745;
}

.search-btn {
	width: 80px;
	height: 30px;
	font-weight: 900;
	color: white;
	text-align: center;
	background: linear-gradient(to bottom, grey, black);
	border: solid 2px white;
	border-radius: 5px;
}

.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 20px 0;
}

.pagination a {
	text-decoration: none;
	padding: 10px 15px;
	margin: 0 5px;
	border: 1px solid #a38983;
	border-radius: 5px;
	color: #17202a;
	transition: background-color 0.3s, color 0.3s;
}

.pagination a:hover {
	background-color: #7f8c8d;
	color: white;
}

.pagination a.active {
	background-color: #7f8c8d;
	color: white;
	border: none;
}

.pagination a.prev, .pagination a.next {
	font-weight: bold;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>

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
								class="ion-ios-arrow-forward"></i></a></span> <span>community <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">자유 게시판</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="board-container">
		<div class="container">
			<div class="board-header">
				<p>&nbsp;</p>
			</div>
			<form>
				<span class="countSpan"></span> <span class="right"
					; style="margin-left: 400px;"> <span class="grey"
					; id="strong";>SELECT</span> <select>
						<option value="제목" ; name="제목";>제목</option>
						<option value="직성자" ;name="작성자";>작성자</option>
				</select> <input type="text";> <input type="button" name="검색"
					class="search-btn" value="검색">
				</span>
			</form>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th style="width: 8%">번호</th>
							<th style="width: 15%">작성자</th>
							<th style="width: 40%"><a style="margin-left: 100px;"></a>제목</th>
							<th style="width: 15%">작성일</th>
							<th style="width: 10%">조회수</th>
							<th style="width: 12%">관리</th>
						</tr>
					</thead>
					<tbody class="tbody">
						<tr>
							<td>5</td>
							<td>김영현</td>
							<td><a href="bodetail" class="post-title"></a> <span
								class="badge badge-new"></span> <span
								class="badge bg-secondary">2</span></td>
							<td>2024-10-15</td>
							<td>200</td>
							<td>
								<button class="btn btn-sm btn-outline-primary">수정</button>
								<button class="btn btn-sm btn-outline-danger">삭제</button>
							</td>
						</tr>
						<tr>
							<td>4</td>
							<td>김건우</td>
							<td><a href="#" class="post-title">제가 요즘 고민이 있는데요..</a> <span
								class="badge bg-secondary">5</span></td>
							<td>2024-10-12</td>
							<td>60</td>
							<td>
								<button class="btn btn-sm btn-outline-primary">수정</button>
								<button class="btn btn-sm btn-outline-danger">삭제</button>
							</td>
						</tr>
						<tr>
							<td>3</td>
							<td>조승현</td>
							<td><a href="#" class="post-title">새로 장만한 제 자식입니다.</a> <span
								class="badge bg-secondary">8</span></td>
							<td>2024-10-10</td>
							<td>120</td>
							<td>
								<button class="btn btn-sm btn-outline-primary">수정</button>
								<button class="btn btn-sm btn-outline-danger">삭제</button>
							</td>
						</tr>
						<tr>
							<td>2</td>
							<td>안석운</td>
							<td><a href="#" class="post-title">이야아아아 너무 기분이 좋아용</a> <span
								class="badge bg-secondary">8</span></td>
							<td>2024-10-10</td>
							<td>120</td>
							<td>
								<button class="btn btn-sm btn-outline-primary">수정</button>
								<button class="btn btn-sm btn-outline-danger">삭제</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>최진경</td>
							<td><a href="#" class="post-title">제 새로산 차 어때요?</a> <span
								class="badge bg-secondary">8</span></td>
							<td>2024-10-10</td>
							<td>120</td>
							<td>
								<button class="btn btn-sm btn-outline-primary">수정</button>
								<button class="btn btn-sm btn-outline-danger">삭제</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="pagination">
				<a href="#" class="prev">« 이전</a> <a href="#" class="active">1</a> <a
					href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
				<a href="#" class="next">다음 »</a>
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
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
    </svg>
	</div>

	<%@ include file="/WEB-INF/view/common/js.jsp"%>

</body>
<script type="text/javascript">
	function init() {
		$.ajax({
			url : "boardAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			success : function(response) {
				var html= [];
				$(".table-responsive .table .tbody").empty();
				for (var i = 0; i < response.length; i++) {
					html.push('<tr>');
					html.push('	<td>' + (i+1) + '</td>');
					html.push('	<td>' + response[i].mIdx + '</td>');
					html.push('	<td><a href="boDetail" class="post-title">' + response[i].title + '</a>');
					html.push('		<span class="badge bg-secondary"></span>');
					html.push('	</td>');
					html.push('	<td>2024-10-15</td>');
					html.push('	<td>200</td>');
					html.push('	<td>');
					html.push('		<button class="btn btn-sm btn-outline-primary">수정</button>');
					html.push('		<button class="btn btn-sm btn-outline-danger">삭제</button>');
					html.push('	</td>');
					html.push('</tr>');
				}
				$(".countSpan").empty();
				$(".countSpan").html("▷ 총 " + response.length + "개의 게시물이 있습니다.");
				
				$(".table-responsive .table .tbody").append(html.join(''));
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