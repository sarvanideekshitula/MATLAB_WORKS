function binaryHistogram()
    im = imread('cameraman.tif');
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
    for i = 1:256
        imHistg(i) = imHistg(i)/(m*n);
    end
    res = zeros(255, 1);
    for i = 1:254
        hist1 = imHistg(1:i);
        hist1 = hist1/sum(hist1);
        hist2 = imHistg(i+1:end);
        hist2 = hist2/sum(hist2);
        m1=0;
        m2=0;
        for j = 1:i
            m1 = m1 + (j-1)*hist1(j);
        end
        for j = (i+1):imHistg(end)
            m2 = m2 + j*hist2(j);
        end
        var1=0;
        var2=0;
        for j = 1:i
            var1 = var1+ ((j-m1)^2)*hist1(j);
        end
        for j = (i+1):imHistg(end)
            var2 = var2+ ((j-m2)^2)*hist2(j);
        end
        res(i) = (m2-m1)^2/(var1+var2);
    end
    th = max(res);
    max(res)
    bin = zeros(256, 1);
    for i = 1:m
        for j = 1:n
            if im(i, j) > th
                bin(i, j) = 1;
            else
                bin(i, j) = 0;
            end
        end
    end
    imshow(bin);
end