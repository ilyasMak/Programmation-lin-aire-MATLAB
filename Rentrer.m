function Indice_Max= Rentrer(B,Indice,vars)
max=0;

for i = 1:length(B)-1 ;
    if B(size(B,1)-1,i)>max ;
        max=B(size(B,1)-1,i);
        Indice_Max=Indice(i);
    end ;
    
end 




end

