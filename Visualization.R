# Mia Truonng
# Bar chart to show the average body mass of samples for each species
# Load required libraries
library(RSQLite)
library(ggplot2)

# Set working directory to the right folder

# Create a connection to the SQLite database
conn <- dbConnect(RSQLite::SQLite(), dbname = "penguin.sqlite")

# Query the database to retrieve the average body mass for each species
query <- "SELECT SpeciesName, AVG(BodyMass) AS AvgBodyMass
          FROM Samples
          JOIN Species ON Samples.SpeciesID = Species.SpeciesID
          GROUP BY SpeciesName"
result <- dbGetQuery(conn, query)

# Close the database connection
dbDisconnect(conn)

# Create a bar chart of the average body mass by species
print(ggplot(result, aes(x = SpeciesName, y = AvgBodyMass)) +
        geom_bar(stat = "identity", fill = "pink") +
        labs(title = "Average Body Mass by Species",
             x = "Species",
             y = "Average Body Mass") +
        theme_minimal() +
        theme(plot.title = element_text(size = 16, face = "bold", color = "black", hjust = 0.5),  # Center-align the title
              axis.text.x = element_text(angle = 45, hjust = 1, color = "black"),
              axis.text.y = element_text(color = "black", margin = margin(r = 0.5)),  # Set margin for y-axis labels
              axis.title = element_text(size = 12, color = "black"),
              panel.grid.major = element_blank(),
              panel.grid.minor = element_blank(),
              panel.background = element_rect(fill = "beige"),
              axis.line = element_line(color = "black", size = 0.5),
              axis.ticks = element_line(color = "black", size = 0.5),
              axis.ticks.length = unit(0.2, "cm")  # Specify the length of the tick marks
        )
)