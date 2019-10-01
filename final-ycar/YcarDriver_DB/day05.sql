ALTER TABLE `ycar`.`DRIVER` 
CHANGE COLUMN `pw` `pw` VARCHAR(50) NULL ;
select * from D_COMPANY;
select * from DRIVER;
select * from D_LICENSE;
drop table D_COMPANY;
drop table D_LICENSE;

ALTER TABLE `ycar`.`DRIVER` 
ADD COLUMN `ctype` VARCHAR(1) NOT NULL COMMENT '회사인증타입 E메일 P증명서' AFTER `type`,
ADD COLUMN `company` VARCHAR(50) NOT NULL AFTER `ctype`,
ADD COLUMN `cemail` VARCHAR(100) NULL AFTER `company`,
ADD COLUMN `cnum` VARCHAR(50) NULL COMMENT '사업자등록번호' AFTER `cemail`,
ADD COLUMN `lscnum` VARCHAR(30) NOT NULL COMMENT '운전면허번호' AFTER `cnum`,
ADD COLUMN `idnum1` VARCHAR(20) NULL COMMENT '주민번호앞 6' AFTER `lscnum`,
ADD COLUMN `idnum2` VARCHAR(20) NULL COMMENT '주민번호뒤 1' AFTER `idnum1`,
ADD COLUMN `lsctype` VARCHAR(1) NULL COMMENT '1종보통 A\n2종보통 B' AFTER `idnum2`,
ADD COLUMN `sdate` VARCHAR(20) NULL COMMENT '허가일자' AFTER `lsctype`,
ADD COLUMN `police` VARCHAR(50) NULL COMMENT '허가경찰청' AFTER `sdate`,
ADD COLUMN `carnum` VARCHAR(50) NULL COMMENT '자동차번호' AFTER `police`,
ADD COLUMN `cartype` VARCHAR(1) NULL COMMENT '자동차 타입(대/중/소)' AFTER `carnum`;

UPDATE `ycar`.`DRIVER` SET `type` = 'S', `ctype` = 'E', `company` = '연차', `cemail` = 'test@test.com' WHERE (`d_idx` = '1');
UPDATE `ycar`.`DRIVER` SET `type` = 'S', `ctype` = 'P', `company` = '연차', `cnum` = '2061112345' WHERE (`d_idx` = '2');
UPDATE `ycar`.`DRIVER` SET `type` = 'S', `ctype` = 'E', `company` = '연차', `cemail` = 'test3@test.com' WHERE (`d_idx` = '3');

UPDATE `ycar`.`DRIVER` SET `lscnum` = '123456789012', `idnum1` = '901010', `idnum2` = '2', `lsctype` = 'A', `sdate` = '20190101', `police` = '서울지방경찰청장', `carnum` = '33가1234', `cartype` = 'L' WHERE (`d_idx` = '1');
UPDATE `ycar`.`DRIVER` SET `lscnum` = '345678901234', `idnum1` = '901010', `idnum2` = '2', `lsctype` = 'B', `sdate` = '20190101', `police` = '서울지방경찰청장', `carnum` = '11가1234', `cartype` = 'M' WHERE (`d_idx` = '2');
UPDATE `ycar`.`DRIVER` SET `lscnum` = '567123489012', `idnum1` = '911111', `idnum2` = '2', `lsctype` = 'B', `sdate` = '20190303', `police` = '서울지방경찰청장', `carnum` = '33가1112', `cartype` = 'S' WHERE (`d_idx` = '3');
