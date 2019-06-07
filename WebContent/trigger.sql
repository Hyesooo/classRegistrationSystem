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
      RAISE_APPLICATION_ERROR(-20002, '비밀 번호를 4자리 이상 입력해주세요.');
   WHEN no_spacebar THEN
      RAISE_APPLICATION_ERROR(-20003, '비밀번호에 공란을 포함할 수 없습니다.');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/