%Comment the plots in diter for faster runs and not overwritting the
%figures
%run multiple runs on diter to see eta, units and iterationis impact on
%error.
samples = 500; %makerbf intisalise weight matrix randomly, iterate to get better result
fun = @(x) (sin(2*x));
x = 0:0.1:2*pi;
x = x';

%Etas    
etas = 0.1:0.1:1;%[0.001, 0.005, 0.01, 0.05, 0.1,0.5, 1];
%etas = [0.001,0.005,0.001,0.005, 0.01, 0.05, 0.1, 0.5, 1];
errors = zeros(1,size(etas,2));
itersub = 6000;
itermax = 6000;
units = 6;
disp('Etas')
for j=1:samples,
    i = 1;
    for eta=etas,
        makerbf;
        diterNoPlot;
        errors(i) = errors(i) + 0.5 * sum(sum((f-y).^2)); %errors(i) + max(abs(f-y)); %maxError
        i = i+1;
    end
    
    if mod(j,samples/10)==0,
       disp('Eta sample'); 
       disp(int2str(j));
    end
    
end

errors = errors./samples;
plot(etas, errors);
%bar(errors);
xlabel('Etas');
ylabel('Error');

%xlabel(['Etas ',num2str(etas)]);
%text(x,n,barstrings,'horizontalalignment','center','verticalalignment','bottom')

%{
%%Units
allUnits = 6:1:20;
errorsU = zeros(1,size(allUnits,2));
disp('Units')
for j=1:samples,
    i = 1;
    for units=allUnits,
        makerbf;
        diterNoPlot;
        errorsU(i) = errorsU(i) + max(abs(f-y)); %maxError
        i = i+1;
    end
    
    if mod(j,samples/10)==0,
       disp('Unit sample'); 
       disp(int2str(j));
    end
end

errorsU = errorsU./samples;
figure;
plot(allUnits, errorsU);
xlabel('Units');
ylabel('Error');

%%Iterations
allIterations = 100:100:4000;
errorsI = zeros(1,size(allIterations,2));
units = 6;
disp('Iterations')
for j=1:samples,
    i = 1;
    for myItermax=allIterations,
        makerbf;
        itersub = myItermax;
        itermax = myItermax;
        diterNoPlot;
        errorsI(i) = errorsI(i) + max(abs(f-y)); %maxError
        i = i+1;
    end
    
    if mod(j,samples/10)==0,
       disp('Iter sample'); 
       disp(int2str(j));
    end
end
disp('Done')
errorsI = errorsI./samples;
figure;
plot(allIterations, errorsI);
xlabel('Iterations');
ylabel('Error');
%}