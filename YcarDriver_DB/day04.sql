ALTER TABLE `ycar`.`DRIVER` 
ADD COLUMN `type` VARCHAR(1) NULL AFTER `signout`,
CHANGE COLUMN `id` `id` VARCHAR(100) NOT NULL COMMENT 'UK 지정해야' ;

ALTER TABLE `ycar`.`DRIVER` 
CHANGE COLUMN `type` `type` VARCHAR(1) NULL DEFAULT NULL COMMENT '가입 타입  : 간편, 카카오, 구글 등' ;


desc DRIVER;
desc D_COMPANY;
desc D_LICENSE;
desc D_OPTION;
desc D_ROUTE;

ALTER TABLE `ycar`.`D_COMPANY` 
CHANGE COLUMN `type` `ctype` VARCHAR(1) NOT NULL COMMENT '어떤걸로 인증했나' ;

