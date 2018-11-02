function label=decisionTreeTest(decisionTreeModel,sampleSet,propertyName)

L=size(sampleSet,1);
label=zeros(L,1);
for index=1:L
    sample=sampleSet(index,:);
    Nodes=decisionTreeModel.Node;
    rootNode=Nodes(1);
    head=rootNode.NodeName;
    ind=GetFeatureNum(propertyName,head);
    edge=sample(ind);
    k=1;
    level=1;
    while k<length(Nodes)
        k=k+1;
        if Nodes(k).level==level
            if strcmp(Nodes(k).fatherNodeName,head)
                if Nodes(k).EdgeProperty==edge
                    if Nodes(k).NodeName<=1
                        label(index)=Nodes(k).NodeName;
                        break;
                    else
                        head=Nodes(k).NodeName;
                        ind=GetFeatureNum(propertyName,head);
                        edge=sample(ind);
                        level=level+1;
                    end
                end
            end
        end
    end
end