# Perceptron-Digit-Recognization
Neural networks approach for visual pattern recognition is to take a large number of handwritten digits, known as training examples and then develop a system which can learn from those training examples. 
Also, by increasing the number of training examples the network can learn more about handwriting and improve its accuracy. Neural networks are now so good that they are used by banks to process cheques, and by post offices to recognize addresses

#Perceptron - A perceptron takes several binary inputs, x1,x2,…, and produces a single binary output.
A simple rule to compute the output is by applying weights, w1,w2,…, real numbers expressing the importance of the respective inputs to the output. The neuron's output " 0 or 1 " is determined by whether the weighted sum submition of w(i) * x(i) is less than or greater than some threshold value, where w and x are vectors whose components are the weights and inputs, respectively. 

I have trained 10 perceptrons that will, as a group, learn to classify the handwritten digits in the MNIST dataset. Each perceptron will have 785 inputs and one output. Each perceptron’s target is one of the 10 digits, 0−9.

Implementation Strategy-:

First, the training and testing sets (‘csv’ file) are loaded and scaled. The scaling is done in order to bring the inputs in the range of 0 to 1, i.e. dividing each of the element by 255. 
Then random weights are generated for the entire system (785 X 10) in the range -.05 to .05. 
Then we test the training and testing accuracy for the given data sets. 
The dot product of the inputs and weights is then calculated. Further the subtraction of target and output is evaluated. 
Then based on whether or not the target and the output are same, weights are updated. 
The accuracy is calculated, and it may be the case that there are multiple perceptrons firing 1. In such a case we consider the perceptron with the greatest dot product. This process continues for 50 epochs in each learning rate.

