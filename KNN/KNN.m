% import data
load fisheriris                      
meas=meas(1:150,1:4);                   
train=[(meas(1:40,:));(meas(51:90,:));(meas(101:140,:))]; 
test=[(meas(41:50,:));(meas(91:100,:));(meas(141:150,:))];
trainGroup=[ones(1,40),2*ones(1,40),3*ones(1,40)]';      
testGroup=[ones(1,10),2*ones(1,10),3*ones(1,10)]';

%knn k=5
k=5;
acc=0;
for i=1:size(test,1)
    Test=test(i,:);
    out=testGroup(i);
    for j=1:size(train,1)
        Train=train(j,:);
        %caculate distance
        dis(j,1)=sqrt(sum((Test-Train).^2));
    end
    [~,ind]=sort(dis,'ascend');
    knn=trainGroup(ind(1:5));
    label=unique(knn);
    for h=1:length(knn)
        num(h)=sum(knn==knn(h));
    end
    [~,Ind]=max(num);
    pre(i,1)=knn(Ind);
    if pre(i,1)==out
        acc=acc+1;
    end
end

acc=acc/size(test,1)