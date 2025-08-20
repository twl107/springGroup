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
  unique key(mid),
  unique key(nickName)
);

desc friend;
drop table friend;

insert into friend values (default, 'admin', '1234', '관리맨', '관리자', 33, '남자', '서울');

select * from friend;

update friend set pwd = '4146042278' where idx = 1;
update friend set pwd = '4146042278' where idx = 2;
update friend set pwd = '4146042278' where idx = 3;