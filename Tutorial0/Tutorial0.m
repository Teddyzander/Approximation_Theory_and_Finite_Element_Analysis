x_pos = [0:0.01:1];

% plot functions, check for continuous

f1 = x_pos.^2;
f2 = x_pos.^(3/2);
f3 = x_pos.^(1/2);
f4 = x_pos.^(-1/4);
f5 = x_pos.^(-1/2);
f6 = x_pos.^(-1);

%plot(x_pos, f1);

%hold on

%plot(x_pos, f2);
%plot(x_pos, f3);
%plot(x_pos, f4);
%plot(x_pos, f5);
%plot(x_pos, f6);

%ylim([0. 10]);
%legend;

x_neg = [-1:0.01:0];

f7_1 = -1 * x_neg;
f7_2 = x_pos;

f8_1 = -1 * (x_neg.^2)/2;
f8_2 = (x_pos.^2)/2;

plot(x_neg, f8_1);
hold on
plot(x_pos, f8_2);
