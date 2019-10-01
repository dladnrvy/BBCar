CREATE SCHEMA `ycar` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

-- 운전자
CREATE TABLE `ycar`.`DRIVER` (
	`d_idx`    INT(10)      NOT NULL, -- 회원번호
	`id`       VARCHAR(50)  NOT NULL COMMENT 'UK 지정해야', -- 아이디
	`pw`       VARCHAR(50)  NOT NULL, -- 비밀번호
	`name`     VARCHAR(20)  NOT NULL, -- 이름
	`verify`   VARCHAR(1)   NULL     COMMENT '직장인 인증여부/N기본값', -- 인증여부
	`code`     VARCHAR(50)  NULL,     -- 인증코드
	`nickname` VARCHAR(50)  NULL,     -- 닉네임
	`gender`   VARCHAR(1)   NULL     COMMENT '주민번호로추출(여F 남M)', -- 성별
	`email`    VARCHAR(100) NULL     COMMENT '개인이메일/회사로인증한사람은 default값으로 이메일도 같이.' -- 이메일
);

-- 운전자
ALTER TABLE `ycar`.`DRIVER`
	ADD CONSTRAINT `PK_DRIVER` -- 운전자 기본키
		PRIMARY KEY (
			`d_idx` -- 회원번호
		);
        
ALTER TABLE `ycar`.`DRIVER` 
CHANGE COLUMN `d_idx` `d_idx` INT(10) NOT NULL AUTO_INCREMENT,
CHANGE COLUMN `verify` `verify` VARCHAR(1) NULL DEFAULT 'N' COMMENT '직장인 인증여부/N기본값' ,
CHANGE COLUMN `gender` `gender` VARCHAR(1) NULL DEFAULT 'F' COMMENT '주민번호로추출(여F 남M) F기본값' ,
ADD UNIQUE INDEX `id_UNIQUE` (`id` ASC);
;

-- 운전자운전정보에 대해 -------------------------------------
-- 운전자-운전정보
CREATE TABLE ycar.`D_LICENSE` (
	`d_idx`   INT(10)     NOT NULL, -- 회원번호
	`lscnum`  VARCHAR(30) NOT NULL, -- 운전면허번호
	`idnum1`  VARCHAR(20) NULL,     -- 주민번호앞
	`idnum2`  VARCHAR(20) NULL,     -- 주민번호뒤
	`lsctype` VARCHAR(1)  NULL     COMMENT '1종/2종 등', -- 종류
	`sdate`   DATE        NULL,     -- 시작일자
	`police`  VARCHAR(50) NULL,     -- 경찰청
	`carnum`  VARCHAR(50) NULL,     -- 차량번호
	`cartype` VARCHAR(1)  NULL     COMMENT '대/중/소' -- 차종
);

-- 운전자-운전정보
ALTER TABLE ycar.`D_LICENSE`
	ADD CONSTRAINT `PK_D_LICENSE` -- 운전자-운전정보 기본키
		PRIMARY KEY (
			`d_idx` -- 회원번호
		);

-- 운전자-운전정보
ALTER TABLE ycar.`D_LICENSE`
	ADD CONSTRAINT `FK_DRIVER_TO_D_LICENSE` -- 운전자 -> 운전자-운전정보
		FOREIGN KEY (
			`d_idx` -- 회원번호
		)
		REFERENCES `DRIVER` ( -- 운전자
			`d_idx` -- 회원번호
		);        
        
ALTER TABLE `ycar`.`D_LICENSE` 
ADD UNIQUE INDEX `lscnum_UNIQUE` (`lscnum` ASC),
ADD UNIQUE INDEX `carnum_UNIQUE` (`carnum` ASC);
;
        
        
-- 운전자-직장인증
CREATE TABLE `ycar`.`D_COMPANY` (
	`d_idx`   INT(10)      NOT NULL, -- 회원번호
	`type`    VARCHAR(1)   NOT NULL COMMENT '어떤걸로 인증했나', -- 인증타입 E메일 P증명서
	`company` VARCHAR(50)  NOT NULL, -- 회사명
	`cemail`  VARCHAR(100) NULL,     -- 회사이메일
	`cnum`    VARCHAR(50)  NULL      -- 사업자등록번호
);

-- 운전자-직장인증
ALTER TABLE `ycar`.`D_COMPANY`
	ADD CONSTRAINT `PK_D_COMPANY` -- 운전자-직장인증 기본키
		PRIMARY KEY (
			`d_idx` -- 회원번호
		);

-- 운전자-직장인증
ALTER TABLE `ycar`.`D_COMPANY`
	ADD CONSTRAINT `FK_DRIVER_TO_D_COMPANY` -- 운전자 -> 운전자-직장인증
		FOREIGN KEY (
			`d_idx` -- 회원번호
		)
		REFERENCES `DRIVER` ( -- 운전자
			`d_idx` -- 회원번호
		);        
        
        
        
        
-- 운전자-선호경로
CREATE TABLE ycar.`D_ROUTE` (
	`d_idx` INT(10)     NOT NULL, -- 회원번호
	`type`  VARCHAR(1)  NULL     COMMENT '1집2직장3기타', -- 선호타입
	`place` VARCHAR(50) NULL      -- 장소명
);

-- 운전자-선호경로
ALTER TABLE ycar.`D_ROUTE`
	ADD CONSTRAINT `FK_DRIVER_TO_D_ROUTE` -- 운전자 -> 운전자-선호경로
		FOREIGN KEY (
			`d_idx` -- 회원번호
		)
		REFERENCES `DRIVER` ( -- 운전자
			`d_idx` -- 회원번호
		);    
        
        


-- 운전자-선호운행옵션
CREATE TABLE ycar.`D_OPTION` (
	`d_idx`    INT(10)    NOT NULL, -- 회원번호
	`d_option` VARCHAR(1) NULL     COMMENT '123456' -- 옵션타입
);

-- 운전자-선호운행옵션
ALTER TABLE ycar.`D_OPTION`
	ADD CONSTRAINT `FK_DRIVER_TO_D_OPTION` -- 운전자 -> 운전자-선호운행옵션
		FOREIGN KEY (
			`d_idx` -- 회원번호
		)
		REFERENCES `DRIVER` ( -- 운전자
			`d_idx` -- 회원번호
		);
        
        
        
ALTER TABLE `ycar`.`DRIVER` 
ADD COLUMN `signout` VARCHAR(1) NULL DEFAULT 'N' AFTER `email`;        


drop table ycar.D_OPTION;
drop table ycar.D_ROUTE;
drop table ycar.D_LICENSE;
drop table ycar.D_COMPANY;
drop table ycar.DRIVER;
drop table ycar.P_reservation;

select * from DRIVER;
desc DRIVER;

insert into DRIVER(id,pw,name,verify,code,nickname,email) 
values('test','test','테스터','Y','A3fs3RFgZ0','피곤한 테스터','test@test.com');
insert into DRIVER(id,pw,name,verify,code,nickname,email) 
values('test2','1234','테스터2','Y','84ZB4KoRgq','행복한 테스터','test2@test.com');
insert into DRIVER(id,pw,name,verify,code,nickname,email) 
values('test3','1234','테스터3','Y','I8e2hfw9kD','칼퇴하는 테스터','test3@test.com');


select * from D_COMPANY;
desc D_COMPANY;
insert into D_COMPANY(d_idx,type,company,cemail)
values(1,'E','연차','test@test.com');
insert into D_COMPANY(d_idx,type,company,cnum)
values(2,'P','연차','2061112345');
insert into D_COMPANY(d_idx,type,company,cemail)
values(3,'E','연차','test3@test.com');

select * from D_LICENSE;
desc D_LICENSE;

insert into D_LICENSE()
values(1,'123456789012','901010','2','1종보통','2019-01-01','서울지방경찰청장','33가1234','대');
insert into D_LICENSE()
values(2,'345678901234','901110','2','2종보통','2019-01-01','서울지방경찰청장','43가1234','중');
insert into D_LICENSE()
values(3,'567123489012','911111','2','2종보통','2019-01-01','서울지방경찰청장','23가1234','소');