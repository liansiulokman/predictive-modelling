library(tidyverse)
library(sqldf)
library(readxl)
library(caret)
library(jsonlite)


train_data <- read.csv("C:\\Users\\lians\\OneDrive\\Documents\\MMA 867 Predictive Modelling\\Assignment 1\\restaurant-revenue-prediction2\\train.csv")
test_data <- read.csv("C:\\Users\\lians\\OneDrive\\Documents\\MMA 867 Predictive Modelling\\Assignment 1\\restaurant-revenue-prediction2\\test.csv")

train <- train_data[1:90, ]
test <- train_data[91:100, ]

#reg <- lm(revenue~., train)
#reg <- lm(revenue~P18+P20+P21+P28+P37, train)
#reg <- lm(revenue~P18+P20+P21+P28, train) #2075860 Trial 1
#reg <- lm(revenue~P20+P21+P28, train) #2064416 Trial 2
#reg <- lm(revenue~P20+P28, train) #2049090 Trial 3
#reg <- lm(revenue~P20+P28+P20*P28, train) #1832456 Trial 4

#reg <- lm(revenue~P20+P28, train) #2205734 Trial 5

#reg <- lm(revenue~P20+P28, train_data) #Trial 6

#reg <- lm(revenue~P20+P28, train) #2138570 Trial #7

#reg <- lm(revenue~P20+P28+P20*P28, train) #2197010 Trial #8

#reg <- lm(revenue~P18+P20+P28, train) #85:: #2061647 Trial #9

#reg <- lm(revenue~P18+P20+P28, train) #2202404 Trial #10

#reg <- lm(revenue~P18+P20+P28+P18*P20*P28, train) #2188337 Trial #11 -> best public: 1300021

#reg <- lm(revenue~P18+P20+P28+P20*P28, train) #2200134 Trial #12 (dropped)

#reg <- lm(revenue~P18+P28+P18*P28, train) #2414924 Trial #13 private: 3615262 - rank 72

#reg <- lm(revenue~P18+P28+P21+P18*P28, train) #2452573 Trial #14 (dropped)

#reg <- lm(revenue~P18+P28+P18*P28, train) #2416927 Trial #15/16/17 - try different train data size

#reg <- lm(revenue~P18+P28+P18*P28, train_data) #Trial #18 <-- private 3598831 rank 69

#reg <- lm(revenue~log(P28), train) #2371672 Trial #19 (dropped)

#reg <- lm(revenue~P28, train) #2449577 Trial #20 <-- private 3593577 rank 68

#reg <- lm(revenue~P28, train_data) #Trial #21 <--private 3579722 rank 65

#reg <- lm(revenue~P20, train) #2468369 Trial #22  <-- private 3547006 rank 61

#reg <- lm(revenue~P20, train_data) #Trial 23 <-- private 3536137 rank 61

#reg <- lm(revenue~log(P20), train) #2605862 Trial 24

reg <- lm(revenue~log(P20), train_data) #Trial 25 <-- best private 3525787 rank 56

summary(reg)

pred <- predict(reg,test)

RMSE(pred,test$revenue)


predicted_revenue <- predict(reg,test_data)

write.csv(predicted_revenue, file = "C:\\Users\\lians\\OneDrive\\Documents\\MMA 867 Predictive Modelling\\Assignment 1\\restaurant-revenue-prediction2\\Submission-Trial-25.csv") # export the predicted prices into a CSV file
