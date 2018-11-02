function result=CalculateInfoEntropy(label)

result=0;
L=length(label);
item=unique(label);
num=length(item);

for i=1:num
    N=sum(label==item(num));
    p=N/L;
    result=result-p*log2(p);
end