CREATE OR REPLACE PROCEDURE InsertEnroll(sStudentId IN VARCHAR2,
ClassId IN VARCHAR2, /*sclassId*/
ClassDiv IN NUMBER,
result OUT VARCHAR2)

IS
overflow_max_flow EXCEPTION; /*too_many_sumclassUnit*/
overlap_class EXCEPTION; /*too_many_classs*/
overflow_max_PPL EXCEPTION; /*too_many_students*/
overlap_class_time EXCEPTION; /*duplicate_time*/

nYear NUMBER;
nSemester NUMBER;
SumCredit NUMBER; /*nSumclassUnit*/
ClassCredit NUMBER; /*nclassUnit*/
tempCnt NUMBER; /*nCnt*/
maxPPL NUMBER; /*nTeachMax*/

BEGIN
result := '';
DBMS_OUTPUT.put_line('#');
DBMS_OUTPUT.put_line(sStudentId || '���� �����ȣ ' || ClassId ||
', �й� ' || ClassDiv || '�� ���� ����� ��û�Ͽ����ϴ�.');
/* �⵵, �б� �˾Ƴ��� */
nYear := Date2EnrollYear(SYSDATE);
nSemester := Date2EnrollSemester(SYSDATE);
/* ���� ó�� 1 : �ִ����� �ʰ����� */
SELECT SUM(c.c_credit)
INTO SumCredit
FROM class c, enroll e
WHERE e.s_id = sStudentId and e.c_id = c.c_id;
SELECT c_credit
INTO ClassCredit
FROM class
WHERE c_id = ClassId and c_div = ClassDiv;
IF (SumCredit + ClassCredit > 18)
THEN
RAISE overflow_max_flow;
END IF;

/* ���� ó�� 2 : ������ ���� ��û ���� */
SELECT COUNT(*)
INTO tempCnt
FROM enroll
WHERE s_id = sStudentId and c_id = ClassId;
IF (tempCnt > 0)
THEN
RAISE overlap_class;
END IF;

/* ���� ó�� 3 : ������û �ο� �ʰ� ���� */
SELECT c_maxppl
INTO maxPPL
FROM class
WHERE c_id = ClassId;
SELECT COUNT(*)
INTO tempCnt
FROM enroll
WHERE c_id = ClassId;
IF (tempCnt >= maxPPL)
THEN
RAISE overflow_max_PPL;
END IF;

/* ���� ó�� 4 : ��û�� ����� �ð� �ߺ� ���� */
SELECT COUNT(*)
INTO tempCnt
FROM
(
SELECT c_hour,c_day
FROM class
WHERE c_id = ClassId and c_year = nYear and c_sem = nSemester
INTERSECT
SELECT c.c_hour, c.c_day
FROM class c, enroll e
WHERE e.s_id=sStudentId and c.c_year=nYear and c.c_sem = nSemester and e.c_id=c.c_id 
);
IF (tempCnt > 0)
THEN
RAISE overlap_class_time;
END IF;

/* ���� ��û ��� */
INSERT INTO enroll(S_ID,C_ID)
VALUES (sStudentId, ClassId);
COMMIT;
result := '������û ����� �Ϸ�Ǿ����ϴ�.';
EXCEPTION
WHEN overflow_max_flow THEN
result := '�ִ������� �ʰ��Ͽ����ϴ�';
WHEN overlap_class THEN
result := '�̹� ��ϵ� ������ ��û�Ͽ����ϴ�';
WHEN overflow_max_PPL THEN
result := '������û �ο��� �ʰ��Ǿ� ����� �Ұ����մϴ�';
WHEN overlap_class_time THEN
result := '�̹� ��ϵ� ���� �� �ߺ��Ǵ� �ð��� �����մϴ�';
WHEN OTHERS THEN
ROLLBACK;
result := SQLCODE;
END;
/