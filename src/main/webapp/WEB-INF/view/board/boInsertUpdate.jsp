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
/* 삭제 버튼 스타일 */
button[type="button"] {
    background-color: #ff4757;  /* 빨간색 배경 */
    color: white;  /* 글자 색상 흰색 */
    border: none;  /* 기본 테두리 제거 */
    padding: 6px 12px;  /* 패딩을 더해서 버튼 크기 조절 */
    border-radius: 8px;  /* 둥근 모서리 */
    cursor: pointer;  /* 마우스 커서가 손 모양으로 바뀌게 */
    font-size: 14px;  /* 글자 크기 설정 */
    display: inline-block;  /* 버튼을 inline-block으로 설정 */
    transition: background-color 0.3s ease, transform 0.2s ease;  /* 배경 색상 변화와 크기 변화 효과 */
    opacity: 0.8;  /* 기본적으로 약간 투명한 효과 */
}

button[type="button"]:hover {
    background-color: #ff6b81;  /* 호버 시 밝은 빨간색 배경 */
    transform: scale(1.1);  /* 호버 시 버튼이 살짝 커지게 */
    opacity: 1;  /* 호버 시 완전 불투명 */
}

button[type="button"]:active {
    transform: scale(0.95);  /* 클릭 시 버튼이 작아지는 효과 */
}


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
    width: 820px;
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
.container.main{
	margin-top: 100px;
}

.large-input {
    width: 820px; /* 원하는 너비 설정 */
    height: 500px; /* 원하는 높이 설정 */
    font-size: 16px; /* 글자 크기 조정 */
    padding: 5px; /* 패딩 추가로 여유 공간 생성 */
    vertical-align: top; /* 텍스트를 상단에 위치 */
    resize: none; /* 사용자가 크기를 조정하지 못하게 */
    overflow-y: auto; /* 세로 스크롤 가능하게 */
}

.button-container {
    display: flex;
    justify-content: space-between; /* 가로 가운데 정렬 */
    margin-top: 20px; /* 위쪽 여백 추가 */
    align-items: center;
}

.submit-button {
    padding: 10px 20px; /* 버튼의 패딩 */
    font-size: 16px; /* 글자 크기 */
    color: white; /* 글자 색상 */
    background-color: #495057d6; /* 버튼 배경 색상 */
    border: none; /* 기본 테두리 제거 */
    border-radius: 5px; /* 모서리 둥글게 */
    cursor: pointer; /* 커서 변경 */
    transition: background-color 0.3s; /* 배경 색상 변화 효과 */
    margin-bottom: 20px; /* 버튼 아래쪽 여백 추가 */
    display: inline-block; /* 버튼을 inline-block으로 설정 */
    text-align: center; /* 텍스트 가운데 정렬 */
    line-height: 1.5; /* 수직 정렬을 위한 라인 높이 조정 */
    height: 50px; /* 버튼 높이 설정 */
    margin-right: 30px;
}

.submit-button:hover {
    background-color: #218838; /* 호버 시 배경 색상 변화 */
}

.formTitle2 {
    color: white;
}

</style>
</head>
<body>

<%@ include file="/WEB-INF/view/common/header.jsp"%>

	<section class="hero-wrap hero-wrap-2 js-fullheight"
	style="background-image: url('images/bg_7.jpg');"
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
					<h1 class="mb-3 bread">게시물 등록</h1>
				</div>
			</div>
		</div>
	</section>
	
	<section>
	    <div class="post-container">
	        <div class="post-header">
	        </div>
	        <div class="post-content">
	        </div>
	        <div class="button-container">
	            <a href="boList" class="nav-btn">목록으로</a>
	        </div>
	    </div>
	</section>

    <%@ include file="/WEB-INF/view/common/footer.jsp"%>

<%@ include file="/WEB-INF/view/common/js.jsp"%>
</body>

<script type="text/javascript">
var midx = '<%=session.getAttribute("mIdx") != null ? session.getAttribute("mIdx") : 0%>';
var name = '<%=session.getAttribute("name") != null ? session.getAttribute("name") : ""%>';
var adminCheck = '<%=session.getAttribute("adminCheck") != null ? session.getAttribute("adminCheck") : ""%>';
var isImage1Change = false;
var isImage2Change = false;
var isImage3Change = false;

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
			$(".mb-3.bread").html("게시물 등록")
			boardCreate(); 
			$("#deleteImage1").hide();
			$("#deleteImage2").hide();
		}
		else {
			console.log("수정");
			$(".mb-3.bread").html("게시물 수정")
			boardUpdate(); 
		}
	    
	    
	}


	function boardCreate() {
	    var html = [];
	    $("#formTitle").empty();
	    html.push('<span id="formTitle">등록</span>');
	    $("#formTitle").append(html.join(''));

	    var html = [];
	    $(".formTitle2").empty();
	    html.push('<p class="formTitle2" style="color: white;">게시물을 등록하는 페이지입니다.</p>');
	    $(".formTitle2").append(html.join(''));

	    var html = [];
	    $(".post-header").empty();
	    html.push('<span class="post-category">자유게시판</span>');
	    html.push('<h1 class="post-title"><input type="text" id="title" style="width: 820px;" placeholder="제목을 입력하세요"></h1>');
	    html.push('<div class="post-meta">');
	    html.push('    <span><i class="fas fa-user"></i><span id="name">' + name + '</span></span>'); // 작성자 이름 표시할 곳
	    html.push('</div>');
	    $(".post-header").append(html.join(''));

	    var htmlContent = [];
	    $(".post-content").empty();
	    htmlContent.push('<div class="post-text">');
	    htmlContent.push('    <p><textarea class="large-input" id="content" placeholder="내용을 입력하세요"></textarea></p>');
	    htmlContent.push('</div>');
	    htmlContent.push('<div class="post-images">');
	    htmlContent.push('    <div class="post-image">');
	    htmlContent.push('        <input type="file" id="imageUpload1" accept="image/*" onchange="previewImage(event, 1)">');
	    htmlContent.push('        <img id="preview1" src="" alt="차량 사진 1" style="display:none;">');
	    htmlContent.push('        <button type="button" id="deleteImage1" onclick="deleteImage(1)">삭제</button>');
	    htmlContent.push('    </div>');
	    htmlContent.push('    <div class="post-image">');
	    htmlContent.push('        <input type="file" id="imageUpload2" accept="image/*" onchange="previewImage(event, 2)">');
	    htmlContent.push('        <img id="preview2" src="" alt="차량 사진 2" style="display:none;">');
	    htmlContent.push('        <button type="button" id="deleteImage2" onclick="deleteImage(2)">삭제</button>');
	    htmlContent.push('    </div>');
	    htmlContent.push('</div>');
	    $(".post-content").append(htmlContent.join(''));

	    var html = [];
	    $(".button-container").append('<button class="submit-button" onclick="submitForm()">등록하기</button>');
	}

	// 이미지 미리보기 함수
	function previewImage(event, imageNumber) {
	    var reader = new FileReader();
	    reader.onload = function() {
	        var previewId = 'preview' + imageNumber;
	        var deleteBtnId = 'deleteImage' + imageNumber;
	        document.getElementById(previewId).src = reader.result;
	        document.getElementById(previewId).style.display = 'block';
	     	// 삭제 버튼 보이기
	        document.getElementById(deleteBtnId).style.display = 'inline-block';
	    }
	    reader.readAsDataURL(event.target.files[0]);
	    if(imageNumber == 1){ isImage1Change = true;}
	    if(imageNumber == 2){ isImage2Change = true;}
	}

	// 이미지 삭제 함수
	function deleteImage(imageNumber) {
	    var inputId = 'imageUpload' + imageNumber;
	    var previewId = 'preview' + imageNumber;
	    var deleteBtnId = 'deleteImage' + imageNumber;

	    if (imageNumber == 1) {
	        document.getElementById('preview1').style.display = 'none';
	        document.getElementById('deleteImage1').style.display = 'none';
	        document.getElementById('imageUpload1').value = null; // 파일 입력 초기화
	    } else if (imageNumber == 2) {
	        document.getElementById('preview2').style.display = 'none';
	        document.getElementById('deleteImage2').style.display = 'none';
	        document.getElementById('imageUpload2').value = null; // 파일 입력 초기화
	    }
	    
	    // 이미지 변경 여부를 false로 설정
	    if (imageNumber == 1) {
	        isImage1Change = true;
	    }
	    if (imageNumber == 2) {
	        isImage2Change = true;
	    }
	}
	
	// 파일 상태 확인 함수 (파일이 있으면 삭제 버튼 표시)
	function checkFileStatus() {
	    // 첫 번째 파일 입력 상태 확인
	    if (document.getElementById('imageUpload1').files.length > 0 || document.getElementById('preview1').src != "") {
	        document.getElementById('deleteImage1').style.display = 'inline-block';
	    } else {
	        document.getElementById('deleteImage1').style.display = 'none';
	    }

	    // 두 번째 파일 입력 상태 확인
	    if (document.getElementById('imageUpload2').files.length > 0 || document.getElementById('preview2').src != "") {
	        document.getElementById('deleteImage2').style.display = 'inline-block';
	    } else {
	        document.getElementById('deleteImage2').style.display = 'none';
	    }
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
				    $("#formTitle").empty();
				    html.push('<span id="formTitle">수정</span>');
				    $("#formTitle").append(html.join(''));
				    
					var html = [];
				    $(".formTitle2").empty();
				    html.push('<p class="formTitle2">게시물을 수정하는 페이지입니다.</p>');
				    $(".formTitle2").append(html.join(''));
					
					var html = [];
					$(".post-header").empty();
					html.push('	<span class="post-category">자유게시판</span>');
					html.push('	<h1 class="post-title"><input type="text" id="title" style="width: inherit;" value="' + response.title + '"></h1>');
					html.push('	<div class="post-meta">');
					html.push('		<span><i class="fas fa-user"></i>' + response.name + '</span>');
					html.push('		<span><i class="fas fa-calendar"></i>' + response.regdate + '</span>');
					html.push('	</div>');
					$(".post-header").append(html.join(''));
					
					var html = [];
					$(".post-content").empty();
					html.push('<div class="post-text">');
					html.push('<p><textarea class="large-input" id="content">' + response.content + '</textarea></p>');
					html.push('</div>');
					html.push('<div class="post-images">');
					// 첫 번째 이미지
		            html.push('<div class="post-image">');
		            html.push('    <input type="file" id="imageUpload1" accept="image/*" onchange="previewImage(event, 1)">');
		            if (response.image1) {
		                html.push('    <img id="preview1" src="boardImage/' + response.image1 + '" alt="차량 사진 1">');
		                html.push('    <button type="button" id="deleteImage1" style="display:inline-block;" onclick="deleteImage(1)">삭제</button>');
		            } else {
		                html.push('    <img id="preview1" src="" alt="차량 사진 1" style="display:none;">');
		                html.push('    <button type="button" id="deleteImage1" style="display:none;" onclick="deleteImage(1)">삭제</button>');
		            }
		            html.push('</div>');

		            // 두 번째 이미지
		            html.push('<div class="post-image">');
		            html.push('    <input type="file" id="imageUpload2" accept="image/*" onchange="previewImage(event, 2)">');
		            if (response.image2) {
		                html.push('    <img id="preview2" src="boardImage/' + response.image2 + '" alt="차량 사진 2">');
		                html.push('    <button type="button" id="deleteImage2" style="display:inline-block;" onclick="deleteImage(2)">삭제</button>');
		            } else {
		                html.push('    <img id="preview2" src="" alt="차량 사진 2" style="display:none;">');
		                html.push('    <button type="button" id="deleteImage2" style="display:none;" onclick="deleteImage(2)">삭제</button>');
		            }
					html.push('	</div>');
					html.push('</div>');
					$(".post-content").append(html.join(''));
					
					var html = [];
				    $(".button-container").append('<button class="submit-button" onclick="updateForm()">수정하기</button>');
				    if(response.image1 != undefined){ $("#preview1").show(); }
				    if(response.image2 != undefined){ $("#preview2").show(); }
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
            alert('글 내용을 입력해주세요!');
            $('#content').focus();
            return false;
        }
        return true;
    }

    function submitForm() {
    	// 유효성 검사 추가
        if (!validCheck()) {
            return;
        }

    	
    	// FormData 객체 생성
		const formData = new FormData();
		
		// 폼 데이터 추가
		formData.append('mIdx', midx);
		formData.append('title', $('#title').val());
		formData.append('content', $('#content').val());
		formData.append('regdate', $('#regdate').val());
		
		// 파일도 포함 (이미지가 업로드된 경우만)
		const image1 = document.getElementById('imageUpload1').files[0];
		const image2 = document.getElementById('imageUpload2').files[0];
		if (image1) formData.append('image1', image1);
		if (image2) formData.append('image2', image2);
		
        $.ajax({
            type: "POST", // POST 방식으로 변경
            url: "boCreate", // 보낼 URL
            data: formData,
            contentType: false, // 필수
	        processData: false, // 필수
	        dataType: "json",
            success: function(response) {
                alert('처리가 완료되었습니다.');
                window.location.href = "/boList"; // 등록 후 이동할 페이지
            },
            error: function() {
                alert('처리 중 오류가 발생했습니다.');
            }
        });
    }
    
    function updateForm() {
    	// 유효성 검사 추가
        if (!validCheck()) {
            return;
        }
    	
        // FormData 객체 생성
        const formData = new FormData();

        // 수정된 제목과 내용 가져오기
        formData.append('mIdx', midx); // 수정할 게시물의 idx
        formData.append('bIdx', bIdx); // 수정할 게시물의 idx
        formData.append('title', $('#title').val());
        formData.append('content', $('#content').val());
       	formData.append('isImage1Change', isImage1Change); // 변경 여부를 폼데이터에 담아서 보낸다.
       	formData.append('isImage2Change', isImage2Change);
       	formData.append('isImage3Change', isImage3Change);
       	
        // 기존 이미지를 제거할 경우 빈 문자열("")을 보냄
        const image1 = document.getElementById('imageUpload1').files[0];
        const image2 = document.getElementById('imageUpload2').files[0];

        if (!image1) { // 이미지가 없는 경우
        	if(isImage1Change){ // 기존에 이미지가 있다가 삭제된 경우
            	formData.append('image1', ''); // 이미지1 삭제\
        	} // else는 이미지가 없는 경우에 파일첨부가 되지 않은 경우 입니다.
        }
        if(image1){ // 이미지가 있는 경우
        	if(isImage1Change){ // 이미지가 있고 파일첨부 여부가 True인 경우
        		formData.append('image1', image1);
        	} // else는 이미지 파일첨부가 있는데 변경 여부가 False인 경우 >> 있을수가 없다.
        }

        if (!image2) { // 이미지가 없는 경우
        	if(isImage2Change){ // 기존에 이미지가 있다가 삭제된 경우
            	formData.append('image2', ''); // 이미지1 삭제
        	} // else는 이미지가 없는 경우에 파일첨부가 되지 않은 경우 입니다.
        }
        if(image2){ // 이미지가 있는 경우
        	if(isImage2Change){ // 이미지가 있고 파일첨부 여부가 True인 경우
        		formData.append('image2', image2);
        	} // else는 이미지 파일첨부가 있는데 변경 여부가 False인 경우 >> 있을수가 없다.
        }
        
        // 서버로 수정된 데이터 전송
        $.ajax({
            type: "POST",
            url: "boUpdate", // 수정 요청을 보낼 URL
            data: formData,
            contentType: false,
            processData: false,
            dataType: "json",
            success: function(response) {
                alert('수정이 완료되었습니다.');
                window.location.href = "/boList"; // 수정 후 목록 페이지로 이동
            },
            error: function(xhr, status, error) {
                console.error('수정 실패: ' + error);
                alert('수정 중 오류가 발생했습니다.');
            }
        });
    }


    $(document).ready(function(){
    	init();
    	// 파일 입력 값이 있을 경우, 삭제 버튼을 보이게 설정
        if(bIdx > 0) { checkFileStatus(); }
    });
</script>

</html>
