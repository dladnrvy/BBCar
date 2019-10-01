-- 2019.09.24 TUE

SELECT * FROM ycar.DRIVER;



-- 운전자FAQ게시판
CREATE TABLE `D_FAQ` (
	`faq_idx` INT(7)      NOT NULL, -- 게시글번호
	`d_idx`   INT(10)     NULL,     -- 회원번호
	`title`   VARCHAR(50) NOT NULL, -- 제목
	`cont`    TEXT        NOT NULL, -- 내용
	`time`    DATETIME    NULL,     -- 작성시간
	`hit`     INT(7)      NULL      -- 조회수
);

-- 운전자FAQ게시판
ALTER TABLE `D_FAQ`
	ADD CONSTRAINT `PK_D_FAQ` -- 운전자FAQ게시판 기본키
		PRIMARY KEY (
			`faq_idx` -- 게시글번호
		);

-- 운전자FAQ게시판
ALTER TABLE `D_FAQ`
	ADD CONSTRAINT `FK_DRIVER_TO_D_FAQ` -- 운전자 -> 운전자FAQ게시판
		FOREIGN KEY (
			`d_idx` -- 회원번호
		)
		REFERENCES `DRIVER` ( -- 운전자
			`d_idx` -- 회원번호
		);
        
        
        
-- table 변경         
ALTER TABLE `ycar`.`D_FAQ` 
DROP FOREIGN KEY `FK_DRIVER_TO_D_FAQ`;
ALTER TABLE `ycar`.`D_FAQ` 
CHANGE COLUMN `d_idx` `d_idx` INT(10) NOT NULL ,
CHANGE COLUMN `time` `time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ,
CHANGE COLUMN `hit` `hit` INT(7) NULL DEFAULT 1 ;
ALTER TABLE `ycar`.`D_FAQ` 
ADD CONSTRAINT `FK_DRIVER_TO_D_FAQ`
  FOREIGN KEY (`d_idx`)
  REFERENCES `ycar`.`DRIVER` (`d_idx`);
        
UPDATE `ycar`.`D_FAQ` SET `faq_idx` = '1' WHERE (`faq_idx` = '0');
ALTER TABLE `ycar`.`D_FAQ` 
CHANGE COLUMN `faq_idx` `faq_idx` INT(7) NOT NULL AUTO_INCREMENT ;

        
SELECT * FROM D_FAQ;

insert into D_FAQ(d_idx, title, cont) values (13, '제목제목제목001','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (1, '제목제목제목002','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (2, '제목제목제목003','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (3, '제목제목제목004','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (4, '제목제목제목005','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (6, '제목제목제목007','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (7, '제목제목제목008','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (8, '제목제목제목009','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (9, '제목제목제목010','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (10, '제목제목제목011','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (11, '제목제목제목012','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (12, '제목제목제목013','제목제목제목제목,,,,!!내용내용내용내용,,,!');


insert into D_FAQ(d_idx, title, cont) values (1, '제목제목제목014','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (2, '제목제목제목015','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (3, '제목제목제목016','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (4, '제목제목제목017','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (6, '제목제목제목018','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (7, '제목제목제목019','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (8, '제목제목제목020','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (9, '제목제목제목021','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (10, '제목제목제목022','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (11, '제목제목제목023','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (12, '제목제목제목024','제목제목제목제목,,,,!!내용내용내용내용,,,!');
insert into D_FAQ(d_idx, title, cont) values (13, '제목제목제목025','제목제목제목제목,,,,!!내용내용내용내용,,,!');


SELECT f.faq_idx, f.title, d.nickname, f.time, f.hit
FROM D_FAQ f
inner join DRIVER d
using (d_idx)
order by faq_idx
;

SELECT f.faq_idx, f.title, d.d_idx, d.nickname, f.cont, f.time, f.hit
FROM D_FAQ f
inner join DRIVER d
using (d_idx)
where d_idx = 13
order by faq_idx
;






