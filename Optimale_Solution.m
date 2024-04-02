function bool=Optimale_Solution(B)

for i=1:length(B)-1
    if B(size(B,1)-1,i)>0
        a=false; 
        break ; 
    else
        a=true ; 
    end
end


  if(a==false) fprintf(" \nCette Solution est pas Optimale ! on peut améliorer")
      bool=0;
  else fprintf("\nCette Solution est Optimale .")
      bool=1;
       % sol=B(1:size(B,1)-2, size(B,2) )
       % z=-B(size(B,1)-1,size(B,2))
  end
  

end