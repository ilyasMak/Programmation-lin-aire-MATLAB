
function [B,sol]=Resoudre(c,A,b,Max_ou_Min)

b=reshape(b,length(b),1);
c=reshape(c,1,length(c));

if (Max_ou_Min=='Max') [vars,B,Indice]=Base_Initiale(c,A,b,[],[]); end
if (Max_ou_Min=='Min') [vars,B,Indice]=Base_Initiale(-c,A,b,[],[]);  end   


fprintf("-La base Initiale est : ")
display(B);
bool=Optimale_Solution(B) ;
while(bool==0)
    fprintf("\n_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_\n");
    [Indice_Max] = Rentrer(B,Indice,vars);
    [B]= Sortie(B,Indice,Indice_Max,vars);
    B= Normaliser(B,vars)
    bool=Optimale_Solution(B) ;
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





end