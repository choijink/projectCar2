-- 1. CarMain에 AMG A클래스 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '벤츠', '준중형', '해치백', 'AMG A클래스', 'benz.png', 'amgaclasshach.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 데이터 삽입 (A45S AMG 4MATIC)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'AMG A클래스'),
    '가솔린', '1,991cc', '9.1km/ℓ', 5, 'I4', '사륜', '421hp', '51kg.m', 
    '4,455mm', '1,850mm', '1,410mm', '2,730mm', '1,655kg', 'A45S AMG 4MATIC'
);

-------------------------------------------------------------------

-- 3. CarDetail2에 데이터 삽입 (DCT 및 Limited Edition)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'A45S AMG 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'AMG A클래스')),
    'DCT', '7,980만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'A45S AMG 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'AMG A클래스')),
    'Limited Edition', '8,880만원'
);


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/
-------------------------------------------------------------------
-- 1. CarMain에 AMG CLA클래스 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', '벤츠', '준중형', '세단', 'AMG CLA클래스', 'benz.png', 'amgclaclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 데이터 삽입 (CLA45S AMG 4MATIC+)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'AMG CLA클래스'),
    '가솔린', '1,991cc', '9.2km/ℓ', 5, 'I4', '사륜', '421hp', '51kg.m', 
    '4,700mm', '1,855mm', '1,405mm', '2,730mm', '1,695kg', 'CLA45S AMG 4MATIC+'
);

-------------------------------------------------------------------

-- 3. CarDetail2에 데이터 삽입 (DCT)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'CLA45S AMG 4MATIC+' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'AMG CLA클래스')),
    'DCT', '9,000만원'
);

-------------------------------------------------------------------
/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 EQE 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', '벤츠', '준대형', '세단', 'EQE', 'benz.png', 'eqe.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 EQE350+ 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'EQE'),
    '전기', '-', '4.3km/kWh', 5, '-', '후륜', '215kW', '565Nm', 
    '4,965mm', '1,905mm', '1,510mm', '3,120mm', '2,355kg', 'EQE350+'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EQE350+' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EQE')),
    'A/T', '10,350만원'
);

-------------------------------------------------------------------

-- 3. CarDetail1에 EQE350 4MATIC 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'EQE'),
    '전기', '-', '4km/kWh', 5, '-', '사륜', '215kW', '765Nm', 
    '4,965mm', '1,905mm', '1,510mm', '3,120mm', '2,465kg', 'EQE350 4MATIC'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EQE350 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EQE')),
    'A/T', '10,990만원'
);


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 EQE SUV 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', '벤츠', '준대형', 'SUV', 'EQE SUV', 'benz.png', 'eqesuv.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 EQE350 4MATIC 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'EQE SUV'),
    '전기', '-', '3.9km/kWh', 5, '-', '사륜', '215kW', '765Nm', 
    '4,870mm', '1,920mm', '1,685mm', '3,030mm', '2,540kg', 'EQE350 4MATIC'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EQE350 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EQE SUV')),
    'A/T', '10,990만원'
);

-------------------------------------------------------------------

-- 3. CarDetail1에 EQE500 4MATIC 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'EQE SUV'),
    '전기', '-', '3.8km/kWh', 5, '-', '사륜', '300kW', '858Nm', 
    '4,880mm', '1,930mm', '1,685mm', '3,030mm', '2,510kg', 'EQE500 4MATIC'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EQE500 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EQE SUV')),
    'A/T', '13,300만원'
);

-------------------------------------------------------------------

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 GLE 클래스 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', '벤츠', '준대형', 'SUV', 'GLE클래스', 'benz.png', 'gleclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 GLE300d 4MATIC 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'GLE클래스'),
    '디젤', '1,993cc', '11.4km/ℓ', 5, 'I4', '사륜', '269hp', '56.1kg.m', 
    '4,925mm', '2,010mm', '1,780mm', '2,995mm', '2,460kg', 'GLE300d 4MATIC'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'GLE300d 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'GLE클래스')),
    'A/T', '11,400만원'
);

-------------------------------------------------------------------

-- 3. CarDetail1에 GLE450 4MATIC 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'GLE클래스'),
    '가솔린', '2,999cc', '8.5km/ℓ', 5, 'I6', '사륜', '381hp', '51kg.m', 
    '4,925mm', '2,020mm', '1,780mm', '2,995mm', '2,435kg', 'GLE450 4MATIC'
);

INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'GLE450 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'GLE클래스')),
    'A/T', '13,430만원'
);

-------------------------------------------------------------------

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 AMG GLE 클래스 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', '벤츠', '준대형', 'SUV', 'AMG GLE클래스', 'benz.png', 'amggleclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 GLE53 AMG 4MATIC+ 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'AMG GLE클래스'),
    '가솔린', '2,999cc', '8km/ℓ', 5, 'I6', '사륜', '435hp', '57.1kg.m', 
    '4,935mm', '2,015mm', '1,780mm', '2,995mm', '2,445kg', 'GLE53 AMG 4MATIC+'
);

-- 3. CarDetail2에 GLE53 AMG 4MATIC+ 모델 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'GLE53 AMG 4MATIC+' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'AMG GLE클래스')),
    'A/T', '15,500만원'
);

-------------------------------------------------------------------

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/




-- 1. CarMain에 AMG GT 4도어 쿠페 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', '벤츠', '대형', '세단', 'AMG GT 4도어 쿠페', 'benz.png', 'amggt4door.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 AMG GT 43 4MATIC+ 모델 세부 사양 삽입 (첫 번째)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'AMG GT 4도어 쿠페'),
    '가솔린', '2,999cc', '8.2km/ℓ', 4, 'I6', '사륜', '389hp', '51kg.m', 
    '5,055mm', '1,955mm', '1,455mm', '2,950mm', '2,085kg', 'AMG GT 43 4MATIC+'
);

-- 3. CarDetail2에 AMG GT 43 4MATIC+ 모델 트림과 가격 정보 삽입 (첫 번째)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'AMG GT 43 4MATIC+' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'AMG GT 4도어 쿠페')),
    'A/T', '15,560만원'
);
-- 5. CarDetail2에 AMG GT 43 4MATIC+ 모델 트림과 가격 정보 삽입 (두 번째)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'AMG GT 43 4MATIC+' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'AMG GT 4도어 쿠페')),
    'Dynamic', '17,060만원'
);

-------------------------------------------------------------------

-- 6. CarDetail1에 AMG GT 63 S 4MATIC+ 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'AMG GT 4도어 쿠페'),
    '가솔린', '3,982cc', '6.7km/ℓ', 4, 'V8', '사륜', '639hp', '91.7kg.m', 
    '5,055mm', '1,955mm', '1,455mm', '2,950mm', '2,160kg', 'AMG GT 63 S 4MATIC+'
);

-- 7. CarDetail2에 AMG GT 63 S 4MATIC+ 모델 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'AMG GT 63 S 4MATIC+' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'AMG GT 4도어 쿠페')),
    'A/T', '24,740만원'
);

-------------------------------------------------------------------
/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 EQS SUV 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', '벤츠', '대형', 'SUV', 'EQS SUV', 'benz.png', 'eqssuv.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 EQS450 4MATIC 모델 세부 사양 삽입 (첫 번째)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'EQS SUV'),
    '전기', '-', '3.6km/kWh', 5, '-', '사륜', '265kW', '800Nm', 
    '5,125mm', '2,035mm', '1,720mm', '3,210mm', '2,850kg', 'EQS450 4MATIC'
);

-- 3. CarDetail2에 EQS450 4MATIC 모델 트림과 가격 정보 삽입 (첫 번째)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EQS450 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EQS SUV')),
    'A/T', '16,000만원'
);

-------------------------------------------------------------------

-- 4. CarDetail1에 EQS580 4MATIC 모델 세부 사양 삽입 (두 번째)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'EQS SUV'),
    '전기', '-', '3.5km/kWh', 5, '-', '사륜', '400kW', '858Nm', 
    '5,135mm', '2,035mm', '1,720mm', '3,210mm', '2,890kg', 'EQS580 4MATIC'
);

-- 5. CarDetail2에 EQS580 4MATIC 모델 트림과 가격 정보 삽입 (두 번째)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EQS580 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EQS SUV')),
    'A/T', '18,750만원'
);

-------------------------------------------------------------------
/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 GLS클래스 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', '벤츠', '대형', 'SUV', 'GLS클래스', 'benz.png', 'glsclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 GLS450d 4MATIC 모델 세부 사양 삽입 (첫 번째)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'GLS클래스'),
    '디젤', '2,989cc', '10.4km/ℓ', 7, 'I6', '사륜', '367hp', '76.5kg.m', 
    '5,220mm', '2,030mm', '1,825mm', '3,135mm', '2,635kg', 'GLS450d 4MATIC'
);

-- 3. CarDetail2에 GLS450d 4MATIC 모델 트림과 가격 정보 삽입 (첫 번째)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'GLS450d 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'GLS클래스')),
    'A/T', '16,160만원'
);

-------------------------------------------------------------------

-- 4. CarDetail1에 GLS580 4MATIC 모델 세부 사양 삽입 (두 번째)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'GLS클래스'),
    '가솔린', '3,982cc', '6km/ℓ', 7, 'V8', '사륜', '549hp', '78.5kg.m', 
    '5,215mm', '2,030mm', '1,840mm', '3,135mm', '2,670kg', 'GLS580 4MATIC'
);

-- 5. CarDetail2에 GLS580 4MATIC 모델 트림과 가격 정보 삽입 (두 번째)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'GLS580 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'GLS클래스')),
    'A/T', '18,150만원'
);

-------------------------------------------------------------------

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 EQS 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', '벤츠', '대형', '세단', 'EQS', 'benz.png', 'eqs.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 EQS450+ 모델 세부 사양 삽입 (첫 번째)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'EQS'),
    '전기', '-', '3.8km/kWh', 5, '-', '후륜', '245kW', '568Nm', 
    '5,225mm', '1,925mm', '1,520mm', '3,210mm', '2,570kg', 'EQS450+'
);

-- 3. CarDetail2에 EQS450+ 모델 트림과 가격 정보 삽입 (첫 번째)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EQS450+' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EQS')),
    'A/T', '16,390만원'
);

-------------------------------------------------------------------

-- 4. CarDetail1에 EQS450 4MATIC 모델 세부 사양 삽입 (두 번째)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'EQS'),
    '전기', '-', '3.5km/kWh', 5, '-', '사륜', '265kW', '800Nm', 
    '5,225mm', '1,925mm', '1,510mm', '3,210mm', '2,590kg', 'EQS450 4MATIC'
);

-- 5. CarDetail2에 EQS450 4MATIC 모델 트림과 가격 정보 삽입 (두 번째)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EQS450 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EQS')),
    'A/T', '19,000만원'
);

-------------------------------------------------------------------
/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 G클래스 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', '벤츠', '중형', 'SUV', 'G클래스', 'benz.png', 'gclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 G450d 4MATIC 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'G클래스'),
    '디젤', '2,989cc', '10km/ℓ', 5, 'I6', '사륜', '387hp', '96.9kg.m', 
    '4,865mm', '1,985mm', '1,980mm', '2,890mm', '2,565kg', 'G450d 4MATIC'
);

-- 3. CarDetail2에 G450d 4MATIC 모델 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'G450d 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'G클래스')),
    'A/T', '18,500만원'
);

-------------------------------------------------------------------
/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 S클래스 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', '벤츠', '대형', '세단', 'S클래스', 'benz.png', 'sclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 S450 4MATIC Long 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'S클래스'),
    '가솔린', '2,999cc', '9.7km/ℓ', 5, 'I6', '사륜', '381hp', '51kg.m', 
    '5,290mm', '1,920mm', '1,505mm', '3,216mm', '2,155kg', 'S450 4MATIC Long'
);

-- 3. CarDetail2에 S450 4MATIC Long 모델 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'S450 4MATIC Long' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'S클래스')),
    'A/T', '18,520만원'
);

-------------------------------------------------------------------

-- 4. CarDetail1에 S500 4MATIC Long 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'S클래스'),
    '가솔린', '2,999cc', '9.4km/ℓ', 5, 'I6', '사륜', '449hp', '57.1kg.m', 
    '5,320mm', '1,920mm', '1,505mm', '3,216mm', '2,225kg', 'S500 4MATIC Long'
);

-- 5. CarDetail2에 S500 4MATIC Long 모델 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'S500 4MATIC Long' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'S클래스')),
    'A/T', '20,630만원'
);

-------------------------------------------------------------------

-- 6. CarDetail1에 S580 4MATIC Long 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'S클래스'),
    '가솔린', '3,982cc', '8km/ℓ', 5, 'V8', '사륜', '503hp', '71.4kg.m', 
    '5,290mm', '1,920mm', '1,505mm', '3,216mm', '2,255kg', 'S580 4MATIC Long'
);

-- 7. CarDetail2에 S580 4MATIC Long 모델 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'S580 4MATIC Long' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'S클래스')),
    'A/T', '24,990만원'
);

-------------------------------------------------------------------
/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


-- 1. CarMain에 A클래스 해치백 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '벤츠', '준중형', '해치백', 'A클래스', 'benz.png', 'aclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 A220 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'A클래스'),
    '가솔린', '1,991cc', '12.2km/ℓ', 5, 'I4', '전륜', '190hp', '30.6kg.m', 
    '4,430mm', '1,795mm', '1,445mm', '2,730mm', '1,485kg', 'A220'
);

-- 3. CarDetail2에 A220 모델 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'A220' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'A클래스')),
    'DCT', '4,770만원'
);


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 A클래스 세단 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '벤츠', '준중형', '세단', 'A클래스 세단', 'benz.png', 'aclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 A220 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'A클래스 세단'),
    '가솔린', '1,991cc', '12.5km/ℓ', 5, 'I4', '전륜', '190hp', '30.6kg.m', 
    '4,560mm', '1,795mm', '1,445mm', '2,730mm', '1,495kg', 'A220'
);

-------------------------------------------------------------------

-- 3. CarDetail2에 A220 모델 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES (
    (SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'A220' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'A클래스 세단')),
    'DCT', '4,950만원'
);


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 CLA클래스 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '벤츠', '준중형', '세단', 'CLA클래스', 'benz.png', 'claclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 CLA250 4MATIC 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'CLA클래스'),
    '가솔린', '1,991cc', '12km/ℓ', 5, 'I4', '사륜', '224hp', '35.7kg.m', 
    '4,690mm', '1,830mm', '1,435mm', '2,730mm', '1,630kg', 'CLA250 4MATIC'
);

-------------------------------------------------------------------

-- 3. CarDetail2에 CLA250 모델 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'CLA250 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'CLA클래스')), 'Progressive', '5,820만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'CLA250 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'CLA클래스')), 'AMG Line', '6,320만원');



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 C클래스 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '벤츠', '중형', '세단', 'C클래스', 'benz.png', 'cclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 C200 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'C클래스'),
    '가솔린', '1,999cc', '11.7km/ℓ', 5, 'I4', '후륜', '204hp', '32.6kg.m', 
    '4,795mm', '1,820mm', '1,455mm', '2,865mm', '1,705kg', 'C200'
);

-------------------------------------------------------------------

-- 3. CarDetail2에 C200 모델 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'C200' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'C클래스')), 'Avantgarde', '6,200만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'C200' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'C클래스')), 'AMG Line', '6,500만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 C300 4MATIC 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'C클래스'),
    '가솔린', '1,999cc', '11.1km/ℓ', 5, 'I4', '사륜', '258hp', '40.8kg.m', 
    '4,795mm', '1,820mm', '1,455mm', '2,865mm', '1,770kg', 'C300 4MATIC'
);

-------------------------------------------------------------------

-- 5. CarDetail2에 C300 4MATIC 모델 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'C300 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'C클래스')), 'Avantgarde', '6,880만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'C300 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'C클래스')), 'AMG Line', '7,600만원');



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 GLB클래스 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '벤츠', '준중형', 'SUV', 'GLB클래스', 'benz.png', 'glbclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 GLB200d 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'GLB클래스'),
    '디젤', '1,950cc', '14.2km/ℓ', 5, 'I4', '전륜', '150hp', '32.6kg.m', 
    '4,640mm', '1,835mm', '1,700mm', '2,830mm', '1,750kg', 'GLB200d'
);

-------------------------------------------------------------------

-- 3. CarDetail2에 GLB200d 모델 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'GLB200d' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'GLB클래스')), 'DCT', '6,300만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 GLB250 4MATIC 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'GLB클래스'),
    '가솔린', '1,991cc', '10.5km/ℓ', 5, 'I4', '사륜', '224hp', '35.7kg.m', 
    '4,650mm', '1,845mm', '1,690mm', '2,830mm', '1,815kg', 'GLB250 4MATIC'
);

-------------------------------------------------------------------

-- 5. CarDetail2에 GLB250 4MATIC 모델 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'GLB250 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'GLB클래스')), 'DCT', '7,060만원');



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 AMG A클래스 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '벤츠', '준중형', '세단', 'AMG A클래스 세단', 'benz.png', 'amgaclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 A35S AMG 4MATIC 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'AMG A클래스 세단'),
    '가솔린', '1,991cc', '10.4km/ℓ', 5, 'I4', '사륜', '306hp', '40.8kg.m', 
    '4,570mm', '1,800mm', '1,415mm', '2,730mm', '1,625kg', 'A35S AMG 4MATIC'
);

-------------------------------------------------------------------

-- 3. CarDetail2에 A35S AMG 4MATIC 모델 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'A35S AMG 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'AMG A클래스 세단')), 'DCT', '6,730만원');



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 EQA 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '벤츠', '준중형', 'SUV', 'EQA', 'benz.png', 'eqa.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 EQA250 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'EQA'),
    '전기', '-', '5km/kWh', 5, '-', '전륜', '140kW', '385Nm', 
    '4,465mm', '1,835mm', '1,620mm', '2,729mm', '1,985kg', 'EQA250'
);

-------------------------------------------------------------------

-- 3. CarDetail2에 EQA250 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EQA250' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EQA')), 'Electric Art', '6,790만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EQA250' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EQA')), 'AMG Line', '7,360만원');



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 GLA클래스 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '벤츠', '준중형', 'SUV', 'GLA클래스', 'benz.png', 'glaclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 GLA250 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'GLA클래스'),
    '전기', '-', '5km/kWh', 5, '-', '전륜', '140kW', '385Nm', 
    '4,465mm', '1,835mm', '1,620mm', '2,729mm', '1,985kg', 'EQA250'
);

-------------------------------------------------------------------

-- 3. CarDetail2에 GLA250 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EQA250' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'GLA클래스')), 'AMG Line', '6,860만원');



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 E클래스 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '벤츠', '준대형', '세단', 'E클래스', 'benz.png', 'eclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 E200 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'E클래스'),
    '가솔린', '1,999cc', '12.4km/ℓ', 5, 'I4', '후륜', '204hp', '32.6kg.m', 
    '4,955mm', '1,880mm', '1,475mm', '2,960mm', '1,820kg', 'E200'
);

-------------------------------------------------------------------

-- 3. CarDetail2에 E200 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'E200' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'E클래스')), 'Avantgarde Limited', '6,990만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'E200' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'E클래스')), 'Avantgarde', '7,480만원');


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 CLE클래스 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '벤츠', '준대형', '세단', 'CLE클래스', 'benz.png', 'cleclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 CLE200 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'CLE클래스'),
    '가솔린', '1,999cc', '12.1km/ℓ', 5, 'I6', '후륜', '204hp', '32.6kg.m', 
    '4,850mm', '1,860mm', '1,420mm', '2,865mm', '1,770kg', 'CLE200'
);

-------------------------------------------------------------------

-- 3. CarDetail2에 CLE200 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'CLE200' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'CLE클래스')), 'A/T', '7,270만원');

------------------------------------------------------------------------------------------------------------------

-- 4. CarDetail1에 CLE450 4MATIC 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'CLE클래스'),
    '가솔린', '2,999cc', '10.9km/ℓ', 5, 'I6', '사륜', '381hp', '51kg.m', 
    '4,850mm', '1,860mm', '1,420mm', '2,865mm', '1,940kg', 'CLE450 4MATIC'
);

-------------------------------------------------------------------

-- 5. CarDetail2에 CLE450 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'CLE450 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'CLE클래스')), 'A/T', '9,600만원');



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/
-- 1. CarMain에 EQB 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '벤츠', '준중형', 'SUV', 'EQB', 'benz.png', 'eqb.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 EQB300 4MATIC 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'EQB'),
    '전기', '-', '4.1km/kWh', 5, '-', '사륜', '168kW', '390Nm', 
    '4,685mm', '1,835mm', '1,690mm', '2,829mm', '2,135kg', 'EQB300 4MATIC'
);

-------------------------------------------------------------------

-- 3. CarDetail2에 EQB300 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EQB300 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EQB')), 'Progressive', '7,660만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EQB300 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'EQB')), 'AMG Line', '8,200만원');



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 CLE클래스 카브리올레 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '벤츠', '준대형', '세단', 'CLE클래스 카브리올레', 'benz.png', 'cleclasscab.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 CLE200 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'CLE클래스 카브리올레'),
    '가솔린', '1,999cc', '12.1km/ℓ', 4, 'I4', '후륜', '204hp', '32.6kg.m', 
    '4,850mm', '1,860mm', '1,430mm', '2,865mm', '1,900kg', 'CLE200'
);

-------------------------------------------------------------------

-- 3. CarDetail2에 CLE200 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'CLE200' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'CLE클래스 카브리올레')), 'A/T', '7,880만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'CLE200' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'CLE클래스 카브리올레')), 'Online Exclusive', '8,500만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 CLE450 4MATIC 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'CLE클래스 카브리올레'),
    '가솔린', '2,999cc', '10.7km/ℓ', 4, 'I6', '사륜', '381hp', '51kg.m', 
    '4,850mm', '1,860mm', '1,430mm', '2,865mm', '2,045kg', 'CLE450 4MATIC'
);

-------------------------------------------------------------------

-- 5. CarDetail2에 CLE450 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'CLE450 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'CLE클래스 카브리올레')), 'A/T', '10,080만원');



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 GLC클래스 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', '벤츠', '중형', 'SUV', 'GLC클래스', 'benz.png', 'glcclass.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 GLC220d 4MATIC 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'GLC클래스'),
    '디젤', '1,993cc', '14.1km/ℓ', 5, 'I4', '사륜', '197hp', '44.9kg.m', 
    '4,720mm', '1,890mm', '1,645mm', '2,888mm', '2,005kg', 'GLC220d 4MATIC'
);

-------------------------------------------------------------------

-- 3. CarDetail2에 GLC220d 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'GLC220d 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'GLC클래스')), 'A/T', '7,940만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 GLC300 4MATIC 모델 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'GLC클래스'),
    '가솔린', '1,999cc', '10.8km/ℓ', 5, 'I4', '사륜', '258hp', '40.8kg.m', 
    '4,720mm', '1,890mm', '1,645mm', '2,888mm', '1,935kg', 'GLC300 4MATIC'
);

-------------------------------------------------------------------

-- 5. CarDetail2에 GLC300 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'GLC300 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'GLC클래스')), 'Avantgarde', '7,990만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'GLC300 4MATIC' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'GLC클래스')), 'AMG Line', '8,950만원');


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

