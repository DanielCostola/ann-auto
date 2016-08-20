net=fitnet(10,'trainlm');% 10 neurons in hidden layer , trainlm-feedfwd network
net.divideParam.trainRatio=.7;% 70% training
net.divideParam.valRatio=.15;% 15% validation
net.divideParam.testRatio=.15;% 15%testing
[net,pr]=train(net,input,target);% training network and storing parameters

% test subjects information or element
age = 40; % the age of the test subject
weight = 85;% the weight of the test subject
calories = 2400;% the daily calorific intake of the test subject

test = [age weight calories];% putting the test subjects information into an array

disp('calculating cases using ann_coded_Final')% displaing the name of the matlab file being used
disp('calculation in progress')% displaing the progress
 
i = 1;% elements
j = 1;% nodes
acc = 0;% activation
acc2 = 0;% second activation

 for i = 1:3% starting loop for each element
     
netinput_input(i)=(input(i)-minmaxinput(i,1))/(minmaxinput(i,2)-minmaxinput(i,1));% calculating total input of an element
activationinput(i)=netinput_input(i);% input activation of an element equals the total input of the element

    for j = 1:10 % starting loop for each node
        
        acc = activationinput(i)*weight_input_hidden(j,i)+acc;% calculating the activation by multiplying the activation input values with the hidden weighted input values and adding the activation 
        
    end% ending loop
   
    netinput_hidden(j) = acc+bias_hidden(j);% calculating the netinput for the hidden nodes by adding the activation with the bias values 
    activation_hidden(j) = 2 ./ (1 + exp(-2*netinput_hidden(j))) - 1;% clculating  the hidden activation values using the tansig funtion with the netinput for each hidden node
    acc2 = activation_hidden(j)*weight_hidden_output(j)+acc2;% calculating the second activation by multiplying the hidden activation values with the hidden output weighting values and adding on the second activation 
    acc = 0;% setting activation to zero for each loop
    
end % ending loop
  
netinput_output = acc2+bias_output ;% calculating the output of the total input by adding the output bias to the second activation
activation_output = 2 ./ (1 + exp(-2*netinput_output)) - 1;% calculating the activation output using the tansig funtion with the output of the the total input
output(1) = minmaxoutput(1)+(minmaxoutput(2)-minmaxoutput(1))*activation_output;% the funtion used to calculate the output
activation_output = 0;% setting the output of the activation to zero
netinput_output = 0;% setting the output of the total input to zero
acc2 = 0;% setting the second activation to zero

output(1)% the output calculated using the funtion
disp('end of calculation')% displaying the end result which is the chance of a health risk between 1 and 10