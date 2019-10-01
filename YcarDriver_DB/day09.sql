ALTER TABLE `ycar`.`D_ROUTE` 
CHANGE COLUMN `type` `r_type` VARCHAR(1) NULL DEFAULT NULL COMMENT '1집2직장3기타' ;

select * from DRIVER
left join D_ROUTE
using (d_idx)
where d_idx = 13
;

SELECT * FROM ycar.DRIVER;

UPDATE `ycar`.`DRIVER` SET `pw` = '123' WHERE (`d_idx` = '13');
