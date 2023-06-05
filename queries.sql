SELECT SpeciesName, AVG(FlipperLength) AS FlipperLength
FROM Samples
JOIN Species ON Samples.SpeciesID = Species.SpeciesID
GROUP BY SpeciesName;