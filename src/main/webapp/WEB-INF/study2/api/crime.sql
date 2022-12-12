show tables;

create table crime (
	idx int not null auto_increment primary key,
	year int,						/* 범죄년도 */
	police varchar(20), /* (관할) 경찰서 */
	burglar int,				/* 강도 건수 */
	murder int,					/* 살인 건수 */
	theft	int,					/* 절도 건수 */
	violence int				/* 폭력 건수 */
);

select * from crime order by year desc, police;

select year,sum(burglar) as totBurglar,sum(murder) as totMurder,sum(theft) as totTheft,sum(violence) as totViolence
from crime group by year order by year desc, police;

select year,avg(burglar) as totBurglar,avg(murder) as totMurder,avg(theft) as totTheft,avg(violence) as totViolence
from crime group by year order by year desc, police;

