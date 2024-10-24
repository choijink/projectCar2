

-- CarMain에 i7 차량 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', 'BMW', '대형', '세단', 'i7', 'bmw.png', 'i7.png');

-- CarDetail1 테이블에 i7 차량의 세부 정보 삽입 (eDrive50)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'i7'),
    'EV', '-', '3.8km/kWh', 5, '-', '사륜', '335kW', '650Nm', '5,390mm', '1,950mm', '1,545mm', '3,215mm', '2,630kg', 'eDrive50'
);

-- CarDetail2 테이블에 i7 차량의 트림과 가격 정보 삽입 (eDrive50)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i7') AND Grade = 'eDrive50'),
    'M Sport Limited', '16,690만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i7') AND Grade = 'eDrive50'),
    'M Sport', '18,190만원'
);

-- CarDetail1 테이블에 i7 차량의 세부 정보 삽입 (xDrive60)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'i7'),
    'EV', '-', '3.7km/kWh', 5, '-', '사륜', '400kW', '745Nm', '5,390mm', '1,950mm', '1,545mm', '3,215mm', '2,750kg', 'xDrive60'
);

-- CarDetail2 테이블에 i7 차량의 트림과 가격 정보 삽입 (xDrive60)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i7') AND Grade = 'xDrive60'),
    'Design Pure Excellence', '21,290만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i7') AND Grade = 'xDrive60'),
    'M Sport', '21,590만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i7') AND Grade = 'xDrive60'),
    '2024 Frieze Seoul Edition', '23,650만원'
);


--
-- CarMain에 i7 M70 차량 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', 'BMW', '대형', '세단', 'i7 M70', 'bmw.png', 'i7 M70.png');

-- CarDetail1 테이블에 i7 M70 차량의 세부 정보 삽입 (M70 xDrive)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'i7 M70'),
    '전기', '-', '3.3km/kWh', 5, '-', '사륜', '485kW', '1015Nm', '5,390mm', '1,950mm', '1,545mm', '3,215mm', '2,785kg', 'M70 xDrive'
);

-- CarDetail2 테이블에 i7 M70 차량의 트림과 가격 정보 삽입 (M70 xDrive)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i7 M70') AND Grade = 'M70 xDrive'),
    'A/T', '23,180만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i7 M70') AND Grade = 'M70 xDrive'),
    'M Performance', '23,300만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i7 M70') AND Grade = 'M70 xDrive'),
    'Individual Two Tone Edition', '24,560만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i7 M70') AND Grade = 'M70 xDrive'),
    'First Edition', '26,340만원'
);


--
-- CarMain에 iX 차량 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', 'BMW', '준대형', 'SUV', 'iX', 'bmw.png', 'iX.png');

-- CarDetail1 테이블에 iX 차량의 세부 정보 삽입 (xDrive50)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'iX'),
    '전기', '-', '3.7km/kWh', 5, '-', '사륜', '385kW', '765Nm', '4,955mm', '1,965mm', '1,695mm', '3,000mm', '2,588kg', 'xDrive50'
);

-- CarDetail2 테이블에 iX 차량의 트림과 가격 정보 삽입 (xDrive50)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'iX') AND Grade = 'xDrive50'),
    'Sport Plus', '14,990만원'
);


--
-- CarMain에 iX M60 차량 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', 'BMW', '준대형', 'SUV', 'iX M60', 'bmw.png', 'iX M60.png');

-- CarDetail1 테이블에 iX M60 차량의 세부 정보 삽입 (M60)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'iX M60'),
    '전기', '-', '3.4km/kWh', 5, '-', '사륜', '549kW', '1015Nm', '4,955mm', '1,965mm', '1,670mm', '3,000mm', '2,620kg', 'M60'
);

-- CarDetail2 테이블에 iX M60 차량의 트림과 가격 정보 삽입 (M60)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'iX M60') AND Grade = 'M60'),
    'A/T', '16,390만원'
);


--
-- CarMain에 i5 차량 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', 'BMW', '준대형', '세단', 'i5', 'bmw.png', 'i5.png');

-- CarDetail1 테이블에 i5 차량의 세부 정보 삽입 (eDrive40)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'i5'),
    '전기', '-', '4.1km/kWh', 5, '-', '후륜', '250kW', '400Nm', '5,060mm', '1,900mm', '1,515mm', '2,995mm', '2,250kg', 'eDrive40'
);

-- CarDetail2 테이블에 i5 차량의 트림과 가격 정보 삽입 (eDrive40)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i5') AND Grade = 'eDrive40'),
    'A/T', '9,390만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i5') AND Grade = 'eDrive40'),
    'M Sport', '9,690만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i5') AND Grade = 'eDrive40'),
    'M Sport Pro', '10,170만원'
);


--
-- CarMain에 i5 M60 차량 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', 'BMW', '준대형', '세단', 'i5 M60', 'bmw.png', 'i5 M60.png');

-- CarDetail1 테이블에 i5 M60 차량의 세부 정보 삽입 (M60 xDrive)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'i5 M60'),
    '전기', '-', '3.8km/kWh', 5, '-', '사륜', '442kW', '795Nm', '5,060mm', '1,900mm', '1,515mm', '2,995mm', '2,410kg', 'M60 xDrive'
);

-- CarDetail2 테이블에 i5 M60 차량의 트림과 가격 정보 삽입 (M60 xDrive)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i5 M60') AND Grade = 'M60 xDrive'),
    'A/T', '13,890만원'
);


--
-- CarMain에 i4 차량 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', 'BMW', '중형', '세단', 'i4', 'bmw.png', 'i4.png');

-- CarDetail1 테이블에 i4 차량의 세부 정보 삽입 (eDrive40)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'i4'),
    '전기', '-', '4.6km/kWh', 5, '-', '후륜', '250kW', '430Nm', '4,785mm', '1,850mm', '1,450mm', '2,855mm', '2,110kg', 'eDrive40'
);

-- CarDetail2 테이블에 i4 차량의 트림과 가격 정보 삽입 (eDrive40)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i4') AND Grade = 'eDrive40'),
    'M Sport Pro', '8,110만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i4') AND Grade = 'eDrive40'),
    'Individual Edition', '8,480만원'
);


--
-- CarMain에 i4 M50 차량 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', 'BMW', '중형', '세단', 'i4 M50', 'bmw.png', 'i4 M50.png');

-- CarDetail1 테이블에 i4 M50 차량의 세부 정보 삽입 (M50 xDrive)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'i4 M50'),
    '전기', '-', '4.1km/kWh', 5, '-', '사륜', '400kW', '795Nm', '4,785mm', '1,850mm', '1,450mm', '2,855mm', '2,260kg', 'M50 xDrive'
);

-- CarDetail2 테이블에 i4 M50 차량의 트림과 가격 정보 삽입 (M50 xDrive)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i4 M50') AND Grade = 'M50 xDrive'),
    'A/T', '8,490만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'i4 M50') AND Grade = 'M50 xDrive'),
    'Pro', '9,100만원'
);


--
-- CarMain에 iX3 차량 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', 'BMW', '중형', 'SUV', 'iX3', 'bmw.png', 'iX3.png');

-- CarDetail1 테이블에 iX3 차량의 세부 정보 삽입 (EV)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'iX3'),
    '전기', '-', '4.1km/kWh', 5, '-', '후륜', '210kW', '400Nm', '4,735mm', '1,890mm', '1,670mm', '2,865mm', '2,210kg', 'EV'
);

-- CarDetail2 테이블에 iX3 차량의 트림과 가격 정보 삽입 (EV)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'iX3') AND Grade = 'EV'),
    'M Sport', '8,260만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'iX3') AND Grade = 'EV'),
    'M Sport Special Edition', '8,460만원'
);


--
-- CarMain에 iX2 차량 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', 'BMW', '준중형', 'SUV', 'iX2', 'bmw.png', 'iX2.png');

-- CarDetail1 테이블에 iX2 차량의 세부 정보 삽입 (eDrive20)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'iX2'),
    '전기', '-', '4.8km/kWh', 5, '-', '후륜', '150kW', '250Nm', '4,555mm', '1,845mm', '1,560mm', '2,690mm', '1,963kg', 'eDrive20'
);

-- CarDetail2 테이블에 iX2 차량의 트림과 가격 정보 삽입 (eDrive20)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'iX2') AND Grade = 'eDrive20'),
    'xLine', '6,750만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'iX2') AND Grade = 'eDrive20'),
    'M Sport', '6,990만원'
);


--
-- CarMain에 iX1 차량 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', 'BMW', '준중형', 'SUV', 'iX1', 'bmw.png', 'iX1.png');

-- CarDetail1 테이블에 iX1 차량의 세부 정보 삽입 (xDrive30)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'iX1'),
    '전기', '-', '4.2km/kWh', 5, '-', '후륜', '234kW', '494Nm', '4,500mm', '1,835mm', '1,615mm', '2,690mm', '2,085kg', 'xDrive30'
);

-- CarDetail2 테이블에 iX1 차량의 트림과 가격 정보 삽입 (xDrive30)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'iX1') AND Grade = 'xDrive30'),
    'xLine', '6,690만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'iX1') AND Grade = 'xDrive30'),
    'M Sport', '6,950만원'
);


--
-- CarMain에 X7 차량 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', 'BMW', '대형', 'SUV', 'X7', 'bmw.png', 'X7.png');

-- CarDetail1 테이블에 X7 차량의 세부 정보 삽입 (xDrive40i)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'X7'),
    '가솔린', '2,998cc', '7.8km/ℓ', 5, 'I6', '사륜', '381hp', '55kg.m', '5,180mm', '1,990mm', '1,835mm', '3,105mm', '2,575kg', 'xDrive40i'
);

-- CarDetail2 테이블에 X7 차량의 트림과 가격 정보 삽입 (xDrive40i)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X7') AND Grade = 'xDrive40i'),
    'Design Pure Excellence (7인승)', '14,720만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X7') AND Grade = 'xDrive40i'),
    'Design Pure Excellence (6인승)', '14,920만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X7') AND Grade = 'xDrive40i'),
    'M Sport Package (7인승)', '14,970만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X7') AND Grade = 'xDrive40i'),
    'M Sport Package (6인승)', '15,170만원'
);

-- CarDetail1 테이블에 X7 차량의 세부 정보 삽입 (xDrive40d)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'X7'),
    '디젤', '2,993cc', '10km/ℓ', 5, 'I6', '사륜', '340hp', '73.4kg.m', '5,180mm', '1,990mm', '1,835mm', '3,105mm', '2,650kg', 'xDrive40d'
);

-- CarDetail2 테이블에 X7 차량의 트림과 가격 정보 삽입 (xDrive40d)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X7') AND Grade = 'xDrive40d'),
    'Design Pure Excellence (7인승)', '14,820만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X7') AND Grade = 'xDrive40d'),
    'Design Pure Excellence (6인승)', '15,020만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X7') AND Grade = 'xDrive40d'),
    'M Sport Package (7인승)', '15,070만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X7') AND Grade = 'xDrive40d'),
    'M Sport Package (6인승)', '15,270만원'
);

-- CarDetail1 테이블에 X7 차량의 세부 정보 삽입 (M60i xDrive)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'X7'),
    '가솔린', '4,395cc', '6.9km/ℓ', 5, 'V8', '사륜', '530hp', '76.5kg.m', '5,180mm', '1,990mm', '1,835mm', '3,105mm', '2,670kg', 'M60i xDrive'
);

-- CarDetail2 테이블에 X7 차량의 트림과 가격 정보 삽입 (M60i xDrive)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X7') AND Grade = 'M60i xDrive'),
    'A/T', '18,080만원'
);


--
-- CarMain에 X6 차량 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', 'BMW', '준대형', 'SUV', 'X6', 'bmw.png', 'X6.png');

-- CarDetail1 테이블에 X6 차량의 세부 정보 삽입 (xDrive30d)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'X6'),
    '디젤', '2,993cc', '11.9km/ℓ', 5, 'I6', '사륜', '298hp', '68.3kg.m', '4,960mm', '2,005mm', '1,700mm', '2,975mm', '2,390kg', 'xDrive30d'
);

-- CarDetail2 테이블에 X6 차량의 트림과 가격 정보 삽입 (xDrive30d)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X6') AND Grade = 'xDrive30d'),
    'M Sport', '12,580만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X6') AND Grade = 'xDrive30d'),
    'M Sport Pro', '12,780만원'
);

-- CarDetail1 테이블에 X6 차량의 세부 정보 삽입 (xDrive40d)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'X6'),
    '디젤', '2,993cc', '11.6km/ℓ', 5, 'I6', '사륜', '352hp', '73.4kg.m', '4,960mm', '2,005mm', '1,700mm', '2,975mm', '2,413kg', 'xDrive40d'
);

-- CarDetail2 테이블에 X6 차량의 트림과 가격 정보 삽입 (xDrive40d)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X6') AND Grade = 'xDrive40d'),
    'M Sport Pro Online Exclusive', '13,600만원'
);

-- CarDetail1 테이블에 X6 차량의 세부 정보 삽입 (xDrive40i)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'X6'),
    '가솔린', '2,998cc', '9.5km/ℓ', 5, 'I6', '사륜', '381hp', '53kg.m', '4,960mm', '2,005mm', '1,700mm', '2,975mm', '2,320kg', 'xDrive40i'
);

-- CarDetail2 테이블에 X6 차량의 트림과 가격 정보 삽입 (xDrive40i)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X6') AND Grade = 'xDrive40i'),
    'M Sport', '13,140만원'
),
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X6') AND Grade = 'xDrive40i'),
    'M Sport Pro', '13,340만원'
);

-- CarDetail1 테이블에 X6 차량의 세부 정보 삽입 (M60i)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'X6'),
    '가솔린', '4,395cc', '7.8km/ℓ', 5, 'V8', '사륜', '530hp', '76.4kg.m', '4,960mm', '2,005mm', '1,700mm', '2,975mm', '2,430kg', 'M60i'
);

-- CarDetail2 테이블에 X6 차량의 트림과 가격 정보 삽입 (M60i)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X6') AND Grade = 'M60i'),
    'A/T', '15,910만원'
);


--
-- CarMain에 X6 M 차량 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('수입', 'BMW', '준대형', 'SUV', 'X6 M', 'bmw.png', 'X6 M.png');

-- CarDetail1 테이블에 X6 M 차량의 세부 정보 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES 
(
    (SELECT c_idx FROM CarMain WHERE CarName = 'X6 M'),
    '가솔린', '4,395cc', '7km/ℓ', 5, 'V8', '사륜', '625hp', '76.5kg.m', '4,950mm', '2,020mm', '1,695mm', '2,970mm', '2,440kg', 'X6 M'
);

-- CarDetail2 테이블에 X6 M 차량의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
(
    (SELECT cd1_idx FROM CarDetail1 WHERE c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X6 M') AND Grade = 'X6 M'),
    'Competition', '19,390만원'
);

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 BMW X5 M 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', 'BMW', '준대형', 'SUV', 'X5 M', 'bmw.png', 'X5 M.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 X5 M 모델의 가솔린 세부 사양 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'X5 M'),
    '가솔린', '4,395cc', '6.9km/ℓ', 5, 'V8', '사륜', '625hp', '76.5kg.m', 
    '4,940mm', '2,015mm', '1,760mm', '2,970mm', '2,465kg', 'X5 M'
);

-- 3. CarDetail2에 X5 M 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'X5 M' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X5 M')), 'Competition', '18,990만원');



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 BMW X4 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', 'BMW', '중형', 'SUV', 'X4', 'bmw.png', 'X4.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 X4 모델의 가솔린 세부 사양 삽입 (xDrive20i)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'X4'),
    '가솔린', '1,998cc', '9.9km/ℓ', 5, 'I4', '사륜', '184hp', '29.5kg.m', 
    '4,750mm', '1,920mm', '1,620mm', '2,865mm', '1,900kg', 'xDrive20i'
);

-- 3. CarDetail2에 xDrive20i 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'xDrive20i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X4')), 'xLine', '7,210만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'xDrive20i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X4')), 'M Sport', '7,570만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'xDrive20i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X4')), 'Individual Edition', '8,590만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 X4 모델의 디젤 세부 사양 삽입 (xDrive20d)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'X4'),
    '디젤', '1,995cc', '12.3km/ℓ', 5, 'I4', '사륜', '190hp', '40.7kg.m', 
    '4,750mm', '1,920mm', '1,620mm', '2,865mm', '1,940kg', 'xDrive20d'
);

-- 5. CarDetail2에 xDrive20d 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'xDrive20d' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X4')), 'xLine', '7,740만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'xDrive20d' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X4')), 'M Sport', '8,080만원');

-------------------------------------------------------------------

-- 6. CarDetail1에 X4 모델의 가솔린 세부 사양 삽입 (M40i)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'X4'),
    '가솔린', '2,998cc', '8.5km/ℓ', 5, 'I6', '사륜', '387hp', '51kg.m', 
    '4,750mm', '1,940mm', '1,620mm', '2,865mm', '2,430kg', 'M40i'
);

-- 7. CarDetail2에 M40i 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'M40i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X4')), 'A/T', '10,160만원');


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 BMW X4 M 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', 'BMW', '중형', 'SUV', 'X4 M', 'bmw.png', 'X4 M.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 X4 M 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'X4 M'),
    '가솔린', '2,993cc', '7.8km/ℓ', 5, 'I6', '사륜', '510hp', '66.3kg.m', 
    '4,755mm', '1,925mm', '1,620mm', '2,865mm', '2,050kg', 'X4 M'
);

-- 3. CarDetail2에 X4 M 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'X4 M' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X4 M')), 'Competition', '12,920만원');


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/
-- 1. CarMain에 BMW X3 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', 'BMW', '중형', 'SUV', 'X3', 'bmw.png', 'X3.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 xDrive20i 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'X3'),
    '가솔린', '1,998cc', '9.8km/ℓ', 5, 'I4', '사륜', '184hp', '29.5kg.m', 
    '4,710mm', '1,890mm', '1,675mm', '2,865mm', '1,895kg', 'xDrive20i'
);

-- 3. CarDetail2에 xDrive20i 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'xDrive20i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X3')), 'xLine', '7,000만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'xDrive20i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X3')), 'M Sport', '7,340만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'xDrive20i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X3')), 'M Sport Pro Final Edition', '8,130만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'xDrive20i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X3')), 'Individual Edition', '8,250만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 xDrive20d 모델의 세부 사양 삽입 (디젤)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'X3'),
    '디젤', '1,995cc', '12.2km/ℓ', 5, 'I4', '사륜', '190hp', '40.7kg.m', 
    '4,710mm', '1,890mm', '1,675mm', '2,865mm', '1,965kg', 'xDrive20d'
);

-- 5. CarDetail2에 xDrive20d 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'xDrive20d' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X3')), 'xLine', '7,510만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'xDrive20d' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X3')), 'M Sport', '7,860만원');

-------------------------------------------------------------------

-- 6. CarDetail1에 M40i 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'X3'),
    '가솔린', '2,998cc', '9.2km/ℓ', 5, 'I6', '사륜', '387hp', '51kg.m', 
    '4,715mm', '1,890mm', '1,675mm', '2,865mm', '1,945kg', 'M40i'
);

-- 7. CarDetail2에 M40i 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'M40i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X3')), 'A/T', '9,890만원');


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/
-- 1. CarMain에 BMW X2 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', 'BMW', '준중형', 'SUV', 'X2', 'bmw.png', 'X2.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 xDrive20i 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'X2'),
    '가솔린', '1,998cc', '10.8km/ℓ', 5, 'I4', '사륜', '204hp', '30.6kg.m', 
    '4,555mm', '1,830mm', '1,590mm', '2,690mm', '1,720kg', 'xDrive20i'
);

-- 3. CarDetail2에 xDrive20i 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'xDrive20i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X2')), 'M Sport Package', '6,830만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 M35i xDrive 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'X2'),
    '가솔린', '1,998cc', '10.1km/ℓ', 5, 'I4', '사륜', '317hp', '40.8kg.m', 
    '4,555mm', '1,830mm', '1,590mm', '2,690mm', '1,745kg', 'M35i xDrive'
);

-- 5. CarDetail2에 M35i xDrive 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'M35i xDrive' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X2')), 'A/T', '7,440만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'M35i xDrive' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X2')), 'First Edition', '8,150만원');



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 BMW X1 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', 'BMW', '준중형', 'SUV', 'X1', 'bmw.png', 'X1.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 sDrive18d 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'X1'),
    '가솔린', '1,995cc', '14.6km/ℓ', 5, 'I4', '전륜', '150hp', '36.7kg.m', 
    '4,500mm', '1,835mm', '1,640mm', '2,690mm', '1,675kg', 'sDrive18d'
);

-- 3. CarDetail2에 sDrive18d 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'sDrive18d' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X1')), 'xLine', '5,820만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'sDrive18d' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X1')), 'M Sport', '6,290만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 sDrive20i 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'X1'),
    '가솔린', '1,998cc', '11.7km/ℓ', 5, 'I4', '전륜', '204hp', '30.6kg.m', 
    '4,500mm', '1,835mm', '1,640mm', '2,690mm', '1,625kg', 'sDrive20i'
);

-- 5. CarDetail2에 sDrive20i 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'sDrive20i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X1')), 'xLine', '5,940만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'sDrive20i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X1')), 'M Sport', '6,390만원');

-------------------------------------------------------------------

-- 6. CarDetail1에 xDrive20i 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'X1'),
    '가솔린', '1,998cc', '10.7km/ℓ', 5, 'I4', '전륜', '204hp', '30.6kg.m', 
    '4,500mm', '1,835mm', '1,640mm', '2,690mm', '1,720kg', 'xDrive20i'
);

-- 7. CarDetail2에 xDrive20i 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'xDrive20i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X1')), 'xLine', '6,210만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'xDrive20i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X1')), 'M Sport', '6,680만원');

-------------------------------------------------------------------

-- 8. CarDetail1에 M35i xDrive 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'X1'),
    '가솔린', '1,998cc', '10.2km/ℓ', 5, 'I4', '사륜', '317hp', '40.7kg.m', 
    '4,500mm', '1,835mm', '1,620mm', '2,690mm', '1,735kg', 'M35i xDrive'
);

-- 9. CarDetail2에 M35i xDrive 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'M35i xDrive' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X1')), 'A/T', '7,150만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'M35i xDrive' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'X1')), 'Special Edition', '7,580만원');


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 BMW M2 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', 'BMW', '준중형', '세단', 'M2', 'bmw.png', 'M2.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 M2 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'M2'),
    '가솔린', '2,993cc', '8.5km/ℓ', 5, 'I6', '후륜', '460hp', '56.1kg.m', 
    '4,580mm', '1,885mm', '1,405mm', '2,745mm', '1,755kg', 'M2'
);

-- 3. CarDetail2에 M2 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'M2' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'M2')), 'A/T', '8,990만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'M2' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'M2')), 'Special Edition', '8,990만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'M2' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'M2')), 'Carbon Edition', '9,270만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'M2' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'M2')), 'Frozen Pure Grey Edition', '9,350만원');


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 BMW Z4 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', 'BMW', '스포츠카', '세단', 'Z4', 'bmw.png', 'Z4.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 sDrive20i 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'Z4'),
    '가솔린', '1,998cc', '10.7km/ℓ', 5, 'I4', '후륜', '197hp', '32.6kg.m', 
    '4,325mm', '1,865mm', '1,300mm', '2,470mm', '1,525kg', 'sDrive20i'
);

-- 3. CarDetail2에 sDrive20i 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'sDrive20i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'Z4')), 'M Sport', '7,450만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'sDrive20i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'Z4')), 'M Sport Special Edition', '7,680만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 M40i 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = 'Z4'),
    '가솔린', '2,998cc', '10.2km/ℓ', 5, 'I6', '후륜', '387hp', '50.9kg.m', 
    '4,325mm', '1,865mm', '1,310mm', '2,470mm', '1,610kg', 'M40i'
);

-- 5. CarDetail2에 M40i 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'M40i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = 'Z4')), 'A/T', '9,880만원');



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

-- 1. CarMain에 BMW 7시리즈 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', 'BMW', '대형', '세단', '7시리즈', 'bmw.png', '7series.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 740d xDrive 모델의 세부 사양 삽입 (디젤)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '7시리즈'),
    '디젤', '2,993cc', '12.5km/ℓ', 5, 'I6', '사륜', '299hp', '68.3kg.m', 
    '5,390mm', '1,950mm', '1,545mm', '3,215mm', '2,315kg', '740d xDrive'
);

-- 3. CarDetail2에 740d xDrive 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '740d xDrive' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '7시리즈')), 'Classic Silver Edition', '14,730만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '740d xDrive' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '7시리즈')), 'M Sport', '14,990만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 740i xDrive 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '7시리즈'),
    '가솔린', '2,998cc', '10.4km/ℓ', 5, 'I6', '사륜', '381hp', '55.1kg.m', 
    '5,390mm', '1,950mm', '1,545mm', '3,215mm', '2,260kg', '740i xDrive'
);

-- 5. CarDetail2에 740i xDrive 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '740i xDrive' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '7시리즈')), 'Classic Silver Edition', '15,730만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '740i xDrive' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '7시리즈')), 'M Sport Limited', '15,990만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '740i xDrive' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '7시리즈')), 'M Sport', '17,490만원');



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/
-- 1. CarMain에 BMW 5시리즈 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', 'BMW', '준대형', '세단', '5시리즈', 'bmw.png', '5series.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 520i 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '5시리즈'),
    '가솔린', '1,998cc', '12.1km/ℓ', 5, 'I4', '후륜', '190hp', '31.6kg.m', 
    '5,060mm', '1,900mm', '1,515mm', '2,995mm', '1,835kg', '520i'
);

-- 3. CarDetail2에 520i 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '520i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '5시리즈')), 'A/T', '6,880만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '520i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '5시리즈')), 'M Sport', '7,330만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '520i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '5시리즈')), 'Special Edition', '7,490만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 523d 모델의 세부 사양 삽입 (디젤)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '5시리즈'),
    '디젤', '1,995cc', '14.7km/ℓ', 5, 'I4', '후륜', '197hp', '40.8kg.m', 
    '5,060mm', '1,900mm', '1,515mm', '2,995mm', '1,900kg', '523d'
);

-- 5. CarDetail2에 523d 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '523d' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '5시리즈')), 'A/T', '7,580만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '523d' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '5시리즈')), 'M Sport', '8,030만원');

-------------------------------------------------------------------

-- 6. CarDetail1에 523d xDrive 모델의 세부 사양 삽입 (디젤, 사륜)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '5시리즈'),
    '디젤', '1,995cc', '13.8km/ℓ', 5, 'I4', '사륜', '197hp', '40.8kg.m', 
    '5,060mm', '1,900mm', '1,515mm', '2,995mm', '1,965kg', '523d xDrive'
);

-- 7. CarDetail2에 523d xDrive 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '523d xDrive' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '5시리즈')), 'A/T', '7,880만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '523d xDrive' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '5시리즈')), 'M Sport', '8,330만원');

-------------------------------------------------------------------

-- 8. CarDetail1에 530i xDrive 모델의 세부 사양 삽입 (가솔린, 사륜)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '5시리즈'),
    '가솔린', '1,998cc', '11.1km/ℓ', 5, 'I4', '사륜', '258hp', '40.8kg.m', 
    '5,060mm', '1,900mm', '1,515mm', '2,995mm', '1,905kg', '530i xDrive'
);

-- 9. CarDetail2에 530i xDrive 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '530i xDrive' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '5시리즈')), 'A/T', '8,420만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '530i xDrive' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '5시리즈')), 'M Sport', '8,870만원');


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/
-- 1. CarMain에 BMW 3시리즈 차량 정보 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage) 
VALUES ('수입', 'BMW', '중형', '세단', '3시리즈', 'bmw.png', '3series.png');

-------------------------------------------------------------------

-- 2. CarDetail1에 320i 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '3시리즈'),
    '가솔린', '1,998cc', '11.2km/ℓ', 5, 'I4', '후륜', '184hp', '30.6kg.m', 
    '4,715mm', '1,825mm', '1,440mm', '2,850mm', '1,635kg', '320i'
);

-- 3. CarDetail2에 320i 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '320i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '3시리즈')), 'A/T', '5,700만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '320i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '3시리즈')), 'M Sport', '6,140만원');

-------------------------------------------------------------------

-- 4. CarDetail1에 320d 모델의 세부 사양 삽입 (디젤)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '3시리즈'),
    '디젤', '1,995cc', '15km/ℓ', 5, 'I4', '후륜', '190hp', '40.8kg.m', 
    '4,715mm', '1,825mm', '1,440mm', '2,850mm', '1,690kg', '320d'
);

-- 5. CarDetail2에 320d 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '320d' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '3시리즈')), 'A/T', '6,000만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '320d' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '3시리즈')), 'M Sport', '6,400만원');

-------------------------------------------------------------------

-- 6. CarDetail1에 320d xDrive 모델의 세부 사양 삽입 (디젤, 사륜)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '3시리즈'),
    '디젤', '1,995cc', '13.5km/ℓ', 5, 'I4', '사륜', '190hp', '40.8kg.m', 
    '4,715mm', '1,825mm', '1,440mm', '2,850mm', '1,740kg', '320d xDrive'
);

-- 7. CarDetail2에 320d xDrive 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '320d xDrive' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '3시리즈')), 'M Sport', '6,640만원');

-------------------------------------------------------------------

-- 8. CarDetail1에 M340i 모델의 세부 사양 삽입 (가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade) 
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '3시리즈'),
    '가솔린', '2,998cc', '10.4km/ℓ', 5, 'I6', '사륜', '387hp', '51kg.m', 
    '4,715mm', '1,825mm', '1,435mm', '2,850mm', '1,715kg', 'M340i'
);

-- 9. CarDetail2에 M340i 모델의 트림과 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price) 
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'M340i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '3시리즈')), 'A/T', '8,320만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'M340i' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '3시리즈')), 'Pro', '8,480만원');



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


