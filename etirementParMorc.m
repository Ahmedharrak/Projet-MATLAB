function resultat=etirementParMorc(a,min,max)

a=double(a);
l=size(a,1);
c=size(a,2);
for ng=1:256
    LUT(ng)=(255*(ng-min))/(max-min);
end

b=a;

for i=1:l
    for j=1:c
        if LUT(a(i,j)+1)<0
            b(i,j)=0;
        end
        if LUT(a(i,j)+1)>255
            b(i,j)=255;
        end
        if LUT(a(i,j)+1)>=0 && LUT(a(i,j)+1)<=255
        b(i,j)=LUT(a(i,j)+1);
        end
    end
end
b=uint8(b);

resultat=b;

%{
a=double(a);
b=255*(a-min)/(max-min);
b=uint8(b);
resultat=b;
%}
end