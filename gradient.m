function gradient()
    im = im2double(rgb2gray(imread('MidTerm.png')));
    [m, n] = size(im);
    k1 = [-1 -1 -1; 0 0 0; 1 1 1];
    I1 = conv2(im, k1);
    k2 = [-1 0 1; -1 0 1; -1 0 1];
    I2 = conv2(im, k2);
    I3 = I1.*I2;
    %imshow(I3);
    out1 = I1.^2;
    out2 = I2.^2;
    VIm = zeros(m, n);
    for i=1:m
        for j=1:n
            x = out1(i, j);
            y = out2(i, j);
            z = I3(i, j);
            M = [x z; z y];
            V = det(M) - 0.04*trace(M)^2;
            VIm(i, j) = V;
        end
    end
    imshow(VIm, []);
end
