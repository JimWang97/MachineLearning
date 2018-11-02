function decisionTreeMode=decisionTree(data,label,propertyName,delta)

global Node;
Node=struct('level',-1,'fatherNodeName',[],'EdgeProperty',[],'NodeName',[]);

BuildTree(-1,'root','Stem',data,label,propertyName,delta);
Node(1)=[];
model.Node=Node;
decisionTreeMode=model;