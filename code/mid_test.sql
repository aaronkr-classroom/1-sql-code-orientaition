-- 1. teacher 테이블 생성
CREATE TABLE teacher (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- 2. course 테이블 생성
CREATE TABLE course (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    teacher_id INT NOT NULL,
    CONSTRAINT fk_teacher FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);

-- 3. student 테이블 생성
CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- 4. student_course 테이블 생성 (학생과 강의의 다대다 관계)
CREATE TABLE student_course (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    PRIMARY KEY (student_id, course_id),
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES student(id),
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES course(id)
);

-- 데이터 삽입

-- teacher 데이터 삽입
INSERT INTO teacher (id, first_name, last_name) VALUES
(1, 'Taylah', 'Booker'),
(2, 'Sarah-Louise', 'Blake');

-- course 데이터 삽입
INSERT INTO course (id, name, teacher_id) VALUES
(1, 'Database design', 1),
(2, 'English literature', 2),
(3, 'Python programming', 1);

-- student 데이터 삽입
INSERT INTO student (id, first_name, last_name) VALUES
(1, 'Shreya', 'Bain'),
(2, 'Rianna', 'Foster'),
(3, 'Yosef', 'Naylor');

-- student_course 데이터 삽입
INSERT INTO student_course (student_id, course_id) VALUES
(1, 2),
(1, 3),
(2, 2),
(2, 3),
(3, 1);


SELECT
    sc.student_id
FROM
    student_course sc
    JOIN student s ON sc.student_id = s.id;


SELECT
    c.id AS teacher_id
FROM
    course c
    JOIN teacher t ON c.teacher_id = t.id;


SELECT
    sc.course_id
FROM
    student_course sc
    JOIN course c ON sc.course_id = c.id;

