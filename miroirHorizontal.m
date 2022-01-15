function resultat=miroirHorizontal(a)
a=double(a);
l=size(a,1);
c=size(a,2);
b=a;
if mod(l,2)==0
    for i=l:l+1
        for j=1:c
            b(i,j)=0;
        end
    end
end
if mod(c,2)==0
    for i=1:l
        for j=c:c+1
            b(i,j)=0;
        end
    end
end
d=b;
l2=size(d,1);
c2=size(d,2);
ligneCentre=ceil(l2/2);
for i=1:l2
    for j=1:ligneCentre
        d(i,j)=b(i,c2-j+1);
    end
end
for i=1:l2
    for j=ligneCentre:-1:1
        d(i,c2-j+1)=b(i,j);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:ligneCentre
    for j=1:c2
        d(i,j)=b(l2-i+1,j);
    end
end
for i=ligneCentre:-1:1
    for j=1:c2
        d(l2-i+1,j)=b(i,j);
    end
end
d=uint8(d);
resultat=d;
end