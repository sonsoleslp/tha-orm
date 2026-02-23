DROP DATABASE IF EXISTS university;
CREATE DATABASE university CHARACTER SET utf8mb4;
USE university;
 
CREATE TABLE department (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE person (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ssn VARCHAR(9) UNIQUE,
    name VARCHAR(25) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    city VARCHAR(25) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(9),
    birthdate DATE NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    role ENUM('teacher', 'student') NOT NULL
);
 
CREATE TABLE teacher (
    id_teacher INT UNSIGNED PRIMARY KEY,
    id_department INT UNSIGNED NOT NULL,
    salary INT UNSIGNED,
    FOREIGN KEY (id_teacher) REFERENCES person(id),
    FOREIGN KEY (id_department) REFERENCES department(id)
);
 
 CREATE TABLE degree (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
 
CREATE TABLE course (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    credits FLOAT UNSIGNED NOT NULL,
    type ENUM('basic', 'mandatory', 'elective') NOT NULL,
    year TINYINT UNSIGNED NOT NULL,
    semester TINYINT UNSIGNED NOT NULL,
    id_teacher INT UNSIGNED,
    id_degree INT UNSIGNED NOT NULL,
    FOREIGN KEY(id_teacher) REFERENCES teacher(id_teacher),
    FOREIGN KEY(id_degree) REFERENCES degree(id)
);
 
CREATE TABLE academic_year (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    start_year YEAR NOT NULL,
    end_year YEAR NOT NULL
);

CREATE TABLE enrollment (
    id_student INT UNSIGNED NOT NULL,
    id_course INT UNSIGNED NOT NULL,
    id_academic_year INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_student, id_course, id_academic_year),
    FOREIGN KEY (id_student) REFERENCES person(id),
    FOREIGN KEY (id_course) REFERENCES course(id),
    FOREIGN KEY (id_academic_year) REFERENCES academic_year(id)
);
 
 /* department */
INSERT INTO department VALUES (1, 'Computer science');
INSERT INTO department VALUES (2, 'Mathematics');
INSERT INTO department VALUES (3, 'Business');
INSERT INTO department VALUES (4, 'Education');
INSERT INTO department VALUES (5, 'Agriculture');
INSERT INTO department VALUES (6, 'Chemistry');
INSERT INTO department VALUES (7, 'Filology');
INSERT INTO department VALUES (8, 'Law');
INSERT INTO department VALUES (9, 'Biology');
 
 /* person */
INSERT INTO person VALUES (1, '26902806M', 'Salvador', 'Sánchez',  'Joensuu', '23, Oak street', '950254837', '1991/03/28', 'M', 'student');
INSERT INTO person VALUES (2, '89542419S', 'John', 'Smith',   'Joensuu', '55, 3rd avenue', '618253876', '1992/08/08', 'M', 'student');
INSERT INTO person VALUES (3, '11105554G', 'Zoe', 'Ramirez',  'Joensuu', '22, Penny lane', '618223876', '1979/08/19', 'F', 'teacher');
INSERT INTO person VALUES (4, '17105885A', 'Helen', 'Keller',   'Joensuu', '13, Main street', NULL, '2000/10/05', 'M', 'student');
INSERT INTO person VALUES (5, '38223286T', 'David', 'Schmidt',   'Joensuu', '43, Bridge street', '678516294', '1978/01/19', 'M', 'teacher');
INSERT INTO person VALUES (6, '04233869Y', 'Joe',  'Bayer', 'Joensuu', '42, Arenal street', '628349590', '1998/01/28', 'M', 'student');
INSERT INTO person VALUES (7, '97258166K', 'Manuel', 'Strosin',  'Joensuu', '14, Berry lane', NULL, '1999/05/24', 'M', 'student');
INSERT INTO person VALUES (8, '79503962T', 'Cristina', 'Rutherford', 'Joensuu', '33, Pine street', '669162534', '1977/08/21', 'F', 'teacher');
INSERT INTO person VALUES (9, '82842571K', 'Raymond', 'Herzog',  'Joensuu', '14, Sky lane', '626351429', '1996/11/21', 'M', 'student');
INSERT INTO person VALUES (10, '61142000L', 'Esther', 'Spencer',  'Joensuu', '24, Smith street', NULL, '1977/05/19', 'F', 'teacher');
INSERT INTO person VALUES (11, '46900725E', 'Daniel', 'Herman',   'Joensuu', '55, Cherry alley', '679837625', '1997/04/26', 'M', 'student');
INSERT INTO person VALUES (12, '85366986W', 'Carmen',  'Hirthe', 'Joensuu', '51, Washington street', NULL, '1971-04-29', 'F', 'teacher');
INSERT INTO person VALUES (13, '73571384L', 'Alfredo',   'Morissette', 'Joensuu', '10, River lane', '950896725', '1980/02/01', 'M', 'teacher');
INSERT INTO person VALUES (14, '82937751G', 'Bob', 'Hamill',   'Joensuu', '11, Oak street', '950263514', '1977/01/02', 'M', 'teacher');
INSERT INTO person VALUES (15, '80502866Z', 'Alexander',   'Schoen', 'Joensuu', '43, Danube street', '668726354', '1980/03/14', 'M', 'teacher');
INSERT INTO person VALUES (16, '10485008K', 'Tony',   'Considine', 'Joensuu', '111, Mangrove street', NULL, '1982/03/18', 'M', 'teacher');
INSERT INTO person VALUES (17, '85869555K', 'William',   'Upton', 'Joensuu', '22, Sierra street', NULL, '1973/05/05', 'M', 'teacher');
INSERT INTO person VALUES (18, '04326833G', 'Michaela',  'Murray', 'Joensuu', '100, Bridge street', '662765413', '1976/02/25', 'M', 'teacher');
INSERT INTO person VALUES (19, '11578526G', 'Ingrid', 'Lakin',  'Joensuu', '2, Main street', '678652431', '1998/09/01', 'F', 'student');
INSERT INTO person VALUES (20, '79221403L', 'Francesca',   'Muller', 'Joensuu', '13, King avenue', NULL, '1980/10/31', 'M', 'teacher');
INSERT INTO person VALUES (21, '79089577Y', 'James',   'López', 'Joensuu', '20, Alameda lane', '678652431', '1998/01/01', 'M', 'student');
INSERT INTO person VALUES (22, '41491230N', 'Tony',   'Guerrero', 'Joensuu', '4, Main street', '626652498', '1999/02/11', 'M', 'student');
INSERT INTO person VALUES (23, '64753215G', 'Irene',  'Rose', 'Joensuu', '44, Oak street', '628452384', '1996/03/12', 'F', 'student');
INSERT INTO person VALUES (24, '85135690V', 'Sonia',   'Reyes', 'Joensuu', '15, Sky lane', '678812017', '1995/04/13', 'F', 'student');
 
/* teacher */
INSERT INTO teacher VALUES (3, 1, 10000);
INSERT INTO teacher VALUES (5, 2, 4000);
INSERT INTO teacher VALUES (8, 3, 2500);
INSERT INTO teacher VALUES (10, 4, 4000);
INSERT INTO teacher VALUES (12, 4, 3000);
INSERT INTO teacher VALUES (13, 6, 9000);
INSERT INTO teacher VALUES (14, 1, 8000);
INSERT INTO teacher VALUES (15, 2, 7000);
INSERT INTO teacher VALUES (16, 3, 3500);
INSERT INTO teacher VALUES (17, 4, 2000);
INSERT INTO teacher VALUES (18, 5, 10000);
INSERT INTO teacher VALUES (20, 6, 6700);
 
 /* degree */
INSERT INTO degree VALUES (1, 'Degree in Agricultural Engineering');
INSERT INTO degree VALUES (2, 'Degree in Electric Engineering');
INSERT INTO degree VALUES (3, 'Degree in Industrial Engineering');
INSERT INTO degree VALUES (4, 'Degree in Computer Engineering');
INSERT INTO degree VALUES (5, 'Degree in Mechanic Engineering');
INSERT INTO degree VALUES (6, 'Degree in Chemical Engineering');
INSERT INTO degree VALUES (7, 'Degree in Biotechnoloyy');
INSERT INTO degree VALUES (8, 'Degree in Environmental Sciences');
INSERT INTO degree VALUES (9, 'Degree in Mathematics');
INSERT INTO degree VALUES (10, 'Degree in Chemistry');
 
/* course */
INSERT INTO course VALUES (1, 'Discrete Linear Algebra', 6, 'basic', 1, 1, 3, 4);
INSERT INTO course VALUES (2, 'Calculation', 6, 'basic', 1, 1, 14, 4);
INSERT INTO course VALUES (3, 'Computational Physics', 6, 'basic', 1, 1, 3, 4);
INSERT INTO course VALUES (4, 'Introduction to programming', 6, 'basic', 1, 1, 14, 4);
INSERT INTO course VALUES (5, 'Business organization and management', 6, 'basic', 1, 1, 3, 4);
INSERT INTO course VALUES (6, 'Statistics', 6, 'basic', 1, 2, 14, 4);
INSERT INTO course VALUES (7, 'Computer Structure and Technology', 6, 'basic', 1, 2, 3, 4);
INSERT INTO course VALUES (8, 'Electronics Fundamentals', 6, 'basic', 1, 2, 14, 4);
INSERT INTO course VALUES (9, 'Logic and algorithmic', 6, 'basic', 1, 2, 3, 4);
INSERT INTO course VALUES (10, 'Programming methodology', 6, 'basic', 1, 2, 14, 4);
INSERT INTO course VALUES (11, 'Computers architecture', 6, 'basic', 2, 1, 3, 4);
INSERT INTO course VALUES (12, 'Data structure and algorithms I', 6, 'basic', 2, 1, 3, 4);
INSERT INTO course VALUES (13, 'Software engineering', 6, 'mandatory', 2, 1, 14, 4);
INSERT INTO course VALUES (14, 'Intelligent Systems', 6, 'basic', 2, 1, 3, 4);
INSERT INTO course VALUES (15, 'Operating systems', 6, 'mandatory', 2, 1, 14, 4);
INSERT INTO course VALUES (16, 'Databases', 6, 'basic', 2, 2, 14, 4);
INSERT INTO course VALUES (17, 'Data structure and algorithms II', 6, 'basic', 2, 2, 14, 4);
INSERT INTO course VALUES (18, 'Computer networks fundamentals', 6, 'basic', 2, 2, 3, 4);
INSERT INTO course VALUES (19, 'Computer Project Management', 6, 'basic', 2, 2, 3, 4);
INSERT INTO course VALUES (20, 'Software Services Programming', 6, 'mandatory', 2, 2, 14, 4);
INSERT INTO course VALUES (21, 'User interface development', 6, 'mandatory', 3, 1, 14, 4);
INSERT INTO course VALUES (22, 'Requirements Engineering', 6, 'elective', 3, 1, NULL, 4);
INSERT INTO course VALUES (23, 'Integration of information technologies in organizations', 6, 'elective', 3, 1, NULL, 4);
INSERT INTO course VALUES (24, 'Modeling and software design 1', 6, 'elective', 3, 1, NULL, 4);
INSERT INTO course VALUES (25, 'Multiprocessors', 6, 'elective', 3, 1, NULL, 4);
INSERT INTO course VALUES (26, 'Safety and regulatory compliance', 6, 'elective', 3, 1, NULL, 4);
INSERT INTO course VALUES (27, 'Information system for organizations', 6, 'elective', 3, 1, NULL, 4);
INSERT INTO course VALUES (28, 'Web technologies', 6, 'elective', 3, 1, NULL, 4);
INSERT INTO course VALUES (29, 'Code and cryptography theory', 6, 'elective', 3, 1, NULL, 4);
INSERT INTO course VALUES (30, 'Database Administration', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO course VALUES (31, 'Software Engineering Tools and Methods', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO course VALUES (32, 'Industrial and Robotics Informatics', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO course VALUES (33, 'Information Systems', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO course VALUES (34, 'Modeling and software design 2', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO course VALUES (35, 'Electronic business', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO course VALUES (36, 'Peripherals and interfaces', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO course VALUES (37, 'Real time systems', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO course VALUES (38, 'Red Access Technologies', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO course VALUES (39, 'Digital Image Processing', 6, 'elective', 3, 2, NULL, 4);
INSERT INTO course VALUES (40, 'Network and Operating Systems Administration', 6, 'elective', 4, 1, NULL, 4);
INSERT INTO course VALUES (41, 'Data stores', 6, 'elective', 4, 1, NULL, 4);
INSERT INTO course VALUES (42, 'Risk management', 6, 'elective', 4, 1, NULL, 4);
INSERT INTO course VALUES (43, 'Software product lines', 6, 'elective', 4, 1, NULL, 4);
INSERT INTO course VALUES (44, 'Software Engineering 1', 6, 'elective', 4, 1, NULL, 4);
INSERT INTO course VALUES (45, 'Multimedia technologies', 6, 'elective', 4, 1, NULL, 4);
INSERT INTO course VALUES (46, 'Analysis and plassnication of IT', 6, 'elective', 4, 2, NULL, 4);
INSERT INTO course VALUES (47, 'Quick Application Development', 6, 'elective', 4, 2, NULL, 4);
INSERT INTO course VALUES (48, 'Quality Management and Technological Innovation', 6, 'elective', 4, 2, NULL, 4);
INSERT INTO course VALUES (49, 'Business Intelligence', 6, 'elective', 4, 2, NULL, 4);
INSERT INTO course VALUES (50, 'Software engineering processes 2', 6, 'elective', 4, 2, NULL, 4);
INSERT INTO course VALUES (51, 'Informatic security', 6, 'elective', 4, 2, NULL, 4);
INSERT INTO course VALUES (52, 'Cell Biology', 6, 'basic', 1, 1, NULL, 7);
INSERT INTO course VALUES (53, 'Physical', 6, 'basic', 1, 1, NULL, 7);
INSERT INTO course VALUES (54, 'Mathematics I', 6, 'basic', 1, 1, NULL, 7);
INSERT INTO course VALUES (55, 'General chemistry', 6, 'basic', 1, 1, NULL, 7);
INSERT INTO course VALUES (56, 'Organic Chemistry', 6, 'basic', 1, 1, NULL, 7);
INSERT INTO course VALUES (57, 'Plant and animal biology', 6, 'basic', 1, 2, NULL, 7);
INSERT INTO course VALUES (58, 'Biochemistry', 6, 'basic', 1, 2, NULL, 7);
INSERT INTO course VALUES (59, 'Genetics', 6, 'basic', 1, 2, NULL, 7);
INSERT INTO course VALUES (60, 'Mathematics II', 6, 'basic', 1, 2, NULL, 7);
INSERT INTO course VALUES (61, 'Microbiology', 6, 'basic', 1, 2, NULL, 7);
INSERT INTO course VALUES (62, 'Agricultural botany', 6, 'mandatory', 2, 1, NULL, 7);
INSERT INTO course VALUES (63, 'Plant Physiology', 6, 'mandatory', 2, 1, NULL, 7);
INSERT INTO course VALUES (64, 'Molecular Genetic', 6, 'mandatory', 2, 1, NULL, 7);
INSERT INTO course VALUES (65, 'Biochemical Engineering', 6, 'mandatory', 2, 1, NULL, 7);
INSERT INTO course VALUES (66, 'Thermodynamics and kinetic chemical applied', 6, 'mandatory', 2, 1, NULL, 7);
INSERT INTO course VALUES (67, 'Biorreactors', 6, 'mandatory', 2, 2, NULL, 7);
INSERT INTO course VALUES (68, 'Microbial Biotechnology', 6, 'mandatory', 2, 2, NULL, 7);
INSERT INTO course VALUES (69, 'Genetic engineering', 6, 'mandatory', 2, 2, NULL, 7);
INSERT INTO course VALUES (70, 'Immunology', 6, 'mandatory', 2, 2, NULL, 7);
INSERT INTO course VALUES (71, 'Virology', 6, 'mandatory', 2, 2, NULL, 7);
INSERT INTO course VALUES (72, 'Molecular bases of plant development', 4.5, 'mandatory', 3, 1, NULL, 7);
INSERT INTO course VALUES (73, 'Animal Physiology', 4.5, 'mandatory', 3, 1, NULL, 7);
INSERT INTO course VALUES (74, 'Metabolism and biomolecules biosynthesis', 6, 'mandatory', 3, 1, NULL, 7);
INSERT INTO course VALUES (75, 'Separation operations', 6, 'mandatory', 3, 1, NULL, 7);
INSERT INTO course VALUES (76, 'Plant pathology', 4.5, 'mandatory', 3, 1, NULL, 7);
INSERT INTO course VALUES (77, 'Basic instrumental techniques', 4.5, 'mandatory', 3, 1, NULL, 7);
INSERT INTO course VALUES (78, 'Bioinformatics', 4.5, 'mandatory', 3, 2, NULL, 7);
INSERT INTO course VALUES (79, 'Biotechnology of fruit and fruit farms', 4.5, 'mandatory', 3, 2, NULL, 7);
INSERT INTO course VALUES (80, 'Vegetal biotechnology', 6, 'mandatory', 3, 2, NULL, 7);
INSERT INTO course VALUES (81, 'Genomic and Proteomic', 4.5, 'mandatory', 3, 2, NULL, 7);
INSERT INTO course VALUES (82, 'Biotechnological processes', 6, 'mandatory', 3, 2, NULL, 7);
INSERT INTO course VALUES (83, 'Advanced instrumental techniques', 4.5, 'mandatory', 3, 2, NULL, 7);

/* Curso escolar */
INSERT INTO academic_year VALUES (1, 2014, 2015);
INSERT INTO academic_year VALUES (2, 2015, 2016);
INSERT INTO academic_year VALUES (3, 2016, 2017);
INSERT INTO academic_year VALUES (4, 2017, 2018);
INSERT INTO academic_year VALUES (5, 2018, 2019);

/* student se matricula en course */
INSERT INTO enrollment VALUES (1, 1, 1);
INSERT INTO enrollment VALUES (1, 2, 1);
INSERT INTO enrollment VALUES (1, 3, 1);
INSERT INTO enrollment VALUES (2, 1, 1);
INSERT INTO enrollment VALUES (2, 2, 1);
INSERT INTO enrollment VALUES (2, 3, 1);
INSERT INTO enrollment VALUES (4, 1, 1);
INSERT INTO enrollment VALUES (4, 2, 1);
INSERT INTO enrollment VALUES (4, 3, 1);
INSERT INTO enrollment VALUES (24, 1, 5);
INSERT INTO enrollment VALUES (24, 2, 5);
INSERT INTO enrollment VALUES (24, 3, 5);
INSERT INTO enrollment VALUES (24, 4, 5);
INSERT INTO enrollment VALUES (24, 5, 5);
INSERT INTO enrollment VALUES (24, 6, 5);
INSERT INTO enrollment VALUES (24, 7, 5);
INSERT INTO enrollment VALUES (24, 8, 5);
INSERT INTO enrollment VALUES (24, 9, 5);
INSERT INTO enrollment VALUES (24, 10, 5);
INSERT INTO enrollment VALUES (23, 1, 5);
INSERT INTO enrollment VALUES (23, 2, 5);
INSERT INTO enrollment VALUES (23, 3, 5);
INSERT INTO enrollment VALUES (23, 4, 5);
INSERT INTO enrollment VALUES (23, 5, 5);
INSERT INTO enrollment VALUES (23, 6, 5);
INSERT INTO enrollment VALUES (23, 7, 5);
INSERT INTO enrollment VALUES (23, 8, 5);
INSERT INTO enrollment VALUES (23, 9, 5);
INSERT INTO enrollment VALUES (23, 10, 5);
INSERT INTO enrollment VALUES (19, 1, 5);
INSERT INTO enrollment VALUES (19, 2, 5);
INSERT INTO enrollment VALUES (19, 3, 5);
INSERT INTO enrollment VALUES (19, 4, 5);
INSERT INTO enrollment VALUES (19, 5, 5);
INSERT INTO enrollment VALUES (19, 6, 5);
INSERT INTO enrollment VALUES (19, 7, 5);
INSERT INTO enrollment VALUES (19, 8, 5);
INSERT INTO enrollment VALUES (19, 9, 5);
INSERT INTO enrollment VALUES (19, 10, 5);