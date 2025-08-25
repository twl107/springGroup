show tables;

create table board (
	idx int not null auto_increment,	/* 게시글의 고유번호 */
	mid varchar(20) not null,					/* 게시판 올린이 아이디 */
	nickName varchar(20),						/* 게시판 올린이 닉네임 */
	title varchar(100) not null,			/* 게시글 제목 */
	content text not null,						/* 게시글 내용 */
	hostIp varchar(30) not null,			/* 게시글 올린 PC IP */
	openSw char(2) default 'OK',			/* 게시글 공개여부(OK:공개, NO:비공개) */
	readNum int default 0,						/* 글 조회수 */
	wDate datetime default now(),			/* 글 올린 날짜 */
	good int default 0,								/* 좋아요 클릭 수 */
	complaint char(2) default 'NO',	/* 신고글(정상글:NO, 신고당한글:OK) */
	primary key(idx),
	foreign key(mid) references friend(mid)
);

desc board;

drop table board;

insert into board values (default,'admin','관리맨','게시판 서비스를 시작합니다.','즐거운 게시판 생활 되세요','192.168.50.57',default,default,default,default,default);

select * from board;