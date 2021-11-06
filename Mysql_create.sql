CREATE TABLE `Teachers` (
	`IDTeacher` INT NOT NULL AUTO_INCREMENT,
	`FirstName` varchar(255) NOT NULL,
	`LastName` varchar(255) NOT NULL,
	`Position` INT NOT NULL,
	`Phone` varchar(255) NOT NULL,
	`Address` varchar(255) NOT NULL,
	`Email` varchar(255) NOT NULL,
	`WorkExperience` INT NOT NULL,
	PRIMARY KEY (`IDTeacher`)
);

CREATE TABLE `Positions` (
	`IDPosition` INT NOT NULL AUTO_INCREMENT,
	`Name` varchar(255) NOT NULL,
	`Salary` INT NOT NULL,
	PRIMARY KEY (`IDPosition`)
);

CREATE TABLE `Students` (
	`IDStudent` INT NOT NULL AUTO_INCREMENT,
	`FirstName` varchar(255) NOT NULL,
	`LastName` varchar(255) NOT NULL,
	`Phone` varchar(255) NOT NULL,
	`Address` varchar(255) NOT NULL,
	`Email` varchar(255) NOT NULL,
	`Year` INT NOT NULL,
	PRIMARY KEY (`IDStudent`)
);

CREATE TABLE `Disciplines` (
	`IDDiscipline` INT NOT NULL AUTO_INCREMENT,
	`Name` INT NOT NULL,
	`HoursOfLectures` INT NOT NULL,
	`HoursOfSeminars` BINARY NOT NULL,
	PRIMARY KEY (`IDDiscipline`)
);

CREATE TABLE `Exam` (
	`IDExam` INT NOT NULL AUTO_INCREMENT,
	`Discipline` INT NOT NULL,
	`Student` INT NOT NULL,
	`Teacher` INT NOT NULL,
	`Conditions` INT NOT NULL,
	`Date` DATE NOT NULL,
	`Time` DATETIME NOT NULL,
	`Score` INT NOT NULL,
	PRIMARY KEY (`IDExam`)
);

CREATE TABLE `ConditionsFor5` (
	`IDCondition` INT NOT NULL AUTO_INCREMENT,
	`Name` varchar(255) NOT NULL,
	PRIMARY KEY (`IDCondition`)
);

CREATE TABLE `HUB_Teachers` (
	`IDTeacher` INT NOT NULL,
	`Load_date` DATETIME NOT NULL,
	`Record_source` varchar(255) NOT NULL,
	PRIMARY KEY (`IDTeacher`)
);

CREATE TABLE `SAT_Teachers` (
	`IDTeacher` INT NOT NULL,
	`Load_date` DATETIME NOT NULL,
	`Record_source` varchar(255) NOT NULL,
	`FirstName` varchar(255) NOT NULL,
	`LastName` varchar(255) NOT NULL,
	`Phone` varchar(255) NOT NULL,
	`Address` varchar(255) NOT NULL,
	`Email` varchar(255) NOT NULL,
	`WorkExperience` INT NOT NULL
);

CREATE TABLE `HUB_Positions` (
	`IDPosition` INT NOT NULL AUTO_INCREMENT,
	`Load_date` DATETIME NOT NULL,
	`Record_source` varchar(255) NOT NULL,
	PRIMARY KEY (`IDPosition`)
);

CREATE TABLE `SAT_Positions` (
	`IDPosition` INT NOT NULL,
	`Load_date` DATETIME NOT NULL,
	`Record_source` varchar(255) NOT NULL,
	`Name` varchar(255) NOT NULL,
	`Salary` varchar(255) NOT NULL
);

CREATE TABLE `LNK_TeachPos` (
	`TeachPos_hash_key` INT NOT NULL AUTO_INCREMENT,
	`IDTeacher` INT NOT NULL,
	`IDPosition` INT NOT NULL,
	`Load_date` DATETIME NOT NULL,
	`Record_source` varchar(255) NOT NULL,
	PRIMARY KEY (`TeachPos_hash_key`)
);

CREATE TABLE `HUB_Students` (
	`IDStudent` INT NOT NULL AUTO_INCREMENT,
	`Load_date` DATETIME NOT NULL,
	`Record_source` varchar(255) NOT NULL,
	PRIMARY KEY (`IDStudent`)
);

CREATE TABLE `SAT_Students` (
	`IDStudent` INT NOT NULL,
	`Load_date` DATETIME NOT NULL,
	`Record_source` varchar(255) NOT NULL,
	`FirstName` varchar(255) NOT NULL,
	`LastName` varchar(255) NOT NULL,
	`Phone` varchar(255) NOT NULL,
	`Address` varchar(255) NOT NULL,
	`Email` varchar(255) NOT NULL,
	`Year` INT NOT NULL
);

CREATE TABLE `HUB_ConditionsFor5` (
	`IDCondition` INT NOT NULL AUTO_INCREMENT,
	`Load_date` DATETIME NOT NULL,
	`Record_source` varchar(255) NOT NULL,
	PRIMARY KEY (`IDCondition`)
);

CREATE TABLE `SAT_ConditionsFor5` (
	`IDCondition` INT NOT NULL,
	`Load_date` DATETIME NOT NULL,
	`Record_source` varchar(255) NOT NULL,
	`Name` varchar(255) NOT NULL
);

CREATE TABLE `LNK_Exam` (
	`IDExam_hash_key` INT NOT NULL AUTO_INCREMENT,
	`Discipline` INT NOT NULL,
	`Student` INT NOT NULL,
	`Teacher` INT NOT NULL,
	`Conditions` INT NOT NULL,
	`Load_date` DATETIME NOT NULL,
	`Record_source` varchar(255) NOT NULL,
	PRIMARY KEY (`IDExam_hash_key`)
);

CREATE TABLE `SAT_Exam` (
	`IDExam_hash_key` INT NOT NULL,
	`Date` DATE NOT NULL,
	`Time` DATETIME NOT NULL,
	`Score` INT NOT NULL
);

CREATE TABLE `HUB_Disciplines` (
	`IDDiscipline` INT NOT NULL AUTO_INCREMENT,
	`Load_date` DATETIME NOT NULL,
	`Record_source` varchar(255) NOT NULL,
	PRIMARY KEY (`IDDiscipline`)
);

CREATE TABLE `SAT_Disciplines` (
	`IDDiscipline` INT NOT NULL,
	`Load_date` DATETIME NOT NULL,
	`Record_source` varchar(255) NOT NULL,
	`Name` varchar(255) NOT NULL,
	`HoursOfLectures` INT NOT NULL,
	`HoursOfSeminars` INT NOT NULL
);

ALTER TABLE `Teachers` ADD CONSTRAINT `Teachers_fk0` FOREIGN KEY (`Position`) REFERENCES `Positions`(`IDPosition`);

ALTER TABLE `Exam` ADD CONSTRAINT `Exam_fk0` FOREIGN KEY (`Discipline`) REFERENCES `Disciplines`(`IDDiscipline`);

ALTER TABLE `Exam` ADD CONSTRAINT `Exam_fk1` FOREIGN KEY (`Student`) REFERENCES `Students`(`IDStudent`);

ALTER TABLE `Exam` ADD CONSTRAINT `Exam_fk2` FOREIGN KEY (`Teacher`) REFERENCES `Teachers`(`IDTeacher`);

ALTER TABLE `Exam` ADD CONSTRAINT `Exam_fk3` FOREIGN KEY (`Conditions`) REFERENCES `ConditionsFor5`(`IDCondition`);

ALTER TABLE `SAT_Teachers` ADD CONSTRAINT `SAT_Teachers_fk0` FOREIGN KEY (`IDTeacher`) REFERENCES `HUB_Teachers`(`IDTeacher`);

ALTER TABLE `SAT_Positions` ADD CONSTRAINT `SAT_Positions_fk0` FOREIGN KEY (`IDPosition`) REFERENCES `HUB_Positions`(`IDPosition`);

ALTER TABLE `LNK_TeachPos` ADD CONSTRAINT `LNK_TeachPos_fk0` FOREIGN KEY (`IDTeacher`) REFERENCES `HUB_Teachers`(`IDTeacher`);

ALTER TABLE `LNK_TeachPos` ADD CONSTRAINT `LNK_TeachPos_fk1` FOREIGN KEY (`IDPosition`) REFERENCES `HUB_Positions`(`IDPosition`);

ALTER TABLE `SAT_Students` ADD CONSTRAINT `SAT_Students_fk0` FOREIGN KEY (`IDStudent`) REFERENCES `HUB_Students`(`IDStudent`);

ALTER TABLE `SAT_ConditionsFor5` ADD CONSTRAINT `SAT_ConditionsFor5_fk0` FOREIGN KEY (`IDCondition`) REFERENCES `HUB_ConditionsFor5`(`IDCondition`);

ALTER TABLE `LNK_Exam` ADD CONSTRAINT `LNK_Exam_fk0` FOREIGN KEY (`Discipline`) REFERENCES `HUB_Disciplines`(`IDDiscipline`);

ALTER TABLE `LNK_Exam` ADD CONSTRAINT `LNK_Exam_fk1` FOREIGN KEY (`Student`) REFERENCES `HUB_Students`(`IDStudent`);

ALTER TABLE `LNK_Exam` ADD CONSTRAINT `LNK_Exam_fk2` FOREIGN KEY (`Teacher`) REFERENCES `HUB_Teachers`(`IDTeacher`);

ALTER TABLE `LNK_Exam` ADD CONSTRAINT `LNK_Exam_fk3` FOREIGN KEY (`Conditions`) REFERENCES `HUB_ConditionsFor5`(`IDCondition`);

ALTER TABLE `SAT_Exam` ADD CONSTRAINT `SAT_Exam_fk0` FOREIGN KEY (`IDExam_hash_key`) REFERENCES `LNK_Exam`(`IDExam_hash_key`);

ALTER TABLE `SAT_Disciplines` ADD CONSTRAINT `SAT_Disciplines_fk0` FOREIGN KEY (`IDDiscipline`) REFERENCES `HUB_Disciplines`(`IDDiscipline`);




















