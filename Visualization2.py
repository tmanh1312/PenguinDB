# Gloria Hu

import sqlite3
import matplotlib.pyplot as plt

conn = sqlite3.connect('penguin.sqlite')

cursor = conn.cursor()

query = """
SELECT Species.SpeciesName, COUNT(*) AS SampleCount
FROM Samples
JOIN Species ON Samples.SpeciesID = Species.SpeciesID
GROUP BY Species.SpeciesName
HAVING COUNT(*) > 50
ORDER BY SampleCount DESC
"""

cursor.execute(query)

results = cursor.fetchall()

species = []
sample_counts = []
for row in results:
    species.append(row[0])
    sample_counts.append(row[1])

cursor.close()
conn.close()

plt.bar(species, sample_counts)
plt.xlabel('Species')
plt.ylabel('Sample Count')
plt.title('Sample Count by Species')
plt.xticks(rotation=45)

plt.show()
