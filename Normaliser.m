function  B= Normaliser(B,vars)
c=size(B,1)-2 ;
B(1:c,:)=rref(B(1:c,:));


for i=1 :c
B(c+1,:)=B(c+1,:)-B(i,:)*B(c+1,i);
end

display("Les vecteur de base sont :");
display([vars(B(size(B,1),1 )),vars(B(size(B,1),2 )),vars(B(size(B,1),3 ))]);



end
