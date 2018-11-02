function [NodeIndex,BuildNode]=CalculateNode(data,label,delta)

InfoEntropy=CalculateInfoEntropy(label);
[m,n]=size(data);
InfoGain=InfoEntropy*ones(1,n);
BuildNode=true;

for i=1:n
    Litem=data(:,i);
    item=unique(Litem);
    for j=1:length(item)
        itemIndex=find(Litem==item(j));
        InfoGain(i)=InfoGain(i)-length(itemIndex)/m*CalculateInfoEntropy(label(itemIndex));
    end
end

[maxInfoGain,NodeIndex]=max(InfoGain);
if maxInfoGain<delta
    BuildNode=false;
end