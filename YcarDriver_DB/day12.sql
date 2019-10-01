select * from D_CARPOOL;

select * from RESERVATION;
select * from DRIVER;

-- 카풀등록 내역과 카풀예약내역 조인, 등록한 운전자의 pk 가져옴
select 
c.dr_idx
, r.r_idx
, r.p_idx
, c.d_date
, c.d_startpoint
, c.d_endpoint
, r.r_confirm
, d.d_idx
from RESERVATION r
left join D_CARPOOL c
on c.dr_idx = r.dr_idx
inner join DRIVER d
on d.d_idx = c.d_idx
-- where d.d_idx =  
where r.r_confirm is not null
and d.d_idx = 2
order by r.dr_idx ,r.r_idx 
;
