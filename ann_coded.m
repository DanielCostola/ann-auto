ncases = 25;

weight_input_hidden = [1.8273 -2.0469 1.0711
 1.6923 0.7112 -3.1151
 -2.3322 1.7343 1.6379
 0.089461 0.24492 2.8112
 0.80329 2.782 1.6399
 -2.4134 -1.6438 1.135
 -1.9743 -1.0248 1.7776
 0.36411 2.9129 -0.70559
 2.4578 1.4442 0.19426
 1.9025 1.8941 -1.3323];

weight_hidden_output = [-0.23911 
    0.21663 
    -0.11346 
    0.62893 
    0.27868 
    -0.26216 
    0.18512 
    -0.054089 
    0.52469 
    -0.27486];

bias_hidden = [-3.0874
 -1.9036
 1.3472
 -1.5305
 -0.27696
 -0.93089
 -1.2812
 1.6718
 2.4501
 3.045];

bias_output = 0.21434;

minmaxinput = [18 50
    55 90
    1650 2700];

minmaxoutput = [1 10];

disp('calculating cases using ANN Modelo Final')
disp('calculation in progress')

k=1; 
i=1;
for k=1:ncases;
for i=1:25 
    netinput_input(k,i)=(input(k,i)-minmaxinput(i,1))/(minmaxinput(i,2)-minmaxinput(i,1));
	activationinput(k,i)=netinput_input(k,i);
end
end

k=1;
i=1;
j=1;
acc=0;

acc2=0;

           
for k=1:ncases  
    k 
    
 for j=1:9 
    for i=1:25 
        acc=activationinput(k,i)*weight_input_hidden(i,j)+acc;
    end
    netinput_hidden(j)=acc+bias_hidden(j); 
    activation_hidden(j)=2/(1+exp(-2*netinput_hidden(j)))-1; 
    acc2=activation_hidden(j)*weight_hidden_output(j)+acc2; 
    acc=0;
 end   
  
netinput_output=acc2+bias_output ; 
activation_output=2/(1+exp(-2*netinput_output))-1; 
output(k,1)=minmaxoutput(1)+(minmaxoutput(2)-minmaxoutput(1))*activation_output; 
activation_output=0;
netinput_output=0;
acc2=0;
end
disp('end of calculation')
