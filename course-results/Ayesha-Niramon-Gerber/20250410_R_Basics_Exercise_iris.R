# R Basics Exercise Script
# Goal: Practice loading data and creating simple visualizations

# ---------------------------
# 1. Load the Data
# ---------------------------

# Load the `datasets` package (it's built into R, so no need to install it)
library('datasets')
  
# ---------------------------
# 2. Explore the Data
# ---------------------------

# The `iris` dataset is a built-in R dataset with measurements of different flower species
# Display the dataset
iris
# or show(iris)

# What is the data type of this dataset?
typeof(iris)
  
# Display the first 6 rows of the dataset  
# HINT: Use the `head()` function
head(iris,6)
  
# Get a summary of the dataset (mean, min, max, etc.)  
summary(iris)

# Get the structure of the dataset (data types, number of rows/columns)  
# HINT: Use the `str()` function
str(iris)
  
# ---------------------------
# 3. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables `x` and `y`  
x <- iris$Petal.Width
y <- iris$Petal.Length
    
# ---------------------------
# 4. Visualization
# ---------------------------
library(ggplot2)

## 4a. Create a scatter plot to display the relationship between petal width and petal length  
scatterplot <- plot(x,y, xlab = "Petal Width", ylab = "Petal Length", main = "Scatterplot Petal Width x Length")

## 4b. Create a box plot to display Sepal Length for different species  
boxplot <- boxplot(x,y,xlab = "Petal Width", ylab = "Petal Length", main = "Boxplot Petal Width x Length")
    
    # ---------------------------
# Try adding your own comments to explain each step!
# feel free to experiment with other plots or modify colors and labels to make the plot more informative!
