-- This script will create the lookup tables such that a code will be linked to its corresponding name from the csv.
-- This will fulfill part 2, and follow the ER diagram such that each lookup table looks exactly like the ER diagram.

-- Application Lookup tables

-- Delete every table if it already exists from an earlier run to prevent errors
DROP TABLE IF EXISTS 
    Edit_Status, Preapproval, Action_Taken, Co_Applicant_Race_Name, 
    Co_Applicant_Ethnicity, Co_Applicant_Sex, Applicant_Race_Name, Applicant_Sex, Applicant_Ethnicity, Loan_Type, 
    Loan_Purpose, Purchaser, Agency, Lien_Status, Hoepa_Status, Denial_Reason_Name, State, County, msamd, Property_Type, 
    Owner_Occupancy, Location, Application, Co_Applicant, Applicant, Loan_Terms, Compliance, Property, Co_Applicant_Race,
    Applicant_Race, Denial_Reason
CASCADE;

-- Edit status code to name lookup table, but it will be all NULL like in the original CSV
CREATE TABLE Edit_Status (
    edit_status INT UNIQUE CHECK (edit_status IS NULL),
    edit_status_name TEXT CHECK (edit_status_name IS NULL)
);

-- Insert NULL into edit status code and name as they are all NULL in the original CSV
INSERT INTO Edit_Status (edit_status, edit_status_name)
VALUES
    (NULL, NULL);

-- Preapproval code to name lookup table
CREATE TABLE Preapproval (
    preapproval INT PRIMARY KEY,
    preapproval_name TEXT NOT NULL
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
    action_taken_name TEXT NOT NULL
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
    co_applicant_race_name TEXT NOT NULL
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
    co_applicant_ethnicity_name TEXT NOT NULL
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
    co_applicant_sex_name TEXT NOT NULL
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
    applicant_race_name TEXT NOT NULL
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
    applicant_ethnicity_name TEXT NOT NULL
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
    loan_type_name TEXT NOT NULL
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
    loan_purpose_name TEXT NOT NULL
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
    purchaser_type_name TEXT NOT NULL
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
    agency_abbr TEXT NOT NULL,
    agency_name TEXT NOT NULL
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
    lien_status_name TEXT NOT NULL
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
    hoepa_status_name TEXT NOT NULL
);

-- Insert distinct HOEPA status codes matching to its corresponding HOEPA status name based off the CSV's code explanations for LAR Data
INSERT INTO Hoepa_Status (hoepa_status, hoepa_status_name)
VALUES
    (1, 'HOEPA loan'),
    (2, 'Not a HOEPA loan');

-- Denial Reason code to name lookup table
CREATE TABLE Denial_Reason_Name (
    denial_reason INT PRIMARY KEY,
    denial_reason_name TEXT NOT NULL
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
    state_abbr TEXT NOT NULL,
    state_name TEXT NOT NULL
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
    property_type_name TEXT NOT NULL
);

-- Insert distinct property type codes matching to their corresponding property type names based off the CSV's code explanations for LAR Data
INSERT INTO Property_Type (property_type, property_type_name)
VALUES
    (1, 'One-to-four family dwelling (other than manufactured housing)'),
    (2, 'Manufactured housing'),
    (3, 'Multifamily dwelling');

-- Owner occupancy code to name lookup table
CREATE TABLE Owner_Occupancy (
    owner_occupancy INT PRIMARY KEY,
    owner_occupancy_name TEXT NOT NULL
);

-- Insert owner occupancy codes matching to their corresponding owner occupancy names based off the CSV's code explanations for LAR Data
INSERT INTO Owner_Occupancy (owner_occupancy, owner_occupancy_name)
VALUES
    (1, 'Owner-occupied as a principal dwelling'),
    (2, 'Not owner-occupied as a principal dwelling'),
    (3, 'Not applicable');

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
    state_code INT NOT NULL,
    FOREIGN KEY (msamd) REFERENCES msamd(msamd),
    FOREIGN KEY (county_code) REFERENCES County(county_code),
    FOREIGN KEY (state_code) REFERENCES State(state_code)
);

-- Insert distinct locations based off the preliminary's data
INSERT INTO Location (census_tract_number, population, minority_population, tract_to_msamd_income, number_of_owner_occupied_units, number_of_1_to_4_family_units, hud_median_family_income, msamd, county_code, state_code)
SELECT DISTINCT census_tract_number, population, minority_population, tract_to_msamd_income, number_of_owner_occupied_units, number_of_1_to_4_family_units, hud_median_family_income, msamd, county_code, state_code
FROM preliminary;

-- Application table that holds each mortgage application's information
CREATE TABLE Application (
    sequence_number INT PRIMARY KEY,
    as_of_year INT NOT NULL,
    application_date_indicator INT,
    respondent_id TEXT NOT NULL,
    edit_status INT,
    FOREIGN KEY (edit_status) REFERENCES Edit_Status(edit_status),
    preapproval INT NOT NULL,
    FOREIGN KEY (preapproval) REFERENCES Preapproval(preapproval),
    action_taken INT NOT NULL,
    FOREIGN KEY (action_taken) REFERENCES Action_Taken(action_taken),
    purchaser_type INT,
    FOREIGN KEY (purchaser_type) REFERENCES Purchaser(purchaser_type),
    agency_code INT NOT NULL,
    FOREIGN KEY (agency_code) REFERENCES Agency(agency_code)
);

-- Insert every application from preliminary's data
INSERT INTO Application (sequence_number, as_of_year, application_date_indicator, respondent_id, edit_status, preapproval, action_taken, purchaser_type, agency_code)
SELECT sequence_number, as_of_year, application_date_indicator, respondent_id, edit_status, preapproval, action_taken, purchaser_type, agency_code
FROM preliminary;

-- Co Applicant table that holds every co-applicant's information from the application
CREATE TABLE Co_Applicant (
    sequence_number INT,
    co_applicant_ethnicity INT NOT NULL,
    co_applicant_sex INT NOT NULL,
    PRIMARY KEY (sequence_number),
    FOREIGN KEY (sequence_number) REFERENCES Application(sequence_number),
    FOREIGN KEY (co_applicant_ethnicity) REFERENCES Co_Applicant_Ethnicity(co_applicant_ethnicity),
    FOREIGN KEY (co_applicant_sex) REFERENCES Co_Applicant_Sex(co_applicant_sex)
);

-- Insert every co-applicant from preliminary's data
INSERT INTO Co_Applicant (sequence_number, co_applicant_ethnicity, co_applicant_sex)
SELECT sequence_number, co_applicant_ethnicity, co_applicant_sex
FROM preliminary;


-- Applicant table that holds every applicant's information from the application
CREATE TABLE Applicant (
    sequence_number INT PRIMARY KEY,
    applicant_income_000s INT,
    applicant_sex INT NOT NULL,
    applicant_ethnicity INT NOT NULL,
    FOREIGN KEY (sequence_number) REFERENCES Application(sequence_number),
    FOREIGN KEY (applicant_sex) REFERENCES Applicant_Sex(applicant_sex),
    FOREIGN KEY (applicant_ethnicity) REFERENCES Applicant_Ethnicity(applicant_ethnicity)
);

-- Insert every applicant from preliminary's data
INSERT INTO Applicant (sequence_number, applicant_income_000s, applicant_sex, applicant_ethnicity)
SELECT sequence_number, applicant_income_000s, applicant_sex, applicant_ethnicity
FROM preliminary;

-- Loan_Terms Parent Table
CREATE TABLE Loan_Terms (
    sequence_number INT PRIMARY KEY,
    loan_amount_000s INT,
    loan_type INT NOT NULL,
    loan_purpose INT NOT NULL,
    FOREIGN KEY (sequence_number) REFERENCES Application(sequence_number),
    FOREIGN KEY (loan_type) REFERENCES Loan_Type(loan_type),
    FOREIGN KEY (loan_purpose) REFERENCES Loan_Purpose(loan_purpose)
);

-- Insert every mortgage application's loan terms from preliminary
INSERT INTO Loan_Terms (sequence_number, loan_amount_000s, loan_type, loan_purpose)
SELECT sequence_number, loan_amount_000s, loan_type, loan_purpose
FROM preliminary;

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

-- Insert every mortgage application's compliance details from preliminary
INSERT INTO Compliance (sequence_number, rate_spread, lien_status, hoepa_status)
SELECT sequence_number, rate_spread, lien_status, hoepa_status
FROM preliminary;

-- Property Parent Table
CREATE TABLE Property (
    sequence_number INT PRIMARY KEY,
    property_type INT NOT NULL,
    owner_occupancy INT NOT NULL,
    locationID INT NOT NULL,
    FOREIGN KEY (sequence_number) REFERENCES Application(sequence_number),
    FOREIGN KEY (property_type) REFERENCES Property_Type(property_type),
    FOREIGN KEY (owner_occupancy) REFERENCES Owner_Occupancy(owner_occupancy),
    FOREIGN KEY (locationID) REFERENCES Location(locationID)
);

-- Insert every mortgage application's property details from preliminary, while also matching its new respective locationID based an application's exact location details
-- This query joins the preliminary table with the location table based on a concatenated string of location details to ensure matching of each mortgage application's location details
-- CONCAT() is needed, because our usual INSERT statements will invoke an timeout error with all these attributes
INSERT INTO Property (sequence_number, property_type, owner_occupancy, locationID)
SELECT sequence_number, property_type, owner_occupancy, location.locationID
FROM preliminary
JOIN location ON
CONCAT(
        COALESCE(preliminary.census_tract_number::text, ''), '|',
        COALESCE(preliminary.state_code::text, ''), '|',
        COALESCE(preliminary.county_code::text, ''), '|',
        COALESCE(preliminary.msamd::text, ''), '|',
        COALESCE(preliminary.population::text, ''), '|',
        COALESCE(preliminary.minority_population::text, ''), '|',
        COALESCE(preliminary.tract_to_msamd_income::text, ''), '|',
        COALESCE(preliminary.number_of_owner_occupied_units::text, ''), '|',
        COALESCE(preliminary.number_of_1_to_4_family_units::text, ''), '|',
        COALESCE(preliminary.hud_median_family_income::text, '')
     ) = 
CONCAT(
        COALESCE(location.census_tract_number::text, ''), '|',
        COALESCE(location.state_code::text, ''), '|',
        COALESCE(location.county_code::text, ''), '|',
        COALESCE(location.msamd::text, ''), '|',
        COALESCE(location.population::text, ''), '|',
        COALESCE(location.minority_population::text, ''), '|',
        COALESCE(location.tract_to_msamd_income::text, ''), '|',
        COALESCE(location.number_of_owner_occupied_units::text, ''), '|',
        COALESCE(location.number_of_1_to_4_family_units::text, ''), '|',
        COALESCE(location.hud_median_family_income::text, '')
     );

-- Co_Applicant_Race relationship table
CREATE TABLE Co_Applicant_Race (
    sequence_number INT,
    co_applicant_race INT NOT NULL,
    co_applicant_race_number INT,
    PRIMARY KEY (sequence_number, co_applicant_race_number),
    FOREIGN KEY (co_applicant_race) REFERENCES Co_Applicant_Race_Name(co_applicant_race),
    FOREIGN KEY (sequence_number) REFERENCES Co_Applicant(sequence_number)
);

-- Insert every race each co-applicant has from the preliminary table
INSERT INTO Co_Applicant_Race (sequence_number, co_applicant_race, co_applicant_race_number)
SELECT sequence_number, co_applicant_race_1, 1 FROM preliminary WHERE co_applicant_race_1 IS NOT NULL
UNION ALL
SELECT sequence_number, co_applicant_race_2, 2 FROM preliminary WHERE co_applicant_race_2 IS NOT NULL
UNION ALL
SELECT sequence_number, co_applicant_race_3, 3 FROM preliminary WHERE co_applicant_race_3 IS NOT NULL
UNION ALL
SELECT sequence_number, co_applicant_race_4, 4 FROM preliminary WHERE co_applicant_race_4 IS NOT NULL
UNION ALL
SELECT sequence_number, co_applicant_race_5, 5 FROM preliminary WHERE co_applicant_race_5 IS NOT NULL;

-- Applicant_Race relationship table
CREATE TABLE Applicant_Race (
    applicant_race INT NOT NULL,
    sequence_number INT,
    applicant_race_number INT,
    PRIMARY KEY (sequence_number, applicant_race_number),
    FOREIGN KEY (applicant_race) REFERENCES Applicant_Race_Name(applicant_race),
    FOREIGN KEY (sequence_number) REFERENCES Applicant(sequence_number)
);

-- Insert every race each applicant has from the preliminary table
INSERT INTO Applicant_Race (sequence_number, applicant_race, applicant_race_number)
SELECT sequence_number, applicant_race_1, 1 FROM preliminary WHERE applicant_race_1 IS NOT NULL
UNION ALL
SELECT sequence_number, applicant_race_2, 2 FROM preliminary WHERE applicant_race_2 IS NOT NULL
UNION ALL
SELECT sequence_number, applicant_race_3, 3 FROM preliminary WHERE applicant_race_3 IS NOT NULL
UNION ALL
SELECT sequence_number, applicant_race_4, 4 FROM preliminary WHERE applicant_race_4 IS NOT NULL
UNION ALL
SELECT sequence_number, applicant_race_5, 5 FROM preliminary WHERE applicant_race_5 IS NOT NULL;

-- Denial_Reason relationship table
CREATE TABLE Denial_Reason (
    sequence_number INT,
    denial_reason INT,
    denial_reason_number INT,
    PRIMARY KEY (sequence_number, denial_reason_number),
    FOREIGN KEY (sequence_number) REFERENCES Application(sequence_number),
    FOREIGN KEY (denial_reason) REFERENCES Denial_Reason_Name(denial_reason)
);

-- Insert every denial reason each application has from the preliminary table
INSERT INTO Denial_Reason (sequence_number, denial_reason, denial_reason_number)
SELECT sequence_number, denial_reason_1, 1 FROM preliminary WHERE denial_reason_1 IS NOT NULL
UNION ALL
SELECT sequence_number, denial_reason_2, 2 FROM preliminary WHERE denial_reason_2 IS NOT NULL
UNION ALL
SELECT sequence_number, denial_reason_3, 3 FROM preliminary WHERE denial_reason_3 IS NOT NULL;

-- FIXME: Temp, somethign with no space left on device error?
SET max_parallel_workers_per_gather = 0;

COPY (
-- Let Applicant_Races be an CTE that holds all the race codes an applicant from an application has where each race code is stored in its own column from 1 to 5 like in the original CSV
WITH Applicant_Races AS (
    SELECT Applicant_Race.sequence_number,
    MAX(CASE WHEN Applicant_Race.applicant_race_number = 1 THEN Applicant_race.applicant_race END) AS applicant_race_1,
    MAX(CASE WHEN Applicant_Race.applicant_race_number = 2 THEN Applicant_race.applicant_race END) AS applicant_race_2,
    MAX(CASE WHEN Applicant_Race.applicant_race_number = 3 THEN Applicant_race.applicant_race END) AS applicant_race_3,
    MAX(CASE WHEN Applicant_Race.applicant_race_number = 4 THEN Applicant_race.applicant_race END) AS applicant_race_4,
    MAX(CASE WHEN Applicant_Race.applicant_race_number = 5 THEN Applicant_race.applicant_race END) AS applicant_race_5
    FROM Applicant_Race
    GROUP BY Applicant_Race.sequence_number
),
-- Let Applicant_Race_Names be an CTE that holds all the race names of an applicant from an application has where each race name is matched with its race code and stored in its own column from 1 to 5 like in the original CSV
Applicant_Race_Names AS (
    SELECT Applicant_Race.sequence_number,
    MAX(CASE WHEN Applicant_Race.applicant_race_number = 1 THEN Applicant_Race_Name.applicant_race_name END) AS applicant_race_name_1,
    MAX(CASE WHEN Applicant_Race.applicant_race_number = 2 THEN Applicant_Race_Name.applicant_race_name END) AS applicant_race_name_2,
    MAX(CASE WHEN Applicant_Race.applicant_race_number = 3 THEN Applicant_Race_Name.applicant_race_name END) AS applicant_race_name_3,
    MAX(CASE WHEN Applicant_Race.applicant_race_number = 4 THEN Applicant_Race_Name.applicant_race_name END) AS applicant_race_name_4,
    MAX(CASE WHEN Applicant_Race.applicant_race_number = 5 THEN Applicant_Race_Name.applicant_race_name END) AS applicant_race_name_5
    FROM Applicant_Race LEFT JOIN Applicant_Race_Name ON Applicant_Race.applicant_race = Applicant_Race_Name.applicant_race
    GROUP BY Applicant_Race.sequence_number
),
-- Let Co_Applicant_Races be an CTE that holds all the race codes a co-applicant from an application has where each race code is stored in its own column from 1 to 5 like in the original CSV
Co_Applicant_Races AS (
    SELECT Co_Applicant_Race.sequence_number,
    MAX(CASE WHEN Co_Applicant_Race.co_applicant_race_number = 1 THEN Co_Applicant_Race.co_applicant_race END) AS co_applicant_race_1,
    MAX(CASE WHEN Co_Applicant_Race.co_applicant_race_number = 2 THEN Co_Applicant_Race.co_applicant_race END) AS co_applicant_race_2,
    MAX(CASE WHEN Co_Applicant_Race.co_applicant_race_number = 3 THEN Co_Applicant_Race.co_applicant_race END) AS co_applicant_race_3,
    MAX(CASE WHEN Co_Applicant_Race.co_applicant_race_number = 4 THEN Co_Applicant_Race.co_applicant_race END) AS co_applicant_race_4,
    MAX(CASE WHEN Co_Applicant_Race.co_applicant_race_number = 5 THEN Co_Applicant_Race.co_applicant_race END) AS co_applicant_race_5
    FROM Co_Applicant_Race
    GROUP BY Co_Applicant_Race.sequence_number
),
-- Let Co_Applicant_Race_Names be an CTE that holds all the race names of a co-applicant from an application has where each race name is matched with its race code and stored in its own column from 1 to 5 like in the original CSV
Co_Applicant_Race_Names AS (
    SELECT Co_Applicant_Race.sequence_number,
    MAX(CASE WHEN Co_Applicant_Race.co_applicant_race_number = 1 THEN Co_Applicant_Race_Name.co_applicant_race_name END) AS co_applicant_race_name_1,
    MAX(CASE WHEN Co_Applicant_Race.co_applicant_race_number = 2 THEN Co_Applicant_Race_Name.co_applicant_race_name END) AS co_applicant_race_name_2,
    MAX(CASE WHEN Co_Applicant_Race.co_applicant_race_number = 3 THEN Co_Applicant_Race_Name.co_applicant_race_name END) AS co_applicant_race_name_3,
    MAX(CASE WHEN Co_Applicant_Race.co_applicant_race_number = 4 THEN Co_Applicant_Race_Name.co_applicant_race_name END) AS co_applicant_race_name_4,
    MAX(CASE WHEN Co_Applicant_Race.co_applicant_race_number = 5 THEN Co_Applicant_Race_Name.co_applicant_race_name END) AS co_applicant_race_name_5
    FROM Co_Applicant_Race LEFT JOIN Co_Applicant_Race_Name ON Co_Applicant_Race.co_applicant_race = Co_Applicant_Race_Name.co_applicant_race
    GROUP BY Co_Applicant_Race.sequence_number
),
Denial_Reasons AS (
    SELECT Denial_Reason.sequence_number,
    MAX(CASE WHEN Denial_Reason.denial_reason_number = 1 THEN Denial_Reason.denial_reason END) AS denial_reason_1,
    MAX(CASE WHEN Denial_Reason.denial_reason_number = 2 THEN Denial_Reason.denial_reason END) AS denial_reason_2,
    MAX(CASE WHEN Denial_Reason.denial_reason_number = 3 THEN Denial_Reason.denial_reason END) AS denial_reason_3
    FROM Denial_Reason
    GROUP BY Denial_Reason.sequence_number
),
Denial_Reason_Names AS (
    SELECT Denial_Reason.sequence_number,
    MAX(CASE WHEN Denial_Reason.denial_reason_number = 1 THEN Denial_Reason_Name.denial_reason_name END) AS denial_reason_name_1,
    MAX(CASE WHEN Denial_Reason.denial_reason_number = 2 THEN Denial_Reason_Name.denial_reason_name END) AS denial_reason_name_2,
    MAX(CASE WHEN Denial_Reason.denial_reason_number = 3 THEN Denial_Reason_Name.denial_reason_name END) AS denial_reason_name_3
    FROM Denial_Reason LEFT JOIN Denial_Reason_Name ON Denial_Reason.denial_reason = Denial_Reason_Name.denial_reason
    GROUP BY Denial_Reason.sequence_number
)

SELECT
    COALESCE(Application.as_of_year::TEXT, '') AS as_of_year,
    COALESCE(Application.respondent_id::TEXT, '') AS respondent_id,
    COALESCE(Agency.agency_name::TEXT, '') AS agency_name,
    COALESCE(Agency.agency_abbr::TEXT, '') AS agency_abbr,
    COALESCE(Application.agency_code::TEXT, '') AS agency_code,
    COALESCE(Loan_Type.loan_type_name::TEXT, '') AS loan_type_name,
    COALESCE(Loan_Terms.loan_type::TEXT, '') AS loan_type,
    COALESCE(Property_Type.property_type_name::TEXT, '') AS property_type_name,
    COALESCE(Property.property_type::TEXT, '') AS property_type,
    COALESCE(Loan_Purpose.loan_purpose_name::TEXT, '') AS loan_purpose_name,
    COALESCE(Loan_Terms.loan_purpose::TEXT, '') AS loan_purpose,
    COALESCE(Owner_Occupancy.owner_occupancy_name::TEXT, '') AS owner_occupancy_name,
    COALESCE(Property.owner_occupancy::TEXT, '') AS owner_occupancy,
    COALESCE(Loan_Terms.loan_amount_000s::TEXT, '') AS loan_amount_000s,
    COALESCE(Preapproval.preapproval_name::TEXT, '') AS preapproval_name,
    COALESCE(Application.preapproval::TEXT, '') AS preapproval,
    COALESCE(Action_taken.action_taken_name::TEXT, '') AS action_taken_name,
    COALESCE(Application.action_taken::TEXT, '') AS action_taken,
    COALESCE(msamd.msamd_name::TEXT, '') AS msamd_name,
    COALESCE(Location.msamd::TEXT, '') AS msamd,
    COALESCE(State.state_name::TEXT, '') AS state_name,
    COALESCE(State.state_abbr::TEXT, '') AS state_abbr,
    COALESCE(State.state_code::TEXT, '') AS state_code,
    COALESCE(County.county_name::TEXT, '') AS county_name,
    COALESCE(Location.county_code::TEXT, '') AS county_code,
    -- Include leading zeros in the census tract number as shown in the CSV file
    COALESCE(LPAD(CAST(Location.census_tract_number AS TEXT), 7, '0'), '') AS census_tract_number,
    COALESCE(Applicant_Ethnicity.applicant_ethnicity_name::TEXT, '') AS applicant_ethnicity_name,
    COALESCE(Applicant.applicant_ethnicity::TEXT, '') AS applicant_ethnicity,
    COALESCE(Co_Applicant_Ethnicity.co_applicant_ethnicity_name::TEXT, '') AS co_applicant_ethnicity_name,
    COALESCE(Co_Applicant.co_applicant_ethnicity::TEXT, '') AS co_applicant_ethnicity,
    COALESCE(Applicant_Race_Names.applicant_race_name_1::TEXT, '') AS applicant_race_name_1,
    COALESCE(Applicant_Races.applicant_race_1::TEXT, '') AS applicant_race_1,
    COALESCE(Applicant_Race_Names.applicant_race_name_2::TEXT, '') AS applicant_race_name_2,
    COALESCE(Applicant_Races.applicant_race_2::TEXT, '') AS applicant_race_2,
    COALESCE(Applicant_Race_Names.applicant_race_name_3::TEXT, '') AS applicant_race_name_3,
    COALESCE(Applicant_Races.applicant_race_3::TEXT, '') AS applicant_race_3,
    COALESCE(Applicant_Race_Names.applicant_race_name_4::TEXT, '') AS applicant_race_name_4,
    COALESCE(Applicant_Races.applicant_race_4::TEXT, '') AS applicant_race_4,
    COALESCE(Applicant_Race_Names.applicant_race_name_5::TEXT, '') AS applicant_race_name_5,
    COALESCE(Applicant_Races.applicant_race_5::TEXT, '') AS applicant_race_5,
    COALESCE(Co_Applicant_Race_Names.co_applicant_race_name_1::TEXT, '') AS co_applicant_race_name_1,
    COALESCE(Co_Applicant_Races.co_applicant_race_1::TEXT, '') AS co_applicant_race_1,
    COALESCE(Co_Applicant_Race_Names.co_applicant_race_name_2::TEXT, '') AS co_applicant_race_name_2,
    COALESCE(Co_Applicant_Races.co_applicant_race_2::TEXT, '') AS co_applicant_race_2,
    COALESCE(Co_Applicant_Race_Names.co_applicant_race_name_3::TEXT, '') AS co_applicant_race_name_3,
    COALESCE(Co_Applicant_Races.co_applicant_race_3::TEXT, '') AS co_applicant_race_3,
    COALESCE(Co_Applicant_Race_Names.co_applicant_race_name_4::TEXT, '') AS co_applicant_race_name_4,
    COALESCE(Co_Applicant_Races.co_applicant_race_4::TEXT, '') AS co_applicant_race_4,
    COALESCE(Co_Applicant_Race_Names.co_applicant_race_name_5::TEXT, '') AS co_applicant_race_name_5,
    COALESCE(Co_Applicant_Races.co_applicant_race_5::TEXT, '') AS co_applicant_race_5,
    COALESCE(Applicant_Sex.applicant_sex_name::TEXT, '') AS applicant_sex_name,
    COALESCE(Applicant.applicant_sex::TEXT, '') AS applicant_sex,
    COALESCE(Co_Applicant_Sex.co_applicant_sex_name::TEXT, '') AS co_applicant_sex_name,
    COALESCE(Co_Applicant.co_applicant_sex::TEXT, '') AS co_applicant_sex,
    COALESCE(Applicant.applicant_income_000s::TEXT, '') AS applicant_income_000s,
    COALESCE(Purchaser.purchaser_type_name::TEXT, '') AS purchaser_type_name,
    COALESCE(Application.purchaser_type::TEXT, '') AS purchaser_type,
    COALESCE(Denial_Reason_Names.denial_reason_name_1::TEXT, '') AS denial_reason_name_1,
    COALESCE(Denial_Reasons.denial_reason_1::TEXT, '') AS denial_reason_1,
    COALESCE(Denial_Reason_Names.denial_reason_name_2::TEXT, '') AS denial_reason_name_2,
    COALESCE(Denial_Reasons.denial_reason_2::TEXT, '') AS denial_reason_2,
    COALESCE(Denial_Reason_Names.denial_reason_name_3::TEXT, '') AS denial_reason_name_3,
    COALESCE(Denial_Reasons.denial_reason_3::TEXT, '') AS denial_reason_3,
    -- Include leading zeros in the rate spread as shown in the CSV file
    COALESCE(LPAD(CAST(Compliance.rate_spread AS TEXT), 5, '0'), '') AS rate_spread,
    COALESCE(Hoepa_Status.hoepa_status_name::TEXT, '') AS hoepa_status_name,
    COALESCE(Compliance.hoepa_status::TEXT, '') AS hoepa_status,
    COALESCE(Lien_Status.lien_status_name::TEXT, '') AS lien_status_name,
    COALESCE(Compliance.lien_status::TEXT, '') AS lien_status,
    COALESCE(Edit_Status.edit_status_name::TEXT, '') AS edit_status_name,
    COALESCE(Application.edit_status::TEXT, '') AS edit_status,
    
    
    -- FIXME: Ask the professor if we can keep the actual sequence_numbers or make the whole column NULL
    COALESCE(NULL::TEXT, '') AS sequence_number,

    COALESCE(Location.population::TEXT, '') AS population,
    COALESCE(Location.minority_population::TEXT, '') AS minority_population,
    COALESCE(Location.hud_median_family_income::TEXT, '') AS hud_median_family_income,
    COALESCE(Location.tract_to_msamd_income::TEXT, '') AS tract_to_msamd_income,
    COALESCE(Location.number_of_owner_occupied_units::TEXT, '') AS number_of_owner_occupied_units,
    COALESCE(Location.number_of_1_to_4_family_units::TEXT, '') AS number_of_1_to_4_family_units,
    COALESCE(Application.application_date_indicator::TEXT, '') AS application_date_indicator


FROM Application
-- Join the Agency table with the Application table to match applications with their agencies names,  
JOIN Agency ON Agency.agency_code = Application.agency_code

-- Join the Loan_Terms table with the Application table to match applications with their loan terms
JOIN Loan_Terms ON Loan_Terms.sequence_number = Application.sequence_number 
-- Join the Loan_Type table with the Loan_Terms table to match loan type codes with their names
JOIN Loan_Type ON Loan_Type.loan_type = Loan_Terms.loan_type
-- Join the Loan_Purpose table with the Loan_Terms table to match loan purpose codes with their names
JOIN Loan_Purpose ON Loan_Purpose.loan_purpose = Loan_Terms.loan_purpose

-- Join the Property table with the Application table to match applications with their properties
JOIN Property ON Property.sequence_number = Application.sequence_number
-- Join the Property_Type table with the Property table to match property type codes with their names
JOIN Property_Type ON Property_Type.property_type = Property.property_type
-- Join the Owner_Occupancy table with the Property table to match owner occupancy codes with their names
JOIN Owner_Occupancy ON Owner_Occupancy.owner_occupancy = Property.owner_occupancy

-- Join the preapproval table with the application table to match applications' preapproval codes with their names
JOIN Preapproval ON Preapproval.preapproval = Application.preapproval

-- Join the Action_Taken table with the Application table to match applications' action taken codes with their names
JOIN Action_Taken ON Action_Taken.action_taken = Application.action_taken

-- Join the location table with the property table to match a mortgage application's property location, keeping NULL values, with its:
    -- msamd
    -- State name and abbreviation
    -- County name
    -- Population statistics
LEFT JOIN Location ON Location.locationID = Property.LocationID

-- Join the msamd table with the location table to match a mortgage application's property location with its msamd's name
LEFT JOIN msamd ON msamd.msamd = Location.msamd

-- Join the state table with the location table to match a mortgage application's property location with its state's name and abbreviation
JOIN State ON State.state_code = Location.state_code

-- Join the county table with the location table to match a mortgage application's property location with its county's name while keeping NULL values
LEFT JOIN County ON County.county_code = Location.county_code

-- Join the Applicant table with the Application table to match applications with their applicants
JOIN Applicant ON Applicant.sequence_number = Application.sequence_number

-- Join the Applicant_Ethnicity table with the Applicant table to match applicants' ethnicity codes with their names
JOIN Applicant_Ethnicity ON Applicant_Ethnicity.applicant_ethnicity = Applicant.applicant_ethnicity

-- Join the Co_Applicant table with the Application table to match applications with their co-applicants
JOIN Co_Applicant ON Co_Applicant.sequence_number = Application.sequence_number

-- Join the Co_Applicant_Ethnicity table with the Co_Applicant table to match co-applicants' ethnicity codes with their names
JOIN Co_Applicant_Ethnicity ON   Co_Applicant_Ethnicity.co_applicant_ethnicity = Co_Applicant.co_applicant_ethnicity

-- Join the Applicant_Races table with the Applicant table to match applicants with their races while keeping NULL values
LEFT JOIN Applicant_Races ON Applicant_Races.sequence_number = Applicant.sequence_number

-- Join the Applicant_Race_Names table with the Applicant_Races table to match applicants' race codes with their names while keeping NULL values
LEFT JOIN Applicant_Race_Names ON Applicant_Race_Names.sequence_number = Applicant_Races.sequence_number

-- Join the Co_Applicant_Races table with the Co_Applicant table to match co-applicants with their races while keeping NULL values
LEFT JOIN Co_Applicant_Races ON Co_Applicant_Races.sequence_number = Co_Applicant.sequence_number

-- Join the Co_Applicant_Race_Names table with the Co_Applicant_Races table to match co-applicants' race codes with their names while keeping NULL values
LEFT JOIN Co_Applicant_Race_Names ON Co_Applicant_Race_Names.sequence_number = Co_Applicant_Races.sequence_number

-- Join the Applicant_Sex table with the Applicant table to match applicants' sex codes with their names
JOIN Applicant_Sex ON Applicant_Sex.applicant_sex = Applicant.applicant_sex

-- Join the Co_Applicant_Sex table with the Co_Applicant table to match co-applicants' sex codes with their names
JOIN Co_Applicant_Sex ON Co_Applicant_Sex.co_applicant_sex = Co_Applicant.co_applicant_sex

-- Join the Purchaser table with the Application table to match applications' purchaser codes with their names
JOIN Purchaser ON Purchaser.purchaser_type = Application.purchaser_type

-- Join the Denial_Reasons table with the Application table to match applications with their denial reasons while keeping NULL values
LEFT JOIN Denial_Reasons ON Denial_Reasons.sequence_number = Application.sequence_number

-- Join the Denial_Reason_Names table with the Denial_Reasons table to match denial reason codes with their names while keeping NULL values
LEFT JOIN Denial_Reason_Names ON Denial_Reason_Names.sequence_number = Denial_Reasons.sequence_number

-- Join the Compliance table with the Application table to match applications with their compliance records while keeping NULL values
LEFT JOIN Compliance ON Compliance.sequence_number = Application.sequence_number

-- Join the Hoepa_Status table with the Compliance table to match compliance records' HOEPA status codes with their names
JOIN Hoepa_Status ON Hoepa_Status.hoepa_status = Compliance.hoepa_status

-- Join the Lien_Status table with the Compliance table to match compliance records' lien status codes with their names
JOIN Lien_Status ON Lien_Status.lien_status = Compliance.lien_status

-- Join the Edit_Status table with the Application table to match applications' edit status codes with their names while keeping NULL values
LEFT JOIN Edit_Status ON Edit_Status.edit_status = Application.edit_status


ORDER BY Application.sequence_number
) TO STDOUT WITH (
    FORMAT csv,
    HEADER,
    FORCE_QUOTE *
)
\g part2.csv