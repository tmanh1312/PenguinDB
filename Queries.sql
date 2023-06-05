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


-- Gloria Hu
-- 3. To query the number of samples for each species, the number of samples should be greater than 50 and sorted in descending order:：
SELECT Species.SpeciesName, COUNT(*) AS SampleCount
FROM Samples
JOIN Species ON Samples.SpeciesID = Species.SpeciesID
GROUP BY Species.SpeciesName
having COUNT(*)>50
ORDER by SampleCount desc;

-- 4. Query minimum, maximum and mean N isotope ratios (Delta15N) for each Island 
SELECT Locations.Island, ROUND(MIN(Samples.Delta15N),2) AS MinDelta15N, ROUND(MAX(Samples.Delta15N),2) AS MaxDelta15N, ROUND(AVG(Samples.Delta15N),2) AS AvgDelta15N
FROM Samples
JOIN Locations ON Samples.LocationID = Locations.LocationID
where Delta15N<>'NA'
GROUP BY Locations.Island;