## Importing packages
library(datasets)
library(tidyverse) 
library(caret)
library(grid)
library(gridExtra)
library(GGally)
library(rpart)

## PART 0: Data Summary
data(iris)
head(iris)
summary(iris)

## PART 1: Histogram of target values
iris %>%
  group_by(Species) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = Species, y = count, fill = Species)) + 
    geom_bar(stat = "identity") +
    geom_text(aes(label = as.character(count)), 
              position = position_dodge(width = 1),
              hjust = 0.5, vjust = -0.25, size = 3) +
    theme(legend.position = "none") +
    labs(title = "Species", x = "", caption = "Fig.1")
#see RHistogram.pdf for the plot created here
#TODO WRITE ABOUT THIS

## PART 2: Distribution of Predictors Values
h1 <- iris %>%
  group_by(Species, Sepal.Length) %>%
  ggplot(aes(x = Sepal.Length, fill = Species)) + 
      geom_histogram(binwidth = 0.5) + # 
      theme(legend.position = "none") +
      labs(title = "Sepal.Length", x = "", y = "")

h2 <- iris %>%
  group_by(Species, Sepal.Width) %>%
  ggplot(aes(x = Sepal.Width, fill = Species)) + 
      geom_histogram(binwidth = 0.25) + # 
      theme(legend.position = "none") +
      labs(title = "Sepal.Width", x = "", y = "")

h3 <- iris %>%
  group_by(Species, Petal.Length) %>%
  ggplot(aes(x = Petal.Length, fill = Species)) + 
      geom_histogram(binwidth = 1) + # 
      theme(legend.position = "none") +
      labs(title = "Petal.Length", x = "", y = "")

h4 <- iris %>%
  group_by(Species, Petal.Width) %>%
  ggplot(aes(x = Petal.Width, fill = Species)) + 
      geom_histogram(binwidth = 0.5) + # 
      theme(legend.position = "none") +
      labs(title = "Petal.Width", x = "", y = "", caption = "Fig.2")

grid.arrange(h1, h2, h3, h4, ncol = 4)

## PART 3: Importance of Individual Attributes

b1 <- iris %>%
  group_by(Species, Sepal.Length) %>%
  ggplot(aes(x = Species, y = Sepal.Length)) + 
      geom_boxplot(outlier.colour = "red", outlier.shape = 16, outlier.size = 2,
notch = FALSE) +  
      theme_minimal() +
      theme(legend.position = "none",
          axis.text.x = element_text(angle = 90, hjust = 0.5, vjust = 0)) +
      labs(title = "Sepal.Length", x = "", y = "")

b2 <- iris %>%
  group_by(Species, Sepal.Width) %>%
  ggplot(aes(x = Species, y = Sepal.Width)) + 
      geom_boxplot(outlier.colour = "red", outlier.shape = 16, outlier.size = 2, 
notch = FALSE) +  
      theme_minimal() +
      theme(legend.position = "none",
          axis.text.x = element_text(angle = 90, hjust = 0.5, vjust = 0)) +
      labs(title = "Sepal.Width", x = "", y = "")

b3 <- iris %>%
  group_by(Species, Petal.Length) %>%
  ggplot(aes(x = Species, y = Petal.Length)) + 
      geom_boxplot(outlier.colour = "red", outlier.shape = 16, outlier.size = 2,
notch = FALSE) +  
      theme_minimal() +
      theme(legend.position = "none",
          axis.text.x = element_text(angle = 90, hjust = 0.5, vjust = 0)) +
      labs(title = "Petal.Length", x = "", y = "")

b4 <- iris %>%
  group_by(Species, Petal.Width) %>%
  ggplot(aes(x = Species, y = Petal.Width)) + 
      geom_boxplot(outlier.colour = "red", outlier.shape = 16, outlier.size = 2,
notch = FALSE) +  
      theme_minimal() +
      theme(legend.position = "none",
            axis.text.x = element_text(angle = 90, hjust = 0.5, vjust = 0)) +
      labs(title = "Petal.Width", x = "", y = "", caption = "Fig.3")

grid.arrange(b1, b2, b3, b4,
             ncol = 4)

## PART 4: Combining the Predictors 2 by 2
f1 <- iris %>%
  group_by(Species, Sepal.Length, Sepal.Width) %>%
  ggplot(aes(Sepal.Length, Sepal.Width, color = Species)) + 
      geom_point() +  
      theme_minimal() +
      theme(legend.position = "none") +
      labs(title = "")

f2 <- iris %>%
  group_by(Species, Petal.Length, Petal.Width) %>%
  ggplot(aes(Petal.Length, Petal.Width, color = Species)) + 
      geom_point() +  
      theme_minimal() +
      theme(legend.position = "none") +
      labs(title = "")

f3 <- iris %>%
  group_by(Species, Petal.Length, Sepal.Width) %>%
  ggplot(aes(Petal.Length, Sepal.Width, color = Species)) + 
      geom_point() +  
      theme_minimal() +
      theme(legend.position = "none") +
      labs(title = "")

f4 <- iris %>%
  group_by(Species, Sepal.Length, Petal.Width) %>%
  ggplot(aes(Sepal.Length, Petal.Width, color = Species)) + 
      geom_point() +  
      theme_minimal() +
      theme(legend.position = "none") +
      labs(title = "", caption = "Fig.4")

grid.arrange(f1, f2, f3, f4, ncol = 2)

## PART 5: Correlation Between all of the Variables
  # convert all values to numeric (especially the target)
all_num <- iris
all_num$Species <- as.numeric(all_num$Species)
all_num %>% ggcorr(palette = "RdBu", label = TRUE)

## PART 6: Classification Using a Simple Decision Tree


mytree <- rpart(Species ~ ., data = iris)
rattle::fancyRpartPlot(mytree, type = 5, sub = "")

## PART 7: Classification Using Random Forest??
  #Train/Validation Split
set.seed(3) # for reproducibility
idx <- createDataPartition(factor(iris$Species), 
                           times = 1, # one time
                           p = 0.5, # 50% proportion
                           list = FALSE)

  # train set
trainset <- iris[idx,] 
  # validation set
validation_set <- iris[-idx,] %>% select(-Species)   
validation_labels <- iris[-idx,] %>% select(Species)
  #use caret package to train our model
control <- trainControl(method = "cv", # cross-validation
                        verboseIter = TRUE,
                        savePredictions = "final",
                        classProbs = TRUE) 

set.seed(1)
model <- train(Species ~ ., data = iris,
               trControl = control,
               maximize = TRUE,
               tuneGrid = data.frame(mtry = 4),
               method = "rf")
  #print model
model

  #print confusion matrix
confusionMatrix.train(model)

  #check how it works on validation set
val_preds <- predict(model, validation_set)
confusionMatrix(val_preds, validation_labels$Species)

## PART 8: Checking randomForest with an example
  #should be setosa versicolor virginica
set.seed(3)
n <- sample(1:nrow(validation_set), size = 3)
validation_set[n,]

val_preds[n]

  #checking variables of importance
varImp(model)