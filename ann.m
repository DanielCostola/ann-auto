%this program creates a ANN
x=0:0.01:100;
y=x.^2;
net=newff(minmax(x),[24 1], {'logsig','purelin'},'trainlm');
net.trainparam.epochs=8000;
net.trainparam.goal=1e-25;
net.trainparam.goal=0.01;
net=train(net,x,y);
