# Jamie Brusco
# learningDecisionTrees
# January 3, 2021
I am interested in learning more about data analytics, so I completed a course on datacamp.com where I learned how to code in R. I was intrigued by its simplicity and usefulness, so I decided to learn more about how R can be used to analyze data in a more meaningful way. I did some research and learned about the importance of decision trees, so I created this project using a tutorial online to program a decision tree using the Iris Data Set.

## PART 0: Data Summary
I loaded the Iris Data Set and printed out the top of it along with a summary of it to become familiar with the what the data set contained. We can see that the cariables inclue Sepal Length, Sepal Width, Petal Length, Petal Width, and all plants belong to one of three species: setosa, versicolor, or virginica. In Parts 1-5 we will be exploring our data using different visualizations. In parts 6 and 7 we will be classifying our Iris Species using a decision tree and a random forest, and in part 8 we will be checking our work using an example.

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
The sixth figure shows a simple decision tree where we use the main variables from Part 5 to classify the Species of the Iris flower. First, we look at the length of the petal. If it is less than 2.5cm, we can determine that the species is setosa. If it is greater than or equal to 2.5cm, we must compare petal widths to determine the species. If the petal width is less than 1.8cm, we can say that the species is versicolor. Hence, if the petal width is greater than or equal to 1.8cm, the species is virginica.

## PART 7: Classification Using Random Forest
You can view part 7 when you run decisionTreeMain.R. In this part, we classify the species using a random forest classifier. We start by splitting the data into a training set and a validation set. We use cross validation to train our model and can check the confusion matrix to see how well it did. We can see that our model mixed up virginica and versicolor species. Then, we test the model on the validation set and the confusion matrix shows 100% accuracy!`

## PART 8: Testing Random Forest with an example
Part 8 can also be viewed when running decisionTreeMain.R. Here, we test our random forest with three hard coded examples, each corresponding to one of the three Iris plant species. The program prints out the correct species for each of the plants, so we can verify that our random forest is accurate!
