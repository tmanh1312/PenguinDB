-- Mia Truong
-- 1. Retrieve the average body mass of samples for each species
SELECT SpeciesName, AVG(BodyMass) AS AverageBodyMass
FROM Samples
JOIN Species ON Samples.SpeciesID = Species.SpeciesID
GROUP BY SpeciesName;

-- 2. Retrieve the average culmen length and culmen depth for each species separately
SELECT SpeciesName, AVG(CulmenLength) AS AvgCulmenLength, AVG(CulmenDepth) AS AvgCulmenDepth
FROM Samples
JOIN Species ON Samples.SpeciesID = Species.SpeciesID
GROUP BY SpeciesName;
