/**/

-- CarMain 테이블에 아우디 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '아우디', '준대형', '세단', 'A6', 'audi.png', 'A6.png');

-------------------------------------------------------------------

-- 디젤 모델의 CarDetail1 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'A6'),
    '디젤', '1,968cc', '15km/ℓ', 4, 'I4', '전륜구동', '204hp', '40.8kg.m', '4,940mm', '1,885mm', '1,460mm', '2,924mm', '1,765kg', '40 TDI'
);

-- 디젤 모델의 CarDetail2 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'A6') AND Grade = '40 TDI'),
    'S Tronic', '7,100만원'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'A6') AND Grade = '40 TDI'),
    'Premium S Tronic', '7,810만원'
);

-------------------------------------------------------------------

-- 가솔린 모델의 CarDetail1 정보 삽입 (45 TFSI)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'A6'),
    '가솔린', '1,984cc', '11km/ℓ', 4, 'I4', '전륜구동', '265hp', '37.7kg.m', '4,940mm', '1,885mm', '1,460mm', '2,924mm', '1,740kg', '45 TFSI'
);

-- 가솔린 모델의 CarDetail2 정보 삽입 (45 TFSI)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'A6') AND Grade = '45 TFSI'),
    'S Tronic', '7,240만원'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'A6') AND Grade = '45 TFSI'),
    'Premium S Tronic', '7,950만원'
);

-------------------------------------------------------------------

-- 사륜구동 가솔린 모델의 CarDetail1 정보 삽입 (45 TFSI Quattro)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'A6'),
    '가솔린', '1,984cc', '10.7km/ℓ', 4, 'I4', '사륜구동', '265hp', '37.7kg.m', '4,950mm', '1,885mm', '1,460mm', '2,924mm', '1,795kg', '45 TFSI Quattro'
);

-- 사륜구동 가솔린 모델의 CarDetail2 정보 삽입 (45 TFSI Quattro)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'A6') AND Grade = '45 TFSI Quattro'),
    'Premium S Tronic', '8,250만원'
);



/**/

-- CarMain 테이블에 아우디 A5 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '아우디', '중형', '세단', 'A5', 'audi.png', 'A5.png');

-------------------------------------------------------------------

-- CarDetail1 테이블에 A5 차량의 세부 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'A5'),
    '가솔린', '1,984cc', '11.2km/ℓ', 4, 'I4', '사륜구동', '265hp', '37.7kg.m', '4,765mm', '1,845mm', '1,400mm', '2,825mm', '1,685kg', '45 TFSI Quattro'
);

-- CarDetail2 테이블에 A5 차량의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'A5') AND Grade = '45 TFSI Quattro'),
    'Premium', '7,114만원'
);

/**/

-- CarMain 테이블에 아우디 S7 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '아우디', '준대형', '세단', 'S7', 'audi.png', 'S7.png');

-------------------------------------------------------------------

-- CarDetail1 테이블에 S7 차량의 세부 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'S7'),
    '가솔린', '2,967cc', '11.5km/ℓ', 4, 'V6', '사륜구동', '344hp', '71.3kg.m', '4,980mm', '1,910mm', '1,420mm', '2,928mm', '2,135kg', '3.0 TDI Quattro'
);

-- CarDetail2 테이블에 S7 차량의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'S7') AND Grade = '3.0 TDI Quattro'),
    'A/T', '12,860만원'
);

/**/

-- CarMain 테이블에 아우디 RS7 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '아우디', '준대형', '세단', 'RS7', 'audi.png', 'RS7.png');

-------------------------------------------------------------------

-- CarDetail1 테이블에 RS7 차량의 세부 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'RS7'),
    '가솔린', '3,996cc', '7.3km/ℓ', 4, 'V8', '사륜구동', '630hp', '86.7kg.m', '5,010mm', '1,950mm', '1,435mm', '2,929mm', '2,140kg', '4.0 TFSI Quattro'
);

-- CarDetail2 테이블에 RS7 차량의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'RS7') AND Grade = '4.0 TFSI Quattro'),
    'Performance', '18,180만원'
);

/**/

-- CarMain 테이블에 아우디 A7 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '아우디', '준대형', '세단', 'A7', 'audi.png', 'A7.png');

-------------------------------------------------------------------

-- CarDetail1 테이블에 A7 차량의 첫 번째 세부 정보 삽입 (50 TDI Quattro)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'A7'),
    '가솔린', '2,967cc', '11.9km/ℓ', 4, 'V6', '사륜구동', '286hp', '63.2kg.m', '4,975mm', '1,910mm', '1,425mm', '2,926mm', '2,060kg', '50 TDI Quattro'
);

-- CarDetail2 테이블에 A7 차량의 첫 번째 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'A7') AND Grade = '50 TDI Quattro'),
    'Premium', '10,570만원'
);

-------------------------------------------------------------------

-- CarDetail1 테이블에 A7 차량의 두 번째 세부 정보 삽입 (55 TFSI Quattro)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'A7'),
    '가솔린', '2,995cc', '9.5km/ℓ', 4, 'V6', '사륜구동', '340hp', '50.9kg.m', '4,975mm', '1,910mm', '1,425mm', '2,926mm', '1,970kg', '55 TFSI Quattro'
);

-- CarDetail2 테이블에 A7 차량의 두 번째 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'A7') AND Grade = '55 TFSI Quattro'),
    'Premium', '10,780만원'
);

/**/

-- CarMain 테이블에 아우디 SQ7 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '아우디', '준대형', 'SUV', 'SQ7', 'audi.png', 'SQ7.png');

-------------------------------------------------------------------

-- CarDetail1 테이블에 SQ7 차량의 세부 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'SQ7'),
    '가솔린', '3,996cc', '6.7km/ℓ', 5, 'V8', '사륜구동', '507hp', '78.5kg.m', '5,065mm', '1,970mm', '1,700mm', '3,003mm', '2,435kg', '4.0 TFSI Quattro'
);

-- CarDetail2 테이블에 SQ7 차량의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'SQ7') AND Grade = '4.0 TFSI Quattro'),
    'TipTronic', '14,800만원'
);

/**/

-- CarMain 테이블에 아우디 Q8 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '아우디', '준대형', 'SUV', 'Q8', 'audi.png', 'Q8.png');

-------------------------------------------------------------------

-- CarDetail1 테이블에 Q8 차량의 첫 번째 세부 정보 삽입 (45 TDI Quattro)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'Q8'),
    '디젤', '2,967cc', '10.2km/ℓ', 5, 'V6', '사륜구동', '231hp', '50.9kg.m', '4,985mm', '1,995mm', '1,705mm', '2,995mm', '2,305kg', '45 TDI Quattro'
);

-- CarDetail2 테이블에 Q8 차량의 첫 번째 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'Q8') AND Grade = '45 TDI Quattro'),
    'A/T', '10,443만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'Q8') AND Grade = '45 TDI Quattro'),
    'Premium', '11,180만원'
);

-------------------------------------------------------------------

-- CarDetail1 테이블에 Q8 차량의 두 번째 세부 정보 삽입 (50 TDI Quattro)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'Q8'),
    '디젤', '2,967cc', '10.1km/ℓ', 5, 'V6', '사륜구동', '286hp', '61.1kg.m', '5,005mm', '1,995mm', '1,750mm', '2,995mm', '2,360kg', '50 TDI Quattro'
);

-- CarDetail2 테이블에 Q8 차량의 두 번째 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'Q8') AND Grade = '50 TDI Quattro'),
    'Premium', '12,480만원'
);

-------------------------------------------------------------------

-- CarDetail1 테이블에 Q8 차량의 세 번째 세부 정보 삽입 (55 TSI Quattro)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'Q8'),
    '가솔린', '2,995cc', '8.2km/ℓ', 5, 'V6', '사륜구동', '340hp', '51kg.m', '5,005mm', '1,995mm', '1,750mm', '2,996mm', '2,230kg', '55 TFSI Quattro'
);

-- CarDetail2 테이블에 Q8 차량의 세 번째 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'Q8') AND Grade = '55 TFSI Quattro'),
    'Premium', '12,680만원'
);

/**/

-- CarMain 테이블에 아우디 Q7 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '아우디', '준대형', 'SUV', 'Q7', 'audi.png', 'Q7.png');

-------------------------------------------------------------------

-- CarDetail1 테이블에 Q7 차량의 첫 번째 세부 정보 삽입 (45 TDI Quattro)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'Q7'),
    '디젤', '2,967cc', '10.6km/ℓ', 5, 'V6', '사륜구동', '231hp', '50.9kg.m', '5,065mm', '1,970mm', '1,740mm', '2,996mm', '2,245kg', '45 TDI Quattro'
);

-- CarDetail2 테이블에 Q7 차량의 첫 번째 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'Q7') AND Grade = '45 TDI Quattro'),
    'A/T', '10,240만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'Q7') AND Grade = '45 TDI Quattro'),
    'Premium', '10,820만원'
);

-------------------------------------------------------------------

-- CarDetail1 테이블에 Q7 차량의 두 번째 세부 정보 삽입 (50 TDI Quattro)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'Q7'),
    '디젤', '2,967cc', '11km/ℓ', 5, 'V6', '사륜구동', '286hp', '61.1kg.m', '5,065mm', '1,970mm', '1,780mm', '2,999mm', '2,415kg', '50 TDI Quattro'
);

-- CarDetail2 테이블에 Q7 차량의 두 번째 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'Q7') AND Grade = '50 TDI Quattro'),
    'Premium', '11,950만원'
);

-------------------------------------------------------------------

-- CarDetail1 테이블에 Q7 차량의 세 번째 세부 정보 삽입 (55 TSI Quattro)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'Q7'),
    '가솔린', '2,967cc', '8.1km/ℓ', 5, 'V6', '사륜구동', '340hp', '51kg.m', '5,065mm', '1,970mm', '1,780mm', '2,999mm', '2,310kg', '55 TSI Quattro'
);

-- CarDetail2 테이블에 Q7 차량의 세 번째 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'Q7') AND Grade = '55 TSI Quattro'),
    'Premium', '12,150만원'
);

/**/

-- CarMain 테이블에 아우디 Q8 e-트론 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '아우디', '준대형', 'SUV', 'Q8 e-트론', 'audi.png', 'Q8_e.png');

-------------------------------------------------------------------

-- CarDetail1 테이블에 Q8 e-트론 차량의 첫 번째 세부 정보 삽입 (50 Quattro)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'Q8 e-트론'),
    '-', '-', '-', 5, '-', '사륜구동', '250kW', '664Nm', '4,915mm', '1,935mm', '1,640mm', '2,928mm', '2,630kg', '50 Quattro'
);

-- CarDetail2 테이블에 Q8 e-트론 차량의 첫 번째 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'Q8 e-트론') AND Grade = '50 Quattro'),
    'A/T', '10,860만원'
);

-------------------------------------------------------------------

-- CarDetail1 테이블에 Q8 e-트론 차량의 두 번째 세부 정보 삽입 (55 Quattro)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'Q8 e-트론'),
    '-', '-', '-', 5, '-', '사륜구동', '300kW', '664Nm', '4,915mm', '1,935mm', '1,640mm', '2,928mm', '2,670kg', '55 Quattro'
);

-- CarDetail2 테이블에 Q8 e-트론 차량의 두 번째 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'Q8 e-트론') AND Grade = '55 Quattro'),
    'A/T', '12,060만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'Q8 e-트론') AND Grade = '55 Quattro'),
    'Premium', '13,160만원'
);

/**/

-- CarMain 테이블에 아우디 S8 L 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '아우디', '대형', '세단', 'S8 L', 'audi.png', 'S8_L.png');

-------------------------------------------------------------------

-- CarDetail1 테이블에 S8 L 차량의 세부 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'S8 L'),
    '가솔린', '3,996cc', '7.6km/ℓ', 4, 'V8', '사륜구동', '571hp', '81.5kg.m', '5,320mm', '1,945mm', '1,500mm', '3,128mm', '2,355kg', '4.0 TFSI Quattro'
);

-- CarDetail2 테이블에 S8 L 차량의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'S8 L') AND Grade = '4.0 TFSI Quattro'),
    'A/T', '21,630만원'
);

/**/

-- CarMain 테이블에 아우디 SQ5 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '아우디', '중형', 'SUV', 'SQ5', 'audi.png', 'SQ5.png');

-------------------------------------------------------------------

-- CarDetail1 테이블에 SQ5 차량의 세부 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'SQ5'),
    '가솔린', '2,995cc', '8.6km/ℓ', 5, 'V6', '사륜구동', '354hp', '50.9kg.m', '4,680mm', '1,895mm', '1,640mm', '2,825mm', '1,995kg', '3.0 TFSI Quattro'
);

-- CarDetail2 테이블에 SQ5 차량의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'SQ5') AND Grade = '3.0 TFSI Quattro'),
    'Tiptronic', '9,699만원'
);



/**/

-- CarMain 테이블에 아우디 A8 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '아우디', '대형', '세단', 'A8', 'audi.png', 'A8.png');

-------------------------------------------------------------------

-- CarDetail1 테이블에 A8 차량의 세부 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'A8'),
    '디젤', '2,967cc', '11.4km/ℓ', 4, 'V6', '사륜구동', '286hp', '61.1kg.m', '5,190mm', '1,945mm', '1,510mm', '2,998mm', '2,180kg', '50 TDI Quattro'
);

-- CarDetail2 테이블에 A8 차량의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'A8') AND Grade = '50 TDI Quattro'),
    'Premium Tiptronic', '14,440만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'A8') AND Grade = '50 TDI Quattro'),
    'Black Edition', '14,038만원'
);

/**/


