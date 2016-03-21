%% Kiran Gunnam
clear all
clc
close all

ns=256; %%number of segments
nr=262144/2; %%number of points in each segment= 2^27/256
np=2 %% polynomial order used
arg_max=4;
fixpt=1;
for i=1:ns
xsegment_start = (i-1)/ns*arg_max + 2;
xsegment_end   = i/ns*arg_max;
xsegment_step  = 1/(ns*nr)*(arg_max-2);

x(i,:)  =  xsegment_start:xsegment_step:xsegment_end;
y(i,:)  =  log(x(i,:));
p(i,:)  =  polyfit(x(i,:),y(i,:),np);

if(fixpt)
    p_f(i,:)  = p(i,:);
    y11 = (x(i,:).^2).*p_f(i,1)+ x(i,:).*p_f(i,2) + p_f(i,3); 
    y1(i,:)   = fi(y11,1,31,24);
    e(i)      = double(max(abs(y(i,:)-y1(i,:))));
else
    y1(i,:) = polyval(p(i,:),x(i,:));
    %%y1(i,:) = x(i,:).*p(i,1)+p(i,2); %same as above for order 1
    %%polynomial
    e(i)  = max(abs(y(i,:)-y1(i,:)));
end

end
figure
plot(reshape(x',1,[]),reshape(y',1,[]),'b')
hold on
plot(reshape(x',1,[]),reshape(y1',1,[]),'r')
title('cos');
hold off
figure;
plot(e)
title('error vs segment number');
xlabel('segment number')
ylabel('error');
max_error=max(e)
spec_error=2^-15
if(max_error<=spec_error)
    disp('error specification is satisfied')
else
    disp('error specification is not satisfied')
end
c0 = fi(0,1,30,27);
c1 = fi(0,1,22,19);
c2 = fi(0,1,13,10);

 c0.data = p(:,2);
 c1.data = p(:,1);
 c2.data = p(:,1);
