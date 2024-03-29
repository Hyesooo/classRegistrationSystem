CREATE OR REPLACE FUNCTION Date2EnrollYear(dDate IN DATE)
RETURN NUMBER
IS
return_year NUMBER;
mon NUMBER;
BEGIN
return_year := TO_NUMBER(TO_CHAR(dDate, 'YYYY'));
mon := TO_NUMBER(TO_CHAR(dDate, 'MM'));
IF (mon >= 1 AND mon <= 10) THEN RETURN return_year;
ELSE RETURN return_year+1;
END IF;
END;
/

CREATE OR REPLACE FUNCTION Date2EnrollSemester(dDate IN DATE)
RETURN NUMBER
IS
return_semester NUMBER;
mon NUMBER;
BEGIN
mon := TO_NUMBER(TO_CHAR(dDate, 'MM'));
IF (mon >= 1 AND mon <= 6) THEN return_semester := 1;
ELSE return_semester :=2;
END IF;
RETURN return_semester;
END;
/