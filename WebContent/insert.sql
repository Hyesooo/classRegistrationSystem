INSERT INTO students VALUES (1615591, '12345', '이시연', '문헌정보학과');

INSERT INTO students VALUES (1411111, '00000', '김혜수', '경제학부');
INSERT INTO students VALUES (2222222, '33333', '이세윤', '통계학과');


INSERT INTO ADMINISTER VALUES (0000000, '00000');

INSERT INTO CLASS VALUES (1, '123', '데이터베이스프로그래밍', 1, 3, 3, '월수', 2019, 1, 50, '명신123', 0000000);
-- ID, 학수번호, 과목명, 분반, 학점, 시간(교시), 요일, 년도, 학기, 정원,  A_ID


INSERT INTO enroll VALUES ('1615591', 1);
commit;

