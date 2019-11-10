function otsu()
    im = imread('cameraman.tif');
    imHist = zeros(1, 256);
    [m, n] = size(im);
    imHist = imhist(im);
    imHist = imHist/sum(imHist);
    max =0.0;
    for i=2:255
        hist1 = imHist(1:i);
        hist1 = hist1/sum(hist1);
        hist2 = imHist(i+1:end);
        hist2 = hist2/sum(hist2);
        m1=0.0; m2=0.0;
        for j=1:i
            m1 = m1 + (j-1)*hist1(j);
        end
        for j=i+1:255
            m2 = m2 + (j-1)*hist2(j-i+1);
        end
        v1 = 0.0; v2 = 0.0;
        for j=1:i
            v1 = v1 + ((j-1-m1)^2)*hist1(j);
        end
        for j=i+1:255
            v2 = v2 + ((j-1-m2)^2)*hist2(j-i+1);
        end
        large = ((m1-m2)^2)/(v1+v2);
        if(large > max)
            max = large;
            a = i;
        end
    end
    a
    pic = zeros(m, n);
    for i=1:m
        for j=1:n
            if(im(i, j) < a)
                pic(i, j) = 0;
            else
                pic(i, j) = 1;
            end
        end
    end
    imshow(pic, []);