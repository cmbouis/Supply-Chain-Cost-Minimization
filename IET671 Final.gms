Sets
i index for suppliers /1*3/
j index for customers /1*4/;

Parameters
D(j) demand of customer /1 200, 2 300, 3 400, 4 500/
L(i) capacity of supplier /1 400, 2 600, 3 750/;

Table c(i,j) cost of transportation from supplier to customer

         1      2       3       4
1        8      8       5       8
2        9      5       8       9
3        5      10      6       7 ;

Variables
z
integer variable x(i,j);

Equations
ObjectiveFunction
co1 (j)
co2 (i);

ObjectiveFunction..z=e=sum((i,j),x(i,j)*c(i,j));
co1 (j)          ..sum(i,x(i,j))=g=D(j);
co2 (i)          ..sum(j,x(i,j))=l=L(i);

model SupplyChain1 /all/;
Solve SupplyChain1 using MIP minimizing z;
display z.l, x.l;
