# Notes: Getting familiar with R 

- Basics
	- Mathematical opterators: + - * / ^
	- Logical operator: == <= >0 %in%
	- Assignment operator: <- =
	- Programming: if conditional, for loop
	- Calculation: mean max median sum log
	- Comment: #

- Classes
	- 0-D: character, numeric, logical
	- 1-D: vector	c(1,2,3)
	- 2-D: matrix, data frame
	- flexible: list

- Functions
	- SumTwoNumber <- function(a,b){
		return(a+b)
		}
	- result <- SumTwoNumber(1,2)

- Import data
	- read.table(path_to_file)
	- read_delim(path_to_file) # readr library

- Use libraries
	- install.packages(package_name)
	- library(package_name)

- Data frame
	- number: nrow, ncol, dim
	- names: colnames, rownames
	- df[:,1], df$Value
	- apply, sapply, lapply

- Plotting
	- hist plot #basic
	- ggplot(data_frame_name) + geom_xxx() # ggplot2 library
		- bar, histogram, boxplot, violin, line
