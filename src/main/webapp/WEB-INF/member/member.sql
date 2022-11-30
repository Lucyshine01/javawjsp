show tables;

create table member (
	idx int not null auto_increment,  /* 회원 고유번호 */
	mid varchar(20) not null,					/* 회원 아이디(중복불허) */
	pwd varchar(100) not null,				/* 비밀번호(SHA암호화 처리) */
	nickName varchar(20) not null,		/* 별명(중복불허/수정가능) */	
	name varchar(20) not null,				/* 회원 성명 */
	gender varchar(5) default '남자',	/* 성별 */
	birthday datetime default now(),	/* 생일 */
	tel varchar(15),									/* 전화번호(010-1234-5678) */
	address varchar(100),							/* 회원주소(상품 배달시 기본주소로 사용) */
	email varchar(50) not null,				/* 이메일(아이디/비밀번호 분실시 사용) */
	homePage varchar(50) not null,		/* 홈페이지(블로그) 주소 */
	job varchar(20),									/* 회원 직업 */
	hobby varchar(100),								/* 회원 취미(2개이상은 '/'로 구분처리) */
	photo varchar(100) default 'noimage.jpg', /* 회원 사진 */
	content text,											/* 회원 자기 소개 */
	userInfor	char(6) default '공개',	/* 회원 정보 공개여부(공개/비공개) */
	userDel char(2) default 'NO',			/* 회원 탈퇴 신청 여부(OK:탈퇴신청한회원, NO:현재가입중인회원) */
	point int default 100,						/* 회원누적포인트(가입시는 기본 100pt증정, 방문시마다 1회 10pt증가, 최대 1일 50pt포인트까지) */
	level int default 1,							/* 회원등급(0:관리자, 1:준회원, 2:정회원, 3:우수회원, 4:(운영자)) */
	visitCnt int default 0,						/* 방문횟수 */
	startDate datetime default now(),	/* 최초 가입일 */
	lastDate datetime default now(),	/* 마지막 접속일 */
	todayCnt int default 0,						/* 오늛 방문한 횟수 */
	primary key(idx,mid)							/* 주키: idx(고유번호), mid(아이디) */
);

/* drop table member; */

desc member;

insert into member values (default,'admin','1234','관리맨','관리자',default,default,'010-2880-5451','충청북도 청주시 풍년로 56','saasdfhr@gmail.com','http://www.saasdfhr1234.com','프리랜서','등산/바둑',default,'관리자입니다.',default,default,default,0,default,default,default,default);

select * from member;

delete from member where mid = 'asdfasdf';
update member set pwd = '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'  where mid = 'admin';

select * from member where (mid like '%a%' or nickName like '%a%' and name like '%a%' and gender like '%a%') and userInfor = '공개' order by idx desc;
