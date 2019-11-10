function plotHistogram()
    im = imread('cameraman.tif');
    imHistg = getHistogram(im);
    plot (0:255, imHistg); xlabel('intensity'); 
    ylabel('count ofpicxels'); title ('histogram');
end
function imHistg = getHistogram(im)

    [m, n, o] = size(im);
    if (o == 3)
    im = rgb2gray(im);
    end
    imHistg = zeros(256, 1);
    for i = 1:m
        for j = 1:n
        imHistg(im(i,j)+1) = imHistg(im(i,j)+1) + 1;
        end
    end
    imshow(im);
end