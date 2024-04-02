function [B,sol]=Resoudre2Phases(c,A,b,Max_ou_Min)
x=size(A,1)+size(A,2);
b=reshape(b,length(b),1);
c=reshape(c,1,length(c));
fprintf("\n PHASE 1 \n");
[vars,B,Indice]=Base2Phases(c,A,b,[],[]); 
 

B= Normaliser(B,vars);
fprintf("-La base Initiale est : ")
display(B);

bool=Optimale_Solution(B) ;
  z_prov=B( size(B,1)-1,size(B,2));
while(bool==0)
    fprintf("\n_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_\n");
    [Indice_Max] = Rentrer(B,Indice,vars);
    [B]= Sortie(B,Indice,Indice_Max,vars);
    B= Normaliser(B,vars)
    bool=Optimale_Solution(B) ;
       if B( size(B,1)-1,size(B,2))~=z_prov
    z_prov=B( size(B,1)-1,size(B,2));
    else
    fprintf("\nProbleme infini:Voici une des solutions\n");
    break
       end
end 



B(size(B,1)-1,:)=zeros(1,size(B,2));
%inserer c
if Max_ou_Min=='Min'
    c=-c;
end

for i=1:size(B,2)
    if B(size(B,1),i)<=length(c)&&B(size(B,1),i)~=0
   B(size(B,1)-1,i)=c(1,B(size(B,1),i));
    end
    
    
end
i=size(B,2)-1;
while i>0
if B(size(B,1),i)>x
    B(:,i)=[];
end
i=i-1;
end

B= Normaliser(B,vars);
fprintf("-La nouvelle solution de depart est : ")
display(B);
fprintf("\n PHASE 2 \n");

bool=Optimale_Solution(B) ;
z_prov=B( size(B,1)-1,size(B,2));
while(bool==0)
    fprintf("\n_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_\n");
    [Indice_Max] = Rentrer(B,Indice,vars);
    [B]= Sortie(B,Indice,Indice_Max,vars);
    B= Normaliser(B,vars)
    bool=Optimale_Solution(B) ;
    if B( size(B,1)-1,size(B,2))==z_prov
    fprintf("\nProbleme infini:Voici une des solutions\n");
   break  
    else
      z_prov=B( size(B,1)-1,size(B,2));

    end
end 
fprintf("\n_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_\n");
if (Max_ou_Min=='Max') z=-B( size(B,1)-1,size(B,2));end
if (Max_ou_Min=='Min') z=B( size(B,1)-1,size(B,2)); end
sol1=B( 1:size(B,1)-2,size(B,2));
sol=zeros(1,size(B,2)-1);
for i=1:size(B,1)-2
sol(1,B(size(B,1),i))=sol1(i,1);

end

fprintf("Solution Optimale est : ");
display(sol);
fprintf("Z optimale est : ");
display(z);
