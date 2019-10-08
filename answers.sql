--Question 1
SHOW tables;
SELECT FOUND_ROWS();
-- 16 tables

--Question 2
SELECT COUNT(*) FROM users;
-- 222 users

--Question 3
SELECT MIN(table_rows), table_name FROM information_schema.tables WHERE table_schema = "BDA_VQ"
-- table code_answers with a table with 1 entery

--Question 4
SELECT COUNT(*) FROM multiple_choice_questions
-- 108

--Question 5
SELECT courseid FROM courses WHERE semester = 'F15' AND section = 6 AND code = 'CSCI1320'
SELECT COUNT(quizid) FROM quiz_course_close_assoc WHERE courseid = 3
-- 22 quizes

--Question 6
SELECT COUNT(quizid), courseid FROM quiz_course_close_assoc GROUP BY courseid
SELECT code from courses where courseid = 12
-- CSCI 1320 F16 with 26 quizes

--Question 7
SELECT c.courseid as cid, SUM(qq.qCount)
FROM courses c INNER JOIN quiz_course_close_assoc qc ON c.courseid = qc.courseid INNER JOIN
(SELECT qc.quizid as qid, COUNT(qm.mc_question_id) as qCount
FROM quiz_course_close_assoc qc INNER JOIN multiple_choice_assoc qm ON qc.quizid = qm.quizid 
GROUP BY qc.quizid) qq ON qc.quizid = qid GROUP BY c.courseid
--CourseID 15 with 249 questions -- probably wrong
SELECT code FROM courses WHERE courseid = 15
--CSCI1320

--Question 8
--fraction of who submit eventually get it right -- numright/numsubmit
SELECT numright/numsub FROM 
(SELECT COUNT(DISTINCT fake.userid) as numright
FROM (SELECT userid, correct FROM code_answers ca INNER JOIN function_questions fq WHERE ca.question_id = fq.func_question_id AND ca.correct = 1) AS fake) numright 
INNER JOIN
(SELECT COUNT(DISTINCT userid) as numSub
FROM (SELECT userid, correct FROM code_answers ca INNER JOIN function_questions fq WHERE ca.question_id = fq.func_question_id) as fqs) numsub
-- 89.27 percent

--Question 9
--# courses given lambdaq 
SELECT COUNT(DISTINCT courseid) FROM
quiz_course_close_assoc qc INNER JOIN
(SELECT la.quizid as qid FROM
lambda_assoc la INNER JOIN lambda_questions lq WHERE la.lambda_question_id = lq.lambda_question_id) qid ON qc.quizid = qid.qid
--9 course

--Question 10
--userid with most correct and 3 correct
SELECT userid, MAX(numC) FROM
(SELECT userid, COUNT(correct) as numC
FROM code_answers WHERE correct = 1 GROUP BY userid) fak;
--user 39 with 26 correct

--Question 11
SELECT spec_type,COUNT(*)
FROM variable_specifications GROUP BY spec_type ORDER BY COUNT(*)
-- 0-13 2-6 3-5

--Question 12
--frac of quizs with code qs
SELECT qC/qT FROM
(SELECT COUNT(DISTINCT quizid) as qT FROM quizzes) AS qT
JOIN 
(SELECT COUNT(DISTINCT q.quizid) as qC FROM quizzes q INNER JOIN code_answers ca ON q.quizid = ca.quizid) AS qC
-- 38.18 percent

--Question 13
--avg mult choice qs per quiz
SELECT AVG(cnt) FROM
(SELECT COUNT(*) as cnt FROM
multiple_choice_assoc GROUP BY quizid) fake
--avg of 2.5227

--Question 14
--avg coding qs per quiz
SELECT AVG(cnt) FROM
(SELECT DISTINCT quizid as qzid, COUNT(DISTINCT question_id) as cnt FROM code_answers GROUP BY quizid)fake
-- acg of 2.0

--Question 15
--What is the most attempts per student for any course on any quiz?
--assuming asking on coding questions b/c you get to submit multiple times
SELECT MAX(fake.cnt) FROM
(SELECT userid, quizid, count(*) as cnt FROM
code_answers GROUP BY userid, quizid) fake
--211 attemps by userid 1 on quizid 1