-- 1. CarMain에 쏘렌토 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '중형', 'SUV', '쏘렌토', 'kia.png', 'sorento.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 쏘렌토 2.2 디젤 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토'),
    '디젤', '2,151cc', '14.3km/L', 5, 'I4', '전륜', '194hp', '45kg.m', 
    '4,815mm', '1,900mm', '1,700mm', '2,815mm', '1,835kg', '2.2 디젤'
);

-- 3. CarDetail2에 쏘렌토 2.2 디젤 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '프레스티지', '3,778만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '노블레스', '4,064만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '시그니처', '4,375만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '그래비티', '4,464만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 쏘렌토 2.2 디젤 AWD 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토'),
    '디젤', '2,151cc', '13.3km/L', 5, 'I4', '사륜', '194hp', '45kg.m', 
    '4,815mm', '1,900mm', '1,700mm', '2,815mm', '1,835kg', '2.2 디젤 AWD'
);

-- 5. CarDetail2에 쏘렌토 2.2 디젤 AWD 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '프레스티지', '4,010만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '노블레스', '4,296만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '시그니처', '4,607만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '그래비티', '4,696만원');

-------------------------------------------------------------------

-- 6. CarDetail1에 쏘렌토 2.5 가솔린 터보 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토'),
    '가솔린', '2,497cc', '10.8km/L', 5, 'I4', '전륜', '281hp', '43kg.m', 
    '4,815mm', '1,900mm', '1,700mm', '2,815mm', '1,835kg', '2.5 가솔린 터보'
);

-- 7. CarDetail2에 쏘렌토 2.5 가솔린 터보 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '프레스티지', '3,605만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '노블레스', '3,891만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '시그니처', '4,202만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '그래비티', '4,291만원');

-------------------------------------------------------------------

-- 8. CarDetail1에 쏘렌토 2.5 가솔린 터보 AWD 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토'),
    '가솔린', '2,497cc', '9.9km/L', 5, 'I4', '사륜', '194hp', '43kg.m', 
    '4,815mm', '1,900mm', '1,700mm', '2,815mm', '1,835kg', '2.5 가솔린 터보 AWD'
);

-- 9. CarDetail2에 쏘렌토 2.5 가솔린 터보 AWD 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '프레스티지', '3,837만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '노블레스', '4,123만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '시그니처', '4,434만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토')), '그래비티', '4,523만원');

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 쏘렌토 하이브리드 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '중형', 'SUV', '쏘렌토 하이브리드', 'kia.png', 'sorento.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 쏘렌토 하이브리드 1.6 HEV 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토 하이브리드'),
    '가솔린', '1,598cc', '15.7km/L', 5, 'I4', '전륜', '235hp', '43kg.m', 
    '4,815mm', '1,900mm', '1,700mm', '2,815mm', '1,835kg', '1.6 HEV'
);

-- 3. CarDetail2에 쏘렌토 하이브리드 1.6 HEV 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토 하이브리드')), '프레스티지', '3,786만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토 하이브리드')), '노블레스', '4,112만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토 하이브리드')), '시그니처', '4,366만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토 하이브리드')), '그래비티', '4,455만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 쏘렌토 하이브리드 1.6 HEV AWD 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토 하이브리드'),
    '가솔린', '1,598cc', '15.7km/L', 5, 'I4', '사륜', '235hp', '43kg.m', 
    '4,815mm', '1,900mm', '1,700mm', '2,815mm', '1,835kg', '1.6 HEV AWD'
);

-- 5. CarDetail2에 쏘렌토 하이브리드 1.6 HEV AWD 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토 하이브리드')), '프레스티지', '4,161만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토 하이브리드')), '노블레스', '4,488만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토 하이브리드')), '시그니처', '4,742만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘렌토 하이브리드')), '그래비티', '4,831만원');

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 기아 스포티지 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '준중형', 'SUV', '스포티지', 'kia.png', 'sportage.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 기아 스포티지 1.6 가솔린 터보 모델의 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '스포티지'),
    '가솔린', '1,598cc', '12.3km/L', 5, 'I4', '전륜', '180hp', '27kg.m', 
    '4,660mm', '1,865mm', '1,680mm', '2,755mm', '1,565kg', '1.6 가솔린 터보'
);

-- 3. CarDetail2에 1.6 가솔린 터보 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '그래비티', '2,537만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '노블레스', '2,947만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '노블레스 그래비티', '3,066만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '시그니처', '3,274만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '시그니처 그래비티', '3,392만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 기아 스포티지 1.6 가솔린 터보 AWD 모델의 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '스포티지'),
    '가솔린', '1,598cc', '12.3km/L', 5, 'I4', '사륜', '180hp', '27kg.m', 
    '4,660mm', '1,865mm', '1,680mm', '2,755mm', '1,565kg', '1.6 가솔린 터보 AWD'
);

-- 5. CarDetail2에 1.6 가솔린 터보 AWD 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '프레스티지', '2,735만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '노블레스', '3,145만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '노블레스 그래비티', '3,264만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '시그니처', '3,472만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '시그니처 그래비티', '3,590만원');

-------------------------------------------------------------------

-- 6. CarDetail1에 기아 스포티지 2.0 디젤 모델의 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '스포티지'),
    '디젤', '1,998cc', '14.5km/L', 5, 'I4', '전륜', '184hp', '42.5kg.m', 
    '4,660mm', '1,865mm', '1,680mm', '2,755mm', '1,645kg', '2.0 디젤'
);

-- 7. CarDetail2에 2.0 디젤 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '프레스티지', '2,789만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '노블레스', '3,199만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '노블레스 그래비티', '3,318만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '시그니처', '3,526만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '시그니처 그래비티', '3,644만원');

-------------------------------------------------------------------

-- 8. CarDetail1에 기아 스포티지 2.0 디젤 AWD 모델의 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '스포티지'),
    '디젤', '1,998cc', '12.9km/L', 5, 'I4', '사륜', '184hp', '42.5kg.m', 
    '4,660mm', '1,865mm', '1,680mm', '2,755mm', '1,715kg', '2.0 디젤 AWD'
);

-- 9. CarDetail2에 2.0 디젤 AWD 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '프레스티지', '2,789만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '노블레스', '3,199만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '노블레스 그래비티', '3,318만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '시그니처', '3,526만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지')), '시그니처 그래비티', '3,644만원');




/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 스포티지 하이브리드 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '준중형', 'SUV', '스포티지 하이브리드', 'kia.png', 'sportage.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 스포티지 하이브리드 1.6 HEV 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '스포티지 하이브리드'),
    '가솔린', '1,598cc', '16.7km/ℓ', 5, 'I4', '전륜', '230hp', '27kg.m', 
    '4,660mm', '1,865mm', '1,680mm', '2,755mm', '1,635kg', '1.6 HEV'
);

-- 3. CarDetail2에 스포티지 하이브리드 1.6 HEV 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지 하이브리드')), '프레스티지', '3,213만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지 하이브리드')), '노블레스', '3,381만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지 하이브리드')), '노블레스 그래비티', '3,480만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지 하이브리드')), '시그니처', '3,707만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지 하이브리드')), '시그니처 그래비티', '3,806만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 스포티지 하이브리드 1.6 HEV AWD 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '스포티지 하이브리드'),
    '가솔린', '1,598cc', '15.2km/ℓ', 5, 'I4', '사륜', '230hp', '27kg.m', 
    '4,660mm', '1,865mm', '1,680mm', '2,755mm', '1,700kg', '1.6 HEV AWD'
);

-- 5. CarDetail2에 스포티지 하이브리드 1.6 HEV AWD 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지 하이브리드')), '프레스티지', '3,436만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지 하이브리드')), '노블레스', '3,604만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지 하이브리드')), '노블레스 그래비티', '3,703만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지 하이브리드')), '시그니처', '3,930만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '스포티지 하이브리드')), '시그니처 그래비티', '4,029만원');

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 K5 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '중형', '세단', 'K5', 'kia.png', 'k5.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 K5 1.6 가솔린 터보 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'K5'),
    '가솔린', '1,598cc', '13.7km/ℓ', 5, 'I4', '전륜', '180hp', '27kg.m', 
    '4,905mm', '1,860mm', '1,445mm', '2,850mm', '1,480kg', '1.6 가솔린 터보'
);

-- 3. CarDetail2에 K5 1.6 가솔린 터보 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K5')), '프레스티지', '2,868만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K5')), '노블레스', '3,259만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K5')), '시그니처', '3,526만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 K5 2.0 가솔린 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'K5'),
    '가솔린', '1,999cc', '12.6km/ℓ', 5, 'I4', '전륜', '160hp', '20kg.m', 
    '4,905mm', '1,860mm', '1,445mm', '2,850mm', '1,455kg', '2.0 가솔린'
);

-- 5. CarDetail2에 K5 2.0 가솔린 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K5')), '프레스티지', '2,784만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K5')), '노블레스', '3,135만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K5')), '시그니처', '3,447만원');


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 K5 하이브리드 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '중형', '세단', 'K5 하이브리드', 'kia.png', 'k5.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 K5 하이브리드 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'K5 하이브리드'),
    '가솔린', '1,999cc', '19.8km/ℓ', 5, 'I4', '전륜', '195hp', '19.2kg.m', 
    '4,905mm', '1,860mm', '1,445mm', '2,850mm', '1,535kg', '2.0 HEV'
);

-- 3. CarDetail2에 K5 하이브리드 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K5 하이브리드')), '프레스티지', '3,183만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K5 하이브리드')), '노블레스', '3,519만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K5 하이브리드')), '시그니처', '3,811만원');

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 K8 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '준대형', '세단', 'K8', 'kia.png', 'k8.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 K8 2.5 가솔린 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'K8'),
    '가솔린', '2,497cc', '12km/ℓ', 5, 'I4', '전륜', '198hp', '25.3kg.m', 
    '5,015mm', '1,875mm', '1,455mm', '2,895mm', '1,570kg', '2.5 가솔린'
);

-- 3. CarDetail2에 K8 2.5 가솔린 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K8')), '노블레스 라이트', '3,358만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K8')), '노블레스', '3,625만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K8')), '시그니처', '3,986만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K8')), '시그니처 스페셜', '4,154만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 K8 3.5 가솔린 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'K8'),
    '가솔린', '3,470cc', '10.6km/ℓ', 5, 'V6', '전륜', '300hp', '36.6kg.m', 
    '5,015mm', '1,875mm', '1,455mm', '2,895mm', '1,640kg', '3.5 가솔린'
);

-- 5. CarDetail2에 K8 3.5 가솔린 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K8')), '노블레스 라이트', '3,358만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K8')), '노블레스', '3,966만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K8')), '시그니처', '4,298만원');

-------------------------------------------------------------------

-- 6. CarDetail1에 K8 3.5 가솔린 AWD 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'K8'),
    '가솔린', '3,470cc', '9.7km/ℓ', 5, 'V6', '전륜', '300hp', '36.6kg.m', 
    '5,015mm', '1,875mm', '1,455mm', '2,895mm', '1,715kg', '3.5 가솔린 AWD'
);

-- 7. CarDetail2에 K8 3.5 가솔린 AWD 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K8')), '노블레스 라이트', '4,184만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K8')), '노블레스', '4,516만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K8')), '시그니처', '4,624만원');

-------------------------------------------------------------------
/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/



-- 1. CarMain에 K8 하이브리드 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '준대형', '세단', 'K8 하이브리드', 'kia.png', 'k8.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 K8 하이브리드 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'K8 하이브리드'),
    '가솔린', '1,598cc', '18km/ℓ', 5, 'I4', '전륜', '230hp', '27kg.m', 
    '5,015mm', '1,875mm', '1,455mm', '2,895mm', '1,650kg', '1.6 HEV'
);

-- 3. CarDetail2에 K8 하이브리드 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K8 하이브리드')), '노블레스 라이트', '3,782만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K8 하이브리드')), '노블레스', '4,113만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K8 하이브리드')), '시그니처', '4,474만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K8 하이브리드')), '시그니처 스페셜', '4,617만원');

-------------------------------------------------------------------

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 모닝 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '경형', '해치백', '모닝', 'kia.png', 'morning.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 모닝 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '모닝'),
    '가솔린', '998cc', '14.7km/ℓ', 5, 'I4', '전륜', '76hp', '9.7kg.m', 
    '3,595mm', '1,595mm', '1,485mm', '2,400mm', '1,020kg', '1.0 가솔린'
);

-- 3. CarDetail2에 모닝 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '모닝')), '트렌디', '1,325만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '모닝')), '프레스티지', '1,500만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '모닝')), '시그니처', '1,725만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '모닝')), 'GT-Line', '1,820만원');

-------------------------------------------------------------------

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 EV6 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '준중형', 'SUV', 'EV6', 'kia.png', 'EV6.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 EV6 Long Range 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'EV6'),
    '전기', '-', '5.2km/kWh', 5, '-', '전륜', '168kW', '350Nm', 
    '4,695mm', '1,890mm', '1,550mm', '2,900mm', '1,985kg', 'Long Range'
);

-- 3. CarDetail2에 EV6 Long Range 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EV6')), '라이트', '5,260만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EV6')), '에어', '5,530만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EV6')), '어스', '5,935만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EV6')), 'GT-Line', '5,995만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 EV6 Long Range 4WD 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'EV6'),
    '전기', '-', '5.2km/kWh', 5, '-', '사륜', '239kW', '605Nm', 
    '4,695mm', '1,890mm', '1,550mm', '2,900mm', '2,085kg', 'Long Range 4WD'
);

-- 5. CarDetail2에 EV6 Long Range 4WD 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range 4WD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EV6')), '라이트', '5,507만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range 4WD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EV6')), '에어', '5,777만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range 4WD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EV6')), '어스', '6,182만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range 4WD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EV6')), 'GT-Line', '6,242만원');

-------------------------------------------------------------------

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 EV9 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '준대형', 'SUV', 'EV9', 'kia.png', 'EV9.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 EV9 전륜 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'EV9'),
    '전기', '-', '4.2km/kWh', 5, '-', '전륜', '150kW', '350Nm', 
    '5,010mm', '1,980mm', '1,755mm', '3,100mm', '2,425kg', 'EV'
);

-- 3. CarDetail2에 EV9 전륜 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EV9')), '에어', '7,337만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EV9')), '어스', '7,816만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 EV9 사륜 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'EV9'),
    '전기', '-', '4.2km/kWh', 5, '-', '사륜', '150kW', '350Nm', 
    '5,010mm', '1,980mm', '1,755mm', '3,100mm', '2,425kg', 'EV AWD'
);

-- 5. CarDetail2에 EV9 사륜 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EV9')), '에어', '7,816만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EV9')), '어스', '8,169만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EV9')), 'GT-Line', '8,397만원');

-------------------------------------------------------------------

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 니로 하이브리드 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '소형', 'SUV', '니로 하이브리드', 'kia.png', 'niro.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 니로 하이브리드 모델의 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '니로 하이브리드'),
    '가솔린', '1,580cc', '20.8km/ℓ', 5, 'I4', '전륜', '104hp', '14.7kg.m', 
    '4,420mm', '1,825mm', '1,545mm', '2,720mm', '1,445kg', '1.6 HEV'
);

-- 3. CarDetail2에 니로 하이브리드 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '니로 하이브리드')), '트렌디', '2,660만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '니로 하이브리드')), '프레스티지', '2,895만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '니로 하이브리드')), '시그니처', '3,306만원');

-------------------------------------------------------------------



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/
-- 1. CarMain에 니로 EV 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '소형', 'SUV', '니로 EV', 'kia.png', 'niro.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 니로 EV 모델의 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '니로 EV'),
    '전기', '1,580cc', '5.3km/kWh', 5, 'I4', '전륜', '150kW', '255Nm', 
    '4,420mm', '1,825mm', '1,545mm', '2,720mm', '1,705kg', 'EV'
);

-- 3. CarDetail2에 니로 EV 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '니로 EV')), '에어', '4,640만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '니로 EV')), '어스', '4,910만원');

-------------------------------------------------------------------

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 K9 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '대형', '세단', 'K9', 'kia.png', 'k9.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 K9 모델의 세부 사양 삽입 (3.3 가솔린 터보, 전륜)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'K9'),
    '가솔린', '3,342cc', '8.7km/ℓ', 5, 'V6', '전륜', '370hp', '52kg.m', 
    '5,140mm', '1,915mm', '1,490mm', '3,105mm', '2,005kg', '3.3 가솔린 터보'
);

-- 3. CarDetail2에 K9 모델의 트림과 가격 정보 삽입 (3.3 가솔린 터보, 전륜)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.3 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K9')), '플래티넘', '6,468만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 K9 모델의 세부 사양 삽입 (3.3 가솔린 터보 AWD)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'K9'),
    '가솔린', '3,342cc', '8.7km/ℓ', 5, 'V6', '사륜', '370hp', '52kg.m', 
    '5,140mm', '1,915mm', '1,490mm', '3,105mm', '2,075kg', '3.3 가솔린 터보 AWD'
);

-- 5. CarDetail2에 K9 모델의 트림과 가격 정보 삽입 (3.3 가솔린 터보 AWD)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.3 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K9')), '플래티넘', '6,468만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.3 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K9')), '마스터즈', '7,744만원');

-------------------------------------------------------------------

-- 6. CarDetail1에 K9 모델의 세부 사양 삽입 (3.8 가솔린, 전륜)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'K9'),
    '가솔린', '3,778cc', '9km/ℓ', 5, 'V6', '전륜', '315hp', '40.5kg.m', 
    '5,140mm', '1,915mm', '1,490mm', '3,105mm', '2,075kg', '3.8 가솔린'
);

-- 7. CarDetail2에 K9 모델의 트림과 가격 정보 삽입 (3.8 가솔린, 전륜)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.8 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K9')), '플래티넘', '5,815만원');

-------------------------------------------------------------------

-- 8. CarDetail1에 K9 모델의 세부 사양 삽입 (3.8 가솔린 AWD)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'K9'),
    '가솔린', '3,778cc', '8.4km/ℓ', 5, 'V6', '사륜', '315hp', '40.5kg.m', 
    '5,140mm', '1,915mm', '1,490mm', '3,105mm', '2,075kg', '3.8 가솔린 AWD'
);

-- 9. CarDetail2에 K9 모델의 트림과 가격 정보 삽입 (3.8 가솔린 AWD)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.8 가솔린 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K9')), '플래티넘', '6,062만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.8 가솔린 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K9')), '마스터즈', '7,269만원');

-------------------------------------------------------------------

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 카니발 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '대형', 'SUV', '카니발', 'kia.png', 'carnival.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 카니발 모델의 세부 사양 삽입 (2.2 디젤 7인승)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '카니발'),
    '디젤', '2,151cc', '13.1km/ℓ', 7, 'I4', '전륜', '194hp', '45kg.m', 
    '5,155mm', '1,995mm', '1,775mm', '3,090mm', '2,150kg', '2.2 디젤 7인승'
);

-- 3. CarDetail2에 카니발 모델의 트림과 가격 정보 삽입 (2.2 디젤 7인승)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 7인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '노블레스', '4,362만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 7인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '아웃도어', '4,263만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 7인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '시그니처', '4,718만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 7인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '그래비티', '4,800만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 카니발 모델의 세부 사양 삽입 (2.2 디젤 9인승)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '카니발'),
    '디젤', '2,151cc', '13.1km/ℓ', 9, 'I4', '전륜', '194hp', '45kg.m', 
    '5,155mm', '1,995mm', '1,775mm', '3,090mm', '2,115kg', '2.2 디젤 9인승'
);

-- 5. CarDetail2에 카니발 모델의 트림과 가격 정보 삽입 (2.2 디젤 9인승)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 9인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '프레스티지', '3,665만원'), 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 9인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '노블레스', '4,105만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 9인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '시그니처', '4,440만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 9인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '그래비티', '4,543만원');

-------------------------------------------------------------------

-- 6. CarDetail1에 카니발 모델의 세부 사양 삽입 (3.5 가솔린 7인승)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '카니발'),
    '가솔린', '3,470cc', '9km/ℓ', 7, 'V6', '전륜', '294hp', '36.2kg.m', 
    '5,155mm', '1,995mm', '1,775mm', '3,090mm', '2,115kg', '3.5 가솔린 7인승'
);

-- 7. CarDetail2에 카니발 모델의 트림과 가격 정보 삽입 (3.5 가솔린 7인승)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 7인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '노블레스', '4,169만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 7인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '아웃도어', '4,070만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 7인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '시그니처', '4,525만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 7인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '그래비티', '4,607만원');

-------------------------------------------------------------------

-- 8. CarDetail1에 카니발 모델의 세부 사양 삽입 (3.5 가솔린 9인승)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '카니발'),
    '가솔린', '3,470cc', '9km/ℓ', 9, 'V6', '전륜', '294hp', '36.2kg.m', 
    '5,155mm', '1,995mm', '1,775mm', '3,090mm', '2,115kg', '3.5 가솔린 9인승'
);

-- 9. CarDetail2에 카니발 모델의 트림과 가격 정보 삽입 (3.5 가솔린 9인승)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 9인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '프레스티지', '3,470만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 9인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '노블레스', '3,910만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 9인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '시그니처', '4,245만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 9인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발')), '그래비티', '4,348만원');

-------------------------------------------------------------------

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 카니발 하이브리드 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '대형', 'SUV', '카니발 하이브리드', 'kia.png', 'carnival.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 카니발 하이브리드 모델의 세부 사양 삽입 (1.6 HEV 7인승)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '카니발 하이브리드'),
    '가솔린', '1,598cc', '13.5km/ℓ', 7, 'I4', '전륜', '245hp', '27kg.m', 
    '5,155mm', '1,995mm', '1,775mm', '3,090mm', '2,165kg', '1.6 HEV 7인승'
);

-- 3. CarDetail2에 카니발 하이브리드 모델의 트림과 가격 정보 삽입 (1.6 HEV 7인승)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV 7인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발 하이브리드')), '노블레스', '4,619만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV 7인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발 하이브리드')), '아웃도어', '4,520만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV 7인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발 하이브리드')), '시그니처', '4,975만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV 7인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발 하이브리드')), '그래비티', '5,057만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 카니발 하이브리드 모델의 세부 사양 삽입 (1.6 HEV 9인승)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '카니발 하이브리드'),
    '가솔린', '1,598cc', '14km/ℓ', 9, 'I4', '전륜', '245hp', '27kg.m', 
    '5,155mm', '1,995mm', '1,775mm', '3,090mm', '2,165kg', '1.6 HEV 9인승'
);

-- 5. CarDetail2에 카니발 하이브리드 모델의 트림과 가격 정보 삽입 (1.6 HEV 9인승)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV 9인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발 하이브리드')), '프레스티지', '3,925만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV 9인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발 하이브리드')), '노블레스', '4,365만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV 9인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발 하이브리드')), '시그니처', '4,700만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV 9인승' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '카니발 하이브리드')), '그래비티', '4,803만원');

-------------------------------------------------------------------

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 K3 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('국산', '기아', '준중형', '세단', 'K3', 'kia.png', 'k3.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 K3 모델의 세부 사양 삽입 (1.6 가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'K3'),
    '가솔린', '1,598cc', '15.2km/ℓ', 5, 'I4', '전륜', '123hp', '15.7kg.m', 
    '4,645mm', '1,800mm', '1,440mm', '2,700mm', '1,260kg', '1.6 가솔린'
);

-- 3. CarDetail2에 K3 모델의 트림과 가격 정보 삽입 (1.6 가솔린)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K3')), '트렌디', '1,825만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K3')), '프레스티지', '2,151만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'K3')), '시그니처', '2,507만원');


