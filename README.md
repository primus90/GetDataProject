# README  #

This document is a description of the run_analysis R script


## File Preparation ##
1. The zip file downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Zip file copied to working directory
3. Zip file extracted to working directory
4. The test files extracted to sub directory test
5. The train files extracted to sub directory test

# Code Explanation:  #
1. Line 3 sets the directory where the features.txt file is located. The features text file is a listing of all of the features
2. line 4 reads in the features.txt file
3. line 5 converts column V2 to characters
4. line 6 assigns column V2 to features (only the variable name)
5. line 7 removes all hyphens from features variable name
6. line 8 removes all open parenthesis from features variable name
7. line 9 removes all closing parenthesis from features variable name
8. line 10 removes all commas from features variable name
9. line 13 sets the working directory to the test directory
10. line 14 reads in the subject_test.txt into testsub dataframe
11. line 17 reads in the x_test.txt file into the testx dataframe
12. line 19 reads in the y_test.txt file into the testy data frame
13. line 26 changes the column name of testsub to subject
14. line 27 changes the column name of testy to activity
15. line 28 changes the column name of testx to the contents of the features vector obtained in lines 4 - 8
16. testsub, testy and testx are combined in a single dataframe dftest using the cbind function
17. line 33 sets the working directory to the directory where the train files are located
18. line 34 reads in subject_train.txt into trainsub
19. line 35 reads in x_train.txt into trainx
20. line 36 reads in y_train.txt into trainy
21. line 37 changes the column name of trainsub to subject
22. line 38 changed the column name of trainy to activity
23. line 39 changes all of the column names in trainx to the contents of the features vector obtained in lines 4 - 8
24. line 41 combines trainsub,trainy and trainx into dataframe dftrain using the cbind function
25. line 46 combines the training data set dftrain and the test data set dftrain into one data set using the rbind function
26. line 47 casts the data$activity column from integer to character
27. line 48 changes all rows in data$activity to WALKING where the value is 1
28. line 49 changes all rows in data$activity to WALKING_UPSTAIRS where the value is 2
29. line 50 changes all rows in data$activity to WALKING_DOWNSTAIRS where the value is 3
30. line 51 changes all rows in data$activity to SITTING where the value is 4
31. line 52 changes all rows in data$activity to STANDING where the value is 5
32. line 53 changes all rows in data$activity to LAYING where the value is 6
33. line 47 extracts all columns in data (combined test and training data set) that have mean or Mean in the column name into the vector mean
34. line 48 extracts all columns in data (combined test and training data sets) that have std in the column name into the vector sd
35. line 58 combines vectors mean and sd into data frame meanAndSd. The data frame meanAndSd consists of columns from the data frame data (combined test and training data sets) that have [Mm]ean or std in the column name
36. line 59 saves the data frame meanAndSd as a comma delimited file
37. line 64 returns the mean of columns 3:563 of data into the vector y
38. line 65 is vector with the average as the first entry and variable as the second entry
39. line 66 combines vectors b and y into vector j
40. line 67 combines data frame data with data frame j into the data frame tidydata with the end result of the average of columns 3:563 being inserted at the bottom of data frame tidydata
41. line 68 saves the tidydata frame as tidydata.txt file where the row.names are false
