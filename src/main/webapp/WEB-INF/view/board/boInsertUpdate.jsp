<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Community Insert Update</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/view/common/css.jsp"%>
<style type="text/css">
    .container{margin-top: 10px;}
    .input-group{margin: 7px;}
    .input-group-text{
        display: inline-block;
        width: 120px;
        text-align: center;
    }
    #buttonset{margin-top: 15px;}
</style>
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
    background: white;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    overflow: hidden;
}

.post-header {
    background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
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

.post-content {
    padding: 2rem;
}

.post-text {
    font-size: 1.1rem;
    line-height: 1.8;
    color: #444;
    margin-bottom: 2rem;
}

textarea {
    width: 100%;
    padding: 1rem;
    border: 1px solid var(--border-color);
    border-radius: 10px;
    resize: none;
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
    display: none; /* 기본적으로 이미지는 보이지 않도록 설정 */
}

.post-image input {
    width: 100%;
    padding: 0.5rem;
    border: 1px solid var(--border-color);
    border-radius: 10px;
    cursor: pointer;
}

.post-actions {
    display: flex;
    gap: 1rem;
    padding: 1rem 2rem;
    border-top: 1px solid var(--border-color);
    background: #f8f9fa;
}

.action-btn {
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
    background-color: var(--secondary-color);
    color: white;
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
<%@ include file="/WEB-INF/view/common/header.jsp"%>
<div class="container">
    <h2>게시물 <span id="formTitle"></span></h2>
    <p class="formTitle2"></p>

    <div class="post-container">
		<div class="post-header">
		</div>

		<div class="post-content">
		</div>
	</div>

	<!-- <div class="comment-section">
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
					<p  class="comment-text">말씀하신 증상은 타이밍 벨트 쪽에서 발생하는 소리일 가능성이 높습니다.
						가까운 정비소에서 점검을 받아보시는 것을 추천드립니다. 방치하시면 더 큰 문제가 될 수 있어요.</p>
				</div>
			</div>

			<div class="comment">
				<div class="comment-avatar">SJ</div>
				<div class="comment-content">
					<div class="comment-header">
						<span class="comment-author">선진우</span> <span class="comment-date"></span>
					</div>
					<p class="comment-text">저도 비슷한 경험이 있었는데, 엔진오일 교체 시기가 된 것일 수도
						있습니다. 주행거리가 어느 정도 되시나요?</p>
				</div>
			</div>
		</div>
	</div> -->

	<div class="navigation-buttons" style="display: flex; justify-content: center; margin-top: 2rem; padding: 0 2rem;">
	    <a href="boList" class="nav-btn">목록으로</a>
	</div>
    <%@ include file="/WEB-INF/view/common/footer.jsp"%>
</div>
<%@ include file="/WEB-INF/view/common/js.jsp"%>
</body>

<script type="text/javascript">
var name = '<%=session.getAttribute("name") != null ? session.getAttribute("name") : ""%>';

	const params = new URLSearchParams(window.location.search);
	var bIdx = params.get('idx');
	console.log("bIdx : " + bIdx);
	
	function init(){
		var today = new Date();
	    var year = today.getFullYear();
	    var month = String(today.getMonth() + 1).padStart(2, '0');
	    var day = String(today.getDate()).padStart(2, '0');
	    var formattedDate = year + '-' + month + '-' + day;
	
	    $('#regdate').val(formattedDate);
	
	    $('#regdate').datepicker({
	        dateFormat: "yy-mm-dd",
	        changeMonth: true,
	        changeYear: true,
	        onClose: function() {
	            var inputVal = $(this).val();
	            if (!inputVal) {
	                $(this).val(formattedDate);
	            }
	        }
	    }).focus(function() {
	        $(this).datepicker("show");
	    });
	
	    $('#regdate').on("change", function() {
	        if (!$(this).val()) {
	            $(this).val(formattedDate);
	        }
	    });
	    
	    if(bIdx == null){
			console.log("등록");
			boardCreate(); 
		}
		else {
			console.log("수정");
			boardUpdate(); 
		}
	    
	    
	}


	function boardCreate() {
		$.ajax({
	        url: 'getAuthorName', // 작성자 이름을 가져오는 서버 엔드포인트
	        method: 'GET',
	        success: function(response) {
	            $('#authorName').text(response.authorName); // 서버 응답에서 작성자 이름 설정
	        }
	    });
		
		var html = [];
	    $(".formTitle .formTitle2").empty();
	    html.push('<h2>게시물 <span id="formTitle">등록</span></h2>');
	    html.push('<p class="formTitle2">게시물을 등록하는 페이지입니다.</p>');
	    $(".formTitle .formTitle2").append(html.join(''));
		
	    var html = [];
	    $(".post-header").empty();

	    html.push('<h2>게시물 <span id="formTitle">등록</span></h2>');
	    html.push('<p class="formTitle2">게시물을 등록하는 페이지입니다.</p>');
	    html.push('<span class="post-category">자유게시판</span>');
	    html.push('<h1 class="post-title"><input type="text" placeholder="제목을 입력하세요"></h1>');
	    html.push('<div class="post-meta">');
	    html.push('    <span><i class="fas fa-user"></i><span id="name">' + name + '</span></span>'); // 작성자 이름 표시할 곳
	    html.push('</div>');
	    $(".post-header").append(html.join(''));

	    var htmlContent = [];
	    $(".post-content").empty();
	    htmlContent.push('<div class="post-text">');
	    htmlContent.push('    <p><textarea placeholder="내용을 입력하세요"></textarea></p>');
	    htmlContent.push('</div>');
	    htmlContent.push('<div class="post-images">');
	    htmlContent.push('    <div class="post-image">');
	    htmlContent.push('        <input type="file" accept="image/*" onchange="previewImage(event, 1)">');
	    htmlContent.push('        <img id="preview1" src="" alt="차량 사진 1" style="display:none;">');
	    htmlContent.push('    </div>');
	    htmlContent.push('    <div class="post-image">');
	    htmlContent.push('        <input type="file" accept="image/*" onchange="previewImage(event, 2)">');
	    htmlContent.push('        <img id="preview2" src="" alt="차량 사진 2" style="display:none;">');
	    htmlContent.push('    </div>');
	    htmlContent.push('</div>');
	    $(".post-content").append(htmlContent.join(''));
	}

	// 이미지 미리보기 함수
	function previewImage(event, imageNumber) {
	    var reader = new FileReader();
	    reader.onload = function() {
	        var previewId = 'preview' + imageNumber;
	        document.getElementById(previewId).src = reader.result;
	        document.getElementById(previewId).style.display = 'block';
	    }
	    reader.readAsDataURL(event.target.files[0]);
	}


	function boardUpdate(){
			$.ajax({
				url : "boardViewAjaxController", // 서버 서블릿 경로
				method : "GET", // 요청 방식
				data : {
					"idx" : bIdx
				},
				success : function(response) {
					var html = [];
				    $(".formTitle .formTitle2").empty();
				    html.push('<h2>게시물 <span id="formTitle">수정</span></h2>');
				    html.push('<p class="formTitle2">게시물을 수정하는 페이지입니다.</p>');
				    $(".formTitle .formTitle2").append(html.join(''));
					
					var html = [];
					$(".post-header").empty();
					html.push('	<span class="post-category">자유게시판</span>');
					//html.push('	<h1 class="post-title">' + response.title + '</h1>');
					html.push('	<h1 class="post-title"><input type="text" value="' + response.title + '"></h1>');
					html.push('	<div class="post-meta">');
					html.push('		<span><i class="fas fa-user"></i>' + response.name + '</span>');
					html.push('		<span><i class="fas fa-calendar"></i>' + response.regdate + '</span>');
					//html.push('		<span><i class="fas fa-comments"></i> 댓글 2</span>');
					html.push('	</div>');
					$(".post-header").append(html.join(''));
					
					var html = [];
					$(".post-content").empty();
					html.push('<div class="post-text">');
					html.push('	<p><input type="text" value="' + response.content + '"></p>');
					html.push('</div>');
					html.push('<div class="post-images">');
					html.push('	<div class="post-image">');
					html.push('		<img src="' + response.image1 + '" alt="차량 사진 1">');
					html.push('	</div>');
					html.push('	<div class="post-image">');
					html.push('		<img src="' + response.image2 + '" alt="차량 사진 2">');
					html.push('	</div>');
					html.push('</div>');
					$(".post-content").append(html.join(''));
				},
				error : function(xhr, status, error) {
				console.error('요청 실패: ' + error); // 에러 출력
				}
			});
	}
	
    function validCheck(){
        var title = $('#title').val();
        if(title.length < 3 || title.length > 20){
            alert('글 제목은 3글자 이상 20글자 이하이어야 합니다.');
            $('#title').focus();
            return false;
        }

        var content = $('#content').val();
        if(content.length < 5 || content.length > 2500){
            alert('글 내용은 5글자 이상 2500글자 이하이어야 합니다.');
            $('#content').focus();
            return false;
        }

        var regdate = $('#regdate').val();
        var regex = /^\d{4}[\/-][01]\d{1}[\/-][0123]\d{1}$/;
        var result = regex.test(regdate);

        if(result == false){
            alert('날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요.');
            $('#regdate').focus();
            return false;
        }
    }

    function submitForm(event) {
        event.preventDefault();
        if (!validCheck()) return;

        var command = $('#command').val();
        var formData = {
            command: command,
            bIdx: $('#bIdx').val(),
            mIdx: $('#mIdx').val(),
            title: $('#title').val(),
            content: $('#content').val(),
            regdate: $('#regdate').val(),
            announcement: $('#announcement').val()
        };

        $.ajax({
            type: "GET",
            url: "boInsertUpdateController",
            data: formData,
            success: function(response) {
                alert('처리가 완료되었습니다.');
                window.location.href = "home.jsp";
            },
            error: function() {
                alert('처리 중 오류가 발생했습니다.');
            }
        });
    }
    $(document).ready(function(){
    	console.log("init타는쪽");
    	init();
    });
</script>

</html>
