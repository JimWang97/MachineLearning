clc;
clear;

%import data
% 1 is sunny; 2 is rainy; 3 is overcast in outlook
% 1 is hot; 2 is warm; 3 is cool in temperature
% 1 is high; 2 is norm in humidity
% 0 is false, 1 is true in windy
% 0 is no, 1 is yes in playgolf
Outlook=[1,1,3,2,2,2,3,1,1,2,1,3,3,2]';
Temperature=[1,1,1,2,3,3,3,2,3,3,2,2,1,2]';
Humidity=[1,1,1,1,2,2,2,1,2,2,2,1,2,1]';
Windy=[0,1,0,0,0,1,1,0,0,0,1,1,0,1]';
PlayGolf=[0,0,1,1,1,0,1,0,1,1,1,1,1,0]';

%construct the decisiontree
data=[Outlook,Temperature,Humidity,Windy];
propertyName={'Outlook','Temperature','Humidity','Windy'};
delta=0.1;
decisionTreeModel=decisionTree(data,PlayGolf,propertyName,delta);

%test
label=decisionTreeTest(decisionTreeModel,data,propertyName);

acc=0;
for i=1:length(label)
    if label(i)==PlayGolf(i)
        acc=acc+1;
    end
end
acc=acc/length(label)