CREATE OR REPLACE TRIGGER StudentInfoUpdate BEFORE
UPDATE ON students
FOR EACH ROW
DECLARE
   pwd_lessthan4 EXCEPTION;
   no_spacebar EXCEPTION;
   pwd_len NUMBER;
   is_blank NUMBER;
BEGIN
   pwd_len := length(:new.s_pwd);
   IF (pwd_len<4)
      THEN RAISE pwd_lessthan4;
   END IF;
   IF (:new.s_pwd = replace(:new.s_pwd,' ',''))
      THEN is_blank := 0;
   ELSE is_blank :=1;
   END IF;
   IF (is_blank!=0)
      THEN RAISE no_spacebar;
   END IF;
   EXCEPTION
   WHEN pwd_lessthan4 THEN
      RAISE_APPLICATION_ERROR(-20002, '��� ��ȣ�� 4�ڸ� �̻� �Է����ּ���.');
   WHEN no_spacebar THEN
      RAISE_APPLICATION_ERROR(-20003, '��й�ȣ�� ������ ������ �� �����ϴ�.');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/