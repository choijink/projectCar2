<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/view/common/css.jsp"%>
	<meta charset="UTF-8">
	<title>게시물 등록 및 수정</title>
  	<style type="text/css">
  		.container{margin-top: 10px;}
  		.input-group{margin: 7px;}
  		.input-group-text{
			display: inline-block;
			width: 120px;
			text-align: center; /* 텍스트를 가운데 정렬 */
  		}
  		#buttonset{margin-top: 15px;}
  	</style>
  	<script type="text/javascript">
  		$(document).ready(function(){
  	  		$('#regdate').datepicker({dateFormat: "yy/mm/dd"});  	  	
  		});
  		
  		function validCheck(){
  			var subject = $('#subject').val();
  			if(subject.length < 3 || subject.length > 20){
  				alert('글 제목은 3글자 이상 20글자 이하이어야 합니다.');
  				$('#subject').focus();
  				return false ;
  			}
  			
  			var contents = $('#contents').val();
  			if(contents.length < 5 || contents.length > 2500){
  				alert('글 내용은 5글자 이상 2500글자 이하이어야 합니다.');
  				$('#contents').focus() ;
  				return false ;
  			}
  			
  			var regdate = $('#regdate').val();
  			var regex = /^\d{4}[\/-][01]\d{1}[\/-][0123]\d{1}$/ ;
  			var result = regex.test(regdate) ;
  			
  			if(result == false){
  				alert('날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요.');
  				$('#regdate').focus() ;
  				return false ;
  			}  			
  		}

  		function submitForm(event) {
  			event.preventDefault(); // 폼 제출 방지
  			
  			if (!validCheck()) return;

  			var formData = {
  				command: "<%= isAdmin ? "boUpdate" : "boInsert" %>",
  				no: $('#no').val(),
  				subject: $('#subject').val(),
  				contents: $('#contents').val(),
  				regdate: $('#regdate').val(),
  				id: $('#id').val()
  			};

  			$.ajax({
  				type: "GET",
  				url: "boardController",
  				data: formData,
  				success: function(response) {
  					// 성공 시 처리
  					alert('처리가 완료되었습니다.');
  					window.location.href = "successPage.jsp"; // 성공 페이지로 리다이렉트
  				},
  				error: function() {
  					alert('처리 중 오류가 발생했습니다.');
  				}
  			});
  		}
  	</script>
</head>
<body>
<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div class="container">
		<h2>게시물 <span id="formTitle">등록</span></h2>
		<p>사용자들이 게시물을 등록하는 페이지입니다.</p>
		
		<form onsubmit="submitForm(event);">
			<input type="hidden" name="command" value="">
			<div id="boardNo" class="input-group">
				<span class="input-group-text col-md-2">게시물 번호</span> 
				<input id="no" name="no" type="number" class="form-control" value="" disabled>
			</div> 
			<div class="input-group">
				<span class="input-group-text col-md-2">작성자</span>
				<input id="fakeid" name="fakeid" disabled="disabled" type="text" class="form-control" value="<%= userInfo %>">
				<input id="id" name="id" type="hidden" value="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글제목</span> 
				<input id="subject" name="subject" type="text" class="form-control" value="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글내용</span> 
				<input id="contents" name="contents" type="text" class="form-control" value="">
			</div>  
			<div class="input-group">
				<span class="input-group-text col-md-2">등록 일자</span> 
				<input id="regdate" name="regdate" type="text" class="form-control" value="">
			</div>
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg">"수정" : "등록"</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
		<%@ include file="/WEB-INF/view/common/footer.jsp"%>
	</div>
	<%@ include file="/WEB-INF/view/common/js.jsp"%>
</body>
</html>
