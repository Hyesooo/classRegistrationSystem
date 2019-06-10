
/* Drop Tables */

DROP TABLE ENROLL CASCADE CONSTRAINTS;
DROP TABLE CLASS CASCADE CONSTRAINTS;
DROP TABLE ADMINISTER CASCADE CONSTRAINTS;
DROP TABLE STUDENTS CASCADE CONSTRAINTS;




/* Create Tables */

-- ������
CREATE TABLE ADMINISTER
(
	-- ������ ID
	a_id varchar2(10) NOT NULL,
	-- ������ ��й�ȣ
	a_pwd varchar2(30) NOT NULL,
	PRIMARY KEY (a_id)
);


-- �� ���̺�
CREATE TABLE CLASS
(
	-- ���� ��ȣ
	c_id number NOT NULL,
	-- ���� ��ȣ
	c_no number(10) NOT NULL,
	-- �����
	c_name varchar2(100),
	-- �й�
	c_div number(1),
	-- ����
	c_credit number(1),
	-- ���� �ð�(����)
	c_hour number(1) NOT NULL,
	-- ���ǿ���
	c_day varchar2(10) NOT NULL,
	-- �����⵵
	c_year number(4),
	-- ���� �б�
	c_sem number(1),
	-- ���� ����
	c_maxppl number NOT NULL,
	-- ���
	c_where varchar2(30) NOT NULL,
	-- ������ ID
	a_id varchar2(10) NOT NULL,
	PRIMARY KEY (c_id)
);

CREATE SEQUENCE c_id
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 10000;


-- �� ���̺�
CREATE TABLE ENROLL
(
	-- s_id
	s_id varchar2(10) NOT NULL,
	-- ���� ��ȣ
	c_id number NOT NULL
);


-- �� ���̺�
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

COMMENT ON TABLE ADMINISTER IS '������';
COMMENT ON COLUMN ADMINISTER.a_id IS '������ ID';
COMMENT ON COLUMN ADMINISTER.a_pwd IS '������ ��й�ȣ';
COMMENT ON TABLE CLASS IS '�� ���̺�';
COMMENT ON COLUMN CLASS.c_id IS '���� ��ȣ';
COMMENT ON COLUMN CLASS.c_no IS '���� ��ȣ';
COMMENT ON COLUMN CLASS.c_name IS '�����';
COMMENT ON COLUMN CLASS.c_div IS '�й�';
COMMENT ON COLUMN CLASS.c_credit IS '����';
COMMENT ON COLUMN CLASS.c_hour IS '���� �ð�(����)';
COMMENT ON COLUMN CLASS.c_day IS '���ǿ���';
COMMENT ON COLUMN CLASS.c_year IS '�����⵵';
COMMENT ON COLUMN CLASS.c_sem IS '���� �б�';
COMMENT ON COLUMN CLASS.c_maxppl IS '���� ����';
COMMENT ON COLUMN CLASS.c_where IS '���';
COMMENT ON COLUMN CLASS.a_id IS '������ ID';
COMMENT ON TABLE ENROLL IS '�� ���̺�';
COMMENT ON COLUMN ENROLL.s_id IS 's_id';
COMMENT ON COLUMN ENROLL.c_id IS '���� ��ȣ';
COMMENT ON TABLE STUDENTS IS '�� ���̺�';
COMMENT ON COLUMN STUDENTS.s_id IS 's_id';
COMMENT ON COLUMN STUDENTS.s_pwd IS 's_pwd';
COMMENT ON COLUMN STUDENTS.s_major IS 's_major';



