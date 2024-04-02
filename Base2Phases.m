function [vars,B,Indice] = Base2Phases(c,A,b,Aeq,beq)
m=length(c);
n=length(b);
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
A=[A zeros(n,length(Artif)) b];

a=0;
for i=1:n
    for j=m:m+length(Artif)-1
        if b(i)<0
            a=a+1;
            A(i,j+a)=1;
             A(i,:)=-A(i,:);
            break
            
        end
       
    end
end

B=[eye(n) A ] ;
B=[B ;zeros(1,size(A,2)+n)] ;
for i=1:length(Artif)
    B(size(B,1),Artif(i))=-1;
end
%___________________________________________
a=1
for i=1:n
   % for j=1:n+m+length(Artif)
        if (B(i,n+m+a)==-1 )
            
            Indice(1,i)=n+m+a ;
            Indice(1,i+n+m-2+length(Artif))=m+i ;
            a=a+1 ;
        else  Indice(1,i)=m+i ;
        end
end
%end 
for i=1:m 
    Indice(1,n+i)=i ;
end
%------------------------------------------
display(Indice)
display(B)
B=[B;Indice 0];


end