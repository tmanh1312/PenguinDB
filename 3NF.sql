-- Create the Samples table
CREATE TABLE Samples (
    StudyID INTEGER,
    SampleID INTEGER,
    LocationID INTEGER,
    IndividualID TEXT,
    CulmenLength REAL,
    CulmenDepth REAL,
    FlipperLength REAL,
    BodyMass INTEGER,
    Sex TEXT,
    Delta15N REAL,
    Delta13C REAL,
    ClutchCompletion TEXT,
    DateEgg TEXT,
    Comments TEXT,
    SpeciesID INTEGER,
    StageID INTEGER,
    PRIMARY KEY (SampleID, IndividualID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID),
    FOREIGN KEY (SampleID) REFERENCES SampleNumbers(SampleID),
    FOREIGN KEY (StudyID) REFERENCES StudyNames(StudyID),
    FOREIGN KEY (SpeciesID) REFERENCES Species(SpeciesID),
    FOREIGN KEY (StageID) REFERENCES Stages(StageID)
);

-- Create the StudyNames table
CREATE TABLE StudyNames (
    StudyID INTEGER PRIMARY KEY,
    StudyName TEXT
);

-- Create the SampleNumbers table
CREATE TABLE SampleNumbers (
    SampleID INTEGER PRIMARY KEY,
    SampleNumber INTEGER
);

-- Create the Species table
CREATE TABLE Species (
    SpeciesID INTEGER PRIMARY KEY,
    SpeciesName TEXT
);

-- Create the Locations table
CREATE TABLE Locations (
    LocationID INTEGER PRIMARY KEY,
    Region TEXT,
    Island TEXT
);

-- Create the Stages table
CREATE TABLE Stages (
    StageID INTEGER PRIMARY KEY,
    Age TEXT,
    StageName TEXT
);

-- Insert data into the StudyNames table
INSERT INTO StudyNames (StudyName)
SELECT DISTINCT StudyName FROM new_penguin_data;

-- Insert data into the SampleNumbers table
INSERT INTO SampleNumbers (SampleNumber)
SELECT DISTINCT SampleNumber FROM new_penguin_data;

-- Insert data into the Species table
INSERT INTO Species (SpeciesName)
SELECT DISTINCT Species FROM new_penguin_data;

-- Insert data into the Locations table
INSERT INTO Locations (Region, Island)
SELECT DISTINCT Region, Island FROM new_penguin_data;

-- Insert data into the Stages table
INSERT INTO Stages (Age, StageName)
SELECT DISTINCT Age, Stage FROM new_penguin_data;

-- Insert data into the Samples table
INSERT INTO Samples (
    StudyID,
    SampleID,
    LocationID,
    IndividualID,
    CulmenLength,
    CulmenDepth,
    FlipperLength,
    BodyMass,
    Sex,
    Delta15N,
    Delta13C,
    ClutchCompletion,
    DateEgg,
    Comments,
    SpeciesID,
    StageID
)
SELECT
    sti.StudyID,
    si.SampleID,
    l.LocationID,
    nd.IndividualID,
    nd.CulmenLength,
    nd.CulmenDepth,
    nd.FlipperLength,
    nd.BodyMass,
    nd.Sex,
    nd.Delta15N,
    nd.Delta13C,
    nd.ClutchCompletion,
    nd.DateEgg,
    nd.Comments,
    s.SpeciesID,
    st.StageID
FROM new_penguin_data AS nd
JOIN StudyNames AS sti ON sti.StudyName = nd.StudyName
JOIN SampleNumbers AS si ON si.SampleNumber = nd.SampleNumber
JOIN Locations AS l ON l.Region = nd.Region AND l.Island = nd.Island
JOIN Species AS s ON s.SpeciesName = nd.Species
JOIN Stages AS st ON st.Age = nd.Age AND st.StageName = nd.Stage;

DROP TABLE imported_penguin_data;
DROP TABLE new_penguin_data;
