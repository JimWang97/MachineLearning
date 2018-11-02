function BuildTree(fatherlevel,fatherNodeName,edge,data,label,propertyName,delta)

global Node;
sonNode=struct('level',0,'fatherNodeName',[],'EdgeProperty',[],'NodeName',[]);
sonNode.level=fatherlevel+1;
sonNode.fatherNodeName=fatherNodeName;
sonNode.EdgeProperty=edge;

%first condition
if length(unique(label))==1
    sonNode.NodeName=label(1);
    Node=[Node,sonNode];
    return;
end

%second condition
if length(propertyName)<1
   labelSet=unique(label);
   k=length(labelSet);
   for i=1:k
       labelNum(i)=sum(label==labelSet(i));
   end
   [~,labelIndex]=max(labelNum);
   sonNode.NodeName=labelSet(labelIndex);
   Node=[Node,sonNode];
   return;
end

%find the best feature
[sonIndex,Build]=CalculateNode(data,label,delta);

if Build==true
    dataRowIndex=setdiff(1:length(propertyName),sonIndex);
    sonNode.NodeName=propertyName{sonIndex};
    Node=[Node,sonNode];
    propertyName(sonIndex)=[];
    sonData=data(:,sonIndex);
    sonEdge=unique(sonData);%the next label index
    
    for i=1:length(sonEdge)
        edgeDataIndex=find(sonData==sonEdge(i));
        BuildTree(sonNode.level,sonNode.NodeName,sonEdge(i),data(edgeDataIndex,dataRowIndex),label(edgeDataIndex,:),propertyName,delta);
    end
    
else
    labelSet=unique(label);
    k=length(labelSet);
   for i=1:k
       labelNum(i)=sum(label==labelSet(i));
   end
   [~,labelIndex]=max(labelNum);
   sonNode.NodeName=labelSet(labelIndex);
   Node=[Node,sonNode];
   return;
end