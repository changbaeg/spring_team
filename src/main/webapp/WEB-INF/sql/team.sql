use webtest;
drop table if exists team;
create table team(
	teamno  int              NOT NULL AUTO_INCREMENT COMMENT '팀 번호',
    tname   varchar(20)      NOT NULL COMMENT '팀원 이름',
    skill   varchar(20)      NOT NULL COMMENT '스킬 여부',
    phonenum  varchar(20)    NOT NULL COMMENT '전화번호',
    address  varchar(20)     NOT NULL COMMENT '주소', 
    zipcode  varchar(20)     NOT NULL COMMENT '우편번호',
    gender  varchar(20)      NOT NULL COMMENT '성별',
    rdate  DATETIME          NOT NULL COMMENT '등록일',
  PRIMARY KEY (teamno)  
  );
  
select * 
from team;

-- create
INSERT INTO team(tname, skill, phonenum, address, zipcode, gender, rdate)
VALUES('콩순이', 'JAVA', '010-1234-5678', '군산시 미룡로 12', "54164", "woman", NOW());
INSERT INTO team(tname, skill, phonenum, address, zipcode, gender, rdate)
VALUES('콩순삼', 'JAVA', '010-1234-5678', '군산시 미룡로 12', "54164", "woman", NOW());
INSERT INTO team(tname, skill, phonenum, address, zipcode, gender, rdate)
VALUES('콩순사', 'JAVA', '010-1234-5678', '군산시 미룡로 12', "54164", "woman", NOW());

-- list
SELECT teamno, tname, skill, phonenum, address, zipcode, gender, rdate
FROM team
ORDER BY teamno DESC;

-- read
SELECT teamno, tname, skill, phonenum, address, zipcode, gender, rdate
FROM team
WHERE teamno=1;

-- update
UPDATE team
SET tname='ACE TEAM', skill='JAVA', phonenum='010-1111-2222', address='LA', zipcode='451', gender='man'
WHERE teamno=1;

-- delete
DELETE FROM team
WHERE teamno=3;
 
SELECT * FROM team;