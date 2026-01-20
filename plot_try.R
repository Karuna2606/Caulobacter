# Load necessary libraries
library(readxl)
library(ggplot2)

# Load the merged Excel file
data <- read_excel("C:\\Users\\kanua\\Desktop\\Project iit\\Translation_Merged_With_TE_Data_Final.xlsx")

# Keep only Stage1 and TE_5, removing rows with NA
plot_data <- na.omit(data[, c("Stage1", "TE_5")])

# Sort by Stage1 for proper line plotting
plot_data <- plot_data[order(plot_data$Stage1), ]

# Create line plot
ggplot(plot_data, aes(x = Stage1, y = TE_5)) +
  geom_line(color = "blue") +
  labs(
    title = "Stage 1 Translational Rate vs TE at 5 mins",
    x = "Average Translational Rate (Stage 1)",
    y = "TE at 5 mins"
  ) +
  theme_minimal()

