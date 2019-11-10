function biHist() 
    im = imread('cameraman.tif');
    [m, n, o] = size(im);
    if (o == 3)
    im = rgb2gray(im);
    end
    bin = zeros(256, 1);
        for i = 1:m
            for j = 1:n
                if im(i, j) > 80
                    bin(i, j) = 1;
                else
                    bin(i, j) = 0;
                end
            end
        end
    imshowpair(im, bin, 'montage');
end