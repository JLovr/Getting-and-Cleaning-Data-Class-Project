# Getting and Cleaning Data Course Project Readme

## Tasking
Create an r script and a specific tidy dataset given raw data sourced from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
which includes sourcing and credits information as to the original source and the authors in addition to relevant readme and descriptive files.

##Script - run_analysis.R

### Script - run_analysis.R - General thoughts
1. Specific care was taken maximize clarity and ease debugging and testing throughout the script.
2. It was decided that relying on the column names for filtering purposes was the best plan of attack, given the available descriptive information.
3. Column names for final output file for the measurements were constructed from the source names in the features.txt by:
	* Removing non-alphanumeric characters
	* Capitalizing the first letter
	* Prepending Avg in front of the the modified feature name
	* it was felt that this would retain the maximum clarity and alignment with the original feature names while also being easily employed by all R column name indexing modes.
4. Given the requirement to display only those measurements which represented either a mean or standard deviation, after performing an examination of the feature names (__V2__) in the features.txt file, we filtered on unique feature number (__V1__) occurances of the following specific strings:
	*  mean()
	*  std()
	*  meanFreq
	*  gravityMean
5.  Given the there was an exact correlation between the TestCode and the Activity name and the requirement to employ Activity names, and that the required fields for the final output file were to be only the average mean and standard deviations, averaged by Activity and Subject, the Test Code field was removed as extraneous.

### Coding breakdown
1. Import required libraries and functions.
2. Set working directory
3. Read data
   * Subject data was converted into a numeric value for use in sorting purposes later on.
4. Set column headings to __Subject__ for stest and strain and __TestCode__ for the ytest and ytrain dataframes. 
   * Employed a variable, __k1__ to retain a list of these column names for later column name processing
5. Column bound the Subject, TestCode and measurement data into a testing and training data sets
6. Row bound the two datasets together into a single dataset.
7. Appended a column name containing the Activity name corresponding every row's Test Code.
8. Filtered data columns based on feature table Names per search criteria outlined in previous section.
9. Sorted selected columns to retain original Feature naming sequence.
10. Created filtering vector
  * Used an in-line function to prepend __V__ to every selected column number to generate filter map dataframe.
11. Filtered data into new data frame
  * Prepended __k1__ list to filter column list to define list of all required columns for filtered dataframe.
12. Prepared labels for final dataframe.
  * Built list of labels from Activities dataframe.
  * Removed all special characters that were found in the labels.
  * Capitalized the first letter of each labels
  * Prepended __Avg__ to each label.
  * Merged with __k1__ list.
13. Applied new column labels
14. Rearranged data by Activity and Subject to simplify debugging.
15. Built new intermediate __data.table__ to aid processing.
  * Removed extraneous __TestCode__ column.
16. Built results data frame containing the desired table.


	
