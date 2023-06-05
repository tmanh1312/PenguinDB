#Jennifer Oh

import sqlite3
import matplotlib.pyplot as plt

conn = sqlite3.connect('penguin.sqlite')
cursor = conn.cursor()

cursor.execute('SELECT sex, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Samples) AS percentage FROM Samples GROUP BY sex')

data = cursor.fetchall()

sex = [row[0] for row in data]
percentage = [row[1] for row in data]

plt.bar(sex, percentage)
plt.xlabel('Sex')
plt.ylabel('Percentage')
plt.title('Penguin Sex Percentage')

plt.show()

conn.close()