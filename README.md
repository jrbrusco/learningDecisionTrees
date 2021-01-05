# Jamie Brusco
# learningDecisionTrees
# January 3, 2021
I am interested in learning more about data analytics, so I completed a course on datacamp.com where I learned how to code in R. I was intrigued by its simplicity and usefulness, so I decided to learn more about how R can be used to analyze data in a more meaningful way. I did some research and learned about the importance of decision trees, so I created this project using a tutorial online to program a decision tree using the Iris Data Set.

## PART 0: Data Summary
I loaded the Iris Data Set and printed out the top of it along with a summary of it to become familiar with the what the data set contained. We can see that the cariables inclue Sepal Length, Sepal Width, Petal Length, Petal Width, and all plants belong to one of three species: setosa, versicolor, or virginica. In Parts 1-5 we will be exploring our data using different visualizations.

## PART 1: Histogram of target values
The first figure in RPlots.pdf is a Histogram of the target values. The x-values are the type od species and the y-values are the count of how many plants are in the data set. We use this to conclude that the dataset is perfectly distributed because 50 plants are examined for each of the three species. 

## PART 2: Distribution of Predictors Values
The second figure is a histogram that shows the distribution of the predictor values for each of the species, where setosa is red, versicolor is green, and virginica is blue (same colors as the first graph). The x-axis represents a length or width in centimeters and the y-axis represents a count of how many plants had that specific length/width. We have four histograms here, each respresenting a different predictor value with data from each species (distinguishable by color) From this figure, we can conclude that setosa plants have short sepal length, petal length and petal width, whereas virginica plants have long petal length and petal width.

## PART 3: Importance of Individual Attributes
The third figure offers a more clear visualization as to how each attribute affects the indiviudal species. From these box plots, we can conclude that setosa plants stand out from the others in their petal length and petal width. However, there is some overlapping in the data for the other species and their attributes.

## PART 4: Combining the Predictors 2 by 2
In order to find a way to better differentiate the species using their attributes, we can combine the predictor values two by two, as seen in the fourth figure. Here, the top right graph compares petal length and petal width. It is clear that these attributes, used together are able to help us distinguish virginica plants from versicolor plants. We can use this information later in our decision tree.

## PART 5: Correlation Between all of the Variables
In the fifth figure, we find the correlation between all variables to determine which ones will be effective for use in our decision tree. The boxes that are red represent a high correlation and the boxes that are blue represent a lower correlation. We can conclude that sepal width has no correlation with any variables, so we do not want to consider this in our decision tree. From this figure, we can tell that the main variables we want to consider in our decision tree are petal length and petal width.

## PART 6: Classification Using a Simple Decision Tree


## PART 7: Classification Using Random Forest??
  #Train/Validation Split
  
  #use caret package to train our model
  
  #check how it works on validation set


## PART 8: Checking randomForest with an example
  
  #checking variables of importance
