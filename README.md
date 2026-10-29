# Exploratory Data Analysis - Phase 1

## Student Details
- Name: Rosalyn P. Yeldo
- Registration Number: 23BDS0146

## Dataset
Natural Gas Dataset

## Tasks Completed
- Dataset Loading
- Basic Statistical Analysis
- Missing Value Handling
- Data Cleaning
- Data Transformation
- Univariate Analysis (3 Visualizations)
- Bivariate Analysis (3 Visualizations)
- Multivariate Analysis (3 Visualizations)

## Technologies Used
- R
- ggplot2
- dplyr
- zoo
- corrplot
- GGally

## Dataset Source
https://raw.githubusercontent.com/salemprakash/EDA/main/Data/NaturalGas.csv


# Exploratory Data Analysis - Phase 2

To perform clustering analysis on the Natural Gas dataset using:

1. 1-D, 2-D, 3D statistical analyses
2. K-Means Clustering
3. Hierarchical Clustering

The clustering is performed using numerical features from the dataset after standardization.

The dataset contains information about natural gas consumption, prices, heating, income, and other variables for different states and years.

## Features Used

The following numerical features are used for clustering:

- `consumption` - Natural gas consumption
- `price` - Natural gas price
- `eprice` - Electricity price
- `oprice` - Oil price
- `lprice` - Liquefied petroleum gas price
- `heating` - Heating-related variable
- `income` - Income

Categorical and identification variables such as `state`, `statecode`, `year`, and `rownames` are not used as clustering features.

## Tasks Completed

1D

1. Load dataset
2. Calculate mean, median, minimum, maximum, range, variance, SD, IQR, skewness and kurtosis
3. Store and display the statistics
4. Categorical frequency/relative-frequency analysis + pie/bar charts
5. Numerical frequency distribution + histogram/box plot

2D

6. Two categorical variables → contingency table and percentages
7. Stacked/grouped bar plot
8. Categorical + numerical → mean, median and SD by category
9. Side-by-side box plots + violin plot
10. Two numerical variables → Pearson/Spearman correlation + scatter plot with regression line

3D

11. Two categorical + one numerical → mean/SD combinations + grouped bar chart with error bars
12. One categorical + two numerical → categorized scatter plot + category-wise correlation
13. Three or more numerical variables → correlation matrix + heatmap
14. Pairs/scatterplot matrix

K-Means = partition-based clustering

Hierarchical = distance/dendrogram-based clustering


# Exploratory Data Analysis - Phase 3

1) To perform clustering on the dataset.

## Tasks Completed

1. prcomp() performs PCA, and summary(pca) displays the proportion of variance explained by each component.
2. The scree plot displays the percentage of variance explained by each principal component, with data labels and the y-axis fixed from 0 to 100.
3. autoplot() creates a PCA visualization using ggfortify.
4. pca_scores contains the principal component scores for each observation.
5. pch = 19 gives solid circular points, and col = "red" makes them red.

2) To perform SLR method

## Tasks Completed

Loaded the Natural Gas dataset from GitHub.

Checked for missing values and duplicate records.

Identified potential outliers using IQR and boxplots.

Defined independent and dependent variables: consumption (X) and price (Y).

Calculated mean, median, variance, and standard deviation.

Visualized data distributions using histograms and density plots.

Created boxplots for consumption and price.

Plotted the relationship between consumption and price using a scatter plot.

Calculated Pearson correlation between consumption and price.

Visualized the linear relationship using a regression line.

Split the data into training and testing samples.

Built a linear regression model.

Analyzed model performance using the regression summary, coefficients, p-value, and R-squared.

Calculated residuals and evaluated prediction errors using MAE, MSE, RMSE, and MAPE.

## Features Used

Language: R

Dataset: NaturalGas.csv

Data Handling: read.csv(), head(), is.na(), duplicated(), unique()

Statistical Analysis: Mean, median, variance, standard deviation, IQR, correlation

Visualization: Histograms, density plots, boxplots, scatter plots, regression line

Libraries: ggplot2

Machine Learning: Simple linear regression using lm()

Model Evaluation: Residual analysis, MAE, MSE, RMSE, MAPE, p-value, R-squared
