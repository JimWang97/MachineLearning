x=[2.5 0.5 2.2 1.9 3.1 2.3 2 1 1.5 1.1];
y=[2.4 0.7 2.9 2.2 3.0 2.7 1.6 1.1 1.6 0.9];

%calculate mean and demean
u_x=mean(x);
u_y=mean(y);
x=x-u_x;
y=y-u_y;

C=cov(x,y);
[eigenvector,eigenvalue]=eig(C);
[~,ind]=max(max(eigenvalue));

vector=eigenvector(:,ind(1));
final=[x' y']*vector;
