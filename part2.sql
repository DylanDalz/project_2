-- This script will create the lookup tables such that a code will be linked to its corresponding name from the csv.
-- This will fulfill part 2, and follow the ER diagram such that each lookup table looks exactly like the ER diagram.

-- Co-applicant lookup tables

CREATE TABLE Co_Applicant_Race_Name (
    co_applicant_race INT PRIMARY KEY,
    co_applicant_race_name TEXT
);

-- A reminder that we condensed race 1 to 5 down into just co_applicant_race.
CREATE TABLE Co_Applicant_Race (
    sequence_number INT,
    co_applicant_race INT,
    co_applicant_race_number INT,
    PRIMARY KEY (sequence_number, co_applicant_race_number),
    FOREIGN KEY (co_applicant_race) REFERENCES Co_Applicant_Race_Name(co_applicant_race),
    FOREIGN KEY (sequence_number) REFERENCES Co_Applicant(sequence_number)
);

CREATE TABLE Co_Applicant_Ethnicity (
    co_applicant_ethnicity INT PRIMARY KEY,
    co_applicant_ethnicity_name TEXT
);

CREATE TABLE Co_Applicant_Sex (
    co_applicant_sex INT PRIMARY KEY,
    co_applicant_sex_name TEXT
);

-- Applicant lookup tables

CREATE TABLE Applicant_Race_Name (
    applicant_race INT PRIMARY KEY,
    applicant_race_name TEXT
);

CREATE TABLE Applicant_Race (
    applicant_race INT,
    sequence_number INT,
    applicant_race_number INT,
    PRIMARY KEY (sequence_number, applicant_race_number),
    FOREIGN KEY (applicant_race) REFERENCES Applicant_Race_Name(applicant_race),
    FOREIGN KEY (sequence_number) REFERENCES Applicant(sequence_number)
);

CREATE TABLE Applicant_Sex (
    applicant_sex INT PRIMARY KEY,
    applicant_sex_name TEXT
);

CREATE TABLE Applicant_Ethnicity (
    applicant_ethnicity INT PRIMARY KEY,
    applicant_ethnicity_name TEXT
);

-- Loan_Terms' lookup tables

CREATE TABLE Loan_Type (
    loan_type INT PRIMARY KEY,
    loan_type_name TEXT
);

CREATE TABLE Loan_Purpose (
    loan_purpose INT PRIMARY KEY,
    loan_purpose_name TEXT
);

-- Purchaser lookup table

CREATE TABLE Purchaser (
    purchaser_type INT PRIMARY KEY,
    purchaser_type_name TEXT
);

-- Lender lookup table

CREATE TABLE Lender (
    respondent_id TEXT PRIMARY KEY,
    agency_code INT,
    FOREIGN KEY (agency_code) REFERENCES Agency(agency_code)
);

-- Agency lookup table
CREATE TABLE Agency (
    agency_code INT PRIMARY KEY,
    agency_abbr TEXT,
    agency_name TEXT
);

-- Compliance Lookup tables

CREATE TABLE Lien_Status (
    lien_status INT PRIMARY KEY,
    lien_status_name TEXT
);

CREATE TABLE Hoepa_Status (
    hoepa_status INT PRIMARY KEY,
    hoepa_status_name TEXT
);

-- Denial Reason Lookup tables

CREATE TABLE Denial_Reason (
    sequence_number INT,
    denial_reason INT,
    denial_reason_number INT,
    PRIMARY KEY (sequence_number, denial_reason_number),
    FOREIGN KEY (sequence_number) REFERENCES Application(sequence_number),
    FOREIGN KEY (denial_reason) REFERENCES Denial_Reason_Name(denial_reason)
);

CREATE TABLE Denial_Reason_Name (
    denial_reason INT PRIMARY KEY,
    denial_reason_name TEXT
);

-- Location Lookup tables

CREATE TABLE State (
    state_code INT PRIMARY KEY,
    state_abbr TEXT,
    state_name TEXT
);

CREATE TABLE County (
    county_code INT PRIMARY KEY,
    county_name TEXT
);

CREATE TABLE msamd (
    msamd INT PRIMARY KEY,
    msamd_name TEXT,
    hud_median_family_income INT
);

-- Property Lookup tables

CREATE TABLE Property_Type (
    property_type INT PRIMARY KEY,
    property_type_name TEXT
);

CREATE TABLE Owner_Occupancy (
    owner_occupancy INT PRIMARY KEY,
    owner_occupancy_name TEXT
);

-- Application Lookup tables

-- This will be NULL
CREATE TABLE Edit_Status (
    edit_status INT,
    edit_status_name TEXT
);

CREATE TABLE Preapproval (
    preapproval INT PRIMARY KEY,
    preapproval_name TEXT
);

CREATE TABLE Action_Taken (
    action_taken INT PRIMARY KEY,
    action_taken_name TEXT
);

