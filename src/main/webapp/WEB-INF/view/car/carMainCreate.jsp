<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>vsCAR : 차량 등록하기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/view/common/css.jsp"%>
</head>
<style>
.choice1 {
	padding-left: 10px;
	flex-grow: 0.5; /* 유연한 크기 조정 */
}

.table-container {
	position: relative;
	max-width: 1100px;
	margin: 0 auto; /* 테이블 중앙 정렬 */
}

table {
	width: 100%; /* 테이블 너비 100% */
	max-width: 1100px;
	border-collapse: collapse; /* 테이블 경계 합치기 */
	margin-top: 20px; /* 테이블 위쪽 여백 */
}

th, td {
	padding: 12px;
	border: 1px solid #ddd; /* 경계 색상 */
	text-align: center; /* 텍스트 중앙 정렬 */
}

th {
	background-color: #4CAF50; /* 헤더 배경 색상 */
	color: white; /* 헤더 텍스트 색상 */
}

.gridClass1 {
	display: grid;
	grid-template-columns: 7fr 200px 1fr 1fr; /* 그리드 레이아웃 설정 */
	gap: 15px; /* 그리드 간격 */
}

.gridButton1 {
	border-radius: 10px; /* 버튼 둥글기 */
	background-color: rgb(76, 175, 80); /* 버튼 배경색 */
	color: white; /* 버튼 텍스트 색상 */
	border: 1px white solid; /* 버튼 경계 */
}

.gridButton2 {
	border-radius: 10px; /* 버튼 둥글기 */
	background-color: #dc3545; /* 버튼 배경색 */
	color: white; /* 버튼 텍스트 색상 */
	border: 1px white solid; /* 버튼 경계 */
}

.th:nth-child(odd), td:nth-child(odd) {
	background-color: #f2f2f2; /* 홀수번째 열 배경색 */
}

.brandMark {
	width: 80px; /* 브랜드 마크 너비 */
}

.recommend {
	display: grid; /* 추천 항목 그리드 레이아웃 */
}
.ftco-section {
    padding: 0em 0;
    position: relative;
}
.preview {
    margin-top: 5px;
    font-size: 0.9em;
    color: #555; /* 미리보기 텍스트 색상 */
}
.centered-input {
        text-align: center;
}

    
</style>

<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('images/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<h1 class="mb-3 bread">차량 등록하기</h1>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div style="text-align: center; margin-top: 60px;">
			<img id="uploadButton1" src="../../../buttonImage/imageInsert.png" alt="차량 이미지 업로드 버튼"
				onclick="document.getElementById('imageUpload1').click()"
				style="cursor: pointer; width: 500px; height: 400px;">

			<input type="file" id="imageUpload1" accept="image/*"
				style="display: none;" onchange="previewCar(event)">
		</div>
	</section>
	<section>
		<div style="text-align: center; margin-top: 20px;">
			<img id="uploadButton2" src="../../../buttonImage/brandMarkInsert.png" alt="제조사 로고 업로드 버튼"
				onclick="document.getElementById('imageUpload2').click()"
				style="cursor: pointer; width: 180px; height: 100px;">
				
			<input type="file" id="imageUpload2" accept="image/*"
				style="display: none;" onchange="previewMark(event)">
		</div>
	</section>
	<section class="ftco-section ftco-car-details">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="car-details"></div>
				</div>
			</div>
		</div>
		<div class="table-container">
			<div class="gridClass1">
				<h2>차량 제원 등록하기</h2>
				<div></div>
			</div>
			<table>
				 <thead> 
			 <tr> 
			 <th>항목</th> 
			 <th>세부 사항</th> 
			 </tr> 
			 </thead> 
			 <tbody> 
			 <tr> 
			 <td>국산/수입</td> 
			 <td><input type="text" id="domesticImportInput" class="centered-input" placeholder="국산 / 수입"></td>
			 </tr>
			 <tr>
			 <td>제조사</td> 
			 <td><input type="text" id="brandInput" class="centered-input" placeholder="벤츠"></td>
			 </tr>
			 <tr>
			 <td>차량 크기</td> 
			 <td><input type="text" id="vehicleSizeInput" class="centered-input" placeholder="중형, 대형"></td>
			 </tr> 
			 <tr>
			 <td>차종</td> 
			 <td><input type="text" id="carModelInput" class="centered-input" placeholder="세단, suv.."></td>
			 </tr> 
			 <tr> 
			 <td>차량 이름</td>
			 <td><input type="text" id="carNameInput" class="centered-input" placeholder="아반떼"></td>
			 </tr> 
			 </tbody> 
			</table>
		</div>
		<!-- 등록 완료 버튼 -->
		<div class="buttonClass" style="text-align: center; margin-top: 20px; margin-bottom: 20px;">
			<button class="gridButton1" onclick="clickInsert()" id="insertButton">등록 완료</button>
		</div>
	</section>

	<%@ include file="/WEB-INF/view/common/footer.jsp"%>

	<!-- 로더 -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
	</div>

	<%@ include file="/WEB-INF/view/common/js.jsp"%>
</body>
<script>
	const params = new URLSearchParams(window.location.search);
	var cIdx = params.get('idx'); // URL에서 인덱스 값 가져오기
	console.log(cIdx);
	var TrimMap = new Map(); // 트림 정보를 저장할 Map
	var carData = []; // 전체 차량 데이터를 저장하는 전역 변수
	var isCarImageFileChange = false;
	var isBrandImageFileChange = false;

	function init() {
		if(cIdx > 0){
			carView();
			document.title = "vsCAR : 차량 수정하기";
			$(".mb-3.bread").html("차량 수정하기");
			$(".gridClass1 h2").html("차량 제원 수정하기");
			$(".buttonClass").empty();
			var html=[];
			html.push('<button class="gridButton1" onclick="clickUpdate()" id="updateButton">수정 완료</button>');
			$(".buttonClass").append(html.join(''));
		}
	 // 초기화 함수 호출
	}
	
    function previewCar(event) {
    	if(cIdx > 0){ isCarImageFileChange = true; console.log("바뀜1"); }
        const file = event.target.files[0]; // 선택한 파일 가져오기
        const reader = new FileReader(); // FileReader 객체 생성
        
        reader.onload = function() {
            // 선택한 이미지로 업로드 버튼 이미지 변경
            const uploadButton1 = document.getElementById('uploadButton1');
            uploadButton1.src = reader.result; // 읽어온 데이터로 버튼 이미지 변경
        };
        
        if (file) {
            reader.readAsDataURL(file); // 파일을 Data URL로 읽기
        }
    }
    
    function previewMark(event) {
    	if(cIdx > 0){ isBrandImageFileChange = true; console.log("바뀜2");}
        const file = event.target.files[0]; // 선택한 파일 가져오기
        const reader = new FileReader(); // FileReader 객체 생성
        
        reader.onload = function() {
            // 선택한 이미지로 업로드 버튼 이미지 변경
            const uploadButton2 = document.getElementById('uploadButton2');
            uploadButton2.src = reader.result; // 읽어온 데이터로 버튼 이미지 변경
        };
        
        if (file) {
            reader.readAsDataURL(file); // 파일을 Data URL로 읽기
        }
    }
	
	function clickInsert() {
		 // FormData 객체 생성
	    const formData = new FormData();
	    
	    // 폼 데이터 추가
	    formData.append('domesticImport', document.getElementById('domesticImportInput').value);
	    formData.append('brand', document.getElementById('brandInput').value);
	    formData.append('vehicleSize', document.getElementById('vehicleSizeInput').value);
	    formData.append('carModel', document.getElementById('carModelInput').value);
	    formData.append('carName', document.getElementById('carNameInput').value);

	    // 파일도 포함 (이미지가 업로드된 경우만)
	    const carImage = document.getElementById('imageUpload1').files[0];
	    const brandMark = document.getElementById('imageUpload2').files[0];
	    if (carImage) formData.append('carImage', carImage);
	    if (brandMark) formData.append('brandMark', brandMark);
	   
	    // AJAX 요청 (fetch API 사용)
	    $.ajax({
	        url: "carMainInsertAjaxController",
	        type: "POST",
	        data: formData,
	        contentType: false, // 필수
	        processData: false, // 필수
	        dataType: "json",
	        success: function(response) {
	            console.log("Success:", response);
	            if(response.status === "success") {
	                alert('carMain 등록 완료');
	                window.location.href = "/carList";
	            } else {
	                alert('carMain 등록 실패 : ' + response.message);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("Error details:", xhr.responseText);
	            alert('차량등록 중 오류가 발생했습니다.');
	        }
	    });
	}

	function clickUpdate() {
		 // FormData 객체 생성
	    const formData = new FormData();
	    
	    // 폼 데이터 추가
	    formData.append('cIdx', cIdx);
	    formData.append('domesticImport', document.getElementById('domesticImportInput').value);
	    formData.append('brand', document.getElementById('brandInput').value);
	    formData.append('vehicleSize', document.getElementById('vehicleSizeInput').value);
	    formData.append('carModel', document.getElementById('carModelInput').value);
	    formData.append('carName', document.getElementById('carNameInput').value);
	    formData.append('isCarImageFileChange', isCarImageFileChange);
	    formData.append('isBrandImageFileChange', isBrandImageFileChange);
	    
	    // 파일도 포함 (이미지가 업로드된 경우만)
	    if(isCarImageFileChange){
	    	const carImage = document.getElementById('imageUpload1').files[0];
	    	if (carImage) formData.append('carImage', carImage);
	    }
	    if(isBrandImageFileChange){
		    const brandMark = document.getElementById('imageUpload2').files[0];
		    if (brandMark) formData.append('brandMark', brandMark);
		}
	   
	    // AJAX 요청 (fetch API 사용)
	    $.ajax({
	        url: "carMainUpdateAjaxController",
	        type: "POST",
	        data: formData,
	        contentType: false, // 필수
	        processData: false, // 필수
	        dataType: "json",
	        success: function(response) {
	            console.log("Success:", response);
	            if(response.status === "success") {
	                alert('carMain 수정 완료');
	                window.location.href = "/carList";
	            } else {
	                alert('carMain 수정 실패 : ' + response.message);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("Error details:", xhr.responseText);
	            alert('차량등록 중 오류가 발생했습니다.');
	        }
	    });
	}
	
	function carView(){
		$.ajax({
			url : "CarViewAjaxController", // 서버 서블릿 경로
			method : "GET", // 요청 방식
			data : {
				"idx" : cIdx
			},
			success : function(response) {
				console.log(response);
				$("#uploadButton1").attr('src', 'carImage/' + response[0].carImage)
				$("#uploadButton2").attr('src', 'carImage/' + response[0].brandMark)
				$("#domesticImportInput").val(response[0].domesticImport);
				$("#brandInput").val(response[0].brand);
				$("#vehicleSizeInput").val(response[0].vehicleSize);
				$("#carModelInput").val(response[0].carModel);
				$("#carNameInput").val(response[0].carName);
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