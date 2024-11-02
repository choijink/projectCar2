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
			<form id="searchForm">
			    <span class="countSpan"></span>
			    <span class="right" style="margin-left: 400px;">
			        <select id="searchCriteria">
			            <option value="title">제목</option>
			            <option value="author">작성자</option>
			        </select>
			        <input type="text" id="searchInput" placeholder="검색어를 입력하세요">
			        <input type="button" class="search-btn" value="검색">
			    </span>
			</form>

			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th style="width: 8%">번호</th>
							<th style="width: 15%">작성자</th>
							<th style="width: 40%">제목</th>
							<th style="width: 15%">작성일</th>
							<th class="admin-management" style="width: 12%">관리</th>
						</tr>
					</thead>
					<tbody class="tbody"></tbody>
				</table>
			</div>

			<div class="under" style="display:grid; grid-template-columns:1fr 110px;">
				<div class="pagination" id="paginationContainer">
				    <!-- 페이지네이션 링크가 동적으로 추가될 곳 -->
				</div>

				<div class="btn-class" style="display: flex; justify-content: center; align-items: center; margin: 20px 0;">
				<button onclick="boInsertUpdate(0)" id="btn-insert">게시물 등록</button>
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
	var isAdmin = true; // 이 값을 서버에서 가져온 실제 사용자 권한으로 설정해야 합니다.
	
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
					if (isAdmin) {
						html.push('		<button class="btn btn-sm btn-outline-primary" onclick="boInsertUpdate('+ response[i].bIdx +')">수정</button>');
						html.push('		<button class="btn btn-sm btn-outline-danger" onclick="boDelete('+ response[i].bIdx +')">삭제</button>');
					} else {
						html.push('		<span class="text-muted">관리자 전용</span>');
					}
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
	
	function boInsertUpdate(idx){
		if(idx == 0){ window.location.href = "/boCreate"}
		else { window.location.href = "/boUpdate?idx=" + idx;} // 서블릿 경로로 수정
	}
	
	function boDelete(bIdx) {
	    if (confirm("정말로 이 게시물을 삭제하시겠습니까?")) {
	        $.ajax({
	            url: "boardDeleteAjaxController", // 삭제 요청을 처리할 서블릿 경로
	            method: "GET",
	            data: { bIdx: bIdx }, // 삭제할 게시물의 ID
	            success: function(response) {
	                if (response.success) {
	                    alert("게시물이 삭제되었습니다.");
	                    init(); // 목록을 다시 불러와서 삭제된 게시물 반영
	                } else {
	                    alert("게시물 삭제에 실패했습니다.");
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error('요청 실패: ' + error);
	                alert("삭제 요청 중 오류가 발생했습니다.");
	            }
	        });
	    }
	}

	$(document).ready(function() {
	    init();
	    
	    $('.search-btn').click(function() {
	        performSearch();
	    });

	    $('#searchInput').keyup(function(event) {
	        if (event.key === "Enter") { // 엔터 키가 눌렸을 때
	        	event.preventDefault(); // 기본 동작 방지
	            performSearch();
	        }
	    });
	    
	 	// 폼 제출 시 기본 동작 방지
	    $('form').submit(function(event) {
	        event.preventDefault(); // 폼 제출 방지
	    });
	});
	
	function performSearch() {
	    var criteria = $('#searchCriteria').val();
	    var query = $('#searchInput').val().toLowerCase();
	    filterPosts(criteria, query);
	}
	
	function filterPosts(criteria, query) {
	    $(".tbody tr").each(function() {
	        var title = $(this).find("td:nth-child(3) a").text().toLowerCase(); // 제목
	        var author = $(this).find("td:nth-child(2)").text().toLowerCase(); // 작성자

	        if (criteria === "title" && title.includes(query)) {
	            $(this).show(); // 제목이 검색어를 포함하면 표시
	        } else if (criteria === "author" && author.includes(query)) {
	            $(this).show(); // 작성자가 검색어를 포함하면 표시
	        } else {
	            $(this).hide(); // 검색 결과에 맞지 않으면 숨김
	        }
	    });

	    updateCount(); // 필터링 후 게시물 수 업데이트
	}

	function updateCount() {
	    var visibleCount = $(".tbody tr:visible").length;
	    $(".countSpan").html("▷ 총 " + visibleCount + "개의 게시물이 있습니다.");
	}
</script>
</html>
