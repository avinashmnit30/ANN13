ephocs = 400;
nodes = 10;
eta = 0.03;
x = 1:ephocs;

Wstart = randn(10, 3);
Vstart = randn(1, 11);

error1 = zeros(2,ephocs);
error2 = zeros(2,ephocs);
error3 = zeros(2,ephocs);
error4 = zeros(2,ephocs);
error5 = zeros(2,ephocs);

iter = 1;

for i = 1:iter,
error1 = error1 + twolayer(patterns,targets,nodes,ephocs, eta, 0.99, Wstart, Vstart);
error2 = error2 + twolayer(patterns,targets,nodes,ephocs, eta, 0.7, Wstart, Vstart);
error3 = error3 + twolayer(patterns,targets,nodes,ephocs, eta, 0.3, Wstart, Vstart);
error4 = error4 + twolayer(patterns,targets,nodes,ephocs, eta, 0.01, Wstart, Vstart);
error5 = error5 + twolayer(patterns,targets,nodes,ephocs, eta, 0.0001, Wstart, Vstart);
end

error1 = error1./iter;
error2 = error2./iter;
error3 = error3./iter;
error4 = error4./iter;
error5 = error5./iter;

plot(x, error1(1,:), 'm')
hold on;
plot(x, error2(1,:), 'r')
plot(x, error3(1,:), 'b')
%plot(x, error4(1,:), 'k')
plot(x, error5(1,:), 'c')
title(['Iterations: ', int2str(iter), '. Learning curve for two layer network with varying step size.'])
legend('Momentum 0.99', 'Momentum 0.7','Momentum 0.3','Momentum 0.0001');
xlabel('Epochs'); ylabel('Euclidean error');

%figure;
%plot(x, error1(2,:), 'm')
%hold on;
%plot(x, error2(2,:), 'r')
%plot(x, error3(2,:), 'b')
%plot(x, error4(2,:), 'k')
%plot(x, error5(2,:), 'c')
%title(['Iterations: ', int2str(iter), '. Learning curve for two layer network with varying number of hidden nodes.'])
%legend('Hidden nodes 1', 'Hidden nodes 5', 'Hidden nodes 10', 'Hidden nodes 100', 'Hidden nodes 3000');
%xlabel('Epochs'); ylabel('Missclassified instances');