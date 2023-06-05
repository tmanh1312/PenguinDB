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

-- Jennifer
-- 5. Average FlipperLength of Samples for each species

SELECT SpeciesName, AVG(FlipperLength) AS FlipperLength
FROM Samples
JOIN Species ON Samples.SpeciesID = Species.SpeciesID
GROUP BY SpeciesName;

-- 6. Calculate the percentage of penguins for each sex:
SELECT sex, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Samples) AS percentage
FROM Samples
GROUP BY sex;

-- Khaliun Tumenbayar
-- 7. What is the average body mass of the most penguin populated Location?
SELECT l.Region, l.Island, AVG(s.BodyMass) AS AvgBodyMass
FROM Samples AS s
JOIN Locations AS l ON s.LocationID = l.LocationID
GROUP BY l.Region, l.Island
HAVING COUNT(*) = (
    SELECT COUNT(*) AS PenguinCount
    FROM Samples
    GROUP BY LocationID
    ORDER BY COUNT(LocationID) DESC
    LIMIT 1
);

-- Result: Anvers|Biscoe|4687.94642857143

-- 8. What is the average Culmen length and depth for each penguin sex?
SELECT Sex, MAX(CulmenLength) AS MaxCulmenLength, MAX(CulmenDepth) AS MaxCulmenDepth
FROM Samples
GROUP BY Sex;

-- Result: FEMALE Penguin: Max Culmen Length: 58.0 | Max Culmen Depth: 20.7
-- Result: MALE Penguin: Max Culmen Length: 59.6 | Max Culmen Depth: 21.5
