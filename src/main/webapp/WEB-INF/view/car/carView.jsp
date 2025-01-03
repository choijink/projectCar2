<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>CarDetail</title>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/view/common/css.jsp"%>
<%@ include file="/WEB-INF/view/common/favicon.jsp" %>
</head>
<style>
.choice1 {
   padding-left: 10px;
   flex-grow: 0.5;
}

.table-container {
   position: relative;
   max-width: 1100px;
   margin: 0 auto;
}

table {
   width: 100%;
   max-width: 1100px;
   border-collapse: collapse;
   margin-top: 20px;
}

th, td {
   padding: 12px;
   border: 1px solid #ddd;
   text-align: center;
}

th {
   background-color: #4CAF50;
   color: white;
}

.gridClass1 {
   display: grid;
   grid-template-columns: 7fr 200px 1fr 1fr;
   gap: 15px;
}

.gridButton1 {
   border-radius: 10px;
   background-color: rgb(76, 175, 80);
   color: white;
   border: 1px white solid;
}

.gridButton2 {
   border-radius: 10px;
   background-color: #dc3545;
   color: white;
   border: 1px white solid;
}

.th:nth-child(odd), td:nth-child(odd) {
   background-color: #f2f2f2;
}

.brandMark {
   width: 80px;
}

.recommend {
   display: grid;
}

.recommend-row {
   display: flex;
   flex-wrap: wrap; /* 차량이 가로로 나란히 표시되도록 */
   margin-right: -15px;
    margin-left: -15px;
}
</style>

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
               <h1 class="mb-3 bread">차량 상세정보</h1>
            </div>
         </div>
      </div>
   </section>
   <section class="ftco-section ftco-car-details">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-12">
               <div class="car-details"></div>
            </div>
         </div>
         <div class="row justify-content-center gap-3">
            <div class="choice1">
               <div class="media block-6 services">
                  <div class="media-body py-md-4">
                     <div class="d-flex mb-3 align-items-center">
                        <div
                           class="icon d-flex align-items-center justify-content-center"
                           style="margin-right: 10px; margin-left: 70px;">
                           <span class="flaticon-dashboard"></span>
                        </div>
                        <div class="text">
                           <span class="col">등급 : </span> <select id="gradeSelectBox"
                              onChange="gradeSelect()"></select>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="choice1">
               <div class="media block-6 services text-center">
                  <div class="media-body py-md-4">
                     <div class="d-flex mb-3 align-items-center">
                        <div
                           class="icon d-flex align-items-center justify-content-center"
                           style="margin-right: 20px; margin-left: 70px;">
                           <span class="flaticon-diesel"></span>
                        </div>
                        <div class="text">
                           <span class="col">트림 : </span> <select id="trimSelectBox"
                              onChange="trimSelect()"><option value="">선택</option></select>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="table-container">
         <div class="gridClass1"></div>
         <table>
            <tr>
               <td colspan="4">해당 등급/트림의 정보가 없습니다.</td>
            </tr>
         </table>
      </div>
   </section>

<!--    <section class="ftco-section ftco-no-pt">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-12 heading-section text-center ftco-animate mb-5">
               <span class="subheading">차량 선택</span>
               <h2 class="mb-2">추천 차량</h2>
            </div>
         </div>

         <div class="recommend-row">
         
         </div>
      </div>
   </section> -->

   <%@ include file="/WEB-INF/view/common/footer.jsp"%>

   <!-- loader -->
   <div id="ftco-loader" class="show fullscreen">
      <svg class="circular" width="48px" height="48px">
         <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
            stroke-width="4" stroke="#eeeeee" />
         <circle class="path" cx="24" cy="24" r="22" fill="none"
            stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
   </div>

   <%@ include file="/WEB-INF/view/common/js.jsp"%>
</body>
<script>
var adminCheck = '<%=session.getAttribute("adminCheck") != null ? session.getAttribute("adminCheck") : ""%>';

   const params = new URLSearchParams(window.location.search);
   var cIdx = params.get('idx');
   var TrimMap = new Map();
   var carData = [] ; // 전체 차량 데이터를 저장하는 전역 변수
   var gradeParam = params.get('grade');
   var trimParam = params.get('trim');
   var grade = "";
   var trim = "";
   
   function init() {
      view();
      if(adminCheck ==2){
            $(".gridClass1").css('grid-template-columns', '1fr 200px 1fr 1fr 1fr 1fr');
         var html = [];
         html.push('<h2>차량 제원</h2>');
         html.push('<div></div>');
            html.push('<button class="gridButton1" onclick="carMainUpdate()">Main 수정하기</button>');
            html.push('<button class="gridButton1" onclick="carDetail1Update()">Detail1 수정하기</button>');
            html.push('<button class="gridButton1" onclick="carDetail2Update()">Detail2 수정하기</button>');
            html.push('<button class="gridButton2" onclick="carDelete()">삭제하기</button>');
         $(".gridClass1").append(html.join(''));
      } else {
         var html = [];
         html.push('<h2>차량 제원</h2>');
         html.push('<div></div>');
         html.push('<div></div>');
         html.push('<button class="gridButton1" onclick="comPare()">비교하기</button>');
         $(".gridClass1").append(html.join(''));
      }
   
   }

   function comPare(){
      $.ajax({
         url : "CarViewAjaxController",
         method : "GET",
         data : {
            "idx" : cIdx
            
         },
         success : function(response){
            window.location.href="/carCompare?idx=" + cIdx + "&grade=" + grade + "&trim=" + trim ;
         },
         error : function(xhr, status, error) {
            console.error('요청 실패: ' + error); // 에러 출력
         }
      });
   }
   
   function view() {
      $.ajax({
         url : "CarViewAjaxController", // 서버 서블릿 경로
         method : "GET", // 요청 방식
         data : {
            "idx" : cIdx
         },
         success : function(response) {
            carData = response;
            // 응답 데이터를 순회하여 중복 제거
            var FuelEfficiency = new Set();
            var FuelType = new Set();
            var Displacement = new Set();
            var MaxPower = new Set();
            var CurbWeight = new Set();
            var MaxTorque = new Set();
            var Grade = new Set();
            var Price = new Set();
            
            TrimMap.clear();

            for (var i = 0; i < response.length; i++) {
               FuelEfficiency.add(response[i].fuelEfficiency); // 브랜드 추가
               FuelType.add(response[i].fuelType); // 모델 이름 추가
               Displacement.add(response[i].displacement); // 모델 이름 추가
               MaxPower.add(response[i].maxPower); // 모델 이름 추가
               CurbWeight.add(response[i].curbWeight); // 모델 이름 추가
               MaxTorque.add(response[i].maxTorque); // 모델 이름 추가
               Grade.add(response[i].grade); // 모델 이름 추가
               Price.add(response[i].price); // 모델 이름 추가
               // grade별로 trim 추가
                   if (!TrimMap.has(response[i].grade)) {
                       TrimMap.set(response[i].grade, []);
                   }
                   TrimMap.get(response[i].grade).push(response[i].trim);
            }
            var html = [];
            html.push('<option value="">선택</option>');
            var gradeArray = Array.from(Grade);
            for (var i = 0; i < gradeArray.length; i++) {
               console.log(gradeArray[i]);
               html.push('<option value="' + gradeArray[i] + '">'
                     + gradeArray[i] + '</option>');
            }
            $('#gradeSelectBox').append(html.join(''));
            if(gradeParam != null){
            	$("#gradeSelectBox").val(gradeParam);
            	gradeSelect();
            }
                        
            var html = [];
                html.push('<div class="img rounded" style="background-image: url(carImage/' + response[0].carImage + ');"></div>');
            html.push('<div class="text text-center">');
                html.push('    <span class="subheading"><img class="brandMark" src="carImage/' + response[0].brandMark + '"></span>');
            html.push('   <h2>' + response[0].brand + ' ' + response[0].carName + '</h2>');
            html.push('</div>');
            $('.car-details').append(html.join(''));

         },
         error : function(xhr, status, error) {
            console.error('요청 실패: ' + error); // 에러 출력
         }
      });
   }

   function gradeSelect() {
      $('#trimSelectBox').empty();
      $('.table-container table').empty();
      $('.table-container table').append('<tr><td colspan="4">해당 등급/트림의 정보가 없습니다.</td></tr>');
      
      var selectElement = document.getElementById("gradeSelectBox");
      var selectedValue = selectElement.value;
      
      console.log(TrimMap);
      // 선택한 grade에 맞는 trim 목록 가져오기
       var trimOptions = TrimMap.get(selectedValue) || [];
      
       var html = [];
          html.push('<option value="">선택</option>');
          for (var i = 0; i < trimOptions.length; i++) {
              html.push('<option value="' + trimOptions[i] + '">' + trimOptions[i] + '</option>');
          }
          $('#trimSelectBox').append(html.join(''));
          grade = selectedValue ;
          if(trimParam != null){
        	  $("#trimSelectBox").val(trimParam);
        	  trimSelect();
          }
   }
   
   function trimSelect(){
      // trim 선택에 따라서 테이블 업데이트
      var selectedGrade = $('#gradeSelectBox').val();
      var selectedTrim = $('#trimSelectBox').val();
      updateTable(selectedGrade, selectedTrim);
      trim = selectedTrim;
   }
   
   function updateTable(selectedGrade, selectedTrim){
      // 선택된 등급과 트림에 맞는 데이터를 carData 찾기
      var filteredData = carData.find(item => {
         return item.grade === selectedGrade && (!selectedTrim || item.trim === selectedTrim);
      })
      console.log(selectedGrade);
      console.log(selectedTrim);
      console.log(filteredData);
      
      if (filteredData){
         $('.table-container table').empty();
         var html = [];
         html.push('<thead>');
         html.push('<tr>');
         html.push('<th>항목</th>');
         html.push('<th>세부 사항</th>');
         html.push('<th>항목</th>');
         html.push('<th>세부 사항</th>');
         html.push('</tr>');
         html.push('</thead>');
         html.push('<tbody>');
         html.push('<tr>');
         html.push('<td>제조사</td>');
         html.push('<td>' + filteredData.brand + '</td>');
         html.push('<td>연비</td>');
         html.push('<td>' + filteredData.fuelEfficiency + '</td>');
         html.push('</tr>');
         html.push('<tr>');
         html.push('<td>모델</td>');
         html.push('<td>' + filteredData.carName + '</td>');
         html.push('<td>배기량</td>');
         html.push('<td>' + filteredData.displacement + '</td>')
         html.push('</tr>');
         html.push('<tr>');
         html.push('<td>연료타입</td>');
         html.push('<td>' + filteredData.fuelType + '</td>');
         html.push('<td>전장</td>');
         html.push('<td>' + filteredData.length + '</td>');
         html.push('</tr>');
         html.push('<tr>');
         html.push('<td>인승</td>');
         html.push('<td>' + filteredData.seatingCapacity + '</td>');
         html.push('<td>전폭</td>');
         html.push('<td>' + filteredData.width + '</td>');
         html.push('</tr>');
         html.push('<tr>');
         html.push('<td>엔진형식</td>');
         html.push('<td>' + filteredData.engineType + '</td>');
         html.push('<td>전고</td>');
         html.push('<td>' + filteredData.height + '</td>');
         html.push('</tr>');
         html.push('<tr>');
         html.push('<td>구동방식</td>');
         html.push('<td>' + filteredData.driveType + '</td>');
         html.push('<td>축거</td>');
         html.push('<td>' + filteredData.wheelBase + '</td>');
         html.push('</tr>');
         html.push('<tr>');
         html.push('<td>최고출력</td>');
         html.push('<td>' + filteredData.maxPower + '</td>');
         html.push('<td>공차중량</td>');
         html.push('<td>' + filteredData.curbWeight + '</td>');
         html.push('</tr>');
         html.push('<tr>');
         html.push('<td>최대토크</td>');
         html.push('<td>' + filteredData.maxTorque + '</td>');
         html.push('<td>가격</td>');
         html.push('<td>' + filteredData.price + '</td>');
         html.push('</tr>');
         html.push('</tbody>');
      
         $('.table-container table').append(html.join(''));
         /* recommendList(filteredData); */
      } else {
         $('.table-container table').append('<tr><td colspan="4">해당 등급/트림의 정보가 없습니다.</td></tr>');
         //recommendList(filteredData);
      }
   }
   
   /* function recommendView() {
      $.ajax({
         url : "CarViewAjaxController", // 서버 서블릿 경로
         method : "GET", // 요청 방식
         data : {
            "idx" : cIdx
         },
         success : function(response) {
            carData = response;
            // 응답 데이터를 순회하여 중복 제거
            var CarImage = new Set();
            var CarName = new Set();
            var BrandMark = new Set();
            var Price = new Set();
            
            for (var i = 0; i < response.length; i++) {
               CarImage.add(response[i].carImage);
               CarName.add(response[i].carName);
               BrandMark.add(response[i].brandMark);
               Price.add(response[i].price);
            }
         },
         error : function(xhr, status, error) {
            console.error('요청 실패: ' + error); // 에러 출력
         }
      });
   } */
   
   function carListController(callback) {
      $.ajax({
         url : "ajaxController", // 서버 서블릿 경로
         method : "GET", // 요청 방식
         data : {
            "domestic" : "",
            "brand" : "",
            "model" : "",
            "name" : "",
            "page" : "",
            "pageSize" : ""
         },
         success : function(response) {
            console.log("response");
            console.log(response);
            callback(response);
         },
         error : function(xhr, status, error) {
            console.error('요청 실패: ' + error); // 에러 출력
         }
      });
   }
   
   /* function recommendList(filteredData) {
       carListController(function(response) {
           // 필터링 조건에 맞는 추천 차량 리스트 생성
           var recommendData = response.filter(car => {
            return car.cIdx !== filteredData.cIdx;
        });
           console.log("recommendData");
           console.log(recommendData);
           // 추천 차량을 무작위로 3대 선택
           var recommendCars = getRandomElements(recommendData, 3);
           console.log("recommendCars");
           console.log(recommendCars);
              if (recommendCars.length > 0) {
                 $('.recommend-row').empty();
                  var html = [];
                  for (var i = 0; i < recommendCars.length; i++) {
                     html.push('<div class="col-md-4">');
                     html.push('<div class="car-wrap rounded ftco-animate">');
                      html.push('<div class="img rounded d-flex align-items-end" style="background-image: url(carImage/' + recommendCars[i].carImage + ');"></div>');
                      html.push('<div class="text">');
                      html.push('<h2 class="mb-0">');
                      html.push('<a href="carView?idx=' + recommendCars[i].cIdx + '">' + recommendCars[i].carName + '</a>');
                      html.push('</h2>');
                      html.push('<div class="d-flex mb-3">');
                      html.push('<a class="cat">' + recommendCars[i].brand + '</a>');
                      html.push('<p class="price ml-auto">');
                      html.push('<span>' + recommendCars[i].vehicleSize + '</span>');
                      html.push('</p>');
                      html.push('</div>');
                      html.push('<p class="recommend">');
                      html.push('<a href="carView?idx=' + recommendCars[i].cIdx + '" class="btn btn-secondary py-2 ml-1">상세보기</a>');
                      html.push('</p>');
                      html.push('</div>');
                      html.push('</div>');
                      html.push('</div>');
                  }

                  // HTML 요소 추가
                  $('.recommend-row').append(html.join(''));
           }
       });
   }
 */
    function carDelete(){
        if(adminCheck == 2){
            $.ajax({
                url : "CarDeleteAjaxController", // 서버 서블릿 경로
                method : "GET", // 요청 방식
                data : {
                    "idx" : cIdx,
                    "adminCheck" : adminCheck,
                },
                success : function(response) {
                    if (response.status === "success") {
                        alert(response.message);
                        window.location.href = "/carList";
                    } else {
                        // 로그인 실패 시 에러 메시지 출력
                        alert(response.message);
                    }
                },
                error : function(xhr, status, error) {
                    console.error('요청 실패: ' + error); // 에러 출력
                }
            });
        }
    }
   
   /* function getRandomElements(arr, num){
       console.log("arr");
       console.log(arr);
      if (num > arr.length) num = arr.length; // 반환할 수 있는 최대 개수 설정
      var shuffle = arr.slice();
      
      for(var i = shuffle.length - 1; i > 0; i--) {
           const j = Math.floor(Math.random() * (i + 1));
           [shuffle[i], shuffle[j]] = [shuffle[j], shuffle[i]];
       }
       // 첫 num개 반환
       return shuffle.slice(0, num);
   } */
   
    function carMainUpdate(){
        window.location.href = "/carMainCreate?idx=" + cIdx;
    }
    function carDetail1Update(){
        window.location.href = "/carDetail1Create?idx=" + cIdx;
    }
    function carDetail2Update(){
        window.location.href = "/carDetail2Create?idx=" + cIdx;
    }
    
   $(document).ready(function() {
      init();
   });
</script>
</html>