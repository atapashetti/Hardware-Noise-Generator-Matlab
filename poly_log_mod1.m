%%a simple example for polyfit to approximate cosine function
%% Kiran Gunnam
clear all
clc
close all

ns=256; %%number of segments
nr=131072; %%number of points in each segment= 2^27/256
np=1 %% polynomial order used
arg_max=66.54;
fixpt=1;
for i=1:ns
xsegment_start = (i-1)/ns*arg_max;
xsegment_end   = i/ns*arg_max;
xsegment_step  = 1/(ns*nr)*arg_max;

x(i,:)  =  xsegment_start:xsegment_step:xsegment_end;
y(i,:)  =  log(x(i,:));
p(i,:)  =  polyfit(x(i,:),y(i,:),np);

if(fixpt)
    p_f(i,:)  = p(i,:);
    y1(i,:) = x(i,:).*p_f(i,1)+p_f(i,2);
    y11(i,:)   = fi(y1(i,:),1,31,24);
    e(i)      = double(max(abs(y(i,:)-y11(i,:))));
    
   % e(i)      = double(max(abs(y(i,:)-y1(i,:))));
else
    y11(i,:) = polyval(p(i,:),x(i,:));
    %%y1(i,:) = x(i,:).*p(i,1)+p(i,2); %same as above for order 1
    %%polynomial
    e(i)  = max(abs(y(i,:)-y11(i,:)));
end

end
figure
plot(reshape(x',1,[]),reshape(y',1,[]),'b')
hold on
plot(reshape(x',1,[]),reshape(y11',1,[]),'r')
title('log');
hold off
figure;
plot(e)
title('error vs segment number');
xlabel('segment number')
ylabel('error');
max_error=max(e)
spec_error=2^-26
if(max_error<=spec_error)
    disp('error specification is satisfied')
else
    disp('error specification is not satisfied')
end