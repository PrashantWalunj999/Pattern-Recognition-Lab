setwd("C:/Users/ASUS/Desktop/PR Lab/a1") 
prc<-read.csv("Breast_Cancer.csv",stringsAsFactors = FALSE)

str(prc)
prc<- prc[-1]
table(prc$diagnosis_result)

prc$diagnosis<- factor(prc$diagnosis_result, levels = c("B", "M"), labels = c("Benign", "Malignant"))
round(prop.table(table(prc$diagnosis)) * 100, digits = 1)

normalize<- function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }

prc_n<-as.data.frame(lapply(prc[2:9], normalize))
summary(prc_n$radius)

prc_train<- prc_n[1:65,]
prc_test<- prc_n[66:100,]

prc_train_labels<- prc[1:65, 1]
prc_test_labels<- prc[66:100, 1]

install.packages(class)
library(class)

prc_test_pred<- knn(train = prc_train, test = prc_test,cl = prc_train_labels, k=10, prob=T)

#Evaluate model performance
library(gmodels)
CrossTable(x = prc_test_labels, y = prc_test_pred,prop.chisq=FALSE)

