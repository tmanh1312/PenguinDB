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
