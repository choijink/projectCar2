<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/view/common/css.jsp" %>
<%@ include file="/WEB-INF/view/common/favicon.jsp" %>
<title>vsCAR : 상세 보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
<style>
.container{margin-top: 10px;}
:root {
	--primary-color: #01d28e;
	--secondary-color: #1089ff;
	--dark-color: #000;
	--light-color: #f8f9fa;
	--gray-color: #6c757d;
	--border-color: #dee2e6;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	line-height: 1.6;
	color: #333;
	background-color: #f8f9fa;
}

.post-container {
	max-width: 1200px;
	margin: 3rem auto;
	background: white;
	border-radius: 15px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
	overflow: hidden;
}

.post-header {
	background-color: #6c757d80 !important;
	color: white;
	padding: 2rem;
}

.post-category {
	display: inline-block;
	background: rgba(255, 255, 255, 0.2);
	padding: 0.3rem 1rem;
	border-radius: 20px;
	font-size: 0.9rem;
	margin-bottom: 1rem;
}

.post-title {
	font-size: 2rem;
	font-weight: 700;
	margin-bottom: 1rem;
}

.post-meta {
	display: flex;
	gap: 2rem;
	font-size: 0.9rem;
	color: rgba(255, 255, 255, 0.9);
}

.post-meta i {
	margin-right: 0.5rem;
}

.post-content {
	padding: 2rem;
}

.post-text {
	font-size: 1.1rem;
	line-height: 1.8;
	color: #444;
	margin-bottom: 2rem;
}

.post-images {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 1rem;
	margin-bottom: 2rem;
}

.post-image {
	border-radius: 10px;
	overflow: hidden;
}

.post-image img {
	width: 100%;
	height: 500px;
	object-fit: contain;
}

.post-actions {
	display: flex;
	gap: 1rem;
	padding: 1rem 2rem;
	border-top: 1px solid var(--border-color);
	background: #f8f9fa;
}

.action-btn {
	display: flex;
	align-items: center;
	gap: 0.5rem;
	padding: 0.5rem 1rem;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: all 0.3s ease;
}

.like-btn {
	background-color: #ff4757;
	color: white;
}

.share-btn {
	background-color: #1089ff;
	color: white;
}

.comment-section {
    padding: 2rem;  /* 상하 여백은 1rem, 좌우 여백은 2rem으로 조정 */
    background: white;
    margin: 0 auto;
    max-width: 1200px;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
}


.comment-form {
	margin-bottom: 2rem;
}

.comment-input {
	width: 100%;
	padding: 1rem;
	border: 1px solid var(--border-color);
	border-radius: 10px;
	resize: none;
	margin-bottom: 1rem;
}

.comment-list {
    padding: 1rem 2rem;
    margin: 0 auto;
    max-width: 1200px;
}


.comment-avatar {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background-color: var(--primary-color);
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-weight: bold;
}

.comment-content {
	flex: 1;
}

.comment-header {
	display: flex;
	justify-content: space-between;
	margin-bottom: 0.5rem;
}

.comment-author {
	font-weight: 500;
}

.comment-date {
	color: var(--gray-color);
	font-size: 0.9rem;
}

.comment-text {
	color: #444;
	line-height: 1.6;
}

.navigation-buttons {
	display: flex;
	justify-content: space-between;
	margin-top: 2rem;
	padding: 0 2rem;
}

.nav-btn {
	padding: 10px 20px;
	border: 1px solid var(--primary-color);
	border-radius: 5px;
	color: var(--primary-color);
	text-decoration: none;
	transition: all 0.3s ease;
	margin-bottom: 20px;
    margin-left: 30px;
}

.nav-btn:hover {
	background-color: var(--primary-color);
	color: white;
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

.element.style {
    background-image: url(images/bg_9.jpg);
    background-size: cover;
    background-position: 50% 50%;
    height: 500px;
}

/* 성공 메시지 스타일 */
.alert-success {
    background-color: #28a745;
    color: white;
    border-radius: 5px;
    padding: 10px;
    font-size: 1rem;
    margin-bottom: 10px;
    display: inline-block;
    width: 100%;
    text-align: center;
}


</style>
</head>
<body>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<section class="hero-wrap hero-wrap-2 js-fullheight"
style="background-image: url('images/bg_9.jpg');
			background-size: cover; background-position: 
			center center; height: 100vh;" data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <h1 class="mb-3 bread">게시물 상세 보기</h1>
            </div>
        </div>
    </div>
</section>

<section>
	<div class="post-container">
		<div class="post-header">
			<!-- 게시글 헤더가 여기에 동적으로 들어갑니다 -->
		</div>
		<div class="post-content">
			<!-- 게시글 내용이 여기에 동적으로 들어갑니다 -->
		</div>
	</div>
	<div class="comment-section">
    	<h3>댓글 <span id="commentCount"></span>개</h3>
    	<div class="comment-form">
        	<textarea class="comment-input" rows="3" placeholder="댓글을 작성하세요."></textarea>
        	<button onclick="replyInsert()" class="action-btn" style="background-color: var(--primary-color); color: white;" id="submitComment">댓글 작성</button>
    	</div>
    	<div class="comment-list">
        	<!-- 댓글 목록이 여기에 동적으로 삽입됩니다. -->
    	</div>
    	
    	<div class="pagination" id="paginationContainer">
		    <!-- 페이지네이션 링크가 동적으로 추가될 곳 -->
		</div>
		<div class="navigation-buttons" style="display: flex; justify-content: left; margin-top: 2rem; padding: unset;">
	    	<a href="boList" class="nav-btn">목록으로</a>
		</div>
	</div>

</section>

	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
	<%@ include file="/WEB-INF/view/common/js.jsp"%>
</body>
<script type="text/javascript">
	const params = new URLSearchParams(window.location.search);
	var bIdx = params.get('bIdx'); // 게시글 인덱스
	
	// 게시글 내용 초기화 및 표시
	function init() {
		$.ajax({
			url: "boardViewAjaxController", // 서버 서블릿 경로
			method: "GET", // 요청 방식
			data: {
				"idx": bIdx // 게시글 인덱스
			},
			success: function(response) {
				// 게시글 내용 처리
				var html = [];
				$(".post-header").empty();
				console.log(response); // 서버로부터 받은 데이터 확인

				// 게시글 제목과 메타데이터 표시
				html.push('<span class="post-category">자유게시판</span>');
				html.push('	<h1 class="post-title">' + response.title + '</h1>');
				html.push('	<div class="post-meta">');
				html.push('		<span><i class="fas fa-user"></i>' + response.name + '</span>');
				html.push('		<span><i class="fas fa-calendar"></i>' + response.regdate + '</span>');
				html.push('	</div>');
				$(".post-header").append(html.join(''));

				// 게시글 본문 내용
				html = [];
				$(".post-content").empty();
				html.push('<div class="post-text">');
				html.push('	<p>' + response.content + '</p>');
				html.push('<div class="post-images">');
				if(response.image1 != null){
					html.push('	<div class="post-image">');
					html.push('		<img src="boardImage/' + response.image1 + '" alt="차량 사진 1">');
					html.push('	</div>');
				}
				if(response.image2 != null){
					html.push('	<div class="post-image">');
					html.push('		<img src="boardImage/' + response.image2 + '" alt="차량 사진 2">');
					html.push('	</div>');
				}
				html.push('</div>');
				$(".post-content").append(html.join(''));

				// 댓글 목록 로드
				loadComments();
			},
			error: function(xhr, status, error) {
				console.error('게시글 조회 실패: ' + error);
			}
		});
	}

	// 댓글 삭제 함수
	function replyDelete(rIdx) {
	    console.log("삭제하려는 댓글의 rIdx: " + rIdx); // rIdx 값이 잘 출력되는지 확인
	    $.ajax({
	        url: '/ReplyAjaxController',  // 댓글 삭제 서블릿 경로
	        method: 'POST',
	        data: {
	            'action': 'deleteReply',
	            'rIdx': rIdx,
	            'bIdx': bIdx
	        },
	        success: function(response) {
	            if (response.status === "success") {
	            	alert(response.message);
	                loadComments(); // 댓글 목록 갱신
	            } else {
	                alert(response.message); // 실패 메시지 출력
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('댓글 삭제 실패: ' + error);
	        }
	    });
	}
	
	// 댓글 작성 버튼 클릭
	
    function replyInsert() {
        const content = $(".comment-input").val(); // 댓글 내용

        if (!content) {
            alert("댓글을 입력해주세요.");
            return;
        }

        // 댓글 추가 AJAX 요청
        $.ajax({
            url: '/ReplyAjaxController',  // 댓글 추가 서블릿 경로
            method: 'POST',
            data: {
                'action': 'addReply',
                'bIdx': bIdx,
                'mIdx': midx,
                'content': content
            },
            success: function(response) {
                if (response.status === "success") {
                    // 댓글 추가 성공 시 댓글 목록 갱신
                    loadComments();
                    $(".comment-input").val(''); // 댓글 입력란 초기화
                 	
                 	// 댓글 등록 완료 메시지 표시
                    showMessage("댓글이 등록되었습니다.");
                } else {
                    alert(response.message); // 실패 메시지 출력
                }
            },
            error: function(xhr, status, error) {
                console.error('댓글 작성 실패: ' + error);
            }
        });
    }
	
 	// 메시지를 화면에 띄우는 함수
    function showMessage(message) {
        var messageBox = $('<div class="alert alert-success" role="alert"></div>').text(message);
        $(".comment-section").prepend(messageBox); // 메시지를 댓글 섹션 맨 위에 추가
        setTimeout(function() {
            messageBox.fadeOut(500, function() {
                $(this).remove(); // 메시지 박스를 숨기고 제거
            });
        }, 2000); // 2초 후 메시지를 사라지게 함
    }

    // 댓글 목록 로드 함수
    function loadComments(pageNumber = 1, pageSize = 5) {
        $.ajax({
            url: '/ReplyAjaxController',  // 댓글 목록 조회 서블릿 경로
            method: 'GET',
            data: {
                'action': 'getReplies',
                'bIdx': bIdx,
                "pageNumber": pageNumber,
	            "pageSize": pageSize
            },
            success: function(response) {
            	console.log("댓글");
            	console.log(response);
            	console.log(midx);
            	console.log(response.mIdx);
                $(".comment-list").empty();
                // 댓글 목록을 테이블 형식으로 추가
                var html = [];
                html.push('<table class="table">');
                html.push('	<thead>');
           		html.push('		<tr>');
  				html.push('			<th>작성자</th>');
				html.push('			<th>댓글 내용</th>');
				html.push('			<th>작성일</th>');
				for(var i=0; i < response.reply.length; i++){
					if (midx == response.reply[i].mIdx || adminCheck == 2) {
						html.push('			<th>삭제</th>');
					}
				}
				html.push('		</tr>');
				html.push('	</thead>');
                html.push('<tbody>');

                // 댓글 목록 동적으로 생성
                for(var i=0; i < response.reply.length; i++){
                    html.push('		<tr class="comment" data-ridx="' + response.reply[i].rIdx + '">');
                    html.push('			<td>' + response.reply[i].name + '</td>');  // mIdx는 작성자 정보로 대체 필요
                    html.push('			<td>' + response.reply[i].content + '</td>');
                    html.push('			<td>' + response.reply[i].regdate + '</td>');
                    if (midx == response.reply[i].mIdx || adminCheck == 2) {
                    	html.push('			<td><button class="delete-reply-btn" data-ridx="' + response.reply[i].rIdx + '" onclick="replyDelete(' + response.reply[i].rIdx + ')">삭제</button></td>');
                    }else{
                    	html.push('<td></td>');
                    }
                    html.push('		</tr>');
                }

                html.push('	</tbody>');
                html.push('</table>');

                $(".comment-list").append(html.join(''));

                // 댓글 개수 업데이트
                $("#commentCount").text(response.totalCount);
                
                var totalPages = Math.ceil(response.totalCount / pageSize); // totalCount는 서버에서 받아온 데이터 총 개수
                // 페이지네이션 렌더링
                renderPagination(totalPages, pageNumber);
            },
            error: function(xhr, status, error) {
                console.error('댓글 목록 조회 실패: ' + error);
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
	        loadComments(pageNumber, 5); // 10은 페이지 크기 예시
	    });
	}

	$(document).ready(function() {
		init();
		
	});

</script>
</html>
