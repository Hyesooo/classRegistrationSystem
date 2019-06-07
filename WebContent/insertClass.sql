CREATE OR REPLACE PROCEDURE InsertClass(
   aClassNo IN NUMBER,
   aClassName IN VARCHAR2,
   aClassDiv IN NUMBER, 
   aClassCredit IN NUMBER, 
   aClassHour IN NUMBER,
   aClassDay IN VARCHAR2, 
   aClassYear IN NUMBER,
   aClassSem IN NUMBER, 
   aClassMaxPPL IN NUMBER,
   aClassWhere IN VARCHAR2, 
   adminId IN VARCHAR2,
   re OUT VARCHAR2)
IS
   exist_already EXCEPTION; 
   exist_already_for_time EXCEPTION; 
   exist_already_for_room EXCEPTION; 
   nYear NUMBER; 
   nSemester NUMBER;
   ClassFlag NUMBER; 
   ClassTimeFlag NUMBER; 
   ClassMake NUMBER; 
   RoomClassFlag NUMBER;
   aClassId NUMBER;
   
BEGIN

   re := '';
   DBMS_OUTPUT.put_line('#');
   DBMS_OUTPUT.put_line('과목번호 ' || aClassNo ||
   ', 분반 ' || TO_CHAR(aClassDiv) || '의 강의 개설을 요청하였습니다.');

   nYear := Date2EnrollYear(SYSDATE);
   nSemester := Date2EnrollSemester(SYSDATE);
   
   SELECT class_seq.nextval INTO aClassId
   FROM Dual;

   SELECT count(*)
   INTO ClassFlag
   FROM class
   WHERE c_id = aClassId and c_sem = nSemester and c_year = nYear;
   IF (ClassFlag>0)
   THEN
   RAISE exist_already;
   END IF;
   

   SELECT COUNT(*)
   INTO ClassTimeFlag
   FROM class
   WHERE c_hour = aClassHour and c_day = aClassDay and c_sem = nSemester and c_year = nYear;
   IF (ClassTimeFlag>0)
   THEN
   RAISE exist_already_for_time;
   END IF;
   

   SELECT count(*)
   INTO RoomClassFlag
   FROM class
   WHERE c_year= nYear and c_sem = nSemester and c_where = aClassWhere;
   IF (RoomClassFlag>0)
   THEN
   RAISE exist_already_for_room;
   END IF;


   SELECT count(*)
   INTO ClassMake
   FROM class
   WHERE c_id = aClassId;
   IF (ClassMake<=0)
   THEN
   INSERT INTO class values(aClassId, aClassNo, aClassName, aClassDiv, aClassCredit, aClassHour, aClassDay,
   aClassYear, aClassSem, aClassMaxPPL, aClassWhere, adminId);
   END IF;
   COMMIT;
   

re := '수업 등록이 완료되었습니다.';
EXCEPTION
WHEN exist_already THEN
re := '이미 존재하는 분반 입니다. 다른 분반 번호를 입력하거나 다른 강의 번호를 입력해주세요.';
WHEN exist_already_for_time THEN
re := '해당 시간은 이미 강의가 있습니다. 다른 시간이나 요일을 선택해주세요.';
WHEN exist_already_for_room THEN
re := '해당 장소에는 같은 시간에 다른 강의가 있습니다.';
WHEN OTHERS THEN
ROLLBACK;
re := SQLCODE;

END;
/