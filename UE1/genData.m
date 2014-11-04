function [data,target]=genData(n,d,lin_sep)

data=zeros(n,d);
lim=floor(n/2);
target(1:lim) = 1;
target(lim+1:n) = -1;
[m1,v1]=deal(randn(1),abs(randn(1))); %var>0!%

if lin_sep==1
    
    [m2,v2] = deal(randn(1),abs(randn(1)));
    data(1:lim,:) = m1+sqrt(v1).*randn(lim,d);
    data(lim+1:n,:) = m2+sqrt(v2).*randn(lim,d);
    
    %spacing%
    m=randn(1);
    b=(m2-m1)+m*(m2-m1);
    
    for i=1:lim
        while (sign(m*data(i,1)-data(i,2)+b) <=0)
            data(i,:)=m1+sqrt(v1).*randn(1,d);
    end
    end
    
     for i=lim+1:n
        while (sign(m*data(i,1)-data(i,2)+b) >=0)
            data(i,:)=m2+sqrt(v2).*randn(1,d);
     end
     end
    
else
    data=m1+sqrt(v1).*randn(n,d);
end

plot(data(1:lim,1),data(1:lim,2),'.',data(lim+1:end,1),data(lim+1:end,2),'*')
legend('Class 1','Class -1');
