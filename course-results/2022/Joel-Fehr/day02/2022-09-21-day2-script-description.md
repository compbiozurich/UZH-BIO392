# Create Data Frame
#### Create a data frame based on a `.pgxseg` file:

First the file path can be defined in the variable `file_path` and a specific string where the data frame should start can be defined in the variables 
`start_string`. After opening the file it is converted into a string and then into an array containing the different lines of the string. After that the 
`start_string` is searched and the index is defined as `start`. Then the lines are splited into the different columns and then finally converted into a 
pandas data frame.

The proposed solution works with the "#" character to identify where the data frame should start. Also the data is then stored in a csv file before the
data frame is created with the pandas module.
