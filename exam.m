A=imread('cameraman.tif');

size(A)
x1=zeros([size(A,1)*size(A,2) 1]);
x2=zeros([size(A,1)*size(A,2) 1]);
size(x2)
deg=45;
C=uint8(zeros([size(A,1) size(A,2)]));
size(C)
m=1;
midx=ceil((size(C,1)+1)/2);
midy=ceil((size(C,2)+1)/2);

for i=1:size(A,1)
    i1=i-midx;
    for j=1:size(A,2)
        p = i1;
        q = j-midy;
        [t,r] = cart2pol(p, q);
        t1=rad2deg(t)+deg;
        t=deg2rad(t1);
        [x, y] = pol2cart(t,r);
        x1(m)=round(x+midx);
        x2(m)=round(y+midy);
        m=m+1; 
    end
end
x1(find(x1 < 1))=1;
x2(find(x2 < 1))=1;

n=1;
for i=1:size(A,1)
    for j=1:size(A,2)
        C(x1(n),x2(n))=A(i,j);
       
        n=n+1;
    end
   
end
imshow(C);