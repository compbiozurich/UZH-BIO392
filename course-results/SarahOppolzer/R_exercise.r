# R Basics Exercise Script
# Goal: Practice loading data and creating simple visualizations

# ---------------------------
# 1. Load the Data
# ---------------------------

# Load the `datasets` package (it's built into R, so no need to install it)
library(datasets)
library(ggplot2)
  
# ---------------------------
# 2. Explore the Data
# ---------------------------

# The `iris` dataset is a built-in R dataset with measurements of different flower species
# Display the dataset
iris
head(iris) 
table(iris)
dd <- iris
# What is the data type of this dataset?
type(iris)
  
# Display the first 6 rows of the dataset  
# HINT: Use the `head()` function
class(iris)
  
# Get a summary of the dataset (mean, min, max, etc.)  
summary(iris)
  
# Get the structure of the dataset (data types, number of rows/columns)  
# HINT: Use the `str()` function
str(iris)
  
# ---------------------------
# 3. Assign Variables
# ---------------------------

# Assign petal width and petal length to variables `x` and `y`  
x <- iris$Sepal.Width
y <- iris$Petal.Length
    
# ---------------------------
# 4. Visualization
# ---------------------------
  
## 4a. Create a scatter plot to display the relationship between petal width and petal length  
ggplot(dd, aes(x = Petal.Width, y = Petal.Length, colour = Species)) +
  geom_point()

    
## 4b. Create a box plot to display Sepal Length for different species  
ggplot(dd, aes(x = Species , y = Sepal.Length, colour = Species))+
  geom_boxplot()
    
# ---------------------------
# Try adding your own comments to explain each step!
# feel free to experiment with other plots or modify colors and labels to make the plot more informative!

