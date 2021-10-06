-- no 정수형(4), pk, (pk_userTBL)
-- username 가변형문자열(20)

create table userTBL(
       no number(4) constraint pk_userTBL primary key,
       username varchar2(20) not null,
       birthYear Number(4) not null,
       addr varchar2(20) not null,
       mobile varchar2(20)
);

-- no : 번호 (순차적인 번호 부여) => 시퀀스 객체
create sequence user_seq;

--user삽입
insert into userTBL values(user_seq.nextval,'홍길동',1985,'서울','010-1234-5678');

insert into userTBL values(user_seq.nextval,'김지우',1986,'부산','010-4567-9685');

insert into userTBL values(user_seq.nextval,'신동완',1990,'경기','010-9877-2356');

commit;

-- 전체 사용자 조회
select * from userTBL;