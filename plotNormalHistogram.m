function plotNormalHistogram()
im = imread('lchb.tif');
imHistg = getHistogram(im);
plot (0:255, imHistg); xlabel('intensity'); 
ylabel('count of picxels'); title ('histogram');
end
function imHistg = getHistogram(im)
[m, n, o] = size(im);
if (o == 3)
imG = rgb2gray(im);
end
for i = 1:m
        for j = 1:n
            im(i, j) = im(i, j) + 100;
        end
end
imHistg = zeros(256, 1);
for i = 1:m
  for j = 1:n
    imHistg(im(i,j)+1) = imHistg(im(i,j)+1) + 1;
  end
end

for i = (m*n):1
    imHistg(i) = imHistg(i)/(m*n);
end
end