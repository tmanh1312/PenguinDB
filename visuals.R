# Khaliun Tumenbayar
# Bar chart to show the Maximum Culmen Depth and Length by Sex

library(RSQLite)
library(ggplot2)

# Create a connection to the SQLite database
conn <- dbConnect(RSQLite::SQLite(), dbname = "penguin.sqlite")

# Query the database to retrieve the maximum culmen length and depth for each sex
query <- "SELECT Sex, MAX(CulmenLength) AS MaxCulmenLength, MAX(CulmenDepth) AS MaxCulmenDepth FROM Samples GROUP BY Sex"
result <- dbGetQuery(conn, query)

# Close the database connection
dbDisconnect(conn)

# Create a bar chart of the maximum culmen length by sex
ggplot(result, aes(x = Sex, y = MaxCulmenLength, fill = Sex)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  geom_text(aes(label = MaxCulmenLength), vjust = -0.5, color = "black") +
  labs(title = "Maximum Culmen Length by Sex",
       x = "Sex",
       y = "Culmen Length") +
  theme_minimal()

# Create a bar chart of the maximum culmen depth by sex
ggplot(result, aes(x = Sex, y = MaxCulmenDepth, fill = Sex)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  geom_text(aes(label = MaxCulmenDepth), vjust = -0.5, color = "black") +
  labs(title = "Maximum Culmen Depth by Sex",
       x = "Sex",
       y = "Culmen Depth") +
  theme_minimal()
