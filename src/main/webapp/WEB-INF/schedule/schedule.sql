show tables;

create table schedule (
  idx   int not null auto_increment primary key,
  mid   varchar(20) not null,					/* 회원 아이디(일정검색시 필요) */
  sDate datetime not null,						/* 일정 등록 날짜 */
  part  varchar(10) not null,					/* 1.모임, 2.업무, 3.학습, 4.여행, 5:기타 */
  content text not null								/* 일정 상세 내역 */
);

desc schedule;


insert into schedule values (default,'saasdfhr','2022-12-08','학습','프로젝트 계쇡서 완료');
insert into schedule values (default,'saasdfhr','2022-12-09','기타','집안일');
insert into schedule values (default,'saasdfhr','2022-12-12','학습','관리자화면 설계');
insert into schedule values (default,'saasdfhr','2022-12-25','여행','크리스마스 친구들과 평택아지트');
insert into schedule values (default,'saasdfhr','2022-12-25','모임','가족조찬모임');
insert into schedule values (default,'saasdfhr','2022-12-25','모임','저녁 지인모임');
insert into schedule values (default,'saasdfhr','2022-12-25','학습','오전10시 스터디카페');
insert into schedule values (default,'saasdfhr','2022-12-31','모임','연말 친척모임');
insert into schedule values (default,'saasdfhr','2023-01-05','학습','Spring설정공부');
insert into schedule values (default,'kms1234','2022-12-25','모임','크리스마스 모임');
insert into schedule values (default,'kms1234','2022-12-27','학습','프로젝트 회원관리 완성');


select * from schedule order by sDate desc;
select * from schedule where mid='saasdfhr' order by sDate desc;
select * from schedule where mid='saasdfhr' and sDate='2022-12-25' order by sDate desc;
select * from schedule where mid='saasdfhr' and date_format(sDate,'%Y-%m')='2022-12' order by sDate desc;
select * from schedule where mid='saasdfhr' and date_format(sDate,'%Y-%m')='2023-1' order by sDate desc; -- 에러..(dateformat 형식에 맞춰지지않음 01로 수정)
select * from schedule where mid='saasdfhr' and date_format(sDate,'%Y-%m')='2022-12' group by part order by sDate desc;
select *,count(*) from schedule where mid='saasdfhr' and sDate='2022-12-25'  group by part order by sDate desc;
select *,count(*) from schedule where mid='saasdfhr' and date_format(sDate,'%Y-%m-%d')='2022-12-25' group by part order by sDate desc;


select * from schedule where mid='saasdfhr' and date_format(sDate,'%Y-%m')='2022-12' order by sDate desc;
select *,count(*) as cnt from schedule where mid='saasdfhr' and date_format(sDate,'%Y-%m')='2022-12' group by sDate order by sDate desc;

