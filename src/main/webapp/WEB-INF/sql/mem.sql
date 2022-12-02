show databases;


ALTER TABLE tb_mem convert to charset UTF8;
create database practice;

use practice;
use @localhost;

CREATE TABLE tb_mem
(
    mem_id      varchar(20)  NOT NULL PRIMARY KEY -- 회원ID
    ,
    mem_pw      varchar(20)  NOT NULL             -- 회원PW
    ,
    mem_nick    varchar(20)  NOT NULL             -- 닉네임
    ,
    mem_name    varchar(20)  NOT NULL             -- 이름
    ,
    mem_zip     varchar(6)   NOT NULL             -- 우편번호
    ,
    mem_adr1    varchar(255) NOT NULL             -- 주소1
    ,
    mem_adr2    varchar(255) NOT NULL             -- 주소2
    ,
    mem_phone   varchar(20)  NOT NULL             -- 연락처
    ,
    mem_birth   date         NOT NULL             -- 생년월일
    ,
    mem_grade   varchar(20)  NOT NULL             -- 회원등급
    ,
    upoint      int          NOT NULL             -- 가용적립금
    ,
    apoint      int          NOT NULL             -- 누적적립금
    ,
    mem_receive char(1)      NOT NULL             -- 수신여부
    ,
    good        int          NOT NULL default 0   -- 좋아요
    ,
    buyer_bad   int          NOT NULL default 0   -- 누적신고횟수
);

drop table tb_mem;

select * from tb_mem;

SELECT mem_id
FROM tb_mem
WHERE mem_id = '1234';



INSERT INTO tb_mem (mem_id, mem_pw, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_birth, mem_grade, upoint, apoint, mem_receive, good, buyer_bad)
VALUES ('gjdjj888', 'kkeioh45@', '방이동도도민경', '김민경', '12345', '서울특별시 중구 세종대로', '67', '02-6466-4564', '19980224', 'VIP', 5000, 5000, 'N', 0, 0);

INSERT INTO tb_mem (mem_id, mem_pw, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_birth, mem_grade, upoint, apoint, mem_receive, good, buyer_bad)
VALUES ('oejdf9090', 'dkhofk777!!@@', '장지동십만우', '구천우', '34567', '서울특별시 서초구 서초대로78길', '5 대각빌딩', '010-4363-5464', '19951103', 'GOLD', 2500, 12500, 'N', 0, 0);

INSERT INTO tb_mem (mem_id, mem_pw, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_birth, mem_grade, upoint, apoint, mem_receive, good, buyer_bad)
VALUES ('fjhdmj555', 'djjgkk555!', '정릉동핵주먹', '최다은', '12345', '서울특별시 서대문구 통일로', '97', '010-4893-7777', '19880520', 'SILVER', 3000, 3000, 'Y', 0, 0);


insert into tb_game(gm_code, gm_name, gm_price, gm_level, gm_category)
values(${gm_code},${gm_name},${gm_price},${gm_level},${gm_category});