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

select * FROM Board;

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