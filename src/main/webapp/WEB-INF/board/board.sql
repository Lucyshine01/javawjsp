show tables;

create table board (
	idx int not null auto_increment, 	/* 게시글의 고유번호 */
	nickName varchar(20) not null,		/* 게시글 올린사람의 닉네임 */
	title varchar(100) not null,			/* 게시글 올린사람의 닉네임 */
	email varchar(50),								/* 글쓴이의 메일주소(회원가입시에 필수 입력처리 되어 있다.) */
	homePage varchar(50),							/* 글쓴이의 홈페이지(블로그)주소 */
	content text not null,						/* 글 내용 */
	wDate datetime default now(),			/* 글 올린 날짜 */
	hostIp varchar(50) not null,			/* 글 올린이의 접속 IP */
	readNum int default 0,						/* 글 조회수 */
	good int default 0,								/* '좋아요' 클릭 횟수 누적하기 */
	mid varchar(20) not null,					/* 회원 아이디(내가 올린 게시글 전체 조회시체 사용) */
	primary key(idx)
);



ALTER TABLE board ADD goodId text;
alter table board drop goodId;

desc board;

insert into board values (default,'관리맨','게시판 서비스를 시작합니다.','saasdfhr@gmail.com','http://www.saasdfhr1234.com','이곳은 게시판입니다.',default,'192.168.50.79',default,default,'admin');

select * from board;

/* 날짜함수 처리 연습 */
select now(); -- now() : 오늘 날짜와 시간을 보여준다.

/* year() : 년도 출력 */
select year(now());
/* month() : 월 출력 */
select month(now());
/* day() : 일 출력 */
select day(now());
/* date(now()) : 년-월-일 출력 */
select date();
/* weekday(now()) : 요일 : 0(월), 1(화), 2(수), 3(목), 4(금), 5(토), 6(일) */
select weekday(now());
/* dayofweek() 요일 : 1(일), 2(월), 3(화), 4(수), 5(목), 6(금), 7(토) */
select dayofweek(now());

/* hour() : 시 출력 */
select hour(now());
/* minute() : 분 출력 */
select minute(now());
/* second() : 초 출력 */
select second(now());


select year('2022-12-1');
select idx, nickName, year(wDate) from board;
select idx, nickName, day(wDate) as 날짜 from board;
select idx, nickName, wDate, weekday(wDate) as 요일 from board;

/* 날짜 연산 */
-- date_add(date, interval 값 type) 앞에 날짜에서 뒤에 일수를 더함
/* 오늘날짜보다 +1일 출력 */
select date_add(now(), interval 1 day); 
/* 오늘날짜보다 -1일 출력 */
select date_add(now(), interval -1 day); 
/* 오늘날짜보다 +10시간 출력 */
select date_add(now(), interval 10 day_hour); 
/* 오늘날짜보다 -10시간 출력 */
select date_add(now(), interval -10 day_hour); 

-- date_sub(date, interval 값 type) 앞에 날짜에서 뒤에 일수를 뺌
select date_sub(now(), interval 1 day);
select date_sub(now(), interval -1 day);


select idx, wDate from board;
/* 년:%y,%Y 월:%m,%M 일:%d,%D */
/* %M 월을 영문출력 */
select idx, date_format(wDate, '%y-%M-%d') from board;
/* %m 월을 숫자출력 */
select idx, date_format(wDate, '%y-%m-%d') from board;
select idx, date_format(wDate, '%y년 %m월 %d일') from board;
/* %y 년도 2자리, %Y 년도 4자리 출력 */
select idx, date_format(wDate, '%Y-%m-%d') from board;
/* %D 일을 th붙여서 출력  */
select idx, date_format(wDate, '%Y-%m-%D') from board;

/* %h(12시간),%H(24시간) */
select idx, date_format(wDate, '%h시 %i분 %s초') from board;
select idx, date_format(wDate, '%H시 %i분 %s초') from board;

-- 현재부터 한달전의 날짜
select date_add(now(), interval -1 month);
select date_add(now(), interval -1 year);

-- 하루전 체크
select date_add(now(), interval -1 day);
select date_add(now(), interval -1 day), wDate from board;

-- 날짜차이 계산 : DATEDIFF(시작날짜, 마지막날짜)
select datediff('2022-11-30', '2022-12-01');
select datediff(now(), '2022-11-30');
select idx, wDate, datediff(now(), wDate) from board;
select *, datediff(now(), wDate) as day_diff from board;


select date(now());SELECT TIMESTAMPDIFF(minute, date_format('2022-04-20 01:01', '%Y-%m-%d %H:%i'), date_format('2022-12-31 23:59', '%Y-%m-%d %H:%i')) AS time_diff;
SELECT TIMESTAMPDIFF(hour, date_format('2022-11-30 13:01', '%Y-%m-%d %H:%i'), date_format(now(), '%Y-%m-%d %H:%i')) AS time_diff;
/* timestampdiff(시간타입, 시작날짜, 마지막날짜)*/
select timestampdiff(hour, now(), '2022-11-30');
select timestampdiff(hour, '2022-11-30', now());
select timestampdiff(minute, now(), '2022-11-30');
select timestampdiff(minute, '2022-11-30', now());
select timestampdiff(hour, wDate, now()) from board;
select *,timestampdiff(hour, wDate, now()) as hour_diff from board;
select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from board;




