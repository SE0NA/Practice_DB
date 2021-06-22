CREATE DATABASE hospital;
USE hospital;

CREATE TABLE address(
  zipcode CHAR(6) NOT NULL,
  address1 VARCHAR(100) NOT NULL,
  PRIMARY KEY(zipcode)
);

CREATE TABLE patient(
  name CHAR(20) NOT NULL,
  id CHAR(20) NOT NULL AUTO_INCREMENT,
  sex CHAR(2) NOT NULL,
  zipcode CHAR(6) NOT NULL,
  address2 VARCHAR(100) NOT NULL,
  insurancecode VARCHAR(30) NULL,
  PRIMARY KEY(id)
);

CREATE TABLE department(
  id CHAR(20) NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  place VARCHAR(100) NOT NULL,
  total_bed INT(3) NOT NULL,
  using_bed INT(3) NOT NULL,
  manager CHAR(10) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE doctor(
  name CHAR(20) NOT NULL,
  employee_id CHAR(20) NOT NULL AUTO_INCREMENT,
  id CHAR(20) NOT NULL.
  employed DATETIME(10) NOT NULL,
  belong_d VARCHAR(20) NOT NULL,
  PRIMARY KEY(employee_id)
);

CREATE TABLE nurse(
  name CHAR(20) NOT NULL,
  employee_id CHAR(20) NOT NULL AUTO_INCREMENT,
  id CHAR(20) NOT NULL.
  employed DATETIME(10) NOT NULL,
  belong_n VARCHAR(20) NOT NULL,
  PRIMARY KEY(employee_id)
);


CREATE TABLE hospitalized(
  patient_id CHAR(20) NOT NULL,
  entered DATETIME(10) NOT NULL,
  out DATETIME(10) NOT NULL,
  charged_dr CHAR(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY(patient_id, entered)
);

CREATE TABLE treatment(
  Code CHAR(20) NOT NULL AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL,
  Period CHAR(20) NOT NULL,
  ExpectedResponse VARCHAR(200) NULL,
  Cost INT(10) NOT NULL,
  PRIMARY KEY(Code)
);

CREATE TABLE patient_treatment(
  treatedpatient_id CHAR(20) NOT NULL,
  treatment_code CHAR(20) NOT NULL,
  PRIMARY KEY(Patient, Treatment)
);

CREATE TABLE patient_nurse(
  assignedpatient_id CHAR(20) NOT NULL,
  charged_n CHAR(20) NOT NULL
);



ALTER TABLE `patient` ADD CONSTRAINT `zipcode`
FOREIGN KEY (`zipcode`) REFERENCES `address` (`zipcode`)
  ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `department` ADD CONSTRAINT `manager`
  FOREIGN KEY (`manager`) REFERENCES `doctor` (`employee_id`)
  ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `doctor` ADD CONSTRAINT `belong_d`
  FOREIGN KEY (`belong_d`) REFERENCES `department` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `nurse` ADD CONSTRAINT `belong_n`
  FOREIGN KEY (`belong_n`) REFERENCES `department` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `hospitalized` ADD CONSTRAINT `patient_id`
  FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `hospitalized` ADD CONSTRAINT `charged_dr`
  FOREIGN KEY (`patient_id`) REFERENCES `doctor` (`employee_id`)
  ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `patient_treatment` ADD CONSTRAINT `treatedpatient_id`
  FOREIGN KEY (`treatedpatient_id`) REFERENCES `patient` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
                                ADD CONSTRAINT `treatment_code` 
  FOREIGN KEY (`treatment_code`) REFERENCES `treatment` (`code`)
  ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `patient_nurse` ADD CONSTRAINT `assignedpatient_id`
  FOREIGN KEY (`assignedpatient_id`) REFERENCES `patient` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
                            ADD CONSTRAINT `charged_n`
  FOREIGN KEY (`charged_n`) `nurse` (`employee_id`)
  ON DELETE CASCADE ON UPDATE CASCADE;






