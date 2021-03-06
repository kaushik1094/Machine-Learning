# Simple Linear Regression

# Importing the dataset
dataset = read.csv('Salary_Data.csv')
#splitting datasets into training set and test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
#feature scaling
#training_set[,2:3]=scale(training_set[,2:3])
#test_set[,2:3]=scale(test_set[,2:3])

#fitting simple Linear regression into the training set
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

#Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)
#visualising the training set results
library(ggplot2)
ggplot() + geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), color = 'red') + 
  geom_line(aes(x = training_set$YearsExperience,y = predict(regressor, newdata = training_set)), color = 'blue')+
  ggtitle('Salary vs experience(training set)')+xlab('years of experience')+ylab('Salary')
#visualising the test set results
library(ggplot2)
ggplot() + geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), color = 'red') + 
  geom_line(aes(x = training_set$YearsExperience,y = predict(regressor, newdata = training_set)), color = 'blue')+
  ggtitle('Salary vs experience(test set)')+xlab('years of experience')+ylab('Salary')
