function [vars,B,Indice]=Base_Initiale(c,A,b,Aeq,beq)
m=size(A,2);
n=size(A,1);
Artif=[];
for i=1:length(b)
    if(b(i)<0)
        Artif=[Artif i];
    end
end


 vars=[{'x1'}];

 for i=2:m ;
    vars=[vars {strcat('x',int2str(i)) }] ;
    
 end;

 for i=1:n;
    vars=[vars  {strcat('e',int2str(i))} ] ;
 end
 %---
 for i=1:length(Artif);
    vars=[vars  {strcat('t',int2str(i))} ] ;
 end

%---

vars=[vars {'b'} ] 
%---
A=[eye(n,n) A b];
B=[A ;zeros(1,n) c 0] ;
Indice=[length(B)-n:length(B)-1 1:length(B)-1-n];

B=[B ; Indice 0];


end