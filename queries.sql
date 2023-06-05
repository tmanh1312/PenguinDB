#Average FlipperLength of Samples for each species

SELECT SpeciesName, AVG(FlipperLength) AS FlipperLength
FROM Samples
JOIN Species ON Samples.SpeciesID = Species.SpeciesID
GROUP BY SpeciesName;

#Calculate the percentage of penguins for each sex:

SELECT sex, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Samples) AS percentage
FROM Samples
GROUP BY sex;

-- hi