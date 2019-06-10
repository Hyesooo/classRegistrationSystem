CREATE OR REPLACE PROCEDURE StudentEnrollTimetable (enrollSID IN NUMBER,
   s_enroll_class OUT SYS_REFCURSOR,
   total_class OUT NUMBER,
   total_unit OUT NUMBER)
IS
   year NUMBER;
   semester NUMBER;
BEGIN
   year := Date2EnrollYear(SYSDATE);
   semester := Date2EnrollSemester(SYSDATE);
   OPEN s_enroll_class FOR
   SELECT c.c_id, c.c_name, c.c_credit, c.c_where, c.c_hour, c.c_day
   from class c, enroll e
   where c.c_year = year and c.c_sem = semester 
   and c.c_id = e.c_id and s_id = enrollSID;
   
   select COUNT(*)
   into total_class
   from enroll
   where s_id = enrollSID;
   
   select SUM(c.c_credit)
   into total_unit
   from enroll e, class c
   where e.s_id = enrollSID and e.c_id = c.c_id;
   DBMS_OUTPUT.PUT_LINE('총 '||total_class||' 과목과 총 '||total_unit||' 학점을 신청하였습니다.');
END;
/