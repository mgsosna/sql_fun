DROP TABLE IF EXISTS classrooms CASCADE;
CREATE TABLE classrooms (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    teacher VARCHAR(100)
);


DROP TABLE IF EXISTS students CASCADE;
CREATE TABLE students (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    classroom_id INT,
    CONSTRAINT fk_classrooms
        FOREIGN KEY(classroom_id)
        REFERENCES classrooms(id)
);


INSERT INTO classrooms
    (teacher)
VALUES
    ('Mary'),
    ('Jonah');


INSERT INTO students
    (name, classroom_id)
 VALUES
    ('Adam', 1),
    ('Betty', 1),
    ('Caroline', 2);


-- Explicitly specify NULL
INSERT INTO students
    (name, classroom_id)
VALUES
    ('Dina', NULL);

-- Implicitly specify NULL
INSERT INTO students
    (name)
VALUES
    ('Evan');



DROP TABLE IF EXISTS assignments CASCADE;
CREATE TABLE assignments (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    category VARCHAR(20),
    name VARCHAR(200),
    due_date DATE,
    weight FLOAT
);

DROP TABLE IF EXISTS grades CASCADE;
CREATE TABLE grades (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    assignment_id INT,
    score INT,
    student_id INT,
    CONSTRAINT fk_assignments
        FOREIGN KEY(assignment_id)
        REFERENCES assignments(id),
    CONSTRAINT fk_students
        FOREIGN KEY(student_id)
        REFERENCES students(id)
);


COPY assignments(category, name, due_date, weight)
FROM 'C:/Users/mgsosna/Desktop/db_data/assignments.csv'
DELIMITER ','
CSV HEADER;


COPY grades(assignment_id, score, student_id)
FROM 'C:/Users/mgsosna/Desktop/db_data/grades.csv'
DELIMITER ','
CSV HEADER;
