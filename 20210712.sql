/* 1. 데이터베이스 생성 명령
DB생성시 한글을 쓸 수 있도록 - default charcharacter set utf8; */
create database ict03 default character set utf8;

/* 최하단 Schemas 클릭 후, 새로고침 한 다음 ict03 우클릭
-> set as default schema를 클릭함, 이러면 현재 명령을 받을 DB로
지정됨*/

/* DB 사용자 계정 생성하기 */
/* user -> ID, identified by -> Password */
create user 'ict' identified by 'ict';

/* 사용자에게 권한 부여
grant 주고싶은기능1, 주고싶은기능2...
만약 모든 권한을 넘길때는 all provileges(관리자의 모든 권한)
to 뒤쪽에는 어떤 계정에게 권한을 넘길지 */
grant all privileges on ict03.* to 'ict';

/* 테이블 생성 명령
primary key - 컬럼의 주요 키를 뜻하며, 중복데티터를 방지합니다.
하나의 컬럼은 반드시 primary key 속성을 가져야함.
not null -> 데이터에 null 값이 들어오는 것을 방지.
UNIQUE -> 중복 데이터가 들어오는것을 막습니다. */
CREATE TABLE users (
	uid varchar(20) primary key,
	upw varchar(20) not null,
    uname varchar(30) not null,
    email varchar(80)
    );
   
    select upw, email from users;
    
    /* 데이터 적재하기
    INSERT INTO 테이블명(컬럼1, 컬럼2...) VALUES(컬럼1값, 컬럼2값...)
    만약 모든 컬럼이 전부 입력대상인 경우 테이블명과 VALUES사이는 생략가능
    INTO 테이블명 VALUES (컬럼1값, 컬럼2값...) */
    INSERT INTO users VALUES("asdf", "123", "ghg", null);
    select * from users;
    
    /* WORKBENCH상에서 데이터를 입력했을때는 마지막에
    반드시 commit;이라고 한 번 더 확인작업을 해줘야
    데이터가 최종적으로 저장됩니다. */
    commit;
    