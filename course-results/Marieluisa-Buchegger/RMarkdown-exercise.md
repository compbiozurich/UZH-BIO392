
# R Basics Exercise Script by Marieluisa Buchegger
Goal: Practice loading data and creating simple visualizations


## 1. Load the Data
Load the `datasets` package (it's built into R, so no need to install it)
```{r}
library(datasets)
```
  
## 2. Explore the Data
The `iris` dataset is a built-in R dataset with measurements of different flower species
Display the dataset

```{r eval = FALSE}
iris
```
What is the data type of this dataset?
```{r}
class(iris)
```
It is a data.frame
  
Display the first 6 rows of the dataset  
HINT: Use the `head()` function

```{r}
head(iris)
```
  
Get a summary of the dataset (mean, min, max, etc.)  
```{r}
summary(iris)
```

Get the structure of the dataset (data types, number of rows/columns)  
HINT: Use the `str()` function
```{r}
str(iris)
```
  
## 3. Assign Variables

Assign petal width and petal length to variables `x` and `y`  
```{r}
x <- iris$Petal.Width
y <- iris$Petal.Length
```


## 4. Visualization

  
4a. Create a scatter plot to display the relationship between petal width and petal length  
```{r}

plot(x,y, main = "Relationship between Petal Width and Peta Length", xlab = "Petal Width", ylab = "Petal Length", pch = 19, col = "blue")
    
```

4b. Create a box plot to display Sepal Length for different species  
Define colors for each species


```{r}
species_colors <- c("setosa" = "red", "versicolor" = "green", "virginica" = "blue")
boxplot(iris$Sepal.Length ~ iris$Species, main = "Sepal Length for different species", xlab = "Species", ylab ="Sepal Length", col = species_colors[levels(iris$Species)])
```




