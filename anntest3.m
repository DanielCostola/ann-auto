
net=fitnet(10,'trainlm');% 10 neurons in hidden layer , trainlm-feedfwd network
net.divideParam.trainRatio=.7;% 70% training
net.divideParam.valRatio=.15;% 15% validation
net.divideParam.testRatio=.15;% 15%testing
[net,pr]=train(net,input,target);% training network and storing parameters
prediction=net(sample);% network predicts the output value of the sample 