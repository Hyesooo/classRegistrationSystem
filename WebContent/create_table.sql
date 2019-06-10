
/* Drop Tables */

DROP TABLE ENROLL CASCADE CONSTRAINTS;
DROP TABLE CLASS CASCADE CONSTRAINTS;
DROP TABLE ADMINISTER CASCADE CONSTRAINTS;
DROP TABLE STUDENTS CASCADE CONSTRAINTS;




/* Create Tables */

-- 관리자
CREATE TABLE ADMINISTER
(
	-- 관리자 ID
	a_id varchar2(10) NOT NULL,
	-- 관리자 비밀번호
	a_pwd varchar2(30) NOT NULL,
	PRIMARY KEY (a_id)
);


-- 새 테이블
CREATE TABLE CLASS
(
	-- 과목 번호
	c_id number NOT NULL,
	-- 과목 번호
	c_no number(10) NOT NULL,
	-- 과목명
	c_name varchar2(100),
	-- 분반
	c_div number(1),
	-- 학점
	c_credit number(1),
	-- 강의 시간(교시)
	c_hour number(1) NOT NULL,
	-- 강의요일
	c_day varchar2(10) NOT NULL,
	-- 수강년도
	c_year number(4),
	-- 수강 학기
	c_sem number(1),
	-- 수강 정원
	c_maxppl number NOT NULL,
	-- 장소
	c_where varchar2(30) NOT NULL,
	-- 관리자 ID
	a_id varchar2(10) NOT NULL,
	PRIMARY KEY (c_id)
);

CREATE SEQUENCE c_id
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 10000;


-- 새 테이블
CREATE TABLE ENROLL
(
	-- s_id
	s_id varchar2(10) NOT NULL,
	-- 과목 번호
	c_id number NOT NULL
);


-- 새 테이블
CREATE TABLE STUDENTS
(
	-- s_id
	s_id varchar2(10) NOT NULL,
	-- s_pwd
	s_pwd varchar2(30) NOT NULL,
	-- s_name
	s_name varchar2(30) NOT NULL,
	-- s_major
	s_major varchar2(70) NOT NULL,
	PRIMARY KEY (s_id)
);




/* Create Foreign Keys */

ALTER TABLE CLASS
	ADD FOREIGN KEY (a_id)
	REFERENCES ADMINISTER (a_id) 
;


ALTER TABLE ENROLL
	ADD FOREIGN KEY (c_id)
	REFERENCES CLASS (c_id)
;


ALTER TABLE ENROLL
	ADD FOREIGN KEY (s_id)
	REFERENCES STUDENTS (s_id)
;



/* Comments */

COMMENT ON TABLE ADMINISTER IS '관리자';
COMMENT ON COLUMN ADMINISTER.a_id IS '관리자 ID';
COMMENT ON COLUMN ADMINISTER.a_pwd IS '관리자 비밀번호';
COMMENT ON TABLE CLASS IS '새 테이블';
COMMENT ON COLUMN CLASS.c_id IS '과목 번호';
COMMENT ON COLUMN CLASS.c_no IS '과목 번호';
COMMENT ON COLUMN CLASS.c_name IS '과목명';
COMMENT ON COLUMN CLASS.c_div IS '분반';
COMMENT ON COLUMN CLASS.c_credit IS '학점';
COMMENT ON COLUMN CLASS.c_hour IS '강의 시간(교시)';
COMMENT ON COLUMN CLASS.c_day IS '강의요일';
COMMENT ON COLUMN CLASS.c_year IS '수강년도';
COMMENT ON COLUMN CLASS.c_sem IS '수강 학기';
COMMENT ON COLUMN CLASS.c_maxppl IS '수강 정원';
COMMENT ON COLUMN CLASS.c_where IS '장소';
COMMENT ON COLUMN CLASS.a_id IS '관리자 ID';
COMMENT ON TABLE ENROLL IS '새 테이블';
COMMENT ON COLUMN ENROLL.s_id IS 's_id';
COMMENT ON COLUMN ENROLL.c_id IS '과목 번호';
COMMENT ON TABLE STUDENTS IS '새 테이블';
COMMENT ON COLUMN STUDENTS.s_id IS 's_id';
COMMENT ON COLUMN STUDENTS.s_pwd IS 's_pwd';
COMMENT ON COLUMN STUDENTS.s_major IS 's_major';



