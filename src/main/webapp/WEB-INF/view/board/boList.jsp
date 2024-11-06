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

.table {
    width: 100%;
    margin-top: 20px;
    margin-bottom: 1rem;
    color: #212529;
}

.table thead th {
    text-align: center;
    vertical-align: bottom;
    border-bottom: 2px solid #dee2e6;
}

.table tbody tr td {
    text-align: center;                          /* 텍스트 중앙 정렬 */
    vertical-align: middle;                      /* 수직 정렬 중앙 */
    padding: 30px 0;                            /* 상하 패딩 설정 */
    border-bottom: 1px solid rgba(0, 0, 0, 0.05) !important; /* 하단 경계선 설정 */
}

#btn-insert {
    text-decoration: none;
    padding: 0px 6px;
    margin: 0 5px;
    border: 1px solid #000000;
    border-radius: 5px;
    color: white; /* 글자색을 흰색으로 설정 */
    background-color: #495057d6; /* 기본 배경색을 채워진 색으로 설정 */
}

#btn-insert:hover {
    background-color: #a38983; /* 마우스 오버 시 배경색 변경하지 않음 */
    color: white; /* 글자색 유지 */
}

</style>

</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>

	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('images/bg_9.jpg');"
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
			    <span class="right" style="margin-left: 500px;">
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
	var adminCheck = '<%=session.getAttribute("adminCheck") != null ? session.getAttribute("adminCheck") : ""%>';
	var midx = '<%=session.getAttribute("mIdx") != null ? session.getAttribute("mIdx") : 0%>';
	/* var isAdmin = true; // 이 값을 서버에서 가져온 실제 사용자 권한으로 설정해야 합니다.
	
	if (!isAdmin) {
	    document.querySelector('.admin-management').style.display = 'none';
	} */
	
	function init(pageNumber = 1, pageSize = 5) {
		$.ajax({
			url : "boardAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"pageNumber": pageNumber,
	            "pageSize": pageSize
			},
			success : function(response) {
				var html= [];
				$(".table-responsive .table .tbody").empty();
				console.log(response);
				for (var i = 0; i < response.boards.length; i++) {
					html.push('<tr>');
					html.push('	<td>' + (response.totalCount - (pageNumber - 1) * pageSize - i) + '</td>');
					html.push('	<td>' + response.boards[i].name + '</td>');
					html.push('	<td><a href="boDetail?bIdx=' + response.boards[i].bIdx + '" class="post-title">' + response.boards[i].title + '</a>');
					html.push('		<span class="badge bg-secondary"></span>');
					html.push('	</td>');
					html.push('	<td>' + response.boards[i].regdate + '</td>');
					if (adminCheck == 2) {
						var html2 = [];
						$(".table-responsive .table thead tr").empty();
						html2.push('<th style="width: 8%">번호</th>');
						html2.push('<th style="width: 15%">작성자</th>');
						html2.push('<th style="width: 40%">제목</th>');
						html2.push('<th style="width: 15%">작성일</th>');
						html2.push('<th class="admin-management" style="width: 12%">관리</th>');
						$(".table-responsive .table thead tr").append(html2.join(''));
						
						html.push('	<td>');
						html.push('		<button class="btn btn-sm btn-outline-primary" onclick="boInsertUpdate('+ response.boards[i].bIdx +')">수정</button>');
						html.push('		<button class="btn btn-sm btn-outline-danger" onclick="boDelete('+ response.boards[i].bIdx +')">삭제</button>');
						html.push('	</td>');
					} 
					html.push('</tr>');
					
				}
				$(".countSpan").empty();
				$(".countSpan").html("▷ 총 " + response.totalCount + "개의 게시물이 있습니다.");
				var totalPages = Math.ceil(response.totalCount / pageSize); // totalCount는 서버에서 받아온 데이터 총 개수
	            renderPagination(totalPages, pageNumber);
				
				$(".table-responsive .table .tbody").append(html.join(''));
			},
			error : function(xhr, status, error) {
				console.error('요청 실패: ' + error); // 에러 출력
			}
		});
	}
	
	function renderPagination(totalPages, currentPage) {
	    var paginationHtml = '';
	    $('.pagination').empty();
	    for (var i = 1; i <= totalPages; i++) {
	        paginationHtml += '<li class="page-item' + (i === currentPage ? ' active' : '') + '">';
	        paginationHtml += '<a class="page-link pagination-link" href="#" data-page="' + i + '">' + i + '</a>';
	        paginationHtml += '</li>';
	    }
	    $('.pagination').html(paginationHtml);

	    // 페이지 링크 클릭 이벤트 핸들러 등록 (이벤트 위임 사용)
	    $('.pagination').on('click', '.pagination-link', function() {
	        var pageNumber = $(this).data('page');
	        init(pageNumber, 5); // 10은 페이지 크기 예시
	    });
	}
	
	function boInsertUpdate(idx){
		if(midx == 0){
			alert("로그인이 필요한 서비스 입니다.");
			window.location.href= "/memberLogin";
		} else {
			if(idx == 0){ window.location.href = "/boCreate"}
			else { window.location.href = "/boUpdate?idx=" + idx;} // 서블릿 경로로 수정
		}
	}
	
	function boDelete(bIdx) {
	    if (confirm("정말로 이 게시물을 삭제하시겠습니까?")) {
	        $.ajax({
	            url: "boDelete", // 삭제 요청을 처리할 서블릿 경로
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
