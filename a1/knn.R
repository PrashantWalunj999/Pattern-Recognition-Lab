setwd("C:/Users/ASUS/Desktop/PR Lab/a1") 

#This command imports the required data set and saves it to the prc data frame.
#stringsAsFactors = FALSE   #This command helps to convert every character vector
#to a factor wherever it makes sense.

prc<-read.csv("Prostate_Cancer.csv",stringsAsFactors = FALSE)

# to see whether the data is structured or not.
str(prc)


#data is structured with 10 variables and 100 observations. If we observe the 
#data set, the first variable 'id' is unique in nature and can be removed as it
#does not provide useful information
##removes the first variable(id) from the data set.
prc<- prc[-1]

#The data set contains patients who have been diagnosed with either Malignant (M) or Benign (B) cancer
table(prc$diagnosis_result)  # it helps us to get the numbers of patients


#In case we wish to rename B as"Benign" and M as "Malignant" and see the results in the count form
#form, we may write as:
prc$diagnosis<- factor(prc$diagnosis_result, levels = c("B", "M"), labels = c("Benign", "Malignant"))

#it gives the result in the percentage form rounded of to 1 decimal place( and so it's digits = 1)
round(prop.table(table(prc$diagnosis)) * 100, digits = 1)

#to normalize the data and transform all the values to a common scale.
normalize<- function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }


# to normalize the numeric features in the data set. Instead of normalizing each of the 8 individual
#variables we use:
prc_n<-as.data.frame(lapply(prc[2:9], normalize))

summary(prc_n$radius)


#Creating training and test data set
#divide the data set into 2 portions in the ratio of 65: 35 (assumed) for the training 
#and test data set respectively.
#divide the prc_n data frame into prc_train and prc_test data frames.
#A blank value in each of the below statements indicate that all rows 
#and columns should be included.
prc_train<- prc_n[1:65,]
prc_test<- prc_n[66:100,]


#take the diagnosis factor in column 1 of the prc data frame and on turn creates prc_train_labels
#and prc_test_labels data frame.
prc_train_labels<- prc[1:65, 1]
prc_test_labels<- prc[66:100, 1]


#Theknn () function needs to be used to train a model for which we need to 
#install a package 'class'. The knn() function identifies the
#k-nearest neighbors using Euclidean distance where k is a user-specified number.

install.packages(class)
library(class)

prc_test_pred<- knn(train = prc_train, test = prc_test,cl = prc_train_labels, k=10, prob=T)

#Evaluate model performance

library(gmodels)
CrossTable(x = prc_test_labels, y = prc_test_pred,prop.chisq=FALSE)

