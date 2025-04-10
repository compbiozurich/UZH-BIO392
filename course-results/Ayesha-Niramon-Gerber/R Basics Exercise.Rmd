---
title: "R Basics Exercise"
author: "Ayesha Gerber"
date: "2025-04-10"
output: pdf_document
---

# R Basics Exercise Script

Goal: Practice loading data and creating simple visualizations

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# 1. Load the Data

### Load the `datasets` package (it's built into R, so no need to install it)

```{r}
library('datasets')
```

# 2. Explore the Data

The `iris` dataset is a built-in R dataset with measurements of different flower species

### Display the dataset

```{r}
iris
# or show(iris)
```

### What is the data type of this dataset?

```{r}
typeof(iris)
```

### Display the first 6 rows of the dataset

HINT: Use the `head()` function

```{r}
head(iris,6)
```

### Get a summary of the dataset (mean, min, max, etc.)

```{r}
summary(iris)
```

### Get the structure of the dataset (data types, number of rows/columns)

HINT: Use the `str()` function

```{r}
str(iris)
```

# 3. Assign Variables

### Assign petal width and petal length to variables `x` and `y`

```{r}
x <- iris$Petal.Width
y <- iris$Petal.Length
```

# 4. Visualization

```{r}
library(ggplot2)
```

## 4a. Create a scatter plot to display the relationship between petal width and petal length

```{r}
scatterplot <- plot(x,y, xlab = "Petal Width", ylab = "Petal Length", main = "Scatterplot Petal Width x Length")
```

## 4b. Create a box plot to display Sepal Length for different species

```{r}
boxplot <- boxplot(x,y,xlab = "Petal Width", ylab = "Petal Length", main = "Boxplot Petal Width x Length")
```
