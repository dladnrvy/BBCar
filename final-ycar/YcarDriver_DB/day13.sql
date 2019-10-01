select * 
from DRIVER;
-- where d_idx > =13;

-- r_idx가 추가되어있어 삭제함.
ALTER TABLE `ycar`.`DRIVER` 
DROP COLUMN `r_idx`;
ALTER TABLE `ycar`.`D_CARPOOL` 
DROP COLUMN `r_idx`;


select 
c.dr_idx
, r.r_idx
, r.p_idx
, c.d_date
, c.d_startpoint
, c.d_endpoint
, r.r_confirm
, d.d_idx
, p.p_idx
, d.nickname as 'd.nick'
, p.nickname as 'p.nick'
from RESERVATION r
left join D_CARPOOL c
on c.dr_idx = r.dr_idx
inner join DRIVER d
on d.d_idx = c.d_idx
inner join PASSENGER p
on r.p_idx = p.p_idx
where r.r_confirm is not null
and d.d_idx = 2
order by r.dr_idx ,r.r_idx 
;