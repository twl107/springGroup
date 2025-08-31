show tables;

create table friend (
  idx  int not null auto_increment primary key,
  mid varchar(20) not null,
  pwd varchar(20) not null,
  nickName varchar(20) not null,
  name varchar(20) not null,
  age  int  default 20,
  gender char(2) default '여자',
  address varchar(30),
  photo varchar(50),		/* 회원사진 filesystem 이름으로 저장 */
  unique key(mid),
  unique key(nickName)
);

alter table friend add column photo varchar(50);

desc friend;
drop table friend;

insert into friend values (default, 'admin', '1234', '관리맨', '관리자', 33, '남자', '서울');
insert into friend values (default, 'ikj1234', '1234', '이장군', '이기자', 23, '남자', '청주');
insert into friend values (default, 'hkd1234', '1234', '홍장군', '홍길동', 28, '남자', '경기');

select * from friend;

update friend set pwd = '4146042278' where idx = 1;
update friend set pwd = '4146042278' where idx = 2;
update friend set pwd = '4146042278' where idx = 3;