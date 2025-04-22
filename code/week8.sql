 SELECT * FROM 학생2;

 -- 트렌젝션
 -- BEGIN; 또는 BEGIN WORK; 또는 BEGIN TRANSACTION; (PGadmin)
 BEGIN; -- START TRANSACTION; (MySQL)
 DELETE FROM 학생 WHERE 학생.성별 = '남';
 DELETE FROM 학생 WHERE 학생.성별 = '여';
 SELECT * FROM 학생;
 
 ROLLBACK;  -- COMMIT; (저장)  ROLLBACK; (취소)
 SELECT * FROM 학생;
 
 BEGIN TRANSACTION;
 UPDATE 학생 SET 이름 = '홍길순' WHERE 학번 = 's002';
 SELECT * FROM 학생;
 COMMIT;

 

 