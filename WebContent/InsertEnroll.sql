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
DBMS_OUTPUT.put_line(sStudentId || '님이 과목번호 ' || ClassId ||
', 분반 ' || ClassDiv || '의 수강 등록을 요청하였습니다.');
/* 년도, 학기 알아내기 */
nYear := Date2EnrollYear(SYSDATE);
nSemester := Date2EnrollSemester(SYSDATE);
/* 에러 처리 1 : 최대학점 초과여부 */
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

/* 에러 처리 2 : 동일한 과목 신청 여부 */
SELECT COUNT(*)
INTO tempCnt
FROM enroll
WHERE s_id = sStudentId and c_id = ClassId;
IF (tempCnt > 0)
THEN
RAISE overlap_class;
END IF;

/* 에러 처리 3 : 수강신청 인원 초과 여부 */
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

/* 에러 처리 4 : 신청한 과목들 시간 중복 여부 */
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

/* 수강 신청 등록 */
INSERT INTO enroll(S_ID,C_ID)
VALUES (sStudentId, ClassId);
COMMIT;
result := '수강신청 등록이 완료되었습니다.';
EXCEPTION
WHEN overflow_max_flow THEN
result := '최대학점을 초과하였습니다';
WHEN overlap_class THEN
result := '이미 등록된 과목을 신청하였습니다';
WHEN overflow_max_PPL THEN
result := '수강신청 인원이 초과되어 등록이 불가능합니다';
WHEN overlap_class_time THEN
result := '이미 등록된 과목 중 중복되는 시간이 존재합니다';
WHEN OTHERS THEN
ROLLBACK;
result := SQLCODE;
END;
/