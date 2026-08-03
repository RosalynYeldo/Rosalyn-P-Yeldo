###############################################################
# PHASE 1 - EXPLORATORY DATA ANALYSIS
# Dataset: NaturalGas.csv
# Objective:
#   1. Load the dataset
#   2. Basic statistical analysis
#   3. Handle missing values
#   4. Data cleaning
#   5. Data transformation
#   6. Univariate Analysis
#   7. Bivariate Analysis
#   8. Multivariate Analysis
###############################################################


###############################
# 1. LOAD REQUIRED LIBRARIES
###############################

library(ggplot2)
library(dplyr)
library(zoo)
library(corrplot)
library(GGally)


###############################
# 2. LOAD THE DATASET
###############################

data <- read.csv("https://raw.githubusercontent.com/salemprakash/EDA/main/Data/NaturalGas.csv")

# View first and last few records
head(data)
tail(data)

# Dataset dimensions
dim(data)

# Column names
colnames(data)

# Structure of dataset
str(data)



###############################
# 3. BASIC STATISTICAL ANALYSIS
###############################

# Summary statistics
summary(data)

# Mean of numeric columns
sapply(data, function(x)
  if(is.numeric(x)) mean(x, na.rm=TRUE))

# Median
sapply(data, function(x)
  if(is.numeric(x)) median(x, na.rm=TRUE))

# Standard Deviation
sapply(data, function(x)
  if(is.numeric(x)) sd(x, na.rm=TRUE))

# Variance
sapply(data, function(x)
  if(is.numeric(x)) var(x, na.rm=TRUE))

# Minimum
sapply(data, function(x)
  if(is.numeric(x)) min(x, na.rm=TRUE))

# Maximum
sapply(data, function(x)
  if(is.numeric(x)) max(x, na.rm=TRUE))

# Quartiles
sapply(data, function(x)
  if(is.numeric(x)) quantile(x, na.rm=TRUE))



###############################
# 4. HANDLE MISSING VALUES
###############################

# Count missing values in each column
colSums(is.na(data))

# Total missing values
sum(is.na(data))

# Display rows containing missing values
data[!complete.cases(data), ]


# Method 1 : Remove missing values
clean_data <- na.omit(data)


# Method 2 : Forward Fill
forward_fill <- data.frame(
  lapply(data, function(x)
    na.locf(x, na.rm = FALSE))
)


# Method 3 : Backward Fill
backward_fill <- data.frame(
  lapply(data, function(x)
    na.locf(x,
            fromLast = TRUE,
            na.rm = FALSE))
)


# Method 4 : Mean Imputation
mean_impute <- data

numeric_columns <- sapply(mean_impute, is.numeric)

mean_impute[numeric_columns] <-
  lapply(mean_impute[numeric_columns], function(x){

    x[is.na(x)] <- mean(x, na.rm = TRUE)
    return(x)

  })



###############################
# 5. DATA CLEANING
###############################

# Remove duplicate rows
clean_data <- distinct(clean_data)

# Check duplicates
sum(duplicated(clean_data))

# Check data types
str(clean_data)

# Convert Date column if present
if("Date" %in% names(clean_data))
{
  clean_data$Date <- as.Date(clean_data$Date)
}



###############################
# 6. DATA TRANSFORMATION
###############################

# Select numeric columns
numeric_data <- clean_data %>%
  select(where(is.numeric))

# Normalization (Min-Max Scaling)
normalized_data <- as.data.frame(
  lapply(numeric_data, function(x){

    (x-min(x))/(max(x)-min(x))

  })
)

# Standardization (Z-score)
standardized_data <- as.data.frame(
  scale(numeric_data)
)



###############################################################
# 7. UNIVARIATE ANALYSIS (Minimum 3 Visualizations)
###############################################################

# Identify first numeric column
num_col <- names(numeric_data)[1]


# Visualization 1 : Histogram
ggplot(clean_data,
       aes(x=.data[[num_col]]))+

  geom_histogram(
    bins=20,
    fill="steelblue",
    color="black")+

  ggtitle("Histogram")


# Visualization 2 : Box Plot
ggplot(clean_data,
       aes(y=.data[[num_col]]))+

  geom_boxplot(fill="orange")+

  ggtitle("Box Plot")


# Visualization 3 : Density Plot
ggplot(clean_data,
       aes(x=.data[[num_col]]))+

  geom_density(fill="lightgreen",
               alpha=0.6)+

  ggtitle("Density Plot")



###############################################################
# 8. BIVARIATE ANALYSIS (Minimum 3 Visualizations)
###############################################################

# Select first two numeric columns
x <- names(numeric_data)[1]
y <- names(numeric_data)[2]


# Visualization 1 : Scatter Plot
ggplot(clean_data,
       aes(x=.data[[x]],
           y=.data[[y]]))+

  geom_point(color="blue")+

  ggtitle("Scatter Plot")


# Visualization 2 : Regression Plot
ggplot(clean_data,
       aes(x=.data[[x]],
           y=.data[[y]]))+

  geom_point()+

  geom_smooth(method="lm",
              se=FALSE,
              color="red")+

  ggtitle("Scatter Plot with Regression Line")


# Visualization 3 : Grouped Boxplot
ggplot(clean_data,
       aes(x=factor(cut(.data[[x]],4)),
           y=.data[[y]]))+

  geom_boxplot(fill="skyblue")+

  xlab(x)+

  ggtitle("Grouped Boxplot")



###############################################################
# 9. MULTIVARIATE ANALYSIS (Minimum 3 Visualizations)
###############################################################

# Visualization 1 : Correlation Heatmap

correlation_matrix <- cor(numeric_data)

corrplot(correlation_matrix,
         method="color",
         tl.cex=0.8)



# Visualization 2 : Pair Plot

ggpairs(numeric_data)



# Visualization 3 : Scatter Plot Matrix using Base R

pairs(numeric_data,
      main="Scatter Plot Matrix",
      pch=19,
      col="darkgreen")
