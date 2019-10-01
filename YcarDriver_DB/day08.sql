desc D_ROUTE;
desc DRIVER;

select * from D_ROUTE;

-- inner나 left나 행중복,, 그러나 널값일 땐 드라이버 값만 나옴...이게 낫긴 함.
select * from DRIVER
left join D_ROUTE
using (d_idx)
where d_idx = 13
;
select * from DRIVER
inner join D_ROUTE
using (d_idx)
where d_idx = 13
;

select * from DRIVER
left join D_ROUTE
using (d_idx)
where d_idx = 13
;


insert into D_ROUTE
values(13, 'H', '서울시 마포구 합정동')
;

insert into D_ROUTE
values(13, 'C', '서울시 종로구 종로2가')
;


drop table Passenger;