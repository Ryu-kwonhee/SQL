/* SELECT구문은 DB 내부의 자료를 조회하는 구문입니다.
SELECT 컬럼명1, 컬럼명2... FROM 테이블이름 WHERER 조건;
형식으로 주로 사용합니다.*/

/* SELECT 구문을 활용하기에 앞서서 사용할 데이터베이스(스키마)를
지정해야 합니다. 이를 위해 USE구문을 사용합니다.
아래 구문은 좌측 SCHMAS에서 employees를 우클릭 한 후
set as default schema를 클릭하는것과 같은 효과를 냅니다.*/
-- employees 데이터베이스가 지금부터 모든 명령을 받습니다.
-- 한 줄 주석은 좌측과 같이 "-- 주석내용"으로 작성합니다.
use employees;

-- ictii03 데이터베이스가 지금부터 모든 명령을 받습니다.
use ict03;

-- employees 데이터베이스 내부의 employees table조회
-- SQL구문으 명령구문은 무조건 대문자, 테이블명이나 호칭 등은
-- 소문자로 작성하는 것이 관례입니다.
-- 무조건 지키지 않아도 되는 제약조건이지만 가독성을 위해 되도록 지켜주세요.
SELECT * FROM employees;

-- 원래 테이블 조회시는 데이터베이스명, 테이블명으로 모두 표기해야 합니다.
SELECT * FROM employees.employees;

-- 컬럼을 전체가 아닌 임의로 가져올때는 컬럼명을 , 로 구분합니다.
-- 이 경우도 모든 컬럼이 아닌 일부 컬럼만 조회할 수도 있으며
-- 심지어 한 개의 컬럼만 조회하는 등 개수 조절도 가능합니다.
SELECT first_name, last_name, gender FROM employees;

-- CMD환경에서는 좌측 스키마처럼 DB목록을 보여주는 창이 없으므로
-- 아래 명령어를 이용해 DB목록을 확인 할 수 있습니다.
SHOW databases;

-- 현재 DB정보를 조회하기 위해서는
SHOW TABLE STATUS;

-- 특정 테이블의 컬럼 정보를 조회하고 싶다면 아래 명령어를 씁니다.
-- DESCRIBE 테이블명; 혹은 DESC 테이블명;
DESCRIBE employees;
DESC employees;

-- 보통 Db는 그냥 생성하지만
-- 간혹 DB가 있는데 초기화하기위해 만약 기존에 같은 이름을 가진
-- DB가 존재한다면 삭제하고 다시 만들라는 명령을 내리기도 합니다.
-- 아래처럼 조건문을 이용해서 처리합니다.
DROP DATABASE IF EXISTS sqlDB; -- sqlDB가 존재시 삭제
CREATE DATABASE sqlDB DEFAULT CHARACTER SET utf8;
USE sqlDB;
-- 테이블을 생성합니다.
-- 테이블 생성시 적힌 제약조건과 컬럼명을 활용해 만들어주세요.

  -- PRIMARY KEY(주요키)
    -- 각 테이블을 대표할 수 있는 대표데이터를 저장하는 컬럼에 붙인다.
    -- 모든 테이블은 무조건 하나의 PRIMARY KEY를 갖는다.
    -- PRIMARY KEY는 자동으로 중복을 방지하고, NULL도 받을 수 없다.
    
CREATE TABLE userTbl(
	userID CHAR(8) PRIMARY KEY NOT NULL,
    username VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    pnum CHAR(11),
    height INT,
    mDate DATE
    );
    
-- FOREIGN KEY(외래 키)
-- 쇼핑몰의 구매자는 반드시 회원이어야 하듯
-- 특정 테이블의 값만을 해당 컬럼에 들어올 수 있도록 거는 제약조건
-- FOREIGN KEY를 거는 컬럼의 자료형과 크기는 
-- 양 쪽 모두에서 같아야 한다.   
-- 참조컬럼에 있는 자료만 타겟컬럼으로 들어올 수 있다.
-- 지금 같은 경우 buyTbl의 userID에는 userTbl의 userID에 존재하는
-- 데이터만 저장할 수 있다.

CREATE TABLE buyTbl(
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	userID char(8) NOT NULL,
    prodName CHAR(6) NOT NULL,
    groupName CHAR(4),
    price INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY (userID) REFERENCES userTbl(userID) -- FOREIGN KEY는 다른쪽의 PRIMARY KEY만 받을 수 있다.
    );
    
    -- 테이블 삭제는 DROP TABLE 테이블명; 으로 합니다.
    -- DB처럼 삭제시 IF EXISTS를 쓸 수 있습니다.
    DROP TABLE IF EXISTS buyTbl;
    DROP TABLE buyTbl;
INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '01111111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '01122222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '01133333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '01144444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', '성시경', 1979, '서울', null, 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '임재범', 1963, '서울', '01166666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '윤종신', 1969, '경남', null, 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', '은지원', 1972, '경북', '01188888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', '조관우', 1965, '경기', '01199999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '바비킴', 1973, '서울', '01100000000', 176, '2013-5-5');

INSERT INTO buyTbl VALUES(null, 'KBS', '운동화', null, 30, 2);
INSERT INTO buyTbl VALUES(null, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES(null, 'JYP', '모니터', '전자', 200, 1);
INSERT INTO buyTbl VALUES(null, 'BBK', '모니터', '전자', 200, 5);
INSERT INTO buyTbl VALUES(null, 'KBS', '청바지', '의류', 50, 3);
INSERT INTO buyTbl VALUES(null, 'BBK', '메모리', '전자', 80, 10);
INSERT INTO buyTbl VALUES(null, 'SSK', '책', '서적', 15, 5);
INSERT INTO buyTbl VALUES(null, 'EJW', '책', '서적', 15, 2);
INSERT INTO buyTbl VALUES(null, 'EJW', '청바지', '의류', 50, 1);
INSERT INTO buyTbl VALUES(null, 'BBK', '운동화', NULL, 30, 2);
INSERT INTO buyTbl VALUES(null, 'EJW', '책', '서적', 15, 1);
INSERT INTO buyTbl VALUES(null, 'BBK', '운동화', NULL, 30, 2);

-- buyTbl에 임의로 INSERT 구문을 이용해서
-- 없는 userID를 정해 데이터 입력을 시도해보세요.
INSERT INTO buyTbl VALUES(null, 'GGG', '운동화', NULL, 30, 2);
 


-- 여태까지 SELECT 구문은 조건없이 모든 데이터를 조회했습니다.
-- 극단적인 경우 employees 테이블의 수십만 row를 다 조회하다보니
-- 조회 시간만 오래 걸리는 경우가 발생했습니다.
-- 따라서 조건에 맞도록 필터링을 할 수 있고, 이를 위해 사용하는 구문은
-- WHERE구문입니다.
-- SELECT 컬럼명1, 컬럼명2... FROM 테이블명 WHERE 컬럼명 + 조건식;

-- 아래는 이름이 김경호인 사람만 조회하는 구문입니다.
SELECT * FROM userTbl WHERE username = '김경호';
-- 관계연산자를 활용해서 대소비교를 하거나
-- and, or을 이용해 조건 여러개를 연결할 수 있습니다.
-- 1970년 이후 출생했으며, 키가 182이상인 사람의 아이디와 이름을
-- 조회하는 구문을 아래에 작성해주세요.(workbench, 커맨드라인 둘 다) 

SELECT userID, username FROM userTbl WHERE (birthYear > 1970) and (height >= 182);