import matplotlib.pyplot as plt#used for plotting graph
from sklearn.model_selection import train_test_split# to split the data into two parts
from sklearn.ensemble import RandomForestClassifier #forrandomforest classifier
from sklearn.metrics import accuracy_score# to check the error and accuracy of the model
from sklearn import svm#for support vector machine

import pandas as pd # data processing, CSV file I/O 

import seaborn as sns # for statistical data visualization.
from IPython import get_ipython
get_ipython().run_line_magic('matplotlib', 'inline')

data = pd.read_csv("C:/Users/ASUS/Desktop/PR_Lab/a3/data.csv",header=0)# here header 0 means the 0 th row is the coloumn
# header in data

print(data.head(2))#  The data have imported and having 33 columns
# head is used for to see top 5 by default . Since head(2) is given it will print top 2 rows


data.info()
#  drop the column Unnamed: 32



# axis 1 means  droping the column

data.columns#  gives the column name which are persent in the data set
# To remove Id column for analysis
data.drop("id",axis=1,inplace=True)
# The data is divided into three parts. Divided the features according to their category
features_mean= list(data.columns[1:11])
features_se= list(data.columns[11:20])
features_worst=list(data.columns[21:31])
print(features_mean)
print("-----------------------------------")
print(features_se)
print("------------------------------------")
print(features_worst)

# diagnosis column is a object type ,  map it to integer value
data['diagnosis']=data['diagnosis'].map({'M':1,'B':0})
#data.describe() # this will describe the all statistical function of our data
# get the frequency of cancer stages
sns.countplot(data['diagnosis'],label="Count")           
#  draw a correlation graph so that , can remove multi colinearity

corr = data[features_mean].corr() # .corr is used for find corelation
plt.figure(figsize=(14,14))
sns.heatmap(corr, cbar = True,  square = True, annot=True, fmt= '.2f',annot_kws={'size': 15},
            xticklabels= features_mean, yticklabels= features_mean,
            cmap= 'coolwarm') 
prediction_var = ['texture_mean','perimeter_mean','smoothness_mean','compactness_mean','symmetry_mean']
# now these are the variables which will use for prediction
#now split the data into train and test

train, test = train_test_split(data, test_size = 0.3)# in this our main data is splitted into train and test
# we can check their dimension
print(train.shape)
print(test.shape)
train_X = train[prediction_var]# taking the training data input 
train_y=train.diagnosis# This is output of our training data
# same  to do for test
test_X= test[prediction_var] # taking test data inputs
test_y =test.diagnosis   #output value of test dat
model=RandomForestClassifier(n_estimators=100)# a simple random forest model
model.fit(train_X,train_y)# now fit the model for traiing data
prediction=model.predict(test_X)# predict for the test data
# prediction will contain the predicted value by our model predicted values of dignosis column for test inputs
print ("accuracy of randomforest")
print (accuracy_score(prediction,test_y))# to check the accuracy
# here will use accuracy measurement between the predicted value and the test output values
model = svm.SVC()
model.fit(train_X,train_y)
prediction=model.predict(test_X)
print ("accuracy of SVM")
print (accuracy_score(prediction,test_y))
