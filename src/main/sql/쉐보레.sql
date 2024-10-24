-- CarMain 테이블에 데이터 추가
-- CarMain에 쉐보레 콜로라도 모델 삽입 
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) VALUES ('국내', '쉐보레', '준대형', 'SUV', '콜로라도', 'chevrolet.png', 'colorado.png');
 -------------------------------------------------------------------
 -- CarDetail1에 가솔린 모델 정보 삽입 
 INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
 VALUES ( (SELECT c_idx FROM CarMain WHERE CarName = '콜로라도'), '가솔린', '2,726cc', '8.1km/ℓ', 5, 'I4', '사륜', '314hp', '54.0kg.m', '5,410mm', '1,905mm', '1,810mm', '3,337mm', '2,150kg', '2.7 가솔린 터보' );
 -- CarDetail2에 트림 및 가격 정보 삽입 
 INSERT INTO CarDetail2 (cd1_idx, Trim, Price) VALUES (
 (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '콜로라도') AND Grade = '2.7 가솔린 터보'), 'Z71', '7,279만원' );

-----

-- CarMain에 쉐보레 트레일블레이저 모델 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '쉐보레', '소형', 'SUV', '트레일블레이저', 'chevrolet.png', 'trailblazer.png');

-------------------------------------------------------------------

-- CarDetail1에 가솔린 전륜구동 모델 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '트레일블레이저'),  
    '가솔린', '1,341cc', '12.6km/ℓ', 5, 'I3', '전륜', '156hp', '24.1kg.m', 
    '4,410mm', '1,810mm', '1,660mm', '2,640mm', '1,345kg', '1.35 가솔린'
);

-- CarDetail2에 트림 및 가격 정보 삽입 (전륜구동 모델)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '트레일블레이저') AND Grade = '1.35 가솔린'), 
    'Premier', '2,799만원'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '트레일블레이저') AND Grade = '1.35 가솔린'), 
    'ACTIV', '3,099만원'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '트레일블레이저') AND Grade = '1.35 가솔린'), 
    'RS', '3,099만원'
);

-------------------------------------------------------------------

-- CarDetail1에 가솔린 사륜구동 모델 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '트레일블레이저'),  
    '가솔린', '1,341cc', '11.6km/ℓ', 5, 'I3', '사륜', '156hp', '24.1kg.m', 
    '4,425mm', '1,810mm', '1,670mm', '2,640mm', '1,470kg', '1.35 가솔린 AWD'
);

-- CarDetail2에 트림 및 가격 정보 삽입 (사륜구동 모델)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '트레일블레이저') AND Grade = '1.35 가솔린 AWD'), 
    'ACTIV', '3,309만원'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '트레일블레이저') AND Grade = '1.35 가솔린 AWD'), 
    'RS', '3,339만원'
);



-----

-- CarMain에 쉐보레 트랙스 모델 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '쉐보레', '소형', 'SUV', '트랙스', 'chevrolet.png', 'trax.png');

-------------------------------------------------------------------

-- CarDetail1에 가솔린 모델 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '트랙스'),  
    '가솔린', '1,199cc', '12km/ℓ', 5, 'I3', '전륜', '139hp', '22.4kg.m', 
    '4,540mm', '1,825mm', '1,560mm', '2,700mm', '1,300kg', '1.2 가솔린'
);

-- CarDetail2에 트림 및 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '트랙스') AND Grade = '1.2 가솔린'), 
    'LS', '2,188만원'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '트랙스') AND Grade = '1.2 가솔린'), 
    'Redline', '2,595만원'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '트랙스') AND Grade = '1.2 가솔린'), 
    'ACTIV', '2,821만원'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '트랙스') AND Grade = '1.2 가솔린'), 
    'RS', '2,880만원'
);



-----

-- CarMain에 쉐보레 트래버스 모델 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '쉐보레', '준대형', 'SUV', '트래버스', 'chevrolet.png', 'traverse.png');

-------------------------------------------------------------------

-- CarDetail1에 가솔린 모델 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '트래버스'),  
    '가솔린', '3,564cc', '8.3km/ℓ', 7, 'V6', '사륜', '310hp', '36.8kg.m', 
    '5,230mm', '2,000mm', '1,780mm', '3,073mm', '2,090kg', '3.6 가솔린'
);

-- CarDetail2에 트림 및 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '트래버스') AND Grade = '3.6 가솔린'), 
    'LT Leather Premium', '5,640만원'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '트래버스') AND Grade = '3.6 가솔린'), 
    'RS', '5,810만원'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '트래버스') AND Grade = '3.6 가솔린'), 
    'Premier', '6,075만원'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '트래버스') AND Grade = '3.6 가솔린'), 
    'Redline', '6,280만원'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '트래버스') AND Grade = '3.6 가솔린'), 
    'High Country', '6,615만원'
);




-----

-- CarMain에 쉐보레 타호 모델 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '쉐보레', '대형', 'SUV', '타호', 'chevrolet.png', 'tahoe.png');

-------------------------------------------------------------------

-- CarDetail1에 가솔린 모델 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '타호'),  
    '가솔린', '6,162cc', '6.4km/ℓ', 7, 'V8', '사륜', '426hp', '63.6kg.m', 
    '5,350mm', '2,060mm', '1,925mm', '3,071mm', '2,651kg', '6.2 가솔린'
);

-- CarDetail2에 트림 및 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '타호') AND Grade = '6.2 가솔린'), 
    'High Country', '9,390만원'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '타호') AND Grade = '6.2 가솔린'), 
    'Dark Knight', '9,500만원'
);



-----

