CREATE TABLE IF NOT EXISTS new_penguin_data (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    SampleNumber INTEGER,
    IndividualID TEXT,
    StudyName TEXT,
    Species TEXT,
    Region TEXT,
    Island TEXT,
    Stage TEXT,
    ClutchCompletion TEXT,
    DateEgg TEXT,
    CulmenLength REAL,
    CulmenDepth REAL,
    FlipperLength REAL,
    BodyMass INTEGER,
    Sex TEXT,
    Delta15N REAL,
    Delta13C REAL,
    Comments TEXT
);

INSERT INTO new_penguin_data (SampleNumber, IndividualID, StudyName, Species, Region, Island, Stage, ClutchCompletion, DateEgg, CulmenLength, CulmenDepth, FlipperLength, BodyMass, Sex, Delta15N, Delta13C, Comments)
SELECT
    "Sample Number",
    "Individual ID",
    StudyName,
    Species,
    Region,
    Island,
    Stage,
    "Clutch Completion",
    "Date Egg",
    "Culmen Length (mm)",
    "Culmen Depth (mm)",
    "Flipper Length (mm)",
    "Body Mass (g)",
    Sex,
    "Delta 15 N (o/oo)",
    "Delta 13 C (o/oo)",
    Comments
FROM imported_penguin_data;
