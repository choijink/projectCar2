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

#btn-insert {
        text-decoration: none;
        padding: 0px 6px;
        margin: 0 5px;
        border: 1px solid #a38983;
        border-radius: 5px;
        color: #17202a;
        transition: background-color 0.3s, color 0.3s;
        background-color: white;
    }

    #btn-insert:hover {
        background-color: #a38983; /* 마우스 오버 시 배경색 */
        color: white; /* 마우스 오버 시 글자색 */
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
							<th class="admin-management" style="width: 12%">관리</th>
						</tr>
					</thead>
					<tbody class="tbody"></tbody>
				</table>
			</div>

			<div class="under" style="display:grid; grid-template-columns:1fr 110px;">
				<div class="pagination">
					<a href="#" class="prev">« 이전</a> <a href="#" class="active">1</a> <a
						href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
					<a href="#" class="next">다음 »</a>
				</div>
				<div class="btn-class" style="
				    display: flex;
				    justify-content: center;
				    align-items: center;
				    margin: 20px 0;
				">
				<button onclick="boInsert()" id="btn-insert">게시물 등록</button>
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
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
    </svg>
	</div>

	<%@ include file="/WEB-INF/view/common/js.jsp"%>

</body>
<script type="text/javascript">
	//예시: 사용자가 관리자일 경우 true
	var isAdmin = true; // 이 값을 서버에서 가져온 실제 사용자 권한으로 설정해야 합니다.
	
	// 관리자 여부에 따라 "관리" 열을 숨기거나 보이게 합니다.
	if (!isAdmin) {
	    document.querySelector('.admin-management').style.display = 'none';
	}
	
	function init() {
		$.ajax({
			url : "boardAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			success : function(response) {
				var html= [];
				$(".table-responsive .table .tbody").empty();
				var totalCount = response.length;
				console.log(response);
				for (var i = 0; i < response.length; i++) {
					html.push('<tr>');
					html.push('	<td>' + totalCount + '</td>');
					html.push('	<td>' + response[i].name + '</td>');
					html.push('	<td><a href="boDetail?bIdx=' + response[i].bIdx + '" class="post-title">' + response[i].title + '</a>');
					html.push('		<span class="badge bg-secondary"></span>');
					html.push('	</td>');
					html.push('	<td>' + response[i].regdate + '</td>');
					html.push('	<td>');
					html.push('		<button class="btn btn-sm btn-outline-primary" onclick="boUpdate">수정</button>');
					html.push('		<button class="btn btn-sm btn-outline-danger" onclick="boDelete">삭제</button>');
					html.push('	</td>');
					html.push('</tr>');
					totalCount--;
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
	
	function boInsert(){
		var url = "/boardInsert"
		window.location.href = url;
	}

	$(document).ready(function() {
		init();
	});
</script>
</html>