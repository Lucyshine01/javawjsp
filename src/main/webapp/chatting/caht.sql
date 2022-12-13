show tables;

create table chat (
	idx int not null auto_increment primary key, /* 채팅 내용 고유번호 */
	nickName varchar(20) not null, /* 닉네임 */
	content varchar(200) not null, /* 채팅 내용 */
	cDate datetime not null default now(), /* 채팅 올린 날짜와 시간 */
	avatar char(1) not null default '1' /* 아바타 */
);

insert into chat values (default, '힙스털', '북치기 박치기 뱅뱅', default, default);
select * from chat;
select * from chat order by cDate desc limit (1),(14);
select count(*) from chat;
