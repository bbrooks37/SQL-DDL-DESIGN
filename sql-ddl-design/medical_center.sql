DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;


-- Table for storing doctor information
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialty VARCHAR(100),
    contact_info VARCHAR(100)
);

-- Inserting data into Doctor table 
INSERT INTO Doctor 
(doctor_id, name, specialty, contact_info) 
VALUES 
(1, 'Dr. Smith', 'Cardiology', '123-456-7890'), 
(2, 'Dr. Adams', 'Neurology', '987-654-3210');

-- Table for storing patient information
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    contact_info VARCHAR(100)
);

-- Inserting data into Patient table
INSERT INTO Patient
(patient_id, name, dob, contact_info)
VALUES
(1, 'Alice', '1990-01-01', '123-456-7890'),
(2, 'Bob', '1985-02-15', '987-654-3210');

-- Table for storing disease information
CREATE TABLE Disease (
    disease_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

-- Inserting data into Disease table
INSERT INTO Disease
(disease_id, name, description)
VALUES
(1, 'Heart Disease', 'A condition that affects the heart'),
(2, 'Stroke', 'A medical emergency that occurs when blood flow to the brain is interrupted');

-- Table for storing visit information
CREATE TABLE Visit (
    visit_id INT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    visit_date DATE,
    diagnosis TEXT,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Inserting data into Visit table
INSERT INTO Visit
(visit_id, doctor_id, patient_id, visit_date, diagnosis)
VALUES
(1, 1, 1, '2020-01-01', 'Heart Disease'),
(2, 2, 2, '2020-02-15', 'Stroke');


-- Bridge table between Visit and Disease to store diagnoses
CREATE TABLE Diagnosis (
    diagnosis_id INT PRIMARY KEY,
    visit_id INT,
    disease_id INT,
    FOREIGN KEY (visit_id) REFERENCES Visit(visit_id),
    FOREIGN KEY (disease_id) REFERENCES Disease(disease_id)
);

-- Inserting data into Diagnosis table
INSERT INTO Diagnosis
(diagnosis_id, visit_id, disease_id)
VALUES
(1, 1, 1),
(2, 2, 2);
