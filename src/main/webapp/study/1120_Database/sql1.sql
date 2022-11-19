show databases;

show tables;

select * from bank;
select * from user;

create table jusorok (
	idx int not null auto_increment primary key,
	mid varchar(20) not null,				/* 아이디 */
	pwd varchar(20) not null,				/* 비밀번호 */
	name varchar(20) not null,			/* 성명 */
	point int default 90,					/* 방문포인트 */
	lastDate datetime default now(),	/* 최종방문날짜 */
	today int default -1 not null		/* 당일 방문횟수 */
);

desc jusorok;

insert into jusorok values (default, 'admin', '1234', '관리자', default, default, default);
insert into jusorok values (253, 'hkd1234', '1234', '홍길동', default, default, default);

update jusorok set lastDate = default where mid = 'admin';

select * from jusorok;

select * from jusorok where mid like '%ad%' and pwd like '%23%';
select * from jusorok where idx like '%5%';

delete from jusorok where mid = 'hkd1234';

drop table jusorok;