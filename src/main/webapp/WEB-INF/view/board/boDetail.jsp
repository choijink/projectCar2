<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/view/common/css.jsp"%>
<title>게시물 상세보기 | JingkaWingka</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
<style>
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
	max-width: 900px;
	margin: 3rem auto;
	margin-top: 100px;
	background: white;
	border-radius: 15px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
	overflow: hidden;
}

.bg-dark {
    background-color: #343a40 !important;
}

.post-header {
	background-color: #949e85 !important;
	color: white;
	padding: 2rem;
	position: relative;
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
	height: 200px;
	object-fit: cover;
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
	padding: 2rem;
	background: white;
	margin-top: 2rem;
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
	display: flex;
	flex-direction: column;
	gap: 1.5rem;
}

.comment {
	display: flex;
	gap: 1rem;
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
	padding: 0.5rem 1rem;
	border: 1px solid var(--primary-color);
	border-radius: 5px;
	color: var(--primary-color);
	text-decoration: none;
	transition: all 0.3s ease;
}

.nav-btn:hover {
	background-color: var(--primary-color);
	color: white;
}
</style>
</head>
<body>
<div style="background-image: url('images/image_5.jpg');"/>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div class="post-container">
		<div class="post-header">
		</div>

		<div class="post-content">
		</div>

	</div>

	<div class="comment-section">
		<h3>댓글 2개</h3>
		<div class="comment-form">
			<textarea class="comment-input" rows="3"
				placeholder="모든 댓글은 서로 존중하는 마음으로 작성해 주세요. 비방, 욕설, 또는 타인을 상처 입히는 내용은 삼가해 주시기 바랍니다."></textarea>
			<button class="action-btn"
				style="background-color: var(--primary-color); color: white;">
				댓글 작성</button>
		</div>

		<div class="comment-list">
			<div class="comment">
				<div class="comment-avatar">JK</div>
				<div class="comment-content">
					<div class="comment-header">
						<span class="comment-author">김학선</span> <span class="comment-date"></span>
					</div>
					<p class="comment-text">말씀하신 증상은 타이밍 벨트 쪽에서 발생하는 소리일 가능성이 높습니다.
						가까운 정비소에서 점검을 받아보시는 것을 추천드립니다. 방치하시면 더 큰 문제가 될 수 있어요.</p>
				</div>
			</div>

			<div class="comment">
				<div class="comment-avatar">SJ</div>
				<div class="comment-content">
					<div class="comment-header">
						<span class="comment-author">선진우</span> <span class="comment-date">2024-10-15
							15:45</span>
					</div>
					<p class="comment-text">저도 비슷한 경험이 있었는데, 엔진오일 교체 시기가 된 것일 수도
						있습니다. 주행거리가 어느 정도 되시나요?</p>
				</div>
			</div>
		</div>
	</div>

	<div class="navigation-buttons" style="display: flex; justify-content: center; margin-top: 2rem; padding: 0 2rem;">
	    <a href="boList" class="nav-btn">목록으로</a>
	</div>


	<%@ include file="/WEB-INF/view/common/footer.jsp"%>
</body>
<script type="text/javascript">
	const params = new URLSearchParams(window.location.search);
	var bIdx = params.get('bIdx');
	function init() {
		$.ajax({
			url : "boardViewAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"idx" : bIdx
			},
			success : function(response) {
				var html = [];
				$(".post-header").empty();
				console.log(response);
				
				html.push('	<span class="post-category">자유게시판</span>');
				html.push('	<h1 class="post-title">' + response.title + '</h1>');
				html.push('	<div class="post-meta">');
				html.push('		<span><i class="fas fa-user"></i>' + response.name + '</span>');
				html.push('		<span><i class="fas fa-calendar"></i>' + response.regdate + '</span>');
				//html.push('		<span><i class="fas fa-comments"></i> 댓글 2</span>');
				html.push('	</div>');
				
				$(".post-header").append(html.join(''));
				
				var html = [];
				$(".post-content").empty();
				html.push('<div class="post-text">');
				html.push('	<p>' + response.content + '</p>');
				html.push('</div>');
				html.push('<div class="post-images">');
				html.push('	<div class="post-image">');
				html.push('		<img src="carImage/k9.png" alt="차량 사진 1">');
				html.push('	</div>');
				html.push('	<div class="post-image">');
				html.push('		<img src="images/car-11.jpg" alt="차량 사진 2">');
				html.push('	</div>');
				html.push('</div>');
				$(".post-content").append(html.join(''));
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
