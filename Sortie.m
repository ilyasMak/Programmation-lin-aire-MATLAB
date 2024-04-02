function [B]= Sortie(B,Indice,Indice_Max,vars)
%base=[vars(B(size(B,1),1 ))]


base=[vars(B(size(B,1),1:size(B,1)-2 ))];

for Entrn=1:length(Indice)
    if Indice(Entrn)==Indice_Max
        break; 
    end
end
B_prov=B(:,size(B,2))./B(:,Entrn);
min=inf;
for i=1:length(B_prov)-2

    if(B_prov(i)>0 && B_prov(i)<min)
        min=B_prov(i) ; 
        Sort=i;
    end
end


if(min==inf) display("Probleme non borné!!")
    
else 
    U_temp=B(:,Sort) ; 
    B(:,Sort)=B(:,Entrn) ;
    B(:,Entrn)=U_temp  ;
  %----------
    u_temp=Indice(Sort) ;
    Indice(Sort)=Indice(Entrn) ;
    Indice(Entrn)=u_temp;
    %_-_

   %display(" Variable entran")
   fprintf("\ncolonne de pivot est  : %d ",Entrn);
   fprintf(" \n Entrante : %d ",Indice(Entrn));
   display(vars(Indice_Max));

   
   
   fprintf(" \n Sortante : %d ",Indice(Sort));
   display(base(Sort));
   

   
end


end

