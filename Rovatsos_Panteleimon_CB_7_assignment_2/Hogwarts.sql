CREATE SCHEMA `hogwarts` DEFAULT CHARACTER SET utf8 ;

USE hogwarts;

CREATE TABLE `Courses`
(
 `id`        integer NOT NULL AUTO_INCREMENT ,
 `title`     varchar(45) NOT NULL ,
 `stream`    varchar(45) ,
 `type`      varchar(45) ,
 `startDate` datetime ,
 `endDate`   datetime ,
PRIMARY KEY (`id`)
);


CREATE TABLE `Assignments`
(
 `id`             integer NOT NULL AUTO_INCREMENT,
 `title`          varchar(45) NOT NULL ,
 `description`    varchar(45) ,
 `oralMark`       varchar(30) ,
 `totalMark`      varchar(30) ,
 `submissionDate` datetime NOT NULL ,
PRIMARY KEY (`id`)
);


CREATE TABLE `Trainers`
(
 `id`      integer NOT NULL AUTO_INCREMENT,
 `fName`   varchar(30) NOT NULL ,
 `lName`   varchar(30) NOT NULL ,
 `subject` varchar(45) ,
PRIMARY KEY (`id`)
);



CREATE TABLE `Students`
(
 `id`          integer NOT NULL AUTO_INCREMENT,
 `fName`       varchar(30) NOT NULL ,
 `lName`       varchar(30) NOT NULL ,
 `dOfBirth`    date NOT NULL ,
 `tuitionFees` decimal NOT NULL ,
PRIMARY KEY (`id`)
);

SHOW DATABASES;


CREATE TABLE `hogwarts`.`studentspercourse` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fk_St_id` INT NOT NULL,
  `fk_C_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_St_id_idx` (`fk_St_id` ASC) VISIBLE,
  INDEX `fk_C_id_idx` (`fk_C_id` ASC) VISIBLE,
  CONSTRAINT `fk_St_id`
    FOREIGN KEY (`fk_St_id`)
    REFERENCES `hogwarts`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_C_id`
    FOREIGN KEY (`fk_C_id`)
    REFERENCES `hogwarts`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
  CREATE TABLE `hogwarts`.`trainerspercourse` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fk_Tr_id` INT NOT NULL,
  `fk_C_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Tr_id_idx` (`fk_Tr_id` ASC) VISIBLE,
  INDEX `fk_C_id_idx` (`fk_C_id` ASC) VISIBLE,
  CONSTRAINT `fk_Tr_id`
    FOREIGN KEY (`fk_Tr_id`)
    REFERENCES `hogwarts`.`trainers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Co_id`
    FOREIGN KEY (`fk_C_id`)
    REFERENCES `hogwarts`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    CREATE TABLE `hogwarts`.`assignmentspercourse` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fk_Ass_id` INT NOT NULL,
  `fk_C_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Ass_id_idx` (`fk_Ass_id` ASC) VISIBLE,
  INDEX `fk_Cou_id_idx` (`fk_C_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ass_id`
    FOREIGN KEY (`fk_Ass_id`)
    REFERENCES `hogwarts`.`assignments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cou_id`
    FOREIGN KEY (`fk_C_id`)
    REFERENCES `hogwarts`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    

CREATE TABLE `hogwarts`.`assignmentsperstudent` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fk_apc_id` INT NOT NULL,
  `fk_spc_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_spc_id_idx` (`fk_spc_id` ASC) VISIBLE,
  INDEX `fk_apc_id_idx` (`fk_apc_id` ASC) VISIBLE,
  CONSTRAINT `fk_spc_id`
    FOREIGN KEY (`fk_spc_id`)
    REFERENCES `hogwarts`.`studentspercourse` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apc_id`
    FOREIGN KEY (`fk_apc_id`)
    REFERENCES `hogwarts`.`assignmentspercourse` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

    
    
INSERT INTO students(fName, lName, dOfBirth, tuitionFees) VALUES('Harry', 'Potter', '2010-5-20', 3000),
 ('Hermione', 'Granger', '2009-12-31', 0), ('Ron', 'Weasly', '2009-4-8', 3000), ('Luna', 'Lovegood', '2010-5-29', 3000),
 ('Tom', 'Riddle', '1980-8-7', 0);

  INSERT INTO trainers(fName, lName, subject) VALUES('Albus', 'Dumbledore', 'Defense against the dark arts');

  INSERT INTO trainers(fName, lName, subject) VALUES('Severus', 'Snape', 'Potions'), ('Minerva', 'McGonagall', 'Transfiguration');

INSERT INTO assignments(title, description, oralMark, totalMark, submissionDate) VALUES('Early Assignment', 'First assignment of the semester', 
'20% of the total mark', 'Oral and writing performance', '2019-06-05 23-59-59'),
('Final assignment', 'Dissertation', '20% of the total mark', 'Oral and writing performance', '2019-08-07 23-59-59');


INSERT INTO courses(title, stream, type, startDate, endDate) VALUES('Defence against the dark arts', 'Dark magic', 'Defensive', '2019-03-25 09-00-00', '2019-07-28 15-00-00'),
('Potions', 'Craft', 'Miscellaneous', '2019-03-25 09-00-00', '2019-07-28 15-00-00'), ('Transfiguration', 'Neutral magic', 'Animagus', '2019-03-25 09-00-00', '2019-07-28 15-00-00');


INSERT INTO studentspercourse(fk_St_id, fk_C_id) VALUES(1, 1), (2,1), (3,1), (4,1), (1,2), (2,2), (4,2),
(1,3), (2,3), (3,3), (5,3);


INSERT INTO trainerspercourse(fk_Tr_id, fk_C_id) VALUES(1,1), (2,1), (2,2), (3,3);

INSERT INTO assignmentspercourse(fk_Ass_id, fk_C_id) VALUES(1,1), (2,1), (2,2), (1,3);

INSERT INTO assignmentsperstudent(fk_apc_id, fk_spc_id) VALUES(1, 1), (1, 2), (1, 3), (1,4), (2,1), (2,2),(2, 3), (2,4), (3,5), (3,6), (3,7),
(4,8), (4,9), (4,10), (4,11);

-- STUDENTS
SELECT CONCAT(fname, ' ', lname) fullName FROM students;

-- TRAINERS
SELECT CONCAT(fname, ' ', lname) fullName FROM trainers;

-- ASSIGNMENTS
SELECT title FROM assignments;

-- COURSES
SELECT title FROM courses;

-- STUDENTS PER COURSE
SELECT CONCAT(fname, ' ', lname) fullName,  title course FROM students s INNER JOIN studentspercourse spc ON s.id = spc.fk_St_id INNER JOIN courses c ON c.id = spc.fk_C_id;

-- TRAINERS PER COURSE
SELECT CONCAT(fname, ' ', lname) fullName, title course FROM trainers t INNER JOIN trainerspercourse tpc ON t.id = tpc.fk_Tr_id INNER JOIN courses c ON c.id = tpc.fk_C_id;

-- ASSIGNMENT PER COURSE
SELECT a.title Assignment, c.title Course FROM assignments a INNER JOIN assignmentspercourse apc ON a.id = apc.fk_Ass_id INNER JOIN courses c ON c.id = apc.fk_C_id;

-- ASSIGNMENTS PER COURSE PER STUDENT ----> INNER JOIN 1st SOLUTION
SELECT a.title Assignment , c.title Course , CONCAT(fname, ' ', lname) fullName FROM assignments a INNER JOIN assignmentspercourse apc ON a.id = apc.fk_Ass_id
INNER JOIN courses c ON c.id = apc.fk_C_id INNER JOIN studentspercourse spc ON c.id = spc.fk_C_id INNER JOIN students s On s.id = spc.fk_St_id;

-- ASSIGNMENTS PER COURSE PER STUDENT ----> 2nd SOLUTION USING THE ASSIGNMENTSPERCOURSE TABLE
SELECT a.title Assignment , c.title Course , CONCAT(fname, ' ', lname) fullName FROM assignments a, courses c, students s, studentspercourse spc, assignmentspercourse apc, assignmentsperstudent aps
WHERE a.id = apc.fk_Ass_id AND apc.id = aps.fk_apc_id AND spc.id = aps.fk_spc_id AND s.id = spc.fk_St_id AND c.id = spc.fk_C_id ;

-- THE LIST OF STUDENTS THAT BELONG TO MORE THAN ONE COURSES
SELECT CONCAT(fname, ' ', lname) fullName FROM students s INNER JOIN studentspercourse spc ON s.id = spc.fk_St_id 
INNER JOIN courses c ON c.id = spc.fk_C_id GROUP BY fname, lname HAVING COUNT(fk_C_id) > 1 ;
