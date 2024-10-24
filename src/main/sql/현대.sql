-- CarMain에 새로운 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '준중형', '세단', '아반떼', 'hyundai.png', 'avante.png');

-- CarDetail1에 CarMain의 c_idx를 참조하여 새로운 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '아반떼'), '가솔린', '1,598cc', '14.8km/L', 5, 'I4', '전륜', '123hp', '15.7kg.m', '4,710mm', '1,825mm', '1,420mm', '2,720mm', '1,260kg', '1.6 가솔린');

-- CarDetail2에 CarDetail1의 cd1_idx를 참조하여 새로운 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린'), '스마트', '1,994만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린'), '모던', '2,326만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린'), '인스퍼레이션', '2,699만원');

-- LPG 모델에 대한 CarDetail1 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '아반떼'), 'LPG', '1,591cc', '10.3km/L', 5, 'I4', '전륜', '120hp', '15.5kg.m', '4,710mm', '1,825mm', '1,420mm', '2,720mm', '1,260kg', '1.6 LPi');

-- LPG 모델에 대한 CarDetail2 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 LPi'), '스마트', '2,134만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 LPi'), '모던', '2,465만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 LPi'), '인스퍼레이션', '2,826만원');

-- N 라인 모델에 대한 CarDetail1 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '아반떼'), 'LPG', '1,998cc', '19.8km/L', 5, 'I4', '전륜', '193hp', '19.7kg.m', '4,710mm', '1,825mm', '1,420mm', '2,720mm', '1,320kg', '1.6 가솔린 N라인');

-- N 라인 모델에 대한 CarDetail2 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 N라인'), '모던', '2,446만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 N라인'), '인스퍼레이션', '2,788만원');
  
  
--


-- CarMain에 새로운 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '준중형', '세단', '아반떼 N', 'hyundai.png', 'avanteN.png');

-- CarDetail1에 CarMain의 c_idx를 참조하여 새로운 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '아반떼 N'), '가솔린', '1,998cc', '10.4km/L', 5, 'I4', '전륜', '280hp', '40kg.m', '4,710mm', '1,825mm', '1,415mm', '2,720mm', '1,480kg', '2.0 가솔린 터보');

-- CarDetail2에 CarDetail1의 cd1_idx를 참조하여 새로운 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 가솔린 터보'), 'N M/T', '3,360만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 가솔린 터보'), 'N', '3,568만원');
  
  
--


-- CarMain에 새로운 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '준중형', '세단', '아반떼 하이브리드', 'hyundai.png', 'avante.png');

-- CarDetail1에 CarMain의 c_idx를 참조하여 새로운 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '아반떼 하이브리드'), '가솔린', '1,580cc', '21.1km/L', 5, 'I4', '전륜', '141hp', '15kg.m', '4,710mm', '1,825mm', '1,420mm', '2,720mm', '1,355kg', '1.6 HEV');

-- CarDetail2에 CarDetail1의 cd1_idx를 참조하여 새로운 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV'), '스마트', '2,485만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV'), '모던', '2,751만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV'), '인스퍼레이션', '3,092만원');

-- N라인 모델에 대한 CarDetail1 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '아반떼 하이브리드'), '가솔린', '1,580cc', '18.5km/L', 5, 'I4', '전륜', '141hp', '15kg.m', '4,710mm', '1,825mm', '1,420mm', '2,720mm', '1,395kg', '1.6 HEV N라인');

-- N라인 모델에 대한 CarDetail2 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV N라인'), '모던', '2,851만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV N라인'), '인스퍼레이션', '3,161만원');
  
  
--


-- CarMain에 새로운 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '준대형', '세단', '그랜저', 'hyundai.png', 'grandeur.png');

-- 첫 번째 CarDetail1에 CarMain의 c_idx를 참조하여 새로운 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '그랜저'), '가솔린', '2,497cc', '11.2km/L', 5, 'I4', '전륜', '198hp', '25.3kg.m', '5,035mm', '1,880mm', '1,460mm', '2,895mm', '1,620kg', '2.5 가솔린');

-- 첫 번째 CarDetail2에 CarDetail1의 cd1_idx를 참조하여 새로운 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린'), '프리미엄', '3,768만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린'), '익스클루시브', '4,258만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린'), '캘리그래피', '4,721만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린'), '캘리그래피 블랙 익스테리어', '4,721만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린'), '캘리그래피 블랙 잉크', '4,850만원');

-------------------------------------------------------------------

-- 두 번째 CarDetail1에 CarMain의 c_idx를 참조하여 새로운 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '그랜저'), '가솔린', '3,470cc', '9.7km/L', 5, 'V6', '전륜', '300hp', '36.6kg.m', '5,035mm', '1,880mm', '1,460mm', '2,895mm', '1,695kg', '3.5 가솔린');

-- 두 번째 CarDetail2에 CarDetail1의 cd1_idx를 참조하여 새로운 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린'), '프리미엄', '3,768만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린'), '익스클루시브', '4,258만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린'), '캘리그래피', '4,721만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린'), '캘리그래피 블랙 익스테리어', '4,721만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린'), '캘리그래피 블랙 잉크', '4,850만원');

-------------------------------------------------------------------

-- 세 번째 CarDetail1에 CarMain의 c_idx를 참조하여 새로운 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '그랜저'), '가솔린', '3,470cc', '9km/L', 5, 'V6', '사륜', '300hp', '36.6kg.m', '5,035mm', '1,880mm', '1,460mm', '2,895mm', '1,765kg', '3.5 가솔린 AWD');

-- 세 번째 CarDetail2에 CarDetail1의 cd1_idx를 참조하여 새로운 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 AWD'), '프리미엄', '4,233만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 AWD'), '익스클루시브', '4,723만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 AWD'), '캘리그래피', '5,186만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 AWD'), '캘리그래피 블랙 익스테리어', '5,186만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 가솔린 AWD'), '캘리그래피 블랙 잉크', '5,315만원');

-------------------------------------------------------------------

-- 네 번째 CarDetail1에 CarMain의 c_idx를 참조하여 새로운 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '그랜저'), 'LPG', '3,470cc', '7.8km/L', 5, 'V6', '전륜', '240hp', '32kg.m', '5,035mm', '1,880mm', '1,460mm', '2,895mm', '1,715kg', '3.5 LPG');

-- 네 번째 CarDetail2에 CarDetail1의 cd1_idx를 참조하여 새로운 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 LPG'), '프리미엄', '3,916만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.5 LPG'), '익스클루시브', '4,406만원');


--


-- 첫 번째 CarMain에 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '준대형', '세단', '그랜저 하이브리드', 'hyundai.png', 'grandeur.png');

-- 첫 번째 CarDetail1에 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '그랜저 하이브리드'), '가솔린', '1,598cc', '15.7km/L', 5, 'I4', '전륜', '230hp', '27.6kg.m', '5,035mm', '1,880mm', '1,460mm', '2,895mm', '1,700kg', '1.6 HEV');

-- 첫 번째 CarDetail2에 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '그랜저 하이브리드')), '프리미엄', '4,291만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '그랜저 하이브리드')), '익스클루시브', '4,781만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '그랜저 하이브리드')), '캘리그래피', '5,244만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '그랜저 하이브리드')), '캘리그래피 블랙 익스테리어', '5,244만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '그랜저 하이브리드')), '캘리그래피 블랙 잉크', '5,373만원');

-------------------------------------------------------------------

-- 두 번째 CarMain에 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '중형', '세단', '쏘나타', 'hyundai.png', 'sonata.png');

-- 두 번째 CarDetail1에 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '쏘나타'), '가솔린', '1,999cc', '11.7km/L', 5, 'I4', '전륜', '160hp', '20kg.m', '4,910mm', '1,860mm', '1,445mm', '2,840mm', '1,475kg', '2.0 가솔린');

-- 두 번째 CarDetail2에 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘나타')), '프리미엄', '2,808만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘나타')), '익스클루시브', '3,192만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘나타')), '인스퍼레이션', '3,556만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘나타')), 'N Line', '3,650만원');

-------------------------------------------------------------------

-- 세 번째 CarDetail1에 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '쏘나타'), 'LPG', '1,999cc', '9.4km/L', 5, 'I4', '전륜', '146hp', '19.5kg.m', '4,910mm', '1,860mm', '1,445mm', '2,840mm', '1,490kg', '2.0 LPi');

-- 세 번째 CarDetail2에 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 LPi' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘나타')), '프리미엄', '2,897만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 LPi' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘나타')), '익스클루시브', '3,281만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 LPi' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘나타')), '인스퍼레이션', '3,586만원');

-------------------------------------------------------------------

-- 네 번째 CarDetail1에 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '쏘나타'), 'LPG', '1,598cc', '12km/L', 5, 'I4', '전륜', '180hp', '27kg.m', '4,910mm', '1,860mm', '1,445mm', '2,840mm', '1,490kg', '1.6 가솔린 터보');

-- 네 번째 CarDetail2에 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘나타')), '프리미엄', '2,875만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘나타')), '익스클루시브', '3,259만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘나타')), '인스퍼레이션', '3,623만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘나타')), 'N Line', '3,717만원');

-------------------------------------------------------------------

-- 다섯 번째 CarDetail1에 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '쏘나타'), 'LPG', '2,497cc', '11.1km/L', 5, 'I4', '전륜', '290hp', '43kg.m', '4,910mm', '1,860mm', '1,445mm', '2,840mm', '1,610kg', '2.5 가솔린 터보');

-- 다섯 번째 CarDetail2에 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘나타')), 'N Line', '3,917만원');

--

-- CarMain에 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '중형', '세단', '쏘나타 하이브리드', 'hyundai.png', 'sonata.png');

-- CarDetail1에 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES ((SELECT c_idx FROM CarMain WHERE CarName = '쏘나타 하이브리드'), '가솔린', '1,999cc', '17.1km/L', 5, 'I4', '전륜', '195hp', '19.2kg.m', '4,910mm', '1,860mm', '1,445mm', '2,840mm', '1,550kg', '2.0 HEV');

-- CarDetail2에 데이터 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘나타 하이브리드')), '프리미엄', '3,187만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘나타 하이브리드')), '익스클루시브', '3,556만원'),
       ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '쏘나타 하이브리드')), '인스퍼레이션', '3,921만원');
       

--

-- CarMain에 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '경형', 'SUV', '캐스퍼', 'hyundai.png', 'casper.png');

-- CarDetail1에 데이터 삽입 (1.0 가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼'),
    '가솔린', '998cc', '13.8km/L', 5, 'I3', '전륜', '76hp', '9.7kg.m', '3,595mm', '1,595mm', '1,575mm', '2,400mm', '995kg', '1.0 가솔린'
);

-- CarDetail2에 데이터 삽입 (1.0 가솔린)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼')), '스마트', '1,385만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼')), '디 에센셜 라이트', '1,490만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼')), '디 에센셜', '1,690만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼')), '인스퍼레이션', '1,870만원');

-- CarDetail1에 데이터 삽입 (1.0 가솔린 터보)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼'),
    '가솔린', '998cc', '12.3km/L', 5, 'I3', '전륜', '100hp', '17.5kg.m', '3,595mm', '1,595mm', '1,575mm', '2,400mm', '1,030kg', '1.0 가솔린 터보'
);

-- CarDetail2에 데이터 삽입 (1.0 가솔린 터보)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼')), '스마트', '1,480만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼')), '디 에센셜 라이트', '1,585만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼')), '디 에센셜', '1,780만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼')), '인스퍼레이션', '1,960만원');

-- CarDetail1에 데이터 삽입 (1.0 가솔린 밴)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼'),
    '가솔린', '998cc', '14.3km/L', 5, 'I3', '전륜', '76hp', '9.7kg.m', '3,595mm', '1,595mm', '1,575mm', '2,400mm', '985kg', '1.0 가솔린 밴'
);

-- CarDetail2에 데이터 삽입 (1.0 가솔린 밴)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린 밴' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼')), '스마트', '1,375만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린 밴' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼')), '스마트 초이스', '1,480만원');

-- CarDetail1에 데이터 삽입 (1.0 가솔린 터보 밴)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼'),
    '가솔린', '998cc', '12.8km/L', 5, 'I3', '전륜', '100hp', '17.5kg.m', '3,595mm', '1,595mm', '1,575mm', '2,400mm', '1,030kg', '1.0 가솔린 터보 밴'
);

-- CarDetail2에 데이터 삽입 (1.0 가솔린 터보 밴)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린 터보 밴' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼')), '스마트', '1,470만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.0 가솔린 터보 밴' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼')), '스마트 초이스', '1,575만원');

--

-- CarMain에 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '소형', 'SUV', '코나', 'hyundai.png', 'kona.png');

-- CarDetail1에 데이터 삽입 (1.6 가솔린 터보)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '코나'),
    '가솔린', '1,598cc', '12.2km/L', 5, 'I4', '전륜', '198hp', '27kg.m', '4,350mm', '1,825mm', '1,580mm', '2,660mm', '1,405kg', '1.6 가솔린 터보'
);

-- CarDetail2에 데이터 삽입 (1.6 가솔린 터보)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나')), '모던', '2,516만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나')), '모던 플러스', '2,580만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나')), '프리미엄', '2,779만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나')), '인스퍼레이션', '3,120만원');

-------------------------------------------------------------------

-- CarDetail1에 데이터 삽입 (1.6 가솔린 터보 N Line)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '코나'),
    '가솔린', '1,598cc', '12.2km/L', 5, 'I4', '전륜', '198hp', '27kg.m', '4,385mm', '1,825mm', '1,590mm', '2,660mm', '1,405kg', '1.6 가솔린 터보 N Line'
);

-- CarDetail2에 데이터 삽입 (1.6 가솔린 터보 N Line)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보 N Line' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나')), '프리미엄', '2,942만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보 N Line' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나')), '인스퍼레이션', '3,219만원');

-------------------------------------------------------------------

-- CarDetail1에 데이터 삽입 (2.0 가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '코나'),
    '가솔린', '1,999cc', '13km/L', 5, 'I4', '전륜', '149hp', '18.3kg.m', '4,350mm', '1,825mm', '1,580mm', '2,660mm', '1,360kg', '2.0 가솔린'
);

-- CarDetail2에 데이터 삽입 (2.0 가솔린)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나')), '모던', '2,446만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나')), '모던 플러스', '2,510만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나')), '프리미엄', '2,710만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나')), '인스퍼레이션', '3,051만원');

-------------------------------------------------------------------

-- CarDetail1에 데이터 삽입 (2.0 가솔린 N Line)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '코나'),
    '가솔린', '1,999cc', '13km/L', 5, 'I4', '전륜', '149hp', '18.3kg.m', '4,385mm', '1,825mm', '1,590mm', '2,660mm', '1,410kg', '2.0 가솔린 N Line'
);

-- CarDetail2에 데이터 삽입 (2.0 가솔린 N Line)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 가솔린 N Line' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나')), '프리미엄', '2,873만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 가솔린 N Line' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나')), '인스퍼레이션', '3,150만원');


--

-- CarMain에 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '소형', 'SUV', '코나 하이브리드', 'hyundai.png', 'kona.png');

-- CarDetail1에 데이터 삽입 (1.6 HEV)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '코나 하이브리드'),
    '가솔린', '1,580cc', '18.1km/L', 5, 'I4', '전륜', '141hp', '14.7kg.m', '4,350mm', '1,825mm', '1,580mm', '2,660mm', '1,435kg', '1.6 HEV'
);

-- CarDetail2에 데이터 삽입 (1.6 HEV)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나 하이브리드')), '모던', '2,959만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나 하이브리드')), '모던 플러스', '3,023만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나 하이브리드')), '프리미엄', '3,178만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나 하이브리드')), '인스퍼레이션', '3,495만원');

-------------------------------------------------------------------

-- CarDetail1에 데이터 삽입 (1.6 HEV N Line)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '코나 하이브리드'),
    '가솔린', '1,580cc', '18.1km/L', 5, 'I4', '전륜', '141hp', '14.7kg.m', '4,385mm', '1,825mm', '1,580mm', '2,660mm', '1,450kg', '1.6 HEV N Line'
);

-- CarDetail2에 데이터 삽입 (1.6 HEV N Line)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV N Line' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나 하이브리드')), '프리미엄', '3,341만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV N Line' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나 하이브리드')), '인스퍼레이션', '3,594만원');


--

-- CarMain에 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '준중형', 'SUV', '투싼', 'hyundai.png', 'tucson.png');

-- CarDetail1에 데이터 삽입 (1.6 가솔린 터보)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '투싼'),
    '가솔린', '1,598cc', '12.5km/L', 5, 'I4', '전륜', '180hp', '27kg.m', '4,640mm', '1,865mm', '1,665mm', '2,755mm', '1,535kg', '1.6 가솔린 터보'
);

-- CarDetail2에 데이터 삽입 (1.6 가솔린 터보)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼')), '모던', '2,771만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼')), '프리미엄', '3,048만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼')), '인스퍼레이션', '3,439만원');

-------------------------------------------------------------------

-- CarDetail1에 데이터 삽입 (2.0 디젤)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '투싼'),
    '디젤', '1,998cc', '14.3km/L', 5, 'I4', '전륜', '184hp', '42.5kg.m', '4,640mm', '1,865mm', '1,665mm', '2,755mm', '1,630kg', '2.0 디젤'
);

-- CarDetail2에 데이터 삽입 (2.0 디젤)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼')), '모던', '3,013만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼')), '프리미엄', '3,290만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼')), '인스퍼레이션', '3,681만원');

-------------------------------------------------------------------

-- CarDetail1에 데이터 삽입 (2.0 디젤 AWD)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '투싼'),
    '디젤', '1,998cc', '12.6km/L', 5, 'I4', '사륜', '184hp', '42.5kg.m', '4,640mm', '1,865mm', '1,665mm', '2,755mm', '1,700kg', '2.0 디젤 AWD'
);

-- CarDetail2에 데이터 삽입 (2.0 디젤 AWD)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼')), '모던', '3,236만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼')), '프리미엄', '3,513만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼')), '인스퍼레이션', '3,904만원');

-------------------------------------------------------------------

-- CarDetail1에 데이터 삽입 (1.6 가솔린 터보 N Line)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '투싼'),
    '가솔린', '1,598cc', '12km/L', 5, 'I4', '전륜', '180hp', '27kg.m', '4,640mm', '1,865mm', '1,665mm', '2,755mm', '1,575kg', '1.6 가솔린 터보 N Line'
);

-- CarDetail2에 데이터 삽입 (1.6 가솔린 터보 N Line)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보 N Line' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼')), '프리미엄', '3,223만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 가솔린 터보 N Line' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼')), '인스퍼레이션', '3,539만원');

-------------------------------------------------------------------

-- CarDetail1에 데이터 삽입 (2.0 디젤 N Line)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '투싼'),
    '디젤', '1,998cc', '13.9km/L', 5, 'I4', '전륜', '184hp', '42.5kg.m', '4,650mm', '1,865mm', '1,665mm', '2,755mm', '1,670kg', '2.0 디젤 N Line'
);

-- CarDetail2에 데이터 삽입 (2.0 디젤 N Line)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤 N Line' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼')), '프리미엄', '3,465만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.0 디젤 N Line' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼')), '인스퍼레이션', '3,781만원');


--

-- CarMain에 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '준중형', 'SUV', '투싼 하이브리드', 'hyundai.png', 'tucson.png');

-- CarDetail1에 데이터 삽입 (1.6 HEV)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '투싼 하이브리드'),
    '가솔린', '1,598cc', '16.2km/L', 5, 'I4', '전륜', '235hp', '27kg.m', '4,640mm', '1,865mm', '1,665mm', '2,755mm', '1,625kg', '1.6 HEV'
);

-- CarDetail2에 데이터 삽입 (1.6 HEV)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼 하이브리드')), '모던', '3,213만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼 하이브리드')), '프리미엄', '3,469만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼 하이브리드')), '인스퍼레이션', '3,858만원');

-------------------------------------------------------------------

-- CarDetail1에 데이터 삽입 (1.6 HEV AWD)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '투싼 하이브리드'),
    '가솔린', '1,598cc', '14.7km/L', 5, 'I4', '사륜', '235hp', '27kg.m', '4,640mm', '1,865mm', '1,665mm', '2,755mm', '1,690kg', '1.6 HEV AWD'
);

-- CarDetail2에 데이터 삽입 (1.6 HEV AWD)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼 하이브리드')), '모던', '3,436만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼 하이브리드')), '프리미엄', '3,692만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼 하이브리드')), '인스퍼레이션', '4,081만원');

-------------------------------------------------------------------

-- CarDetail1에 데이터 삽입 (1.6 HEV N Line)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '투싼 하이브리드'),
    '가솔린', '1,598cc', '14.9km/L', 5, 'I4', '전륜', '235hp', '27kg.m', '4,640mm', '1,865mm', '1,665mm', '2,755mm', '1,665kg', '1.6 HEV N Line'
);

-- CarDetail2에 데이터 삽입 (1.6 HEV N Line)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV N Line' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼 하이브리드')), '프리미엄', '3,624만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV N Line' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '투싼 하이브리드')), '인스퍼레이션', '3,938만원');


--

-- CarMain에 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '중형', 'SUV', '싼타페', 'hyundai.png', 'santafe.png');

-- CarDetail1에 데이터 삽입 (2.5 가솔린 터보)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '싼타페'),
    '가솔린', '2,497cc', '10km/L', 5, 'I4', '전륜', '281hp', '43kg.m', '4,830mm', '1,900mm', '1,720mm', '2,815mm', '1,795kg', '2.5 가솔린 터보'
);

-- CarDetail2에 데이터 삽입 (2.5 가솔린 터보)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페')), '익스클루시브', '3,546만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페')), '프레스티지', '3,863만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페')), '프레스티지 플러스', '4,005만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페')), '캘리그래피', '4,442만원');

-------------------------------------------------------------------

-- CarDetail1에 데이터 삽입 (2.5 가솔린 터보 AWD)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '싼타페'),
    '가솔린', '2,497cc', '9.7km/L', 5, 'I4', '사륜', '281hp', '43kg.m', '4,830mm', '1,900mm', '1,720mm', '2,815mm', '1,860kg', '2.5 가솔린 터보 AWD'
);

-- CarDetail2에 데이터 삽입 (2.5 가솔린 터보 AWD)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페')), '익스클루시브', '3,769만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페')), '프레스티지', '4,086만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페')), '프레스티지 플러스', '4,228만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.5 가솔린 터보 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페')), '캘리그래피', '4,665만원');


--

-- CarMain에 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '중형', 'SUV', '싼타페 하이브리드', 'hyundai.png', 'santafe.png');

-- CarDetail1에 데이터 삽입 (1.6 HEV)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '싼타페 하이브리드'),
    '가솔린', '1,598cc', '14.4km/L', 5, 'I4', '전륜', '235hp', '27kg.m', '4,830mm', '1,900mm', '1,720mm', '2,815mm', '1,865kg', '1.6 HEV'
);

-- CarDetail2에 데이터 삽입 (1.6 HEV)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페 하이브리드')), '익스클루시브', '3,888만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페 하이브리드')), '프레스티지', '4,205만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페 하이브리드')), '프레스티지 플러스', '4,347만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페 하이브리드')), '캘리그래피', '4,739만원');

-------------------------------------------------------------------

-- CarDetail1에 데이터 삽입 (1.6 HEV AWD)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '싼타페 하이브리드'),
    '가솔린', '1,598cc', '13km/L', 5, 'I4', '전륜', '235hp', '27kg.m', '4,830mm', '1,900mm', '1,720mm', '2,815mm', '1,865kg', '1.6 HEV AWD'
);

-- CarDetail2에 데이터 삽입 (1.6 HEV AWD)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페 하이브리드')), '익스클루시브', '4,254만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페 하이브리드')), '프레스티지', '4,571만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페 하이브리드')), '프레스티지 플러스', '4,713만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '1.6 HEV AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '싼타페 하이브리드')), '캘리그래피', '5,105만원');


--

-- CarMain에 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '준대형', 'SUV', '팰리세이드', 'hyundai.png', 'palisade.png');

-- CarDetail1에 데이터 삽입 (2.2 디젤)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드'),
    '디젤', '2,199cc', '12km/L', 5, 'I4', '전륜', '202hp', '45kg.m', '4,995mm', '1,975mm', '1,750mm', '2,900mm', '1,970kg', '2.2 디젤'
);

-- CarDetail2에 데이터 삽입 (2.2 디젤)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '익스클루시브', '4,044만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '르블랑', '4,346만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '프레스티지', '4,772만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '캘리그래피', '5,254만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '캘리그래피 블랙에디션', '5,254만원');

-------------------------------------------------------------------

-- CarDetail1에 데이터 삽입 (2.2 디젤 AWD)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드'),
    '디젤', '2,199cc', '11.4km/L', 5, 'I4', '사륜', '202hp', '45kg.m', '4,995mm', '1,975mm', '1,750mm', '2,900mm', '2,025kg', '2.2 디젤 AWD'
);

-- CarDetail2에 데이터 삽입 (2.2 디젤 AWD)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '익스클루시브', '4,281만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '르블랑', '4,583만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '프레스티지', '5,009만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '캘리그래피', '5,491만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '2.2 디젤 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '캘리그래피 블랙에디션', '5,491만원');

-------------------------------------------------------------------

-- CarDetail1에 데이터 삽입 (3.8 가솔린)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드'),
    '가솔린', '3,778cc', '9km/L', 5, 'V6', '전륜', '295hp', '36.2kg.m', '4,995mm', '1,975mm', '1,750mm', '2,900mm', '1,895kg', '3.8 가솔린'
);

-- CarDetail2에 데이터 삽입 (3.8 가솔린)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.8 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '익스클루시브', '3,896만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.8 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '르블랑', '4,198만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.8 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '프레스티지', '4,624만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.8 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '캘리그래피', '5,106만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.8 가솔린' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '캘리그래피 블랙에디션', '5,106만원');

-------------------------------------------------------------------

-- CarDetail1에 데이터 삽입 (3.8 가솔린 AWD)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드'),
    '가솔린', '3,778cc', '8.5km/L', 5, 'V6', '사륜', '295hp', '36.2kg.m', '4,995mm', '1,975mm', '1,750mm', '2,900mm', '1,960kg', '3.8 가솔린 AWD'
);

-- CarDetail2에 데이터 삽입 (3.8 가솔린 AWD)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.8 가솔린 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '익스클루시브', '4,133만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.8 가솔린 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '르블랑', '4,435만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.8 가솔린 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '프레스티지', '4,861만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.8 가솔린 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '캘리그래피', '5,343만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = '3.8 가솔린 AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '팰리세이드')), '캘리그래피 블랙에디션', '5,343만원');


--

-- CarMain에 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '소형', 'SUV', '캐스퍼 일렉트릭', 'hyundai.png', 'casperelectric.png');

-- CarDetail1에 데이터 삽입 (EV)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼 일렉트릭'),
    '전기', '-', '5.6km/kWh', 5, '-', '전륜', '113hp', '15kg.m', '3,825mm', '1,610mm', '1,575mm', '2,580mm', '1,300kg', 'EV'
);

-- CarDetail2에 데이터 삽입 (EV)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼 일렉트릭')), '프리미엄', '2,740만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'EV' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '캐스퍼 일렉트릭')), '인스퍼레이션', '2,990만원');
    
--

-- CarMain에 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '소형', 'SUV', '코나 일렉트릭', 'hyundai.png', 'konaelectirc.png');

-- CarDetail1에 데이터 삽입 (Standard)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '코나 일렉트릭'),
    '전기', '-', '4.7km/kWh', 5, '-', '전륜', '133hp', '26kg.m', '4,355mm', '1,825mm', '1,575mm', '2,660mm', '1,625kg', 'Standard'
);

-- CarDetail2에 데이터 삽입 (Standard)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Standard' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나 일렉트릭')), 'E 밸류 플러스', '4,142만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Standard' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나 일렉트릭')), '프리미엄', '4,352만원');

-- CarDetail1에 데이터 삽입 (Long Range)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '코나 일렉트릭'),
    '전기', '-', '4.7km/kWh', 5, '-', '전륜', '133hp', '26kg.m', '4,355mm', '1,825mm', '1,575mm', '2,660mm', '1,625kg', 'Long Range'
);

-- CarDetail2에 데이터 삽입 (Long Range)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나 일렉트릭')), '모던 플러스', '4,566만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나 일렉트릭')), '프리미엄', '4,652만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나 일렉트릭')), '인스퍼레이션', '4,992만원');

-- CarDetail1에 데이터 삽입 (Long Range N Line)
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '코나 일렉트릭'),
    '전기', '-', '4.7km/kWh', 5, '-', '전륜', '201hp', '26kg.m', '4,385mm', '1,825mm', '1,575mm', '2,660mm', '1,740kg', 'Long Range N Line'
);

-- CarDetail2에 데이터 삽입 (Long Range N Line)
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range N Line' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나 일렉트릭')), '프리미엄', '4,831만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range N Line' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '코나 일렉트릭')), '인스퍼레이션', '5,086만원');

--

-- CarMain에 아이오닉 5 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '준중형', 'SUV', '아이오닉 5', 'hyundai.png', 'ioniq5.png');

-- CarDetail1에 Standard 트림 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 5'),
    '전기', '-', '6.5km/kWh', 5, '-', '-', '167hp', '35.7kg.m', '4,655mm', '1,890mm', '1,605mm', '3,000mm', '1,890kg', 'Standard'
);

-- CarDetail2에 Standard 트림의 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Standard' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 5')), 'E 밸류 플러스', '4,700만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Standard' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 5')), '익스클루시브', '4,990만원');

-- CarDetail1에 Long Range 트림 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 5'),
    '전기', '-', '6.3km/kWh', 5, '-', '-', '167hp', '35.7kg.m', '4,655mm', '1,890mm', '1,605mm', '3,000mm', '1,890kg', 'Long Range'
);

-- CarDetail2에 Long Range 트림의 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 5')), 'E 라이트', '5,240만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 5')), '익스클루시브', '5,410만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 5')), '프레스티지', '5,885만원');


--

-- CarMain에 아이오닉 6 데이터 삽입
INSERT INTO CarMain (DomesticImport, Brand, VehicleSize, CarModel, CarName, BrandMark, CarImage)
VALUES ('국내', '현대', '중형', '세단', '아이오닉 6', 'hyundai.png', 'ioniq6.png');

-- CarDetail1에 Standard 트림 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 6'),
    '전기', '-', '6.2km/kWh', 5, '-', '-', '149hp', '35.7kg.m', '4,855mm', '1,880mm', '1,495mm', '2,950mm', '1,800kg', 'Standard'
);

-- CarDetail2에 Standard 트림의 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Standard' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 6')), 'E 밸류 플러스', '4,695만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Standard' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 6')), '익스클루시브', '4,945만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Standard' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 6')), '익스클루시브 플러스', '5,150만원');

-- CarDetail1에 Long Range 트림 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 6'),
    '전기', '-', '6km/kWh', 5, '-', '-', '225hp', '35.7kg.m', '4,855mm', '1,880mm', '1,495mm', '2,950mm', '1,930kg', 'Long Range'
);

-- CarDetail2에 Long Range 트림의 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 6')), 'E 라이트', '5,060만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 6')), '익스클루시브', '5,405만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 6')), '익스클루시브 플러스', '5,575만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 6')), '프레스티지', '5,935만원');

-- CarDetail1에 Long Range AWD 트림 데이터 삽입
INSERT INTO CarDetail1 (c_idx, FuelType, Displacement, FuelEfficiency, SeatingCapacity, EngineType, DriveType, MaxPower, MaxTorque, Length, Width, Height, Wheelbase, CurbWeight, Grade)
VALUES (
    (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 6'),
    '전기', '-', '5.5km/kWh', 5, '-', '사륜', '320hp', '61.7kg.m', '4,855mm', '1,880mm', '1,495mm', '2,950mm', '2,035kg', 'Long Range AWD'
);

-- CarDetail2에 Long Range AWD 트림의 가격 정보 삽입
INSERT INTO CarDetail2 (cd1_idx, Trim, Price)
VALUES 
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 6')), 'E 라이트', '5,307만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 6')), '익스클루시브', '5,652만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 6')), '익스클루시브 플러스', '5,822만원'),
    ((SELECT cd1_idx FROM CarDetail1 WHERE Grade = 'Long Range AWD' AND c_idx = (SELECT c_idx FROM CarMain WHERE CarName = '아이오닉 6')), '프레스티지', '6,182만원');
