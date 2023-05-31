-- Split the "Stage" column
CREATE TABLE new_penguin_data_backup (
    id INTEGER PRIMARY KEY,
    SampleNumber INTEGER,
    IndividualID TEXT,
    StudyName TEXT,
    Species TEXT,
    Region TEXT,
    Island TEXT,
    Age TEXT,
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

INSERT INTO new_penguin_data_backup
SELECT
    id,
    SampleNumber,
    IndividualID,
    StudyName,
    Species,
    Region,
    Island,
    TRIM(SUBSTR(Stage, 1, INSTR(Stage, ',') - 1)) AS Age,
    TRIM(SUBSTR(Stage, INSTR(Stage, ',') + 1)) AS Stage,
    ClutchCompletion,
    DateEgg,
    CulmenLength,
    CulmenDepth,
    FlipperLength,
    BodyMass,
    Sex,
    Delta15N,
    Delta13C,
    Comments
FROM new_penguin_data;

DROP TABLE new_penguin_data;

ALTER TABLE new_penguin_data_backup
RENAME TO new_penguin_data;
