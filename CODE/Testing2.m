
%Testing with PPG Signals
load('Trained_Network2.mat');
load('HRT.mat');
input2 = HRT;

N = 15;
for k = 1:N
    transposed_Input2 = input2(k)';
    weighted_Sum2 = Weight2*transposed_Input2;
    output2(k) = Sigmoid(weighted_Sum2);
end