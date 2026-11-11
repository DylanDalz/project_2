-- This script will create the lookup tables such that a code will be linked to its corresponding name from the csv.
-- This will fulfill part 2, and follow the ER diagram such that each lookup table looks exactly like the ER diagram.

-- Application Lookup tables

-- Delete every table if it already exists from an earlier run to prevent errors
DROP TABLE IF EXISTS 
    Edit_Status, Preapproval, Action_Taken, Co_Applicant_Race_Name, 
    Co_Applicant_Ethnicity, Co_Applicant_Sex, Applicant_Race_Name, Applicant_Sex, Applicant_Ethnicity, Loan_Type, 
    Loan_Purpose, Purchaser, Agency, Lien_Status, Hoepa_Status, Denial_Reason_Name, State, County, msamd, Property_Type, 
    Owner_Occupancy, Lender, Location, Application, Co_Applicant, Applicant, Loan_Terms, Compliance, Property, Co_Applicant_Race,
    Applicant_Race, Denial_Reason
CASCADE;

-- Edit status code to name lookup table, but it will be all NULL like in the original CSV
CREATE TABLE Edit_Status (
    edit_status INT UNIQUE,
    edit_status_name TEXT
);

-- Insert NULL into edit status code and name as they are all NULL in the original CSV
INSERT INTO Edit_Status (edit_status, edit_status_name)
VALUES
    (NULL, NULL);

-- Preapproval code to name lookup table
CREATE TABLE Preapproval (
    preapproval INT PRIMARY KEY,
    preapproval_name TEXT
);

-- Insert distinct preapproval codes matching to their corresponding preapproval names based off the CSV's code explanations for LAR Data
INSERT INTO Preapproval (preapproval, preapproval_name)
VALUES
    (1, 'Preapproval was requested'),
    (2, 'Preapproval was not requested'),
    (3, 'Not applicable');

-- Action taken code to name lookup table
CREATE TABLE Action_Taken (
    action_taken INT PRIMARY KEY,
    action_taken_name TEXT
);

-- Insert distinct action taken codes matching to their corresponding action taken names based off the CSV's code explanations for LAR Data
INSERT INTO Action_Taken (action_taken, action_taken_name)
VALUES
    (1, 'Loan originated'),
    (2, 'Application approved but not accepted'),
    (3, 'Application denied by financial institution'),
    (4, 'Application withdrawn by applicant'),
    (5, 'File closed for incompleteness'),
    (6, 'Loan purchased by the institution'),
    (7, 'Preapproval request denied by financial institution'),
    (8, 'Preapproval request approved but not accepted');

-- Co-applicant race name lookup table
CREATE TABLE Co_Applicant_Race_Name (
    co_applicant_race INT PRIMARY KEY,
    co_applicant_race_name TEXT
);

-- Insert distinct co-applicant race codes matching to its corresponding race name based off the CSV's code explanations for LAR Data
INSERT INTO Co_Applicant_Race_Name (co_applicant_race, co_applicant_race_name)
VALUES
    (1, 'American Indian or Alaska Native'),
    (2, 'Asian'),
    (3, 'Black or African American'),
    (4, 'Native Hawaiian or Other Pacific Islander'),
    (5, 'White'),
    (6, 'Information not provided by applicant in mail, Internet, or telephone application'),
    (7, 'Not applicable'),
    (8, 'No co-applicant');

-- Co-applicant ethnicity code to name lookup table
CREATE TABLE Co_Applicant_Ethnicity (
    co_applicant_ethnicity INT PRIMARY KEY,
    co_applicant_ethnicity_name TEXT
);

-- Insert distinct co-applicant ethnicity codes matching to its corresponding ethnicity name based off the CSV's code explanations for LAR Data
INSERT INTO Co_Applicant_Ethnicity (co_applicant_ethnicity, co_applicant_ethnicity_name)
VALUES
    (1, 'Hispanic or Latino'),
    (2, 'Not Hispanic or Latino'),
    (3, 'Information not provided by applicant in mail, Internet, or telephone application'),
    (4, 'Not applicable'),
    (5, 'No co-applicant');

-- Co-applicant sex code to name lookup table
CREATE TABLE Co_Applicant_Sex (
    co_applicant_sex INT PRIMARY KEY,
    co_applicant_sex_name TEXT
);

-- Insert distinct co-applicant sex codes matching to its corresponding sex name based off the CSV's code explanations for LAR Data
INSERT INTO Co_Applicant_Sex (co_applicant_sex, co_applicant_sex_name)
VALUES
    (1, 'Male'),
    (2, 'Female'),
    (3, 'Information not provided by applicant in mail, Internet, or telephone application'),
    (4, 'Not applicable'),
    (5, 'No co-applicant');

-- Applicant race code to name lookup table
CREATE TABLE Applicant_Race_Name (
    applicant_race INT PRIMARY KEY,
    applicant_race_name TEXT
);

-- Insert distinct applicant race codes matching to its corresponding race name based off the CSV's code explanations for LAR Data
INSERT INTO Applicant_Race_Name (applicant_race, applicant_race_name)
VALUES
    (1, 'American Indian or Alaska Native'),
    (2, 'Asian'),
    (3, 'Black or African American'),
    (4, 'Native Hawaiian or Other Pacific Islander'),
    (5, 'White'),
    (6, 'Information not provided by applicant in mail, Internet, or telephone application'),
    (7, 'Not applicable');

-- Applicant sex code to name lookup table
CREATE TABLE Applicant_Sex (
    applicant_sex INT PRIMARY KEY,
    applicant_sex_name TEXT
);

-- Insert distinct applicant sex codes matching to its corresponding sex name based off the CSV's code explanations for LAR Data
INSERT INTO Applicant_Sex (applicant_sex, applicant_sex_name)
VALUES
    (1, 'Male'),
    (2, 'Female'),
    (3, 'Information not provided by applicant in mail, Internet, or telephone application'),
    (4, 'Not applicable');

-- Applicant ethnicity code to name lookup table
CREATE TABLE Applicant_Ethnicity (
    applicant_ethnicity INT PRIMARY KEY,
    applicant_ethnicity_name TEXT
);

-- Insert distinct applicant ethnicity codes matching to its corresponding ethnicity name based off the CSV's code explanations for LAR Data
INSERT INTO Applicant_Ethnicity (applicant_ethnicity, applicant_ethnicity_name)
VALUES
    (1, 'Hispanic or Latino'),
    (2, 'Not Hispanic or Latino'),
    (3, 'Information not provided by applicant in mail, Internet, or telephone application'),
    (4, 'Not applicable');

-- Loan Type code to name lookup table
CREATE TABLE Loan_Type (
    loan_type INT PRIMARY KEY,
    loan_type_name TEXT
);

-- Insert distinct loan type codes matching to its corresponding loan type name based off the CSV's code explanations for LAR Data
INSERT INTO Loan_Type (loan_type, loan_type_name)
VALUES
    (1, 'Conventional'),
    (2, 'FHA-insured'),
    (3, 'VA-guaranteed'),
    (4, 'FSA/RHS-guaranteed');

-- Loan Purpose code to name lookup table
CREATE TABLE Loan_Purpose (
    loan_purpose INT PRIMARY KEY,
    loan_purpose_name TEXT
);

-- Insert distinct loan purpose codes matching to its corresponding loan purpose name based off the CSV's code explanations for LAR Data
INSERT INTO Loan_Purpose (loan_purpose, loan_purpose_name)
VALUES
    (1, 'Home purchase'),
    (2, 'Home improvement'),
    (3, 'Refinancing');

-- Purchaser code to name lookup table
CREATE TABLE Purchaser (
    purchaser_type INT PRIMARY KEY,
    purchaser_type_name TEXT
);

-- Insert distinct purchaser codes matching to its corresponding purchaser name based off the CSV's code explanations for LAR Data
INSERT INTO Purchaser (purchaser_type, purchaser_type_name)
VALUES
    (0, 'Loan was not originated or was not sold in calendar year covered by register'),
    (1, 'Fannie Mae (FNMA)'),
    (2, 'Ginnie Mae (GNMA)'),
    (3, 'Freddie Mac (FHLMC)'),
    (4, 'Farmer Mac (FAMC)'),
    (5, 'Private securitization'),
    (6, 'Commercial bank, savings bank or savings association'),
    (7, 'Life insurance company, credit union, mortgage bank, or finance company'),
    (8, 'Affiliate institution'),
    (9, 'Other type of purchaser');

-- Agency code to abbreviation and namelookup table
CREATE TABLE Agency (
    agency_code INT PRIMARY KEY,
    agency_abbr TEXT,
    agency_name TEXT
);

INSERT INTO Agency (agency_code, agency_abbr, agency_name)
VALUES
    (1, 'OCC', 'Office of the Comptroller of the Currency'),
    (2, 'FRS', 'Federal Reserve System'),
    (3, 'FDIC', 'Federal Deposit Insurance Corporation'),
    (5, 'NCUA', 'National Credit Union Administration'),
    (7, 'HUD', 'Department of Housing and Urban Development'),
    (9, 'CFPB', 'Consumer Financial Protection Bureau');

-- Lien Status code to name lookup table
CREATE TABLE Lien_Status (
    lien_status INT PRIMARY KEY,
    lien_status_name TEXT
);

-- Insert distinct lien status codes matching to its corresponding lien status name based off the CSV's code explanations for LAR Data
INSERT INTO Lien_Status (lien_status, lien_status_name)
VALUES
    (1, 'Secured by a first lien'),
    (2, 'Secured by a subordinate lien'),
    (3, 'Not secured by a lien'),
    (4, 'Not applicable');

-- HOEPA Status code to name lookup table
CREATE TABLE Hoepa_Status (
    hoepa_status INT PRIMARY KEY,
    hoepa_status_name TEXT
);

-- Insert distinct HOEPA status codes matching to its corresponding HOEPA status name based off the CSV's code explanations for LAR Data
INSERT INTO Hoepa_Status (hoepa_status, hoepa_status_name)
VALUES
    (1, 'HOEPA loan'),
    (2, 'Not a HOEPA loan');

-- Denial Reason code to name lookup table
CREATE TABLE Denial_Reason_Name (
    denial_reason INT PRIMARY KEY,
    denial_reason_name TEXT
);

-- Insert distinct denial reason codes matching to its corresponding denial reason name based off the CSV's code explanations for LAR Data
INSERT INTO Denial_Reason_Name (denial_reason, denial_reason_name)
VALUES
    (1, 'Debt-to-income ratio'),
    (2, 'Employment history'),
    (3, 'Credit history'),
    (4, 'Collateral'),
    (5, 'Insufficient cash (downpayment, closing costs)'),
    (6, 'Unverifiable information'),
    (7, 'Credit application incomplete'),
    (8, 'Mortgage insurance denied'),
    (9, 'Other');

-- State code to abbreviation and name lookup table
CREATE TABLE State (
    state_code INT PRIMARY KEY,
    state_abbr TEXT,
    state_name TEXT
);

-- Insert distinct state codes matching to their corresponding state abbreviations and names based off the preliminary's data
INSERT INTO State (state_code, state_abbr, state_name)
SELECT DISTINCT state_code, state_abbr, state_name
FROM preliminary
WHERE state_code IS NOT NULL;

-- County code to name lookup table
CREATE TABLE County (
    county_code INT PRIMARY KEY,
    county_name TEXT
);

-- Insert distinct county codes matching to their corresponding county names based off the preliminary's data
INSERT INTO County (county_code, county_name)
SELECT DISTINCT county_code, county_name
FROM preliminary
WHERE county_code IS NOT NULL;

-- msamd code to name and HUD median family income lookup table
CREATE TABLE msamd (
    msamd INT PRIMARY KEY,
    msamd_name TEXT
);

-- Insert distinct msamd codes matching to their corresponding msamd names and HUD median family incomes based off the preliminary's data
INSERT INTO msamd (msamd, msamd_name)
SELECT DISTINCT msamd, msamd_name
FROM preliminary
WHERE msamd IS NOT NULL;

-- Property type code to name lookup table
CREATE TABLE Property_Type (
    property_type INT PRIMARY KEY,
    property_type_name TEXT
);

-- Insert distinct property type codes matching to their corresponding property type names based off the CSV's code explanations for LAR Data
INSERT INTO Property_Type (property_type, property_type_name)
VALUES
    (1, 'One to four-family (other than manufactured housing)'),
    (2, 'Manufactured housing'),
    (3, 'Multifamily');

-- Owner occupancy code to name lookup table
CREATE TABLE Owner_Occupancy (
    owner_occupancy INT PRIMARY KEY,
    owner_occupancy_name TEXT
);

-- Insert owner occupancy codes matching to their corresponding owner occupancy names based off the CSV's code explanations for LAR Data
INSERT INTO Owner_Occupancy (owner_occupancy, owner_occupancy_name)
VALUES
    (1, 'Owner-occupied as a principal dwelling'),
    (2, 'Not owner-occupied'),
    (3, 'Not applicable');

-- Lender code to name lookup table
CREATE TABLE Lender (
    respondent_id TEXT PRIMARY KEY,
    agency_code INT,
    FOREIGN KEY (agency_code) REFERENCES Agency(agency_code)
);

-- Insert distinct lender IDs based off the preliminary's data
INSERT INTO Lender (respondent_id)
SELECT DISTINCT respondent_id
FROM preliminary
WHERE respondent_id IS NOT NULL;

-- Update Lender table to match agency codes with their respective lenders they regulate based off the preliminary's data
UPDATE Lender
SET agency_code = preliminary.agency_code
FROM preliminary
WHERE Lender.respondent_id = preliminary.respondent_id;

-- Location Parent 
CREATE TABLE Location (
    locationID SERIAL PRIMARY KEY,
    census_tract_number NUMERIC,
    population INT,
    minority_population NUMERIC,
    tract_to_msamd_income NUMERIC,
    number_of_owner_occupied_units INT,
    number_of_1_to_4_family_units INT,
    hud_median_family_income INT,
    msamd INT,
    county_code INT,
    state_code INT,
    FOREIGN KEY (msamd) REFERENCES msamd(msamd),
    FOREIGN KEY (county_code) REFERENCES County(county_code),
    FOREIGN KEY (state_code) REFERENCES State(state_code)
);

-- Application Parent Table

CREATE TABLE Application (
    sequence_number INT PRIMARY KEY,
    as_of_year INT,
    application_date_indicator INT,
    edit_status INT,
    FOREIGN KEY (edit_status) REFERENCES Edit_Status(edit_status),
    preapproval INT,
    FOREIGN KEY (preapproval) REFERENCES Preapproval(preapproval),
    action_taken INT,
    FOREIGN KEY (action_taken) REFERENCES Action_Taken(action_taken),
    purchaser_type INT,
    FOREIGN KEY (purchaser_type) REFERENCES Purchaser(purchaser_type),
    respondent_id TEXT,
    FOREIGN KEY (respondent_id) REFERENCES Lender(respondent_id)
);

-- Co Applicant Parent Table

CREATE TABLE Co_Applicant (
    sequence_number INT,
    co_applicant_ethnicity INT,
    co_applicant_sex INT,
    PRIMARY KEY (sequence_number),
    FOREIGN KEY (sequence_number) REFERENCES Application(sequence_number),
    FOREIGN KEY (co_applicant_ethnicity) REFERENCES Co_Applicant_Ethnicity(co_applicant_ethnicity),
    FOREIGN KEY (co_applicant_sex) REFERENCES Co_Applicant_Sex(co_applicant_sex)
);

-- Applicant Parent Table

CREATE TABLE Applicant (
    sequence_number INT PRIMARY KEY,
    applicant_income_000s INT,
    applicant_sex INT,
    applicant_ethnicity INT,
    FOREIGN KEY (sequence_number) REFERENCES Application(sequence_number),
    FOREIGN KEY (applicant_sex) REFERENCES Applicant_Sex(applicant_sex),
    FOREIGN KEY (applicant_ethnicity) REFERENCES Applicant_Ethnicity(applicant_ethnicity)
);

-- Loan_Terms Parent Table

CREATE TABLE Loan_Terms (
    sequence_number INT PRIMARY KEY,
    loan_amount_000s INT,
    loan_type INT,
    loan_purpose INT,
    FOREIGN KEY (sequence_number) REFERENCES Application(sequence_number),
    FOREIGN KEY (loan_type) REFERENCES Loan_Type(loan_type),
    FOREIGN KEY (loan_purpose) REFERENCES Loan_Purpose(loan_purpose)
);

-- Compliance Parent Table

CREATE TABLE Compliance (
    sequence_number INT PRIMARY KEY,
    rate_spread NUMERIC,
    lien_status INT,
    hoepa_status INT,
    FOREIGN KEY (sequence_number) REFERENCES Application(sequence_number),
    FOREIGN KEY (lien_status) REFERENCES Lien_Status(lien_status),
    FOREIGN KEY (hoepa_status) REFERENCES Hoepa_Status(hoepa_status)
);

-- Property Parent Table

CREATE TABLE Property (
    sequence_number INT PRIMARY KEY,
    property_type INT,
    owner_occupancy INT,
    locationID INT,
    FOREIGN KEY (sequence_number) REFERENCES Application(sequence_number),
    FOREIGN KEY (property_type) REFERENCES Property_Type(property_type),
    FOREIGN KEY (owner_occupancy) REFERENCES Owner_Occupancy(owner_occupancy),
    FOREIGN KEY (locationID) REFERENCES Location(locationID)
);

-- Co_Applicant_Race relationship table
-- A reminder that we condensed race 1 to 5 down into just co_applicant_race.
CREATE TABLE Co_Applicant_Race (
    sequence_number INT,
    co_applicant_race INT,
    co_applicant_race_number INT,
    PRIMARY KEY (sequence_number, co_applicant_race_number),
    FOREIGN KEY (co_applicant_race) REFERENCES Co_Applicant_Race_Name(co_applicant_race),
    FOREIGN KEY (sequence_number) REFERENCES Co_Applicant(sequence_number)
);

-- Applicant_Race relationship table
CREATE TABLE Applicant_Race (
    applicant_race INT,
    sequence_number INT,
    applicant_race_number INT,
    PRIMARY KEY (sequence_number, applicant_race_number),
    FOREIGN KEY (applicant_race) REFERENCES Applicant_Race_Name(applicant_race),
    FOREIGN KEY (sequence_number) REFERENCES Applicant(sequence_number)
);

-- Denial_Reason relationship table
CREATE TABLE Denial_Reason (
    sequence_number INT,
    denial_reason INT,
    denial_reason_number INT,
    PRIMARY KEY (sequence_number, denial_reason_number),
    FOREIGN KEY (sequence_number) REFERENCES Application(sequence_number),
    FOREIGN KEY (denial_reason) REFERENCES Denial_Reason_Name(denial_reason)
);