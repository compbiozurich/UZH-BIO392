

# Exercise
R Basics Exercise Script
Goal: Practice loading data and creating simple visualizations


1. Load the Data

Load the `datasets` package (it's built into R, so no need to install it). I also imported ggplot for the plotting later.

```{r}
library(datasets)
library(ggplot2)
```
  

# 2. Explore the Data


The `iris` dataset is a built-in R dataset with measurements of different flower species

Display the dataset
```{r}
iris 
dd <- iris
```
I assigned the iris data to dd for simpler coding later on.


What is the data type of this dataset?
```{r}
class(iris)
```
Result: "data.frame"


Display the first 6 rows of the dataset  
HINT: Use the `head()` function
```{r}
head(iris)
```


Get a summary of the dataset (mean, min, max, etc.)  
```{r}
summary(iris)
```
The summary looks like this: 
  Sepal.Length    Sepal.Width     Petal.Length    Petal.Width          Species  
 Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100   setosa    :50  
 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300   versicolor:50  
 Median :5.800   Median :3.000   Median :4.350   Median :1.300   virginica :50  
 Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199                  
 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800                  
 Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500   
  
Get the structure of the dataset (data types, number of rows/columns)  
HINT: Use the `str()` function
```{r}
str(iris)
```
The structure looks like this: 
Show in New Window
Description:df [6 × 5]
 
 
Sepal.Length
<dbl>
Sepal.Width
<dbl>
Petal.Length
<dbl>
Petal.Width
<dbl>
Species
<fctr>
1	5.1	3.5	1.4	0.2	setosa
2	4.9	3.0	1.4	0.2	setosa
3	4.7	3.2	1.3	0.2	setosa
4	4.6	3.1	1.5	0.2	setosa
5	5.0	3.6	1.4	0.2	setosa
6	5.4	3.9	1.7	0.4	setosa
6 rows
Show in New Window
[1] "data.frame"
Show in New Window
  Sepal.Length    Sepal.Width     Petal.Length    Petal.Width          Species  
 Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100   setosa    :50  
 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300   versicolor:50  
 Median :5.800   Median :3.000   Median :4.350   Median :1.300   virginica :50  
 Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199                  
 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800                  
 Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500                  
Show in New Window



# 3. Assign Variables


Assign petal width and petal length to variables `x` and `y`  
```{r}
x <- iris$Sepal.Width
y <- iris$Petal.Length
```


# 4. Visualization

4a. Create a scatter plot to display the relationship between petal width and petal length  
```{r}
ggplot(dd, aes(x = Petal.Width, y = Petal.Length, colour = Species)) +
  geom_point()
```
Plot: 
![image](https://github.com/user-attachments/assets/13749b5a-336d-471b-b3ed-83bf43e9aa4a)


4b. Create a box plot to display Sepal Length for different species  
```{r}
ggplot(dd, aes(x = Species , y = Sepal.Length, colour = Species))+
  geom_boxplot()
```
Plot: 
![image](https://github.com/user-attachments/assets/5af839c1-432b-43d4-a91d-8c7aab6ee7e5)

