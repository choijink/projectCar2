<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>carVs</title>
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
   width: 33.33%;
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

.th:nth-child(even), td:nth-child(even) {
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
   flex-wrap: nowrap; /* 차량이 가로로 나란히 표시되도록 */
   gap: 20px; /* 추천 차량 간의 간격 설정 */
}

.progress-bar {
   width: 100%;
   height: 10px;
   background-color: #dedede;
   font-weight: 600;
   font-size: .8rem;
}

.progress1 {
   width: 100%;
   height: 10px;
   padding: 0;
   text-align: center;
   background-color: #f46c46;
   color: #111;
}

.progress2 {
   height: 10px;
   padding: 0;
   text-align: center;
   background-color: #83c4ff;
   color: #111;
}

.text-container {
   display: flex;
   justify-content: space-between;
   padding: 8px;
}

.car-details .img {
   height: 250px !important;
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
               <h1 class="mb-3 bread">차량 비교</h1>
            </div>
         </div>
      </div>
   </section>
   <section class="ftco-section ftco-car-details">
      <div class="container">
         <div class="row justify-content-between">
            <div class="col-md-6 car1">
               <div class="car-details">
                  <div class="img rounded"
                     style="background-image: url(../../../carImage/myCar.png);"></div>
               </div>
               <div class="choice1">
                  <div class="media block-3 services">
                     <div class="media-body py-md-3">
                        <div class="d-flex mb-3 align-items-center">
                           <div class="text">
                              <span class="col">차량 : </span> <select id="carNameSelectBox1"
                                 onChange="carNameSelect(1)"><option value="">선택</option>
                              </select>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="choice1">
                  <div class="media block-3 services">
                     <div class="media-body py-md-3">
                        <div class="d-flex mb-3 align-items-center">
                           <div class="text">
                              <span class="col">등급 : </span> <select id="gradeSelectBox1"
                                 onChange="gradeSelect(1)"><option value="">선택</option>
                              </select>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="choice1">
                  <div class="media block-3 services text-center">
                     <div class="media-body py-md-3">
                        <div class="d-flex mb-3 align-items-center">
                           <div class="text">
                              <span class="col">트림 : </span> <select id="trimSelectBox1"
                                 onChange="trimSelect(1)"><option value="">선택</option>
                              </select>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <%-- 차량 비교 그래프 --%>
               <div class="container">
                  <div class="text-container">
                     <span class="fuelEfficiency1"></span> <span>연비</span>
                  </div>
                  <div class="row justify-content: space-evenly">
                     <div class="progress-bar 1"></div>
                  </div>
                  <div class="text-container">
                     <span class="maxPower1"></span> <span>출력</span>
                  </div>
                  <div class="row justify-content: space-evenly">
                     <div class="progress-bar 2"></div>
                  </div>
                  <div class="text-container">
                     <span class="maxTorque1"></span> <span>토크</span>
                  </div>
                  <div class="row justify-content: space-evenly">
                     <div class="progress-bar 3"></div>
                  </div>
                  <div class="text-container">
                     <span class="displacement1"></span> <span>배기</span>
                  </div>
                  <div class="row justify-content: space-evenly">
                     <div class="progress-bar 4"></div>
                  </div>
                  <div class="text-container">
                     <span class="seatingCapacity1"></span> <span>탑승</span>
                  </div>
                  <div class="row justify-content: space-evenly">
                     <div class="progress-bar 5"></div>
                  </div>
               </div>
            </div>
            <div class="col-md-6 car2">
               <div class="car-details">
                  <div class="img rounded" style="background-image: url(../../../carImage/myCar.png);"></div>
               </div>
               <div class="choice1">
                  <div class="media block-3 services">
                     <div class="media-body py-md-3">
                        <div class="d-flex mb-3 align-items-center">
                           <div class="text">
                              <span class="col">차량 : </span> <select id="carNameSelectBox2"
                                 onChange="carNameSelect(2)"><option value="">1번째 차량을 먼저 선택하세요.</option></select>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="choice1">
                  <div class="media block-3 services">
                     <div class="media-body py-md-3">
                        <div class="d-flex mb-3 align-items-center">
                           <div class="text">
                              <span class="col">등급 : </span> <select id="gradeSelectBox2"
                                 onChange="gradeSelect(2)"><option value="">선택</option></select>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="choice1">
                  <div class="media block-3 services text-center">
                     <div class="media-body py-md-3">
                        <div class="d-flex mb-3 align-items-center">
                           <div class="text">
                              <span class="col">트림 : </span> <select id="trimSelectBox2"
                                 onChange="trimSelect(2)"><option value="">선택</option></select>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <%-- 차량 비교 그래프 --%>
               <div class="container">
                  <div class="text-container">
                     <span>연비</span> <span class="fuelEfficiency2"></span>
                  </div>
                  <div class="row justify-content: space-evenly">
                     <div class="progress-bar 6"></div>
                  </div>
                  <div class="text-container">
                     <span>출력</span> <span class="maxPower2"></span>
                  </div>
                  <div class="row justify-content: space-evenly">
                     <div class="progress-bar 7"></div>
                  </div>
                  <div class="text-container">
                     <span>토크</span> <span class="maxTorque2"></span>
                  </div>
                  <div class="row justify-content: space-evenly">
                     <div class="progress-bar 8"></div>
                  </div>
                  <div class="text-container">
                     <span>배기</span> <span class="displacement2"></span>
                  </div>
                  <div class="row justify-content: space-evenly">
                     <div class="progress-bar 9"></div>
                  </div>
                  <div class="text-container">
                     <span>인원</span> <span class="seatingCapacity2"></span>
                  </div>
                  <div class="row justify-content: space-evenly">
                     <div class="progress-bar 10"></div>
                  </div>
               </div>
            </div>
         </div>
      </div>


      <div class="table-container" style="margin: 60px auto">

         <h2 class="ftco-animate" style="text-align: center">차량 제원</h2>

         <%--     
         <% if ("admin".equals(userRole)) { %>
                <button class="gridButton1">수정</button>
                <button class="gridButton2">삭제</button>
            <% } else { %>
                <button class="gridButton1">비교하기</button>
                <button class="gridButton2">관심등록</button>
            <% } %>
            --%>


         <table style="justify-content: center">
            <thead>
               <tr>
                  <th>세부 사항</th>
                  <th>항목</th>
                  <th>세부 사항</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td class="brand1"></td>
                  <td>제조사</td>
                  <td class="brand2"></td>
               </tr>
               <tr>
                  <td class="model1"></td>
                  <td>모델</td>
                  <td class="model2"></td>
               </tr>
               <tr>
                  <td class="fuelType1"></td>
                  <td>연료타입</td>
                  <td class="fuelType2"></td>
               </tr>
               <tr>
                  <td class="seating1"></td>
                  <td>인승</td>
                  <td class="seating2"></td>
               </tr>
               <tr>
                  <td class="engineType1"></td>
                  <td>엔진형식</td>
                  <td class="engineType2"></td>
               </tr>
               <tr>
                  <td class="driveType1"></td>
                  <td>구동방식</td>
                  <td class="driveType2"></td>
               </tr>
               <tr>
                  <td class="maxPower1"></td>
                  <td>최고출력</td>
                  <td class="maxPower2"></td>
               </tr>
               <tr>
                  <td class="maxTorque1"></td>
                  <td>최대토크</td>
                  <td class="maxTorque2"></td>
               </tr>
               <tr>
                  <td class="fuelEff1"></td>
                  <td>연비</td>
                  <td class="fuelEff2"></td>
               </tr>
               <tr>
                  <td class="displacement1"></td>
                  <td>배기량</td>
                  <td class="displacement2"></td>
               </tr>
               <tr>
                  <td class="length1"></td>
                  <td>전장</td>
                  <td class="length2"></td>
               </tr>
               <tr>
                  <td class="width1"></td>
                  <td>전폭</td>
                  <td class="width2"></td>
               </tr>
               <tr>
                  <td class="height1"></td>
                  <td>전고</td>
                  <td class="height2"></td>
               </tr>
               <tr>
                  <td class="wheelbase1"></td>
                  <td>축거</td>
                  <td class="wheelbase2"></td>
               </tr>
               <tr>
                  <td class="curbweight1"></td>
                  <td>공차중량</td>
                  <td class="curbweight2"></td>
               </tr>
               <tr>
                  <td class="price1"></td>
                  <td>가격</td>
                  <td class="price2"></td>
               </tr>
            </tbody>
         </table>
      </div>
   </section>

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
   const params = new URLSearchParams(window.location.search);
   var gradeParam = params.get('grade');
   var trimParam = params.get('trim');
   
   // cIdx는 차량 select하는 함수로 던져주세요.
   // gradeParam은 grade 선택하는 함수로 던져주세요.
   // trimParam은 trim 선택하는 함수로 던져주세요.
   var cIdx = 0;
      if(params.get('idx') != null) cIdx = params.get('idx');
   var GradeMap = new Map();
   var TrimMap = new Map();
   var carData1 = [] ; // 전체 차량 데이터를 저장하는 전역 변수
   var carData2 = [] ; // 전체 차량 데이터를 저장하는 전역 변수
   
   var selectFirstCarIdx = "";

   function init() {
        carList(0);
   }

   function viewCompare(num){ 
      $.ajax({
         url : "CarViewAjaxController", // 서버 서블릿 경로
         method : "GET", // 요청 방식
         async : false,
         data : {
            "idx" : cIdx
         },
         success : function(response) {
            if(num == 1) {carData1 = response;}
            if(num == 2) {carData2 = response;}
            var CarName = new Set();
            var Grade = new Set();
            var Trim = new Set();
            
            GradeMap.clear();
            TrimMap.clear();
            
            for (var i = 0; i < response.length; i++) {
               CarName.add(response[i].carName); // 모델 이름 추가
               Grade.add(response[i].grade); // 모델 이름 추가
               // carName별로 Grade 추가
                   if (!GradeMap.has(response[i].carName)) {
                      GradeMap.set(response[i].carName, []);
                   }
                   GradeMap.get(response[i].carName).push(response[i].grade);
                   
               if (!TrimMap.has(response[i].grade)) {
                       TrimMap.set(response[i].grade, []);
                   }
                   TrimMap.get(response[i].grade).push(response[i].trim);
            }
         }
      });
   }
   
   
   
   function carNameSelect(num){
      if(num == 1){
         var selectElement = document.getElementById("carNameSelectBox1");
         var selectedValue = selectElement.value;
         if(selectedValue == ""){
         $(".car1 .img.rounded").css('background-image', 'url(../../../carImage/myCar.png)');
         return;
         }
         selectFirstCarIdx = selectedValue;
         var carImage = selectElement.options[selectElement.selectedIndex].id;
         cIdx = selectedValue;
      }
      else if(num == 2){
         var selectElement = document.getElementById("carNameSelectBox2");
         var selectedValue = selectElement.value;
         if(selectedValue == ""){
          $(".car2 .img.rounded").css('background-image', 'url(../../../carImage/myCar.png)');
          return;
          }
         var carImage = selectElement.options[selectElement.selectedIndex].id;
         cIdx = selectedValue;
      }
      
      carImageSelect(carImage, num);
      
      viewCompare(num);
      
      // 선택한 carName에 맞는 grade 목록 가져오기
      if(num==1){
         $('#gradeSelectBox1').empty();
          var html = [];
          html.push('<option value="">선택</option>');
          TrimMap.forEach((valueArray, key) => {
           html.push('<option value="' + key + '">' + key + '</option>'); });
             
          $('#gradeSelectBox1').append(html.join(''));
          if(gradeParam != null){
           $("#gradeSelectBox1").val(gradeParam);
               gradeSelect(1);
           }
        }
       if(num==2){
         $('#gradeSelectBox2').empty();
          var html = [];
          html.push('<option value="">선택</option>');
          TrimMap.forEach((valueArray, key) => {
           html.push('<option value="' + key + '">' + key + '</option>'); });
             
          $('#gradeSelectBox2').append(html.join(''));
      }
   }
   
   function gradeSelect(num) {
      if(num==1){
      $('#trimSelectBox1').empty();
      //$('.table-container table').empty();
      //$('.table-container table').append('<tr><td colspan="4">해당 등급/트림의 정보가 없습니다.</td></tr>');
      
      var selectCarName = document.getElementById("gradeSelectBox1");
      var selectedValue = selectCarName.value;
      
      // 선택한 grade에 맞는 trim 목록 가져오기
       var trimOptions = TrimMap.get(selectedValue) || [];
      
       $('#trimSelectBox1').empty();
       var html = [];
       html.push('<option value="">선택</option>');
       trimOptions.forEach(trim => {
        html.push('<option value="' + trim + '">' + trim + '</option>');
           
       });
          $('#trimSelectBox1').append(html.join(''));
          if(trimParam != null){
             $("#trimSelectBox1").val(trimParam);
             trimSelect(1);
          }
        }
      else if(num==2){
         $('#trimSelectBox2').empty();
         //$('.table-container table').empty();
         //$('.table-container table').append('<tr><td colspan="4">해당 등급/트림의 정보가 없습니다.</td></tr>');
         
         var selectCarName = document.getElementById("gradeSelectBox2");
         var selectedValue = selectCarName.value;
         
         // 선택한 grade에 맞는 trim 목록 가져오기
          var trimOptions = TrimMap.get(selectedValue) || [];
         
          $('#trimSelectBox2').empty();
          var html = [];
          html.push('<option value="">선택</option>');
          trimOptions.forEach(trim => {
          html.push('<option value="' + trim + '">' + trim + '</option>');
              
          });
             $('#trimSelectBox2').append(html.join(''));
      }
   }
   
   function trimSelect(num){
      if(num == 1 && $('#carNameSelectBox1').val() && $('#gradeSelectBox1').val()){
        carList(1);
         viewCompare(num);
         var selectedGrade = $('#gradeSelectBox1').val();
         var selectedTrim = $('#trimSelectBox1').val();
         }
      if(num == 2){
         var selectedGrade = $('#gradeSelectBox2').val();
         var selectedTrim = $('#trimSelectBox2').val();
      }
      // trim 선택에 따라서 테이블 업데이트
      updateTable(selectedGrade, selectedTrim, num);
   }
   
   function updateTable(selectedGrade, selectedTrim, num){
      // 선택된 등급과 트림에 맞는 데이터를 carData 찾기
      var filteredData1 = carData1.find(item => {
         return item.grade === selectedGrade && (!selectedTrim || item.trim === selectedTrim);
      })
      console.log("1");
      console.log(filteredData1);
      var filteredData2 = carData2.find(item => {
         return item.grade === selectedGrade && (!selectedTrim || item.trim === selectedTrim);
      })
      console.log("2");
      console.log(filteredData2);
      if (filteredData1){
       // 정규식을 이용해 숫자와 소수점만 남기고 나머지 문자 제거
        var cleanFuelEfficiency = filteredData1.fuelEfficiency.replace(/[^0-9.]/g, "");
        // 문자열을 숫자로 변환
          var numFuelEfficiency = Number(cleanFuelEfficiency);
          var fuelEfficiencyPercentage = (numFuelEfficiency / 25) * 100;
          var cleanMaxPower = filteredData1.maxPower.replace(/[^0-9.]/g, "");
          var numMaxPower = Number(cleanMaxPower);
          var maxPowerPercentage = (numMaxPower / 800) * 100;
          var cleanMaxTorque = filteredData1.maxTorque.replace(/[^0-9.]/g, "");
          // 문자열을 숫자로 변환하고 소수점이 하나만 남도록 처리 ex)36.6kg.m 일때
          var numMaxTorque = parseFloat(cleanMaxTorque);
        var maxTorquePercentage = ((numMaxTorque >=90 ? numMaxTorque/10 : numMaxTorque)/ 90) * 100;
          var cleanDisplacement = filteredData1.displacement.replace(/[^0-9.]/g, "");
        var numDisplacement = Number(cleanDisplacement);
        var displacementPercentage = (numDisplacement / 5000) * 100;
        var cleanSeatingCapacity = filteredData1.seatingCapacity.replace(/[^0-9.]/g, "");
        var numSeatingCapacity = Number(cleanSeatingCapacity);
        var seatingCapacityPercentage = (numSeatingCapacity / 10) * 100;
         $(".brand1").html(filteredData1.brand);
         $(".model1").html(filteredData1.carName);
         $(".fuelType1").html(filteredData1.fuelType);
         $(".seating1").html(filteredData1.seatingCapacity);
         $(".engineType1").html(filteredData1.engineType);
         $(".driveType1").html(filteredData1.driveType);
         $(".maxPower1").html(filteredData1.maxPower);
         $(".maxTorque1").html(filteredData1.maxTorque);
         $(".fuelEff1").html(filteredData1.fuelEfficiency);
         $(".displacement1").html(filteredData1.displacement);
         $(".length1").html(filteredData1.length);
         $(".width1").html(filteredData1.width);
         $(".height1").html(filteredData1.height);
         $(".wheelbase1").html(filteredData1.wheelBase);
         $(".curbweight1").html(filteredData1.curbWeight);
         $(".price1").html(filteredData1.price);
         $(".fuelEfficiency1").html(filteredData1.fuelEfficiency);
         $(".maxPower1").html(filteredData1.maxPower);
         $(".maxTorque1").html(filteredData1.maxTorque);
         $(".displacement1").html(filteredData1.displacement);
         $(".seatingCapacity1").html(filteredData1.seatingCapacity);
       $(".progress-bar.1").html('<div class="progress1" style="background: linear-gradient(to left, #f46c46 ' + fuelEfficiencyPercentage + '%, transparent ' + fuelEfficiencyPercentage + '%);"></div>');
       $(".progress-bar.2").html('<div class="progress1" style="background: linear-gradient(to left, #f46c46 ' + maxPowerPercentage + '%, transparent ' + maxPowerPercentage + '%);"></div>');
       $(".progress-bar.3").html('<div class="progress1" style="background: linear-gradient(to left, #f46c46 ' + maxTorquePercentage + '%, transparent ' + maxTorquePercentage + '%);"></div>');
       $(".progress-bar.4").html('<div class="progress1" style="background: linear-gradient(to left, #f46c46 ' + displacementPercentage + '%, transparent ' + displacementPercentage + '%);"></div>');
       $(".progress-bar.5").html('<div class="progress1" style="background: linear-gradient(to left, #f46c46 ' + seatingCapacityPercentage + '%, transparent ' + seatingCapacityPercentage + '%);"></div>');
         
         
      }
      if(filteredData2){
       // 정규식을 이용해 숫자와 소수점만 남기고 나머지 문자 제거
          var cleanFuelEfficiency = filteredData2.fuelEfficiency.replace(/[^0-9.]/g, "");
          // 문자열을 숫자로 변환
            var numFuelEfficiency = Number(cleanFuelEfficiency);
            var fuelEfficiencyPercentage = (numFuelEfficiency / 25) * 100;
            var cleanMaxPower = filteredData2.maxPower.replace(/[^0-9.]/g, "");
            var numMaxPower = Number(cleanMaxPower);
            var maxPowerPercentage = (numMaxPower / 800) * 100;
            var cleanMaxTorque = filteredData2.maxTorque.replace(/[^0-9.]/g, "");
            // 문자열을 숫자로 변환하고 소수점이 하나만 남도록 처리 ex)36.6kg.m 일때
            var numMaxTorque = parseFloat(cleanMaxTorque);
            var maxTorquePercentage = ((numMaxTorque >=90 ? numMaxTorque/10 : numMaxTorque)/ 90) * 100;
            var cleanDisplacement = filteredData2.displacement.replace(/[^0-9.]/g, "");
             var numDisplacement = Number(cleanDisplacement);
             var displacementPercentage = (numDisplacement / 5000) * 100;
             var cleanSeatingCapacity = filteredData2.seatingCapacity.replace(/[^0-9.]/g, "");
             var numSeatingCapacity = Number(cleanSeatingCapacity);
             var seatingCapacityPercentage = (numSeatingCapacity / 10) * 100;
         $(".brand2").html(filteredData2.brand);
         $(".model2").html(filteredData2.carName);
         $(".fuelType2").html(filteredData2.fuelType);
         $(".seating2").html(filteredData2.seatingCapacity);
         $(".engineType2").html(filteredData2.engineType);
         $(".driveType2").html(filteredData2.driveType);
         $(".maxPower2").html(filteredData2.maxPower);
         $(".maxTorque2").html(filteredData2.maxTorque);
         $(".fuelEff2").html(filteredData2.fuelEfficiency);
         $(".displacement2").html(filteredData2.displacement);
         $(".length2").html(filteredData2.length);
         $(".width2").html(filteredData2.width);
         $(".height2").html(filteredData2.height);
         $(".wheelbase2").html(filteredData2.wheelBase);
         $(".curbweight2").html(filteredData2.curbWeight);
         $(".price2").html(filteredData2.price);
         $(".fuelEfficiency2").html(filteredData2.fuelEfficiency);
         $(".maxPower2").html(filteredData2.maxPower);
         $(".maxTorque2").html(filteredData2.maxTorque);
         $(".displacement2").html(filteredData2.displacement);
         $(".seatingCapacity2").html(filteredData2.seatingCapacity);
       $(".progress-bar.6").html('<div class="progress2" style="width:' + fuelEfficiencyPercentage + '%"></div>');
       $(".progress-bar.7").html('<div class="progress2" style="width:' + maxPowerPercentage + '%"></div>');
       $(".progress-bar.8").html('<div class="progress2" style="width:' + maxTorquePercentage + '%"></div>');
       $(".progress-bar.9").html('<div class="progress2" style="width:' + displacementPercentage + '%"></div>');
       $(".progress-bar.10").html('<div class="progress2" style="width:' + seatingCapacityPercentage + '%"></div>');
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
   
   function carList(num){
      if(num == 0){
         carListController(function(response){
            var html=[];
            $("#carNameSelectBox1").empty();
            html.push('<option value="">선택</option>');
            response.sort((a, b) => a.carName.localeCompare(b.carName));
            for(var i=0; i < response.length; i++){
               html.push('<option id="' + response[i].carImage + '" value="' + response[i].cIdx + '">' + response[i].carName + '</option>');
            }
            $("#carNameSelectBox1").append(html.join(''));
            
            if(cIdx > 0){
               $("#carNameSelectBox1").val(cIdx);
               carNameSelect(1);
            }
         });
      }
      if(num == 1){
         carListController(function(response){
            $("#carNameSelectBox2").empty();
            var html=[];
            html.push('<option value="">선택</option>');
            response.sort((a, b) => a.carName.localeCompare(b.carName));
            for(var i=0; i < response.length; i++){   
               if(response[i].cIdx != selectFirstCarIdx){
                  html.push('<option id="' + response[i].carImage + '" value="' + response[i].cIdx + '">' + response[i].carName + '</option>');
               }
            }
            $("#carNameSelectBox2").append(html.join(''));
         });
      }
   }
   
   function carImageSelect(carimage, num){
      var html = [];
      if(num == 1){
         $('.car1 .car-details').empty();
         if(carNameSelectBox1.value != null){
            html.push('<div class="img rounded" style="background-image: url(../../../carImage/' + carimage + ');"></div>');
         }
         $('.car1 .car-details').append(html.join(''));
      }
      else if(num == 2){
         $('.car2 .car-details').empty();
         if(carNameSelectBox2.value != null){
            html.push('<div class="img rounded" style="background-image: url(../../../carImage/' + carimage + ');"></div>');
         }
         $('.car2 .car-details').append(html.join(''));
      }
   }
   
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
            callback(response);
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