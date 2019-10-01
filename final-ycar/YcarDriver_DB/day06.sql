select * from DRIVER;
select * from D_OPTION;

delete from D_OPTION;
delete from DRIVER where d_idx = 5;

desc DRIVER;
desc D_OPTION;

ALTER TABLE `ycar`.`DRIVER` 
ADD COLUMN `d_option` VARCHAR(20) NULL AFTER `cartype`;

drop table D_OPTION;
drop table P_OPTION;
select * from DRIVER;

ALTER TABLE `ycar`.`PASSENGER` 
ADD COLUMN `p_option` VARCHAR(20) NULL AFTER `ctype`;

ALTER TABLE `ycar`.`DRIVER` 
CHANGE COLUMN `verify` `verify` VARCHAR(1) NULL DEFAULT 'Y' COMMENT '직장인 인증여부/N기본값' ;

UPDATE `ycar`.`DRIVER` SET `verify` = 'Y' WHERE (`d_idx` = '6');
UPDATE `ycar`.`DRIVER` SET `verify` = 'Y' WHERE (`d_idx` = '7');
UPDATE `ycar`.`DRIVER` SET `verify` = 'Y' WHERE (`d_idx` = '8');
UPDATE `ycar`.`DRIVER` SET `verify` = 'Y' WHERE (`d_idx` = '9');
UPDATE `ycar`.`DRIVER` SET `verify` = 'Y' WHERE (`d_idx` = '10');
UPDATE `ycar`.`DRIVER` SET `verify` = 'Y' WHERE (`d_idx` = '11');
UPDATE `ycar`.`DRIVER` SET `verify` = 'Y' WHERE (`d_idx` = '12');
UPDATE `ycar`.`DRIVER` SET `verify` = 'Y' WHERE (`d_idx` = '4');