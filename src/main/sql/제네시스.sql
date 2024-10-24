
/**/

-- CarMain에 제네시스 G70 모델 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES 
('국산', '제네시스', '중형', '세단', 'G70', 'genesis.png', 'g70.png');

-------------------------------------------------------------------

-- CarDetail1에 2.5 가솔린 터보 후륜구동 모델 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'G70'), 
    '가솔린', '2,497cc', '11.2km/ℓ', 4, 'I4', '후륜구동', '304hp', '43kg.m', 
    '4,685mm', '1,850mm', '1,400mm', '2,835mm', '1,660kg', '2.5 가솔린 터보'
);

-- CarDetail2에 트림 및 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'G70') AND Grade = '2.5 가솔린 터보'), 
    '기본모델', '4,347만원'
);

-------------------------------------------------------------------

-- CarDetail1에 2.5 가솔린 터보 AWD 모델 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'G70'), 
    '가솔린', '2,497cc', '10.6km/ℓ', 4, 'I4', '사륜구동', '304hp', '43kg.m', 
    '4,685mm', '1,850mm', '1,400mm', '2,835mm', '1,725kg', '2.5 가솔린 터보 AWD'
);

-- CarDetail2에 트림 및 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'G70') AND Grade = '2.5 가솔린 터보 AWD'), 
    '기본모델', '4,594만원'
);

-------------------------------------------------------------------

-- CarDetail1에 3.3 가솔린 터보 후륜구동 모델 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'G70'), 
    '가솔린', '3,342cc', '9.4km/ℓ', 4, 'V6', '후륜구동', '370hp', '52kg.m', 
    '4,685mm', '1,850mm', '1,400mm', '2,835mm', '1,725kg', '3.3 가솔린 터보'
);

-- CarDetail2에 트림 및 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'G70') AND Grade = '3.3 가솔린 터보'), 
    '기본모델', '4,842만원'
);

-------------------------------------------------------------------

-- CarDetail1에 3.3 가솔린 터보 AWD 모델 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'G70'), 
    '가솔린', '3,342cc', '8.8km/ℓ', 4, 'V6', '사륜구동', '370hp', '52kg.m', 
    '4,685mm', '1,850mm', '1,400mm', '2,835mm', '1,725kg', '3.3 가솔린 터보 AWD'
);

-- CarDetail2에 트림 및 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'G70') AND Grade = '3.3 가솔린 터보 AWD'), 
    '기본모델', '5,089만원'
);








/**/

-- 1. CarMain에 G80 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국산', '제네시스', '준대형', '세단', 'G80', 'genesis.png', 'g80.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 데이터 삽입 (2.5 가솔린 터보)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'G80'),
    '가솔린', '2,497cc', '10.6km/ℓ', 4, 'I4', '후륜구동', '304hp', '43kg.m', 
    '5,005mm', '1,925mm', '1,465mm', '3,010mm', '1,830kg', '2.5 가솔린 터보'
);

-- 3. CarDetail2에 데이터 삽입 (기본모델)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'G80')),
    '기본모델', '5,890만원'
);

-------------------------------------------------------------------

-- 4. CarDetail1에 데이터 삽입 (2.5 가솔린 터보 AWD)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'G80'),
    '가솔린', '2,497cc', '9.9km/ℓ', 4, 'I4', '사륜구동', '304hp', '43kg.m', 
    '5,005mm', '1,925mm', '1,465mm', '3,010mm', '1,900kg', '2.5 가솔린 터보 AWD'
);

-- 5. CarDetail2에 데이터 삽입 (기본모델)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'G80')),
    '기본모델', '6,170만원'
);

-------------------------------------------------------------------

-- 6. CarDetail1에 데이터 삽입 (3.5 가솔린 터보)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'G80'),
    '가솔린', '3,470cc', '9km/ℓ', 4, 'V6', '후륜구동', '370hp', '54kg.m', 
    '4,685mm', '1,850mm', '1,400mm', '2,835mm', '1,930kg', '3.5 가솔린 터보'
);

-- 7. CarDetail2에 데이터 삽입 (기본모델)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'G80')),
    '기본모델', '6,550만원'
);

-------------------------------------------------------------------

-- 8. CarDetail1에 데이터 삽입 (3.5 가솔린 터보 AWD)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'G80'),
    '가솔린', '3,342cc', '8.3km/ℓ', 4, 'V6', '사륜구동', '370hp', '54kg.m', 
    '4,685mm', '1,850mm', '1,400mm', '2,835mm', '2,000kg', '3.5 가솔린 터보 AWD'
);

-- 9. CarDetail2에 데이터 삽입 (기본모델)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'G80')),
    '기본모델', '6,830만원'
);




/**/
-- 1. CarMain에 G90 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국산', '제네시스', '대형', '세단', 'G90', 'genesis.png', 'g90.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 데이터 삽입 (3.5 가솔린 터보)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'G90'),
    '가솔린', '3,470cc', '9.3km/ℓ', 4, 'V6', '후륜구동', '380hp', '54kg.m', 
    '5,275mm', '1,930mm', '1,490mm', '3,180mm', '2,025kg', '3.5 가솔린 터보'
);

-- 3. CarDetail2에 데이터 삽입 (기본모델)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'G90')),
    '기본모델', '9,540만원'
);

-------------------------------------------------------------------

-- 4. CarDetail1에 데이터 삽입 (3.5 가솔린 터보 AWD)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'G90'),
    '가솔린', '3,470cc', '8.5km/ℓ', 4, 'V6', '사륜구동', '380hp', '54kg.m', 
    '5,275mm', '1,930mm', '1,490mm', '3,180mm', '2,090kg', '3.5 가솔린 터보 AWD'
);

-- 5. CarDetail2에 데이터 삽입 (기본모델)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'G90')),
    '기본모델', '9,890만원'
);

-------------------------------------------------------------------

-- 6. CarDetail1에 데이터 삽입 (3.5 가솔린 터보 MHEV)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'G90'),
    '가솔린', '3,470cc', '9.1km/ℓ', 4, 'V6', '후륜구동', '415hp', '56kg.m', 
    '5,275mm', '1,930mm', '1,490mm', '3,180mm', '2,110kg', '3.5 가솔린 터보 MHEV'
);

-- 7. CarDetail2에 데이터 삽입 (기본모델)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 터보 MHEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'G90')),
    '기본모델', '10,140만원'
);

-------------------------------------------------------------------

-- 8. CarDetail1에 데이터 삽입 (3.5 가솔린 터보 MHEV AWD)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'G90'),
    '가솔린', '3,470cc', '8.2km/ℓ', 4, 'V6', '사륜구동', '415hp', '56kg.m', 
    '5,275mm', '1,930mm', '1,490mm', '3,180mm', '2,175kg', '3.5 가솔린 터보 MHEV AWD'
);

-- 9. CarDetail2에 데이터 삽입 (기본모델 및 Black)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 터보 MHEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'G90')),
    '기본모델', '10,490만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 터보 MHEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'G90')),
    'Black', '13,800만원'
);




-- 1. CarMain에 GV80 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국산', '제네시스', '준대형', 'SUV', 'GV80', 'genesis.png', 'gv80.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 데이터 삽입 (2.5 가솔린 터보)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'GV80'),
    '가솔린', '2,497cc', '9.3km/ℓ', 5, 'I4', '후륜구동', '304hp', '43kg.m', 
    '4,940mm', '1,975mm', '1,715mm', '2,955mm', '2,075kg', '2.5 가솔린 터보'
);

-- 3. CarDetail2에 데이터 삽입 (기본모델)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'GV80')),
    '기본모델', '6,930만원'
);

-------------------------------------------------------------------

-- 4. CarDetail1에 데이터 삽입 (2.5 가솔린 터보 AWD)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'GV80'),
    '가솔린', '2,497cc', '8.9km/ℓ', 5, 'I4', '사륜구동', '304hp', '43kg.m', 
    '4,940mm', '1,975mm', '1,715mm', '2,955mm', '2,155kg', '2.5 가솔린 터보 AWD'
);

-- 5. CarDetail2에 데이터 삽입 (기본모델)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'GV80')),
    '기본모델', '7,280만원'
);

-------------------------------------------------------------------

-- 6. CarDetail1에 데이터 삽입 (3.5 가솔린 터보)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'GV80'),
    '가솔린', '3,470cc', '8.6km/ℓ', 5, 'V6', '후륜구동', '370hp', '52kg.m', 
    '4,940mm', '1,975mm', '1,715mm', '2,955mm', '2,145kg', '3.5 가솔린 터보'
);

-- 7. CarDetail2에 데이터 삽입 (기본모델)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'GV80')),
    '기본모델', '7,480만원'
);

-------------------------------------------------------------------

-- 8. CarDetail1에 데이터 삽입 (3.5 가솔린 터보 AWD)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'GV80'),
    '가솔린', '3,470cc', '7.7km/ℓ', 5, 'V6', '사륜구동', '370hp', '52kg.m', 
    '4,940mm', '1,975mm', '1,715mm', '2,955mm', '2,225kg', '3.5 가솔린 터보 AWD'
);

-- 9. CarDetail2에 데이터 삽입 (기본모델 및 Black)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'GV80')),
    '기본모델', '7,830만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'GV80')),
    'Black', '9,860만원'
);
