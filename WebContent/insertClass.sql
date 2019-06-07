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
   DBMS_OUTPUT.put_line('�����ȣ ' || aClassNo ||
   ', �й� ' || TO_CHAR(aClassDiv) || '�� ���� ������ ��û�Ͽ����ϴ�.');

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
   

re := '���� ����� �Ϸ�Ǿ����ϴ�.';
EXCEPTION
WHEN exist_already THEN
re := '�̹� �����ϴ� �й� �Դϴ�. �ٸ� �й� ��ȣ�� �Է��ϰų� �ٸ� ���� ��ȣ�� �Է����ּ���.';
WHEN exist_already_for_time THEN
re := '�ش� �ð��� �̹� ���ǰ� �ֽ��ϴ�. �ٸ� �ð��̳� ������ �������ּ���.';
WHEN exist_already_for_room THEN
re := '�ش� ��ҿ��� ���� �ð��� �ٸ� ���ǰ� �ֽ��ϴ�.';
WHEN OTHERS THEN
ROLLBACK;
re := SQLCODE;

END;
/