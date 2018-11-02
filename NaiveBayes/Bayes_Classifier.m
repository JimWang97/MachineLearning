%Naive Bayes Classifier
%Striver13
%1/11/2018
clear;
clc;
%import data
data=importdata('data.csv');
Size=size(data.data,1);
y=zeros(Size,1);
for i=1:Size
     if strcmp(data.textdata(i),'L')==1
        y(i)=1;
     elseif strcmp(data.textdata(i),'B')==1
        y(i)=2;
     else
        y(i)=3;
    end
end

%val_data
k=1;
for i=1:10:Size
    x_val(k,1:4)=data.data(i,1:4);
    y_val(k,1)=y(i);
    k=k+1;
end

k=1;
for i=1:Size
    if(mod(i,11)~=0)
        x_train(k,1:4)=data.data(i,1:4);
        y_train(k,1)=y(i);
        k=k+1;
    end
end

%calculate p(x|c)
%p_1(i,j)is the number of data when y=1 and x(i)=j
p=zeros(4,5,3);
P=zeros(1,3);
for num=1:size(x_train,1)
    for i=1:4
        p(i,x_train(num,i),y_train(num))= p(i,x_train(num,i),y_train(num))+1;
    end
    P(1,y_train(num))=P(1,y_train(num))+1;
end
P=P/size(y_train,1);
Sum=sum(p,2);
for i=1:3
    p(:,:,i)=p(:,:,i)./Sum(1,1,i);
end

%calculate acc on the val_data
acc=0;
for i=1:size(y_val,1)
   p_1=p(1,x_val(i,1),1)* p(2,x_val(i,2),1)*p(3,x_val(i,3),1)*p(4,x_val(i,4),1)*P(1,1);
   p_2=p(1,x_val(i,1),2)* p(2,x_val(i,2),2)*p(3,x_val(i,3),2)*p(4,x_val(i,4),2)*P(1,2);
   p_3=p(1,x_val(i,1),3)* p(2,x_val(i,2),3)*p(3,x_val(i,3),3)*p(4,x_val(i,4),3)*P(1,3);
   if p_1>p_2 && p_1>p_3
       y_pre(i)=1;
   elseif p_2>p_1 && p_2>p_3
       y_pre(i)=2;
   else
       y_pre(i)=3;
   end
   if y_pre(i)==y_val(i)
       acc=acc+1;
   end
end
acc=acc/size(y_val,1);
disp(acc);
