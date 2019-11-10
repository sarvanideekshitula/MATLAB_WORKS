function Equalise()
    im = imread('cameraman.tif');
    [m, n, o] = size(im);
    if (o == 3)
    im = rgb2gray(im);
    end
    imHistg = zeros(257, 1);
    for i = 1:m
        for j = 1:n
        imHistg(im(i,j)+2) = imHistg(im(i,j)+2) + 1;
        end
    end
    imHistg(1) = 0;
    for i = 2:257
        imHistg(i) = imHistg(i-1) + imHistg(i);
    end
    pic = zeros(m,n);
    for i = 1:m
        for j = 1:n
            pic(i, j) = ((m*n)-1)*(imHistg(im(i, j)+2)/(m*n));
        end
    end
    imshow(pic,[])
end