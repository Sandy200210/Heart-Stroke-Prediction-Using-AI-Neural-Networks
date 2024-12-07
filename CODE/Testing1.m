
%Testing with ECG Signals
load('Trained_Network1.mat');
load('BPM.mat');
input1 = BPM;

N = 15;
for k = 1:N
    transposed_Input1 = input1(k)';
    weighted_Sum1 = Weight1*transposed_Input1;
    output1(k) = Sigmoid(weighted_Sum1);
end