library(ggplot2)
library(dplyr)
library(readr)
library(patchwork)

# Read the CSV file
df <- read_csv("C:\\Users\\kanua\\Desktop\\Project iit\\Grouped_GM_TR_Output_5.csv")


# Define threshold
threshold <- 1.02

# Prepare filtered plots
p1 <- df %>% filter(GM_TR_1 > threshold) %>%
  ggplot(aes(x = GM_TR_1, y = TE_5)) +
  geom_point(alpha = 0.6, color = "blue") +
  ggtitle("TE_5 vs GM_TR_1") +
  theme_minimal()

p2 <- df %>% filter(GM_TR_2 > threshold) %>%
  ggplot(aes(x = GM_TR_2, y = TE_30)) +
  geom_point(alpha = 0.6, color = "green") +
  ggtitle("TE_30 vs GM_TR_2") +
  theme_minimal()


p3 <- df %>% filter(GM_TR_3 > threshold) %>%
  ggplot(aes(x = GM_TR_3, y = TE_60)) +
  geom_point(alpha = 0.6, color = "purple") +
  ggtitle("TE_60 vs GM_TR_3") +
  theme_minimal()


p4 <- df %>% filter(GM_TR_4 > threshold) %>%
  ggplot(aes(x = GM_TR_4, y = TE_90)) +
  geom_point(alpha = 0.6, color = "orange") +
  ggtitle("TE_90 vs GM_TR_4") +
  theme_minimal()

p5 <- df %>% filter(GM_TR_5 > threshold) %>%
  ggplot(aes(x = GM_TR_5, y = TE_120)) +
  geom_point(alpha = 0.6, color = "red") +
  ggtitle("TE_120 vs GM_TR_5") +
  theme_minimal()

p6 <- df %>% filter(GM_TR_6 > threshold) %>%
  ggplot(aes(x = GM_TR_6, y = TE_150)) +
  geom_point(alpha = 0.6, color = "darkred") +
  ggtitle("TE_150 vs GM_TR_6") +
  theme_minimal()

# Combine all plots
(p1 | p2 | p3) / (p4 | p5 | p6)
install.packages("patchwork")
install.packages("gridExtra")
library(gridExtra)


# Arrange plots in grid
grid.arrange(p1, p2, p3, p4, p5, p6, ncol = 3)

##############################################################################
library(ggplot2)
library(dplyr)
library(readr)
library(gridExtra)

# Read data
df <- read_csv("Grouped_GM_TR_Output_5.csv")

# Threshold
threshold <- 1.02

# Helper function to make plots with correlation
make_plot <- function(data, x_col, y_col, title_label, color) {
  filtered <- data %>% filter(.data[[x_col]] > threshold)
  
  # Compute correlation and p-value
  cor_test <- cor.test(filtered[[x_col]], filtered[[y_col]], method = "pearson")
  corr <- round(cor_test$estimate, 3)
  pval <- signif(cor_test$p.value, 3)
  
  # Create plot
  ggplot(filtered, aes_string(x = x_col, y = y_col)) +
    geom_point(color = color) +
    ggtitle(paste0(title_label, "\nCorr = ", corr, ", p = ", pval)) +
    theme_minimal()
}

# Create 6 plots
p1 <- make_plot(df, "GM_TR_1", "TE_5", "TE_5 vs GM_TR_1", "blue")
p2 <- make_plot(df, "GM_TR_2", "TE_30", "TE_30 vs GM_TR_2", "green")
p3 <- make_plot(df, "GM_TR_3", "TE_60", "TE_60 vs GM_TR_3", "purple")
p4 <- make_plot(df, "GM_TR_4", "TE_90", "TE_90 vs GM_TR_4", "orange")
p5 <- make_plot(df, "GM_TR_5", "TE_120", "TE_120 vs GM_TR_5", "red")
p6 <- make_plot(df, "GM_TR_6", "TE_150", "TE_150 vs GM_TR_6", "darkred")

# Arrange plots
grid.arrange(p1, p2, p3, p4, p5, p6, ncol = 3)

############################################################################

library(ggplot2)
library(dplyr)
library(readr)
library(gridExtra)

# Read data
df <- read_csv("Grouped_GM_TR_Output_5.csv")

# Threshold
threshold <- 1.02

# Helper function to make plots with Spearman correlation
make_plot <- function(data, x_col, y_col, title_label, color) {
  filtered <- data %>% filter(.data[[x_col]] > threshold)
  
  # Compute Spearman correlation and p-value
  cor_test <- cor.test(filtered[[x_col]], filtered[[y_col]], method = "spearman")
  corr <- round(cor_test$estimate, 3)
  pval <- signif(cor_test$p.value, 3)
  
  
  # Create plot
  ggplot(filtered, aes_string(x = x_col, y = y_col)) +
    geom_point(color = color) +
    ggtitle(paste0(title_label, "\nSpearman Corr = ", corr, ", p = ", pval)) +
    theme_minimal()
}

# Create 6 plots with Spearman correlation
p1 <- make_plot(df, "GM_TR_1", "TE_5", "TE_5 vs GM_TR_1", "blue")
p2 <- make_plot(df, "GM_TR_2", "TE_30", "TE_30 vs GM_TR_2", "green")
p3 <- make_plot(df, "GM_TR_3", "TE_60", "TE_60 vs GM_TR_3", "purple")

p4 <- make_plot(df, "GM_TR_4", "TE_90", "TE_90 vs GM_TR_4", "orange")
p5 <- make_plot(df, "GM_TR_5", "TE_120", "TE_120 vs GM_TR_5", "red")
p6 <- make_plot(df, "GM_TR_6", "TE_150", "TE_150 vs GM_TR_6", "darkred")

# Arrange plots
grid.arrange(p1, p2, p3, p4, p5, p6, ncol = 3)

##########################################################
library(ggplot2)
library(dplyr)
library(readr)
library(gridExtra)

# Read data
df <- read_csv("Grouped_GM_TR_Output_5.csv")

# Threshold
threshold <- 1.02

# Helper function to make plots with Spearman correlation and print results
make_plot <- function(data, x_col, y_col, title_label, color) {
  filtered <- data %>% filter(.data[[x_col]] > threshold)
  
  # Compute Spearman correlation and p-value
  cor_test <- cor.test(filtered[[x_col]], filtered[[y_col]], method = "spearman")
  corr <- round(cor_test$estimate, 3)
  pval <- signif(cor_test$p.value, 3)
  
  # Print results in console
  cat(paste0(title_label, " -- Spearman correlation: ", corr, ", p-value: ", pval, "\n"))
  
  # Create plot
  ggplot(filtered, aes_string(x = x_col, y = y_col)) +
    geom_point(color = color) +
    ggtitle(paste0(title_label, "\nSpearman Corr = ", corr, ", p = ", pval)) +
    theme_minimal()
}

# Create 6 plots with Spearman correlation
p1 <- make_plot(df, "GM_TR_1", "TE_5", "TE_5 vs GM_TR_1", "blue")
p2 <- make_plot(df, "GM_TR_2", "TE_30", "TE_30 vs GM_TR_2", "green")
p3 <- make_plot(df, "GM_TR_3", "TE_60", "TE_60 vs GM_TR_3", "purple")
p4 <- make_plot(df, "GM_TR_4", "TE_90", "TE_90 vs GM_TR_4", "orange")
p5 <- make_plot(df, "GM_TR_5", "TE_120", "TE_120 vs GM_TR_5", "red")
p6 <- make_plot(df, "GM_TR_6", "TE_150", "TE_150 vs GM_TR_6", "darkred")

# Arrange plots
grid.arrange(p1, p2, p3, p4, p5, p6, ncol = 3)



####regression 

library(ggplot2)
library(dplyr)
library(readr)
library(gridExtra)

# Read your data
df <- read_csv("Grouped_GM_TR_Output_5.csv")

threshold <- 1.02

# Helper function: run regression, print summary, return ggplot with regression line + stats on plot
make_regression_plot <- function(data, x_col, y_col, title_label, color) {
  # Filter by threshold
  filtered <- data %>% filter(.data[[x_col]] > threshold)
  
  # Fit linear model
  model <- lm(as.formula(paste(y_col, "~", x_col)), data = filtered)
  summ <- summary(model)
  
  # Extract stats for annotation
  intercept <- round(coef(model)[1], 3)
  slope <- round(coef(model)[2], 3)
  r_squared <- round(summ$r.squared, 3)
  pval <- signif(coef(summary(model))[2, "Pr(>|t|)"], 3)
  
  # Print regression summary to console
  cat(paste0("\nRegression for ", y_col, " vs ", x_col, " (threshold > ", threshold, "):\n"))
  print(summ)
  
  # Create plot with regression line and annotation
  p <- ggplot(filtered, aes_string(x = x_col, y = y_col)) +
    geom_point(color = color) +
    geom_smooth(method = "lm", se = FALSE, color = "black") +
    ggtitle(title_label) +
    theme_minimal() +
    annotate("text", 
             x = min(filtered[[x_col]], na.rm = TRUE), 
             y = max(filtered[[y_col]], na.rm = TRUE), 
             label = paste0("y = ", slope, "x + ", intercept, 
                            "\nR² = ", r_squared, 
                            "\np = ", pval),
             hjust = 0, vjust = 1,
             size = 4,
             color = "black")
  
  return(p)
}

# Define pairs to analyze
pairs <- list(
  c("GM_TR_1", "TE_5", "TE_5 vs GM_TR_1", "blue"),
  c("GM_TR_2", "TE_30", "TE_30 vs GM_TR_2", "green"),
  c("GM_TR_3", "TE_60", "TE_60 vs GM_TR_3", "purple"),
  c("GM_TR_4", "TE_90", "TE_90 vs GM_TR_4", "orange"),
  c("GM_TR_5", "TE_120", "TE_120 vs GM_TR_5", "red"),
  c("GM_TR_6", "TE_150", "TE_150 vs GM_TR_6", "darkred")
)

plots <- list()

for (i in seq_along(pairs)) {
  x_col <- pairs[[i]][1]
  y_col <- pairs[[i]][2]
  title <- pairs[[i]][3]
  color <- pairs[[i]][4]
  
  p <- make_regression_plot(df, x_col, y_col, title, color)
  plots[[i]] <- p
}

# Arrange all 6 plots in grid
grid.arrange(grobs = plots, ncol = 3)

######################################################################

library(ggplot2)
library(dplyr)
library(readr)
library(gridExtra)

# Read your data
df <- read_csv("Grouped_GM_TR_Output_5.csv")

# Threshold value
threshold <- 1.02

# Function to run regression, print summary, and create plot with regression line + stats
make_regression_plot <- function(data, x_col, y_col, title_label, color) {
  # Filter rows where GM_TR value <= threshold
  filtered <- data %>% filter(.data[[x_col]] <= threshold)
  
  # Fit linear regression model
  model <- lm(as.formula(paste(y_col, "~", x_col)), data = filtered)
  summ <- summary(model)
  
  # Extract model statistics for annotation
  intercept <- round(coef(model)[1], 3)
  slope <- round(coef(model)[2], 3)
  r_squared <- round(summ$r.squared, 3)
  pval <- signif(coef(summary(model))[2, "Pr(>|t|)"], 3)
  
  # Print regression summary to console
  cat(paste0("\nRegression for ", y_col, " vs ", x_col, " (threshold <= ", threshold, "):\n"))
  print(summ)
  
  # Create scatterplot with regression line and annotation text
  p <- ggplot(filtered, aes_string(x = x_col, y = y_col)) +
    geom_point(color = color) +
    geom_smooth(method = "lm", se = FALSE, color = "black") +
    ggtitle(title_label) +
    theme_minimal() +
    annotate("text", 
             x = min(filtered[[x_col]], na.rm = TRUE), 
             y = max(filtered[[y_col]], na.rm = TRUE), 
             label = paste0("y = ", slope, "x + ", intercept, 
                            "\nR² = ", r_squared, 
                            "\np = ", pval),
             hjust = 0, vjust = 1,
             size = 4,
             color = "black")
  
  return(p)
}

# List of variable pairs with colors and titles
pairs <- list(
  c("GM_TR_1", "TE_5", "TE_5 vs GM_TR_1", "blue"),
  c("GM_TR_2", "TE_30", "TE_30 vs GM_TR_2", "green"),
  c("GM_TR_3", "TE_60", "TE_60 vs GM_TR_3", "purple"),
  c("GM_TR_4", "TE_90", "TE_90 vs GM_TR_4", "orange"),
  c("GM_TR_5", "TE_120", "TE_120 vs GM_TR_5", "red"),
  c("GM_TR_6", "TE_150", "TE_150 vs GM_TR_6", "darkred")
)

plots <- list()

# Loop through pairs, generate plots and print summaries
for (i in seq_along(pairs)) {
  x_col <- pairs[[i]][1]
  y_col <- pairs[[i]][2]
  title <- pairs[[i]][3]
  color <- pairs[[i]][4]
  
  p <- make_regression_plot(df, x_col, y_col, title, color)
  plots[[i]] <- p
}

# Arrange and display all plots in a 2-row by 3-column grid
grid.arrange(grobs = plots, ncol = 3)

#############################################GAM#########

library(ggplot2)
library(dplyr)
library(readr)
library(gridExtra)
library(mgcv)   # for GAM

# Read your data
df <- read_csv("C:\\Users\\kanua\\Desktop\\Project iit\\Merged_TE_AVTR5_Data.csv")

# Threshold value
threshold <- 1.03

# Function to run GAM, print summary, and create plot with smooth curve + stats
make_gam_plot <- function(data, x_col, y_col, title_label, color) {
  # Filter rows where GM_TR value <= threshold
 # filtered <- data %>% filter(.data[[x_col]] <= threshold)
  filtered <- data %>% filter(.data[[x_col]] > threshold)
  # Fit GAM model with smooth term for x_col
  formula_gam <- as.formula(paste(y_col, "~ s(", x_col, ")"))
  gam_model <- gam(formula_gam, data = filtered)
  summ <- summary(gam_model)
  
  # Extract approximate significance of smooth term
  pval <- signif(summ$s.pv[1], 3)
  edf <- round(summ$s.table[1, "edf"], 2)  # effective degrees of freedom
  
  # Print GAM summary to console
  cat(paste0("\nGAM for ", y_col, " vs ", x_col, " (threshold <= ", threshold, "):\n"))
  print(summ)
  
  # Prepare data for prediction and plotting smooth curve
  x_vals <- filtered[[x_col]]
  pred_df <- data.frame(x = seq(min(x_vals, na.rm = TRUE), max(x_vals, na.rm = TRUE), length.out = 200))
  colnames(pred_df) <- x_col
  pred_df$fit <- predict(gam_model, newdata = pred_df)
  
  # Create scatterplot with GAM smooth curve and annotation text
  p <- ggplot(filtered, aes_string(x = x_col, y = y_col)) +
    geom_point(color = color) +
    geom_line(data = pred_df, aes_string(x = x_col, y = "fit"), color = "black", size = 1) +
    ggtitle(title_label) +
    theme_minimal() +
    annotate("text", 
             x = min(filtered[[x_col]], na.rm = TRUE), 
             y = max(filtered[[y_col]], na.rm = TRUE), 
             label = paste0("EDF = ", edf, 
                            "\np = ", pval),
             hjust = 0, vjust = 1,
             size = 4,
             color = "black")
  
  return(p)
}

# List of variable pairs with colors and titles
pairs <- list(
  c("GM_TR_1", "TE_5", "TE_5 vs GM_TR_1", "blue"),
  c("GM_TR_2", "TE_30", "TE_30 vs GM_TR_2", "green"),
  c("GM_TR_3", "TE_60", "TE_60 vs GM_TR_3", "purple"),
  c("GM_TR_4", "TE_90", "TE_90 vs GM_TR_4", "orange"),
  c("GM_TR_5", "TE_120", "TE_120 vs GM_TR_5", "red"),
  c("GM_TR_6", "TE_150", "TE_150 vs GM_TR_6", "darkred")
)


plots <- list()

# Loop through pairs, generate plots and print summaries
for (i in seq_along(pairs)) {
  x_col <- pairs[[i]][1]
  y_col <- pairs[[i]][2]
  title <- pairs[[i]][3]
  color <- pairs[[i]][4]
  
  p <- make_gam_plot(df, x_col, y_col, title, color)
  plots[[i]] <- p
}

# Arrange and display all plots in a 2-row by 3-column grid
grid.arrange(grobs = plots, ncol = 3)


#################gam_avg####################
library(ggplot2)
library(dplyr)
library(readr)
library(gridExtra)
library(mgcv)

# Load your data
df <- read_csv("C:\\Users\\kanua\\Desktop\\Project iit\\Merged_TE_AVTR5_Data.csv")

# Threshold for filtering Avg_TR values
threshold <- 1.03

# Function to generate GAM plot and print model summary
make_gam_plot <- function(data, x_col, y_col, title_label, color) {
  # Filter rows
  filtered <- data %>% filter(.data[[x_col]] > threshold)
  
  # Build GAM formula and model
  formula_gam <- as.formula(paste(y_col, "~ s(", x_col, ")"))
  gam_model <- gam(formula_gam, data = filtered)
  
  # GAM Summary
  summ <- summary(gam_model)
  pval <- signif(summ$s.pv[1], 3)
  edf <- round(summ$s.table[1, "edf"], 2)
  
  # --- PRINT GAM SUMMARY TO CONSOLE ---
  cat(paste0("\n\n========== ", title_label, " ==========\n"))
  print(summ)
  
  # Predict smooth fit for plotting
  x_vals <- filtered[[x_col]]
  pred_df <- data.frame(x = seq(min(x_vals, na.rm = TRUE), max(x_vals, na.rm = TRUE), length.out = 200))
  colnames(pred_df) <- x_col
  pred_df$fit <- predict(gam_model, newdata = pred_df)
  
  # Plot with annotation
  p <- ggplot(filtered, aes_string(x = x_col, y = y_col)) +
    geom_point(color = color) +
    geom_line(data = pred_df, aes_string(x = x_col, y = "fit"), color = "black", size = 1) +
    ggtitle(title_label) +
    theme_minimal() +
    annotate("text", 
             x = min(filtered[[x_col]], na.rm = TRUE), 
             y = max(filtered[[y_col]], na.rm = TRUE), 
             label = paste0("EDF = ", edf, "\np = ", pval),
             hjust = 0, vjust = 1, size = 4, color = "black")
  
  return(p)
}

# Define TE vs Avg_TR variable pairs
pairs <- list(
  c("Avg_TR_5", "TE_5", "TE_5 vs Avg_TR_5", "blue"),
  c("Avg_TR_30", "TE_30", "TE_30 vs Avg_TR_30", "green"),
  c("Avg_TR_60", "TE_60", "TE_60 vs Avg_TR_60", "purple"),
  c("Avg_TR_90", "TE_90", "TE_90 vs Avg_TR_90", "orange"),
  c("Avg_TR_120", "TE_120", "TE_120 vs Avg_TR_120", "red"),
  c("Avg_TR_150", "TE_150", "TE_150 vs Avg_TR_150", "darkred")
)

# Generate plots and print summaries
plots <- list()
for (i in seq_along(pairs)) {
  x_col <- pairs[[i]][1]
  y_col <- pairs[[i]][2]
  title <- pairs[[i]][3]
  color <- pairs[[i]][4]
  
  p <- make_gam_plot(df, x_col, y_col, title, color)
  plots[[i]] <- p
}

# Show all plots in grid
grid.arrange(grobs = plots, ncol = 3)
######################################3GAM FOR te and tai 


library(ggplot2)
library(dplyr)
library(readr)
library(gridExtra)
library(mgcv)   # for GAM

# Read your data
df <- read_csv("C:\\Users\\kanua\\Desktop\\Project iit\\Merged_TE_AVTR5_Data.csv")

# Threshold value
threshold <- 1.03

# Function to run GAM, print summary, and create plot with smooth curve + stats
make_gam_plot <- function(data, x_col, y_col, title_label, color) {
  # Filter rows where GM_TR value <= threshold
  # filtered <- data %>% filter(.data[[x_col]] <= threshold)
  filtered <- data %>% filter(.data[[x_col]] > threshold)
  # Fit GAM model with smooth term for x_col
  formula_gam <- as.formula(paste(y_col, "~ s(", x_col, ")"))
  gam_model <- gam(formula_gam, data = filtered)
  summ <- summary(gam_model)
  
  # Extract approximate significance of smooth term
  pval <- signif(summ$s.pv[1], 3)
  edf <- round(summ$s.table[1, "edf"], 2)  # effective degrees of freedom
  
  # Print GAM summary to console
  cat(paste0("\nGAM for ", y_col, " vs ", x_col, " (threshold <= ", threshold, "):\n"))
  print(summ)
  
  # Prepare data for prediction and plotting smooth curve
  x_vals <- filtered[[x_col]]
  pred_df <- data.frame(x = seq(min(x_vals, na.rm = TRUE), max(x_vals, na.rm = TRUE), length.out = 200))
  colnames(pred_df) <- x_col
  pred_df$fit <- predict(gam_model, newdata = pred_df)
  
  # Create scatterplot with GAM smooth curve and annotation text
  p <- ggplot(filtered, aes_string(x = x_col, y = y_col)) +
    geom_point(color = color) +
    geom_line(data = pred_df, aes_string(x = x_col, y = "fit"), color = "black", size = 1) +
    ggtitle(title_label) +
    theme_minimal() +
    annotate("text", 
             x = min(filtered[[x_col]], na.rm = TRUE), 
             y = max(filtered[[y_col]], na.rm = TRUE), 
             label = paste0("EDF = ", edf, 
                            "\np = ", pval),
             hjust = 0, vjust = 1,
             size = 4,
             color = "black")
  
  return(p)
}

# List of variable pairs with colors and titles
pairs <- list(
  c("GM_TR_1", "TE_5", "TE_5 vs GM_TR_1", "blue"),
  c("GM_TR_2", "TE_30", "TE_30 vs GM_TR_2", "green"),
  c("GM_TR_3", "TE_60", "TE_60 vs GM_TR_3", "purple"),
  c("GM_TR_4", "TE_90", "TE_90 vs GM_TR_4", "orange"),
  c("GM_TR_5", "TE_120", "TE_120 vs GM_TR_5", "red"),
  c("GM_TR_6", "TE_150", "TE_150 vs GM_TR_6", "darkred")
)


plots <- list()

# Loop through pairs, generate plots and print summaries
for (i in seq_along(pairs)) {
  x_col <- pairs[[i]][1]
  y_col <- pairs[[i]][2]
  title <- pairs[[i]][3]
  color <- pairs[[i]][4]
  
  p <- make_gam_plot(df, x_col, y_col, title, color)
  plots[[i]] <- p
}

# Arrange and display all plots in a 2-row by 3-column grid
grid.arrange(grobs = plots, ncol = 3)


#################gam_avg####################


library(ggplot2)
library(dplyr)
library(readr)
library(gridExtra)
library(mgcv)

# Load your data
df <- read_csv("C:\\Users\\kanua\\Desktop\\Project iit\\merged_tai_tr_by_gene.csv")

# Threshold for filtering Avg_TR values
threshold <- 1.1


# Function to generate GAM plot and print model summary
make_gam_plot <- function(data, x_col, y_col, title_label, color) {
  # Filter rows
  filtered <- data %>% filter(.data[[x_col]] > threshold)
  
  # Build GAM formula and model
  formula_gam <- as.formula(paste(y_col, "~ s(", x_col, ")"))
  gam_model <- gam(formula_gam, data = filtered)
  
  # GAM Summary
  summ <- summary(gam_model)
  pval <- signif(summ$s.pv[1], 3)
  edf <- round(summ$s.table[1, "edf"], 2)
  
  # --- PRINT GAM SUMMARY TO CONSOLE ---
  cat(paste0("\n\n========== ", title_label, " ==========\n"))
  print(summ)
  
  # Predict smooth fit for plotting
  x_vals <- filtered[[x_col]]
  pred_df <- data.frame(x = seq(min(x_vals, na.rm = TRUE), max(x_vals, na.rm = TRUE), length.out = 200))
  colnames(pred_df) <- x_col
  pred_df$fit <- predict(gam_model, newdata = pred_df)
  
  # Plot with annotation
  p <- ggplot(filtered, aes_string(x = x_col, y = y_col)) +
    geom_point(color = color) +
    geom_line(data = pred_df, aes_string(x = x_col, y = "fit"), color = "black", size = 1) +
    ggtitle(title_label) +
    theme_minimal() +
    annotate("text", 
             x = min(filtered[[x_col]], na.rm = TRUE), 
             y = max(filtered[[y_col]], na.rm = TRUE), 
             label = paste0("EDF = ", edf, "\np = ", pval),
             hjust = 0, vjust = 1, size = 4, color = "black")
  
  return(p)
}

# Define TE vs Avg_TR variable pairs
pairs <- list(
  c("tAI_5", "TE_5", "TE_5 vs tAI_5", "blue"),
  c("tAI_30", "TE_30", "TE_30 vs tAI_30", "green"),
  c("tAI_60", "TE_60", "TE_60 vs tAI_60", "purple"),
  c("tAI_90", "TE_90", "TE_90 vs tAI_90", "orange"),
  c("tAI_120", "TE_120", "TE_120 vs tAI_120", "red"),
  c("tAI_150", "TE_150", "TE_150 vs tAI_150", "darkred")
)

# Generate plots and print summaries
plots <- list()
for (i in seq_along(pairs)) {
  x_col <- pairs[[i]][1]
  y_col <- pairs[[i]][2]
  title <- pairs[[i]][3]
  color <- pairs[[i]][4]
  
  p <- make_gam_plot(df, x_col, y_col, title, color)
  plots[[i]] <- p
}

# Show all plots in grid
grid.arrange(grobs = plots, ncol = 3)
###############################################
# Load required libraries
library(ggplot2)


library(dplyr)
library(readr)
library(gridExtra)
library(mgcv)

# Load the dataset
df <- read_csv("C:\\Users\\kanua\\Desktop\\Project iit\\merged_tai_tr_by_gene.csv")


# Pre-filter: remove rows with NA in any tAI_* or TE_* column
df <- df %>%
  filter(complete.cases(select(., starts_with("tAI_"), starts_with("TE_"))))

# Threshold for filtering tAI values
threshold <- 1.1




# Define tAI and TE pairs for analysis
pairs <- list(
  c("tAI_5", "TE_5", "TE_5 vs tAI_5", "blue"),
  c("tAI_30", "TE_30", "TE_30 vs tAI_30", "green"),
  c("tAI_60", "TE_60", "TE_60 vs tAI_60", "purple"),
  c("tAI_90", "TE_90", "TE_90 vs tAI_90", "orange"),
  c("tAI_120", "TE_120", "TE_120 vs tAI_120", "red"),
  c("tAI_150", "TE_150", "TE_150 vs tAI_150", "darkred")
)

# Optionally, save all GAM summaries to a file
sink("gam_summaries.txt")

# Generate plots and print summaries
plots <- list()

for (i in seq_along(pairs)) {
  x_col <- pairs[[i]][1]
  y_col <- pairs[[i]][2]
  title <- pairs[[i]][3]
  color <- pairs[[i]][4]
  
  p <- make_gam_plot(df, x_col, y_col, title, color)
  plots[[i]] <- p
}

# Stop saving output to file
sink()


# Display plots in a grid (2 rows x 3 columns)
grid.arrange(grobs = plots, ncol = 3)

make_gam_plot <- function(data, x_col, y_col, title_label, color) {
  # Filter out NA values first
  filtered <- data %>%
    filter(!is.na(.data[[x_col]]) & !is.na(.data[[y_col]])) %>%
    filter(.data[[x_col]] > threshold)
  
  # Safety check: enough rows?
  if (nrow(filtered) < 10 || length(filtered[[x_col]]) == 0 || length(filtered[[y_col]]) == 0) {
    cat(paste0("\n\n========== ", title_label, " ==========\n"))
    cat("Not enough valid data for modeling or plotting.\n")
    return(ggplot() +
             ggtitle(paste(title_label, "(Insufficient Data)")) +
             theme_void())
  }
  
  # Fit GAM with tryCatch
  formula_gam <- as.formula(paste(y_col, "~ s(", x_col, ")"))
  gam_model <- tryCatch(gam(formula_gam, data = filtered), error = function(e) NULL)
  
  if (is.null(gam_model)) {
    cat(paste0("\n\n========== ", title_label, " ==========\n"))
    cat("GAM model failed to fit.\n")
    return(ggplot() +
             ggtitle(paste(title_label, "(Model Fit Failed)")) +
             theme_void())
  }
  
  # Summary and values
  summ <- summary(gam_model)
  pval <- signif(summ$s.pv[1], 3)
  edf <- round(summ$s.table[1, "edf"], 2)
  
  x_vals <- filtered[[x_col]]
  x_min <- min(x_vals, na.rm = TRUE)
  x_max <- max(x_vals, na.rm = TRUE)
  
  # Check that range is valid
  if (is.na(x_min) || is.na(x_max) || x_min == x_max) {
    return(ggplot() +
             ggtitle(paste(title_label, "(No X Range)")) +
             theme_void())
  }
  
  # Predict for plotting
  pred_df <- data.frame(x = seq(x_min, x_max, length.out = 200))
  colnames(pred_df) <- x_col
  
  pred_df$fit <- tryCatch({
    predict(gam_model, newdata = pred_df)
  }, error = function(e) rep(NA, 200))
  
  # Plot safely
  y_max <- max(filtered[[y_col]], na.rm = TRUE)
  y_max <- ifelse(is.finite(y_max), y_max, 0)
  
  p <- ggplot(filtered, aes_string(x = x_col, y = y_col)) +
    geom_point(color = color, alpha = 0.6) +
    geom_line(data = pred_df, aes_string(x = x_col, y = "fit"), color = "black", size = 1) +
    ggtitle(title_label) +
    theme_minimal() +
    annotate("text",
             x = x_min,
             y = y_max,
             label = paste0("EDF = ", edf, "\np = ", pval),
             hjust = 0, vjust = 1, size = 4, color = "black")
  
  return(p)
}











library(ggplot2)
library(dplyr)
library(readr)
library(gridExtra)
library(mgcv)


# Load your data
df <- read_csv("C:\\Users\\kanua\\Desktop\\Project iit\\merged_tai_tr_by_gene.csv")


# Threshold to filter tAI values
threshold <- 0.9 # Adjust if too strict


# Function to make GAM plot safely
make_gam_plot <- function(data, x_col, y_col, title_label, color) {
  make_gam_plot(df, "tAI_5", "TE_5", "TE_5 vs tAI_5", "blue")
  
  # Filter non-NA and threshold
  filtered <- data %>%
    filter(!is.na(.data[[x_col]]) & !is.na(.data[[y_col]])) %>%
    filter(.data[[y_col]] > threshold)  # TE threshold, not tAI
  # Apply threshold to TE, not tAI
  
  # Return blank if not enough data
  if (nrow(filtered) < 10 || length(filtered[[x_col]]) == 0 || length(filtered[[y_col]]) == 0) {
    cat(paste0("\n========== ", title_label, " ==========\n"))
    cat("Not enough data for modeling or plotting.\n")
    return(ggplot() +
             ggtitle(paste(title_label, "(Insufficient Data)")) +
             theme_void())
  }
  
  # Fit GAM with tryCatch
  formula_gam <- as.formula(paste(y_col, "~ s(", x_col, ")"))
  gam_model <- tryCatch(gam(formula_gam, data = filtered), error = function(e) NULL)
  
  if (is.null(gam_model)) {
    cat(paste0("\n========== ", title_label, " ==========\n"))
    cat("GAM model failed.\n")
    return(ggplot() +
             ggtitle(paste(title_label, "(Model Failed)")) +
             theme_void())
  }
  
  # Summary info
  summ <- summary(gam_model)
  pval <- signif(summ$s.pv[1], 3)
  edf <- round(summ$s.table[1, "edf"], 2)
  
  # Predict smooth line
  x_vals <- filtered[[x_col]]
  x_min <- min(x_vals, na.rm = TRUE)
  x_max <- max(x_vals, na.rm = TRUE)
  
  if (is.na(x_min) || is.na(x_max) || x_min == x_max) {
    return(ggplot() + ggtitle(paste(title_label, "(Invalid X Range)")) + theme_void())
  }
  
  pred_df <- data.frame(x = seq(x_min, x_max, length.out = 200))
  colnames(pred_df) <- x_col
  
  pred_df$fit <- tryCatch({
    predict(gam_model, newdata = pred_df)
  }, error = function(e) rep(NA, 200))
  
  y_max <- max(filtered[[y_col]], na.rm = TRUE)
  y_max <- ifelse(is.finite(y_max), y_max, 0)
  
  # Final plot
  p <- ggplot(filtered, aes_string(x = x_col, y = y_col)) +
    geom_point(color = color, alpha = 0.6) +
    geom_line(data = pred_df, aes_string(x = x_col, y = "fit"), color = "black", size = 1) +
    ggtitle(title_label) +
    theme_minimal() +
    annotate("text",
             x = x_min,
             y = y_max,
             label = paste0("EDF = ", edf, "\np = ", pval),
             hjust = 0, vjust = 1, size = 4, color = "black")
  
  return(p)
}




# List of variable pairs: tAI and TE
pairs <- list(
  c("tAI_5", "TE_5", "TE_5 vs tAI_5", "blue"),
  c("tAI_30", "TE_30", "TE_30 vs tAI_30", "green"),
  c("tAI_60", "TE_60", "TE_60 vs tAI_60", "purple"),
  c("tAI_90", "TE_90", "TE_90 vs tAI_90", "orange"),
  c("tAI_120", "TE_120", "TE_120 vs tAI_120", "red"),
  c("tAI_150", "TE_150", "TE_150 vs tAI_150", "darkred")
)

# Generate plots safely
plots <- list()

for (i in seq_along(pairs)) {
  x_col <- pairs[[i]][1]
  y_col <- pairs[[i]][2]
  title <- pairs[[i]][3]
  color <- pairs[[i]][4]
  
  cat(paste("Processing:", title, "\n"))  # 🐛 Debug line
  
  plot_obj <- make_gam_plot(df, x_col, y_col, title, color)
  if (!is.null(plot_obj)) {
    plots[[i]] <- plot_obj
  }
}

  
  plots[[i]] <- plot_obj

  
  }
print(pairs)


# Filter out any NULLs or invalid plots
valid_plots <- Filter(function(p) inherits(p, "ggplot"), plots)

# Display plots in a grid (if valid)
if (length(valid_plots) == 0) {
  cat("No valid plots to display.\n")
} else {
  grid.arrange(grobs = valid_plots, ncol = 3)
}
########################
library(ggplot2)
library(dplyr)

library(readr)
library(gridExtra)
library(mgcv)



# Load data
df <- read_csv("C:/Users/kanua/Desktop/Project iit/merged_tai_tr_by_gene.csv")

# Define TE vs tAI pairs
pairs <- list(
  c("tAI_5", "TE_5", "TE_5 vs tAI_5", "blue"),
  c("tAI_30", "TE_30", "TE_30 vs tAI_30", "green"),
  c("tAI_60", "TE_60", "TE_60 vs tAI_60", "purple"),
  c("tAI_90", "TE_90", "TE_90 vs tAI_90", "orange"),
  c("tAI_120", "TE_120", "TE_120 vs tAI_120", "red"),
  c("tAI_150", "TE_150", "TE_150 vs tAI_150", "darkred")
)

# Function to create GAM plot
make_gam_plot <- function(data, x_col, y_col, title_label, color) {
  # Clean data: remove any rows with NA
  filtered <- data %>% filter(!is.na(.data[[x_col]]), !is.na(.data[[y_col]]))
  
  # Fit GAM model
  formula_gam <- as.formula(paste(y_col, "~ s(", x_col, ")"))
  gam_model <- gam(formula_gam, data = filtered)
  summ <- summary(gam_model)
  pval <- signif(summ$s.pv[1], 3)
  edf <- round(summ$s.table[1, "edf"], 2)
  
  # Generate prediction line
  x_vals <- filtered[[x_col]]
  pred_df <- data.frame(x = seq(min(x_vals), max(x_vals), length.out = 200))
  colnames(pred_df) <- x_col
  pred_df$fit <- predict(gam_model, newdata = pred_df)
  
  # Plot
  p <- ggplot(filtered, aes_string(x = x_col, y = y_col)) +
    geom_point(color = color) +
    geom_line(data = pred_df, aes_string(x = x_col, y = "fit"), color = "black", size = 1) +
    ggtitle(title_label) +
    theme_minimal() +
    annotate("text",
             x = min(x_vals), 
             y = max(filtered[[y_col]]),
             label = paste0("EDF = ", edf, "\np = ", pval),
             hjust = 0, vjust = 1, size = 4, color = "black")
  
  cat(paste0("\n========== ", title_label, " ==========\n"))
  print(summ)
  
  return(p)
}

# Generate and collect plots
plots <- list()
for (i in seq_along(pairs)) {
  x_col <- pairs[[i]][1]
  y_col <- pairs[[i]][2]
  title <- pairs[[i]][3]
  color <- pairs[[i]][4]
  
  plot_obj <- tryCatch({
    make_gam_plot(df, x_col, y_col, title, color)
  }, error = function(e) {
    cat("Error in", title, ":", e$message, "\n")
    NULL
  })
  
  if (!is.null(plot_obj)) {
    plots[[length(plots) + 1]] <- plot_obj
  }
}

# Display in grid
if (length(plots) > 0) {
  grid.arrange(grobs = plots, ncol = 3)
} else {
  cat("No valid plots to display.\n")
}

#%#############################

library(dplyr)

# Step 1: Bin the tAI_5 values into 10 equal-width intervals
df$bin <- cut(df$tAI_5, breaks = 10)

# Step 2: Calculate correlation between TE_5 and tAI_5 within each bin
bin_correlation <- df %>%
  group_by(bin) %>%
  summarise(
    n = n(),
    mean_tAI = mean(tAI_5, na.rm = TRUE),
    cor_TE = cor(tAI_5, TE_5, method = "pearson")
  )

print(bin_correlation)

#################
# Step 1: Low and high tAI subsets
low_tAI <- df %>% filter(tAI_5 < quantile(tAI_5, 0.3))
high_tAI <- df %>% filter(tAI_5 > quantile(tAI_5, 0.7))

# Step 2: Fit GAM models separately
library(mgcv)
gam_low <- gam(TE_5 ~ s(tAI_5), data = low_tAI)
gam_high <- gam(TE_5 ~ s(tAI_5), data = high_tAI)

# Step 3: View summaries
summary(gam_low)
summary(gam_high)
#################################################

library(ggplot2)


ggplot(low_tAI, aes(x = tAI_5, y = TE_5)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "gam") +
  ggtitle("Low tAI subset: TE_5 vs tAI_5")


ggplot(high_tAI, aes(x = tAI_5, y = TE_5)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "gam") +
  ggtitle("High tAI subset: TE_5 vs tAI_5")
#################################################

