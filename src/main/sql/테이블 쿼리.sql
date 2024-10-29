CREATE DATABASE CarProject;

----------------------------------------------------------------------------

create table Member(
	m_idx Int auto_increment primary key COMMENT '회원 식별 번호',
    name varchar(50) not null COMMENT '이름',
    age int not null COMMENT '나이',
    gender char(1) not null COMMENT '성별',
    address varchar(500) not null COMMENT '주소',
    phone varchar(50) not null COMMENT '전화번호',
    mail varchar(200) not null COMMENT '이메일',
    id varchar(200) not null COMMENT '아이디',
    password varchar(200) not null COMMENT '비밀번호'
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

select * from Member;

insert into member(m_idx, name, age, gender, address, phone, mail, id, password)
values(1, '김영현', 31, '남', '서울시 마포구', '01012345678', 'abc@naver.com', 'younghyun123', 'abc123@');
insert into member(m_idx, name, age, gender, address, phone, mail, id, password)
values(2, '김건우', 26, '남', '서울시 양천구', '01064322091', 'ddcy1111@naver.com', 'ddcy1111', 'rjsdn2091@'),
(3, '조승현', 28, '남', '경기도 시흥시', '01012345678', 'abc@naver.com', 'asd123', 'abc123@'),
(4, '안석운', 31, '남', '서울시 마포구', '01012345678', 'abc@naver.com', 'qwer123', 'abc123@'),
(5, '최진경', 32, '남', '서울시 마포구', '01012345678', 'abc@naver.com', 'zxcv123', 'abc123@'),
(6, '문훈교', 26, '남', '서울시 마포구', '01012345678', 'abc@naver.com', 'abc123', 'abc123@');
----------------------------------------------------------------------------

create table Board(
	b_idx Int auto_increment primary key COMMENT '게시글 식별 번호',
    m_idx Int not null COMMENT '회원 식별 번호',
    title varchar(200) not null COMMENT '제목',
    content varchar(2500) not null COMMENT '내용',
    image1 varchar(500) COMMENT '이미지1',
    image2 varchar(500) COMMENT '이미지2',
    image3 varchar(500) COMMENT '이미지3',
    announcement char(1) default 2 COMMENT '공지 설정 (1 : 설정, 2 : 미설정)',
    CONSTRAINT fk_member_midx FOREIGN KEY (m_idx) REFERENCES Member(m_idx)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

ALTER TABLE employees
ADD COLUMN regdate DATE DEFAULT now();


select * FROM Board;
select * from board order by b_idx desc;

insert into board(m_idx, title, content, image1, image2, image3, announcement)
values(1, '소통해요 회원님들~', '안녕하세요~ 이번에 k5를 구매한 초보 차쟁이입니다. 다름이 아니라 어쩌구 저쩌구', 'car-6.jpg', null, null, '2');
insert into board(m_idx, title, content, image1, image2, image3, announcement)
values(2, '새로 출시된 스포츠카 어때요?', '요즘 스포츠카 열풍인데 어제 나온 신형 모델 어떤가요? 디자인이 정말 끝내주던데... 성능도 좋다고 하더라고요. 가격은 좀 나가지만 그만한 가치가 있을 것 같아요. 한번 시승해보고 싶네요!!', 'car-10.jpg', null, null, '2'),
(3, '전기차 보조금 질문드립니다', '안녕하세요 전기차 구매 고민중인데 보조금 관련해서 궁금한게 있어서요. 지역마다 보조금 금액이 다르던데 우리 지역은 얼마나 되나요? 그리고 신청 기간이 언제까지인가요? 전기차 구매하실 분들에게 도움이 되었으면 좋겠네요^^', 'car-5.jpg', null, null, '2'),
(4, '내 차 자랑 ㅎㅎ', '드디어 어제 새 차 뽑았습니다!! 6개월 기다린 보람이 있네요ㅎㅎ 첨부한 사진 보시면 아시겠지만 제가 원했던 옵션으로 다 넣었더니 겉모습이 완전 취향저격이에요. 색상도 너무 맘에 들고요~ 내부 인테리어도 고급스러워요! 다들 새 차 뽑으실 때 참고하세요 ㅎㅎ', 'car-3.jpg', null, null, '2'),
(5, '중고차 사기 당한 것 같아요... 도와주세요ㅠㅠ', '한 달 전에 중고차를 구입했는데 최근에 엔진에서 이상한 소리가 나더니 결국 어제 고장이 났습니다. 알고보니 몇 년 전 사고 이력이 있던 차였던 거에요. 상태가 좋다고 해서 믿고 샀는데 완전히 속은 기분이네요. 어떻게 해야할까요? 판매자에게 보상을 요구할 수 있을까요? 도와주시면 감사하겠습니다ㅠㅠ', 'car-2.jpg', null, null, '2'),
(6, '우리 동네 카페에서 자동차 모임 해요~', '안녕하세요 우리 동네 이디야에서 매주 토요일마다 자동차 모임을 하고 있습니다! 관심있는 분들 누구나 환영해요~ 자동차 관련 정보도 공유하고 같이 드라이브도 가고 재밌게 놀고 있어요 ㅎㅎ 참여하고 싶으신 분들은 댓글 남겨주시면 자세한 안내 드리겠습니다!', 'car-1.jpg', null, null, '2');


----------------------------------------------------------------------------

create table CarMain(
	c_idx Int auto_increment primary key COMMENT '차량 식별 번호',
	DomesticImport varchar(50) not null COMMENT '국내/수입',
    Brand varchar(50) not null COMMENT '브랜드',
    VehicleSize varchar(50) not null COMMENT '차량 크기',
    CarModel varchar(50) not null COMMENT '차종',
    CarName varchar(50) not null COMMENT '모델명',
    BrandMark varchar(50) not null COMMENT '브랜드 마크',
    CarImage varchar(50) not null COMMENT '차량 이미지'
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

select * from CarMain;
ALTER TABLE CarMain AUTO_INCREMENT=0;
----------------------------------------------------------------------------

CREATE TABLE CarDetail1 (
    cd1_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '차량 디테일1 식별 번호',
    c_idx INT NOT NULL COMMENT '차량 식별 번호',
    FuelType VARCHAR(50) NOT NULL COMMENT '연료 종류',
    Displacement VARCHAR(50) NOT NULL COMMENT '배기량',
    FuelEfficiency VARCHAR(50) NOT NULL COMMENT '연비',
    SeatingCapacity VARCHAR(50) NOT NULL COMMENT '인승',
    EngineType VARCHAR(50) NOT NULL COMMENT '엔진 형식',
    DriveType VARCHAR(50) NOT NULL COMMENT '구동 방식',
    MaxPower VARCHAR(50) NOT NULL COMMENT '최고 출력',
    MaxTorque VARCHAR(50) NOT NULL COMMENT '최대 토크',
    Length VARCHAR(50) NOT NULL COMMENT '전장',
    Width VARCHAR(50) NOT NULL COMMENT '전폭',
    Height VARCHAR(50) NOT NULL COMMENT '전고',
    Wheelbase VARCHAR(50) NOT NULL COMMENT '축거',
    CurbWeight VARCHAR(50) NOT NULL COMMENT '공차 중량',
    Grade VARCHAR(50) NOT NULL COMMENT '등급',
    CONSTRAINT fk_carmain_cidx FOREIGN KEY (c_idx) REFERENCES CarMain(c_idx)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

select * from CarMain;
select * from CarDetail1;
select * from CarDetail2;


----------------------------------------------------------------------------

CREATE TABLE CarDetail2 (
    cd2_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '차량 디테일2 식별 번호',
    cd1_idx INT NOT NULL COMMENT '차량 디테일1 식별 번호',
    Trim VARCHAR(50) NOT NULL COMMENT '트림',
    Price VARCHAR(50) NOT NULL COMMENT '가격',
    CONSTRAINT fk_cardetail1_cd1_idx FOREIGN KEY (cd1_idx) REFERENCES CarDetail1(cd1_idx)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

select * from CarDetail2;

----------------------------------------------------------------------------

CREATE TABLE CarFavorites (
    cf_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '차량 찜하기 식별 번호',
    m_idx INT NOT NULL COMMENT '회원 식별 번호',
    cd2_idx INT NOT NULL COMMENT '차량 디테일2 식별 번호',
    CONSTRAINT fk_member_midx2 FOREIGN KEY (m_idx) REFERENCES Member(m_idx),
    CONSTRAINT fk_cardetail2_cd2_idx FOREIGN KEY (cd2_idx) REFERENCES CarDetail2(cd2_idx)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;


select * from CarFavorites;

----------------------------------------------------------------------------

select * FROM carmain;
select * FROM cardetail1;
select * FROM cardetail2;